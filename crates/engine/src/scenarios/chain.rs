//! [`chain`]: a heavy bob on a chain of light links, the mass-ratio test
//! (`docs/06-constraints.md`).

use core::num::NonZeroU32;
use math::convert::usize_to_f64;

use super::pendulum::pendulum_gravity;
use super::shared::mass;
use crate::{ConfigError, DistanceConstraint, Integrator, ParticleId, Scalar, Solver, Vec2, World};

/// Total length of [`chain`], m: the same 1 m as
/// [`PENDULUM_LENGTH`](super::PENDULUM_LENGTH), so a one-link chain is the
/// pendulum and swing times compare directly.
pub const CHAIN_LENGTH: f64 = 1.0;

/// Mass of each link particle of [`chain`], kg: 10 g, so at a 1:100 ratio
/// the bob is 1 kg, the pendulum's
/// [`PENDULUM_MASS`](super::PENDULUM_MASS).
pub const CHAIN_LINK_MASS: f64 = 0.01;

/// Default link count for [`chain`]: 10 links of 10 cm. Enough for
/// Gauss–Seidel's one-pass error to propagate visibly along the chain,
/// few enough to draw each link.
pub const CHAIN_LINKS: usize = 10;

/// A static pin at the origin and `links` rigid rods of equal length,
/// [`CHAIN_LENGTH`] in all, laid out level with the pin (+x) and released
/// from rest under [`pendulum_gravity`]. Each joint between two rods is a
/// link particle of [`CHAIN_LINK_MASS`]; the far end is a bob `mass_ratio`
/// times heavier. Stepped by `solver` with `substeps` per step (iterations
/// stay at the world's default, 1).
///
/// `links == 0` gives a world with just the pin (no error: a slider at its
/// minimum shouldn't fail).
///
/// # Errors
/// [`ConfigError::InvalidMass`] if `mass_ratio` doesn't give a valid bob
/// mass (not positive, not finite, or beyond `S`'s range), checked even
/// when `links == 0` so a bad ratio never passes silently.
pub fn chain<S: Scalar>(
    solver: Solver,
    substeps: NonZeroU32,
    links: usize,
    mass_ratio: f64,
) -> Result<World<S>, ConfigError> {
    let link_mass = mass(CHAIN_LINK_MASS)?;
    let bob_mass = mass(CHAIN_LINK_MASS * mass_ratio)?;
    let mut world = World::new(Integrator::SymplecticEuler, substeps);
    world.add_force(pendulum_gravity());
    let mut previous: ParticleId = world.particles.add_static(Vec2::ZERO).into();
    for link in 1..=links {
        let x = CHAIN_LENGTH * usize_to_f64(link) / usize_to_f64(links);
        let particle_mass = if link == links { bob_mass } else { link_mass };
        let next = world
            .particles
            .add(Vec2::from_f64(x, 0.0), Vec2::ZERO, particle_mass);
        let rod = DistanceConstraint::between(&world.particles, previous, next)
            .ok_or(ConfigError::UnknownParticle)?;
        world.add_constraint(rod)?;
        previous = next;
    }
    world.set_solver(solver);
    Ok(world)
}

#[cfg(test)]
mod tests;
