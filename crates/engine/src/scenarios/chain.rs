//! [`chain`]: a heavy bob on a chain of light links, the roadmap's mass
//! ratio test (M4).

use core::num::NonZeroU32;
use math::convert::usize_to_f64;

use super::pendulum::pendulum_gravity;
use super::shared::mass;
use crate::{ConfigError, DistanceConstraint, Integrator, Scalar, Solver, Vec2, World};

/// Total length of [`chain`], m: the same 1 m as
/// [`PENDULUM_LENGTH`](super::PENDULUM_LENGTH), so a one-link chain is the
/// pendulum and swing times compare directly.
pub const CHAIN_LENGTH: f64 = 1.0;

/// Mass of each link particle of [`chain`], kg: 10 g, so at the roadmap's
/// 1:100 ratio the bob is 1 kg, the pendulum's
/// [`PENDULUM_MASS`](super::PENDULUM_MASS).
pub const CHAIN_LINK_MASS: f64 = 0.01;

/// Default link count for [`chain`]: 10 links of 10 cm. Enough for
/// Gauss–Seidel's one-pass error to propagate visibly along the chain,
/// few enough to draw each link.
pub const CHAIN_LINKS: usize = 10;

/// The roadmap's chain: a static pin at the origin and `links` rigid rods
/// of equal length, [`CHAIN_LENGTH`] in all, laid out level with the pin
/// (+x) and released from rest under [`pendulum_gravity`]. Each joint
/// between two rods is a link particle of [`CHAIN_LINK_MASS`]; the far end
/// is a bob `mass_ratio` times heavier. Stepped by `solver` with `substeps`
/// per step (iterations stay at the world's default, 1).
///
/// `links == 0` gives a world with just the pin (no error: it's a valid,
/// if dull, world, and a slider at its minimum shouldn't fail).
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
    let mut w = World::new(Integrator::SymplecticEuler, substeps);
    w.add_force(pendulum_gravity());
    let mut prev = w.particles.add_static(Vec2::ZERO);
    for i in 1..=links {
        let x = CHAIN_LENGTH * usize_to_f64(i) / usize_to_f64(links);
        let m = if i == links { bob_mass } else { link_mass };
        let next = w.particles.add(Vec2::from_f64(x, 0.0), Vec2::ZERO, m);
        let rod = DistanceConstraint::between(&w.particles, prev, next)
            .ok_or(ConfigError::UnknownParticle)?;
        w.add_constraint(rod)?;
        prev = next;
    }
    w.set_solver(solver);
    Ok(w)
}

#[cfg(test)]
mod tests;
