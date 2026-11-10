//! [`cradle`]: Newton's cradle (M6).

use core::num::NonZeroU32;

use math::convert::usize_to_f64;

use super::pendulum::pendulum_gravity;
use super::shared::{mass, radius};
use crate::{
    ConfigError, DistanceConstraint, Integrator, Restitution, Scalar, Solver, Vec2, World,
};

/// Every ball's radius, m.
pub const CRADLE_RADIUS: f64 = 0.05;
/// Every rod's length, pin to ball center, m.
pub const CRADLE_LENGTH: f64 = 0.5;
/// Every ball's mass, kg.
pub const CRADLE_MASS: f64 = 1.0;
/// Default ball count.
pub const CRADLE_BALLS: usize = 5;

/// The pulled balls start displaced by `(−0.6, +0.2) L` from rest: on the
/// rod's circle (a 3-4-5 triangle, `(−0.6, −0.8) L` from the pin), about
/// 37° out. Exact without trig, so deterministic everywhere.
const PULL: (f64, f64) = (-0.6, 0.2);

/// Newton's cradle: `balls` balls on rigid rods ([`CRADLE_LENGTH`]) from
/// static pins exactly one diameter apart, so neighbors touch at rest;
/// the first `pulled` balls start swung out to the left together (about
/// 37°), under [`pendulum_gravity`]. Elastic.
///
/// An ideal cradle swings exactly `pulled` balls out on the far side. A
/// sequential solver meets the row's simultaneous contacts one at a time,
/// and how close it gets depends on the solver, iterations and substeps:
/// measured, not assumed (`docs/08-collision.md`, "Newton's cradle").
/// `pulled` above `balls` is clamped.
///
/// # Errors
/// [`ConfigError::InvalidMass`] or [`ConfigError::InvalidRadius`] if a
/// scene constant doesn't fit `S` (never, for `f32` and `f64`).
pub fn cradle<S: Scalar>(
    solver: Solver,
    substeps: NonZeroU32,
    balls: usize,
    pulled: usize,
) -> Result<World<S>, ConfigError> {
    let m = mass(CRADLE_MASS)?;
    let r = radius(CRADLE_RADIUS)?;
    let mut w = World::new(Integrator::SymplecticEuler, substeps);
    w.set_solver(solver);
    w.set_restitution(Restitution::ELASTIC);
    w.add_force(pendulum_gravity());
    let center = (usize_to_f64(balls) - 1.0) / 2.0;
    for i in 0..balls {
        let x = (usize_to_f64(i) - center) * 2.0 * CRADLE_RADIUS;
        let pin = w.particles.add_static(Vec2::new(S::from_f64(x), S::ZERO));
        let (dx, dy) = if i < pulled { PULL } else { (0.0, 0.0) };
        let at = Vec2::new(
            S::from_f64(x + dx * CRADLE_LENGTH),
            S::from_f64(-CRADLE_LENGTH + dy * CRADLE_LENGTH),
        );
        let ball = w.particles.add_circle(at, Vec2::ZERO, m, r);
        let rod = DistanceConstraint::between(&w.particles, pin, ball)
            .ok_or(ConfigError::UnknownParticle)?;
        w.add_constraint(rod)?;
    }
    Ok(w)
}
