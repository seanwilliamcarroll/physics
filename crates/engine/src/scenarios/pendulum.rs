//! [`pendulum`]: `01-solvers.md`'s pendulum, a pin and a bob on a rod.

use core::num::NonZeroU32;

use super::shared::{STANDARD_GRAVITY, mass};
use crate::{
    ConfigError, DistanceConstraint, Integrator, Scalar, Solver, Stabilization, UniformGravity,
    Vec2, World,
};

/// Rod length for [`pendulum`], m: `01-solvers.md`'s measured setup.
pub const PENDULUM_LENGTH: f64 = 1.0;

/// Bob mass for [`pendulum`], kg: `01-solvers.md`'s setup. Released
/// horizontally, it swings through `m g L` ≈ 9.81 J.
pub const PENDULUM_MASS: f64 = 1.0;

/// The force [`pendulum`] adds: [`STANDARD_GRAVITY`] downward. Public so
/// energy readouts use exactly the scenario's force (like
/// [`orbit_gravity`](super::orbit_gravity)).
#[must_use]
pub fn pendulum_gravity<S: Scalar>() -> UniformGravity<S> {
    UniformGravity::new(Vec2::new(S::ZERO, -S::from_f64(STANDARD_GRAVITY)))
}

/// `01-solvers.md`'s pendulum: a static pin at the origin and a bob of
/// [`PENDULUM_MASS`] on a rigid rod of [`PENDULUM_LENGTH`], released from
/// rest level with the pin, under [`pendulum_gravity`]. Stepped by
/// `solver` with `substeps` per step.
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't).
pub fn pendulum<S: Scalar>(solver: Solver, substeps: NonZeroU32) -> Result<World<S>, ConfigError> {
    let mut world = World::new(Integrator::SymplecticEuler, substeps);
    world.add_force(pendulum_gravity());
    let pin = world.particles.add_static(Vec2::ZERO);
    let bob = world.particles.add(
        Vec2::from_f64(PENDULUM_LENGTH, 0.0),
        Vec2::ZERO,
        mass(PENDULUM_MASS)?,
    );
    let rod = DistanceConstraint::between(&world.particles, pin, bob)
        .ok_or(ConfigError::UnknownParticle)?;
    world.add_constraint(rod)?;
    world.set_solver(solver);
    // Classic Baumgarte: what `01-solvers.md` measured. Stable here (one
    // rod); split impulses would add XPBD-like damping
    // (`docs/06-constraints.md`, "Stabilization").
    world.set_stabilization(Stabilization::Baumgarte);
    Ok(world)
}
