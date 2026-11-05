//! The refinement (`docs/14-piano.md`, "Dispersion in the loop"): damped
//! Gauss–Newton (Levenberg–Marquardt) on every pole's radius and angle,
//! against the partials' round-trip delays in cents, from where the
//! placement put them.

use core::f64::consts::PI;

use super::{ANGLE_MARGIN, RADIUS_RANGE, Target, biquad_delay, cascade_delay};

/// Iterations, the damping's start and its factors, and the numeric
/// Jacobian's step.
const ITERATIONS: u32 = 80;
const DAMPING_START: f64 = 1e-3;
const DAMPING_DOWN: f64 = 0.3;
const DAMPING_UP: f64 = 10.0;
/// Past this, steps are ~1e-8 of a gradient step: stop early (still
/// deterministic, the same inputs stop at the same iteration).
const DAMPING_STOP: f64 = 1e8;
const JACOBIAN_STEP: f64 = 1e-7;

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
    let n = params.len();
    let mut r = residuals(params, w1, targets);
    let mut cost: f64 = r.iter().map(|x| x * x).sum();
    let mut damping = DAMPING_START;
    for _ in 0..ITERATIONS {
        // A parameter moves only its own biquad's delay, so each column
        // evaluates that biquad alone (not the whole cascade: 1/count the
        // work, and no cancellation against the other biquads).
        let jacobian: Vec<Vec<f64>> = (0..n)
            .map(|i| {
                let pair = params.get(i & !1..=i | 1);
                let Some(&[r, th]) = pair else {
                    return vec![0.0; targets.len()];
                };
                let nudged = if i % 2 == 0 {
                    (r + JACOBIAN_STEP, th)
                } else {
                    (r, th + JACOBIAN_STEP)
                };
                let change = |w: f64| biquad_delay(nudged.0, nudged.1, w) - biquad_delay(r, th, w);
                let at_f1 = change(w1);
                targets
                    .iter()
                    .map(|t| (change(t.w) - at_f1) * t.weight / JACOBIAN_STEP)
                    .collect()
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
