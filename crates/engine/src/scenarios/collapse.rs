//! [`collapse`]: a cold cloud falling in on itself.

use super::cluster::{CLUSTER_RADIUS, CLUSTER_SUBSTEPS, cluster_gravity};
use super::shared::{mass, point_in_annulus};
use crate::rng::SplitMix64;
use crate::{ConfigError, Integrator, Scalar, Vec2, World};
use math::convert::usize_to_f64;

/// Total mass of [`collapse`], kg, shared equally: `G M` = 2 m³/s², so the
/// free-fall scale `√(R³ / G M)` is 2 s at [`CLUSTER_RADIUS`] whatever N.
pub const COLLAPSE_TOTAL_MASS: f64 = 3.0e10;

/// A cold cloud: `body_count` equal-mass bodies uniform in a disk of
/// [`CLUSTER_RADIUS`], all at rest, so gravity pulls it in on itself.
/// Zero momentum and center-of-mass motion by construction. Deterministic
/// per seed.
///
/// # Errors
/// Only if a fixed constant were invalid (it isn't).
pub fn collapse<S: Scalar>(body_count: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut world = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS);
    world.add_force(cluster_gravity()?);
    let body_mass = mass(COLLAPSE_TOTAL_MASS / usize_to_f64(body_count.max(1)))?;
    let mut rng = SplitMix64::new(seed);
    for _ in 0..body_count {
        let (x, y) = point_in_annulus(&mut rng, 0.0, CLUSTER_RADIUS);
        world
            .particles
            .add(Vec2::from_f64(x, y), Vec2::ZERO, body_mass);
    }
    Ok(world)
}

#[cfg(test)]
mod tests;
