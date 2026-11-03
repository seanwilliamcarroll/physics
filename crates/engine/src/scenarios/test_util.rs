//! Helpers shared by the scenario unit tests.

use crate::{Vec2, World};

/// `got` equals `want` up to the rounding of `v0 + want` then `- v0`: a
/// few ulps of the larger magnitude. A different force (other ε or G)
/// would differ by far more.
pub(super) fn assert_same_up_to_rounding(got: Vec2<f64>, want: Vec2<f64>, v0: Vec2<f64>) {
    let tol = 4.0 * f64::EPSILON * (want.length() + v0.length());
    assert!((got - want).length() <= tol, "{got:?} vs {want:?}");
}

pub(super) fn run(w: &mut World<f64>, steps: u32) {
    for _ in 0..steps {
        w.step(1.0 / 60.0);
    }
}
