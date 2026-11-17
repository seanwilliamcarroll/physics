//! The refinement (`docs/14-piano.md`, "Dispersion in the loop"): damped
//! Gauss–Newton (Levenberg–Marquardt) on every pole's radius and angle,
//! against the partials' round-trip delays in cents, from where the
//! placement put them.

use core::f64::consts::PI;

use super::{ANGLE_MARGIN, RADIUS_RANGE, Target, biquad_delay_gradient, cascade_delay};

/// Iterations, and the damping's start and its factors.
const ITERATIONS: u32 = 80;
const DAMPING_START: f64 = 1e-3;
const DAMPING_DOWN: f64 = 0.3;
const DAMPING_UP: f64 = 10.0;
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
/// …), minimizing the squared cents error, a fixed number of iterations.
pub(super) fn refine(params: &mut Vec<f64>, w1: f64, targets: &[Target]) {
    let mut r = residuals(params, w1, targets);
    let mut cost: f64 = r.iter().map(|x| x * x).sum();
    let mut damping = DAMPING_START;
    for _ in 0..ITERATIONS {
        // One column per parameter: a parameter moves only its own
        // biquad's delay, so its column is that biquad's derivative, in
        // closed form (`biquad_delay_gradient`), the pole's (r, θ) pair
        // together.
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
        let dot = |a: &[f64], b: &[f64]| a.iter().zip(b).map(|(x, y)| x * y).sum::<f64>();
        let mut system: Vec<Vec<f64>> = jacobian
            .iter()
            .enumerate()
            .map(|(i, ji)| {
                let mut row: Vec<f64> = jacobian.iter().map(|jj| dot(ji, jj)).collect();
                if let Some(d) = row.get_mut(i) {
                    *d += damping;
                }
                row.push(-dot(ji, &r));
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
            *params = trial;
            r = trial_r;
            cost = trial_cost;
            damping *= DAMPING_DOWN;
        } else {
            damping *= DAMPING_UP;
            // So damped that every step is negligible: converged.
            if damping > DAMPING_STOP {
                break;
            }
        }
    }
}
