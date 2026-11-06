//! Helpers shared by the engine's unit tests (integration tests have
//! `test-support`; unit tests can't use it, see its crate docs).

use crate::{Force, Particles, Scalar, TimeStep, Vec2, World};

/// `got` equals `want` up to the rounding of `v0 + want` then `- v0`: a
/// few ulps of the larger magnitude. A different force (other ε or G)
/// would differ by far more.
pub(crate) fn assert_same_up_to_rounding(got: Vec2<f64>, want: Vec2<f64>, v0: Vec2<f64>) {
    let tol = 4.0 * f64::EPSILON * (want.length() + v0.length());
    assert!((got - want).length() <= tol, "{got:?} vs {want:?}");
}

pub(crate) fn run(w: &mut World<f64>, steps: u32) {
    for _ in 0..steps {
        w.step(time_step(1.0 / 60.0));
    }
}

/// The accelerations force `f` gives particles `p`.
pub(crate) fn accel<S: Scalar>(p: &Particles<S>, f: &impl Force<S>) -> Vec<Vec2<S>> {
    let mut acc = vec![Vec2::ZERO; p.len()];
    f.accumulate(p, &mut acc);
    acc
}

/// `dt` (s) as a [`TimeStep`], for tests' fixed literals.
pub(crate) fn time_step<S: Scalar>(dt: f64) -> TimeStep<S> {
    TimeStep::new(S::from_f64(dt)).unwrap()
}
