//! The refinement (`docs/14-piano.md`, "Dispersion in the loop"): damped
//! Gauss–Newton (Levenberg–Marquardt) on every pole's radius and angle,
//! against the partials' round-trip delays in cents, from where the
//! placement put them.

use core::f64::consts::PI;

use super::{ANGLE_MARGIN, RADIUS_RANGE, Target, biquad_delay_gradient, cascade_delay};

/// Iterations, and the damping's start and its factors.
pub(super) const ITERATIONS: u32 = 80;
/// A refit's while the pole count is still being chosen: enough to
/// estimate the delay that count's fit will have, not to converge.
pub(super) const ESTIMATE_ITERATIONS: u32 = 10;
const DAMPING_START: f64 = 1e-3;
const DAMPING_DOWN: f64 = 0.3;
const DAMPING_UP: f64 = 10.0;
/// An accepted step that lowers the cost by less than this fraction of
/// it: converged. Without it most keys ran all [`ITERATIONS`] for gains
/// of no audible consequence; at 1e-4 no key's worst partial moved by
/// 0.0001 cent (all 88 checked, 2026-11-17), at 1e-3 one moved 2.2.
const CONVERGED: f64 = 1e-4;
/// Past this, steps are ~1e-8 of a gradient step: stop early (still
/// deterministic, the same inputs stop at the same iteration).
const DAMPING_STOP: f64 = 1e8;

/// Each target's error in cents for the cascade `params`.
fn residuals(params: &[f64], w1: f64, targets: &[Target]) -> Vec<f64> {
    let d1 = cascade_delay(params, w1);
    targets
        .iter()
        .map(|t| (cascade_delay(params, t.w) - d1 - t.want) * t.weight)
        .collect()
}

/// Damped Gauss–Newton (Levenberg–Marquardt) on `params` (radius, angle,
/// …), minimizing the squared cents error, for at most `iterations`
/// (stopping early once a step gains less than [`CONVERGED`] of the cost).
pub(super) fn refine(params: &mut Vec<f64>, w1: f64, targets: &[Target], iterations: u32) {
    let mut r = residuals(params, w1, targets);
    let mut cost: f64 = r.iter().map(|x| x * x).sum();
    let mut damping = DAMPING_START;
    // JᵀJ and −Jᵀr at the current parameters: they change only when a step
    // is taken. A rejected step just raises the damping and solves again.
    let mut normal: Option<(Vec<Vec<f64>>, Vec<f64>)> = None;
    for _ in 0..iterations {
        let (jtj, jtr) = normal.get_or_insert_with(|| {
            // One column per parameter: a parameter moves only its own
            // biquad's delay, so its column is that biquad's derivative,
            // in closed form (`biquad_delay_gradient`), the pole's (r, θ)
            // pair together.
            let jacobian: Vec<Vec<f64>> = params
                .as_chunks::<2>()
                .0
                .iter()
                .flat_map(|&[r, th]| {
                    let (dr1, dth1) = biquad_delay_gradient(r, th, w1);
                    let (col_r, col_th): (Vec<f64>, Vec<f64>) = targets
                        .iter()
                        .map(|t| {
                            let (dr, dth) = biquad_delay_gradient(r, th, t.w);
                            ((dr - dr1) * t.weight, (dth - dth1) * t.weight)
                        })
                        .unzip();
                    [col_r, col_th]
                })
                .collect();
            normal_equations(&jacobian, &r)
        });
        let mut system: Vec<Vec<f64>> = jtj
            .iter()
            .zip(jtr.iter())
            .enumerate()
            .map(|(i, (row, &b))| {
                let mut row = row.clone();
                if let Some(d) = row.get_mut(i) {
                    *d += damping;
                }
                row.push(b);
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
            .map(|(i, (p, s))| {
                let v = p + s;
                if i % 2 == 0 {
                    v.clamp(RADIUS_RANGE.0, RADIUS_RANGE.1)
                } else {
                    v.clamp(ANGLE_MARGIN, PI - ANGLE_MARGIN)
                }
            })
            .collect();
        let trial_r = residuals(&trial, w1, targets);
        let trial_cost: f64 = trial_r.iter().map(|x| x * x).sum();
        if trial_cost < cost {
            let gain = cost - trial_cost;
            *params = trial;
            r = trial_r;
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

/// `JᵀJ` and `−Jᵀr` for the Jacobian's columns `jacobian` and the
/// residuals `r`. `JᵀJ` is symmetric: the lower half computed, the upper
/// mirrored from it.
fn normal_equations(jacobian: &[Vec<f64>], r: &[f64]) -> (Vec<Vec<f64>>, Vec<f64>) {
    let dot = |a: &[f64], b: &[f64]| a.iter().zip(b).map(|(x, y)| x * y).sum::<f64>();
    let lower: Vec<Vec<f64>> = jacobian
        .iter()
        .enumerate()
        .map(|(i, ji)| jacobian.iter().take(i + 1).map(|jj| dot(ji, jj)).collect())
        .collect();
    let n = jacobian.len();
    let jtj = (0..n)
        .map(|i| {
            (0..n)
                .map(|j| {
                    let (row, col) = if j <= i { (i, j) } else { (j, i) };
                    lower
                        .get(row)
                        .and_then(|l| l.get(col))
                        .copied()
                        .unwrap_or(0.0)
                })
                .collect()
        })
        .collect();
    let jtr = jacobian.iter().map(|ji| -dot(ji, r)).collect();
    (jtj, jtr)
}
