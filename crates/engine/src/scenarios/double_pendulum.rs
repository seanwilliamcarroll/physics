//! [`double_pendulum`]: two rods end to end, the chaos demo (M4).

use core::num::NonZeroU32;

use super::pendulum::pendulum_gravity;
use super::shared::mass;
use crate::{ConfigError, DistanceConstraint, Integrator, Scalar, Solver, Vec2, World};

/// Length of each rod of [`double_pendulum`], m: the
/// [`PENDULUM_LENGTH`](super::PENDULUM_LENGTH) of the single pendulum,
/// so the two scenes share a scale.
pub const DOUBLE_PENDULUM_LENGTH: f64 = 1.0;

/// Mass of each bob of [`double_pendulum`], kg: the single pendulum's
/// [`PENDULUM_MASS`](super::PENDULUM_MASS). Equal masses and lengths are
/// the textbook double pendulum, chaotic when released horizontal.
pub const DOUBLE_PENDULUM_MASS: f64 = 1.0;

/// A double pendulum: a static pin at the origin, a bob of
/// [`DOUBLE_PENDULUM_MASS`] at the end of each of two rigid rods of
/// [`DOUBLE_PENDULUM_LENGTH`], both laid out level with the pin (+x) and
/// released from rest under [`pendulum_gravity`]. Stepped by `solver` with
/// `substeps` per step.
///
/// `offset` (m) moves the tip's starting position up by that much (+y,
/// perpendicular to the rod), so the second rod starts at an angle of
/// about `offset / L` and its rest length becomes `√(L² + offset²)`
/// (`L` to first order). Two copies `1e-9` apart are the chaos demo.
/// Not checked: a non-finite offset gives a non-finite world, as a
/// non-finite `speed_ratio` does for [`orbit`](super::orbit).
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't).
pub fn double_pendulum<S: Scalar>(
    solver: Solver,
    substeps: NonZeroU32,
    offset: f64,
) -> Result<World<S>, ConfigError> {
    let l = DOUBLE_PENDULUM_LENGTH;
    let m = mass(DOUBLE_PENDULUM_MASS)?;
    let vec = |x: f64, y: f64| Vec2::new(S::from_f64(x), S::from_f64(y));
    let mut w = World::new(Integrator::SymplecticEuler, substeps);
    w.add_force(pendulum_gravity());
    let pin = w.particles.add_static(Vec2::ZERO);
    let elbow = w.particles.add(vec(l, 0.0), Vec2::ZERO, m);
    let tip = w.particles.add(vec(2.0 * l, offset), Vec2::ZERO, m);
    for (a, b) in [(pin, elbow), (elbow, tip)] {
        let rod =
            DistanceConstraint::between(&w.particles, a, b).ok_or(ConfigError::UnknownParticle)?;
        w.add_constraint(rod)?;
    }
    w.set_solver(solver);
    Ok(w)
}

#[cfg(test)]
mod tests;
