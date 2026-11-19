//! The refinement (`docs/14-piano.md`, "Dispersion in the loop"): damped
//! Gauss–Newton on every pole, against the partials' delays in cents.

use core::f64::consts::PI;

use super::{ANGLE_MARGIN, Angles, RADIUS_RANGE, Target};

/// Iterations, and the damping's start and its factors.
pub(super) const ITERATIONS: u32 = 80;
/// A refit while the pole count is still being chosen: estimates, no convergence.
pub(super) const ESTIMATE_ITERATIONS: u32 = 10;
const DAMPING_START: f64 = 1e-3;
const DAMPING_DOWN: f64 = 0.3;
const DAMPING_UP: f64 = 10.0;
/// A step gaining less than this fraction of the cost: converged. At 1e-4
/// no key's worst partial moved by 0.0001 cent (all 88 checked); at 1e-3 one
/// moved 2.2.
const CONVERGED: f64 = 1e-4;
/// Past this, steps are ~1e-8 of a gradient step: stop early.
const DAMPING_STOP: f64 = 1e8;

/// Each target's error in cents for `params`, and each biquad's [`Angles`]
/// at `omega_lowest` then at each target (for the Jacobian).
fn residuals(
    params: &[f64],
    omega_lowest: f64,
    targets: &[Target],
) -> (Vec<f64>, Vec<Vec<Angles>>) {
    let omegas: Vec<f64> = core::iter::once(omega_lowest)
        .chain(targets.iter().map(|target| target.omega))
        .collect();
    let pairs = params.as_chunks::<2>().0;
    let angles: Vec<Vec<Angles>> = pairs
        .iter()
        .map(|&[_, angle]| {
            omegas
                .iter()
                .map(|&omega| Angles::new(angle, omega))
                .collect()
        })
        .collect();
    let delay = |frequency_index: usize, omega: f64| {
        pairs
            .iter()
            .zip(&angles)
            .map(|(&[radius, _], biquad_angles)| {
                biquad_angles
                    .get(frequency_index)
                    .map_or(0.0, |at| at.delay(radius, omega))
            })
            .sum::<f64>()
    };
    let delay_lowest = delay(0, omega_lowest);
    let errors = targets
        .iter()
        .enumerate()
        .map(|(index, target)| {
            (delay(index + 1, target.omega) - delay_lowest - target.want) * target.weight
        })
        .collect();
    (errors, angles)
}

/// Minimizes the squared cents error of `params` (radius, angle, …) for at
/// most `iterations`, stopping early at [`CONVERGED`].
pub(super) fn refine(
    params: &mut Vec<f64>,
    omega_lowest: f64,
    targets: &[Target],
    iterations: u32,
) {
    let (mut errors, mut angles) = residuals(params, omega_lowest, targets);
    let mut cost: f64 = errors.iter().map(|error| error * error).sum();
    let mut damping = DAMPING_START;
    // JᵀJ and −Jᵀr change only when a step is accepted.
    let mut normal: Option<(Vec<Vec<f64>>, Vec<f64>)> = None;
    for _ in 0..iterations {
        let (jtj, jtr) = normal.get_or_insert_with(|| {
            // One column per parameter: it moves only its own biquad's delay.
            let jacobian: Vec<Vec<f64>> = params
                .as_chunks::<2>()
                .0
                .iter()
                .zip(&angles)
                .flat_map(|(&[radius, _], biquad_angles)| {
                    let mut biquad_angles = biquad_angles.iter();
                    let (d_radius_lowest, d_angle_lowest) = biquad_angles
                        .next()
                        .map_or((0.0, 0.0), |at| at.gradient(radius, omega_lowest));
                    let (column_radius, column_angle): (Vec<f64>, Vec<f64>) = targets
                        .iter()
                        .zip(biquad_angles)
                        .map(|(target, at)| {
                            let (d_radius, d_angle) = at.gradient(radius, target.omega);
                            (
                                (d_radius - d_radius_lowest) * target.weight,
                                (d_angle - d_angle_lowest) * target.weight,
                            )
                        })
                        .unzip();
                    [column_radius, column_angle]
                })
                .collect();
            normal_equations(&jacobian, &errors)
        });
        let mut system: Vec<Vec<f64>> = jtj
            .iter()
            .zip(jtr.iter())
            .enumerate()
            .map(|(index, (row, &right_side))| {
                let mut row = row.clone();
                if let Some(diagonal) = row.get_mut(index) {
                    *diagonal += damping;
                }
                row.push(right_side);
                row
            })
            .collect();
        let Some(step) = crate::solve::solve(&mut system) else {
            break;
        };
        let trial: Vec<f64> = params
            .iter()
            .zip(&step)
            .enumerate()
            .map(|(index, (param, delta))| {
                let moved = param + delta;
                if index % 2 == 0 {
                    moved.clamp(RADIUS_RANGE.0, RADIUS_RANGE.1)
                } else {
                    moved.clamp(ANGLE_MARGIN, PI - ANGLE_MARGIN)
                }
            })
            .collect();
        let (trial_errors, trial_angles) = residuals(&trial, omega_lowest, targets);
        let trial_cost: f64 = trial_errors.iter().map(|error| error * error).sum();
        if trial_cost < cost {
            let gain = cost - trial_cost;
            *params = trial;
            errors = trial_errors;
            angles = trial_angles;
            cost = trial_cost;
            normal = None;
            damping *= DAMPING_DOWN;
            if gain <= CONVERGED * cost {
                break;
            }
        } else {
            damping *= DAMPING_UP;
            // So damped that every step is negligible: converged.
            if damping > DAMPING_STOP {
                break;
            }
        }
    }
}

/// `JᵀJ` (symmetric: lower half computed, upper mirrored) and `−Jᵀr`.
fn normal_equations(jacobian: &[Vec<f64>], errors: &[f64]) -> (Vec<Vec<f64>>, Vec<f64>) {
    let dot = |left: &[f64], right: &[f64]| left.iter().zip(right).map(|(x, y)| x * y).sum::<f64>();
    let lower: Vec<Vec<f64>> = jacobian
        .iter()
        .enumerate()
        .map(|(index, column)| {
            jacobian
                .iter()
                .take(index + 1)
                .map(|earlier| dot(column, earlier))
                .collect()
        })
        .collect();
    let size = jacobian.len();
    let jtj = (0..size)
        .map(|row_index| {
            (0..size)
                .map(|column_index| {
                    let (row, column) = if column_index <= row_index {
                        (row_index, column_index)
                    } else {
                        (column_index, row_index)
                    };
                    lower
                        .get(row)
                        .and_then(|lower_row| lower_row.get(column))
                        .copied()
                        .unwrap_or(0.0)
                })
                .collect()
        })
        .collect();
    let jtr = jacobian.iter().map(|column| -dot(column, errors)).collect();
    (jtj, jtr)
}
