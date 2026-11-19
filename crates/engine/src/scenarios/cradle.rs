//! [`cradle`]: Newton's cradle (`docs/08-collision.md`).

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
/// An ideal cradle swings exactly `pulled` balls out on the far side. The
/// impact stage passes the impulse down the row, so both solvers get
/// close; how close depends on the solver and substeps, not iterations
/// (measured: `docs/08-collision.md`, "Newton's cradle").
/// `pulled` above `balls` is clamped.
///
/// # Errors
/// [`ConfigError::InvalidMass`] or [`ConfigError::InvalidRadius`] if a
/// scenario constant doesn't fit `S` (never, for `f32` and `f64`).
pub fn cradle<S: Scalar>(
    solver: Solver,
    substeps: NonZeroU32,
    balls: usize,
    pulled: usize,
) -> Result<World<S>, ConfigError> {
    let ball_mass = mass(CRADLE_MASS)?;
    let ball_radius = radius(CRADLE_RADIUS)?;
    let mut world = World::new(Integrator::SymplecticEuler, substeps);
    world.set_solver(solver);
    world.set_restitution(Restitution::ELASTIC);
    world.add_force(pendulum_gravity());
    let middle = (usize_to_f64(balls) - 1.0) / 2.0;
    for index in 0..balls {
        let pin_x = (usize_to_f64(index) - middle) * 2.0 * CRADLE_RADIUS;
        let pin = world
            .particles
            .add_static(Vec2::new(S::from_f64(pin_x), S::ZERO));
        let (dx, dy) = if index < pulled { PULL } else { (0.0, 0.0) };
        let ball_position = Vec2::new(
            S::from_f64(pin_x + dx * CRADLE_LENGTH),
            S::from_f64(-CRADLE_LENGTH + dy * CRADLE_LENGTH),
        );
        let ball = world
            .particles
            .add_circle(ball_position, Vec2::ZERO, ball_mass, ball_radius);
        let rod = DistanceConstraint::between(&world.particles, pin, ball)
            .ok_or(ConfigError::UnknownParticle)?;
        world.add_constraint(rod)?;
    }
    Ok(world)
}

#[cfg(test)]
mod tests;
