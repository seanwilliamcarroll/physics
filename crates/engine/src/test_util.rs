//! Helpers shared by the engine's unit tests (integration tests have
//! `test-support`; unit tests can't use it, see its crate docs).

use crate::{Force, Particles, Scalar, TimeStep, Vec2, World};

/// `actual` equals `expected` up to the rounding of `start_velocity +
/// expected` then `- start_velocity`: a few ulps of the larger magnitude. A
/// different force (other ε or G) would differ by far more.
pub(crate) fn assert_same_up_to_rounding(
    actual: Vec2<f64>,
    expected: Vec2<f64>,
    start_velocity: Vec2<f64>,
) {
    let tolerance = 4.0 * f64::EPSILON * (expected.length() + start_velocity.length());
    assert!(
        (actual - expected).length() <= tolerance,
        "{actual:?} vs {expected:?}"
    );
}

pub(crate) fn run(world: &mut World<f64>, steps: u32) {
    for _ in 0..steps {
        world.step(time_step(1.0 / 60.0));
    }
}

/// The accelerations `force` gives `particles`.
pub(crate) fn accel<S: Scalar>(particles: &Particles<S>, force: &impl Force<S>) -> Vec<Vec2<S>> {
    let mut accelerations = vec![Vec2::ZERO; particles.len()];
    force.accumulate(particles, &mut accelerations);
    accelerations
}

/// `dt` (s) as a [`TimeStep`], for tests' fixed literals.
pub(crate) fn time_step<S: Scalar>(dt: f64) -> TimeStep<S> {
    TimeStep::new(S::from_f64(dt)).unwrap()
}
