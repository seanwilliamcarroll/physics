//! [`cluster`]: `n` bodies drifting under mutual softened gravity.

use core::num::NonZeroU32;

use super::shared::{BodyF64, add_bodies, newtonian, point_in_annulus, softening};
use crate::rng::SplitMix64;
use crate::{ConfigError, Integrator, PairwiseGravity, Scalar, World};

/// Radius of the disk [`cluster`] fills, m.
pub const CLUSTER_RADIUS: f64 = 2.0;

/// Total mass of [`cluster`], kg, whatever N: `G M` ≈ 13 m³/s². Fixed so
/// the time scale doesn't change with N: per-body mass ranges made N = 1024
/// collapse and fling every body out of view within 0.5 s, while N = 256
/// kept most.
pub const CLUSTER_TOTAL_MASS: f64 = 2.0e11;

/// Relative body weight range for [`cluster`], `(min, max)`: each body draws
/// a weight, then masses are scaled so they sum to [`CLUSTER_TOTAL_MASS`].
/// Unequal masses keep momentum tests honest (equal masses can hide a
/// mass-weighting bug).
pub const CLUSTER_WEIGHT: (f64, f64) = (0.5, 2.0);

/// Largest initial speed per axis for [`cluster`], m/s. Random drift gives
/// the cluster a nonzero net momentum, so conservation tests have a value
/// to conserve (zero could hide a sign error).
pub const CLUSTER_SPEED: f64 = 0.2;

/// Softening length for [`cluster`], m: 1/20 of the radius, so close passes
/// give a bounded kick instead of flinging bodies apart.
pub const CLUSTER_SOFTENING: f64 = 0.1;

/// Substeps for [`cluster`]: one; tests probe conservation, not accuracy.
pub const CLUSTER_SUBSTEPS: NonZeroU32 = NonZeroU32::MIN;

/// The force [`cluster`] adds: [`newtonian`] with [`CLUSTER_SOFTENING`].
/// Public so energy readouts use exactly the scenario's force (like
/// [`orbit_gravity`](super::orbit_gravity)).
///
/// # Errors
/// Only if [`CLUSTER_SOFTENING`] were invalid (it isn't: it's positive).
pub fn cluster_gravity<S: Scalar>() -> Result<PairwiseGravity<S>, ConfigError> {
    softening(CLUSTER_SOFTENING).map(newtonian)
}

/// `body_count` bodies under mutual softened gravity: positions uniform in
/// a disk of [`CLUSTER_RADIUS`], masses in proportion to weights drawn from
/// [`CLUSTER_WEIGHT`] and summing to [`CLUSTER_TOTAL_MASS`], small random
/// velocities. Deterministic per seed.
///
/// Positions use rejection sampling (`point_in_annulus` in `shared.rs`)
/// rather than `r = R√u, θ = 2πv`: no `sin`/`cos`, whose last bits depend on
/// the platform's libm, so the scenario starts bit-identical on every
/// platform.
///
/// # Errors
/// Only if a fixed constant were invalid (it isn't).
pub fn cluster<S: Scalar>(body_count: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut world = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS);
    world.add_force(cluster_gravity()?);
    add_bodies(&mut world, cluster_bodies(body_count, seed))?;
    Ok(world)
}

/// [`cluster`]'s bodies in `f64` (not generic: compiled once). Weights
/// are drawn per body in the same pass as position and velocity, then
/// scaled to the total.
pub(super) fn cluster_bodies(body_count: usize, seed: u64) -> Vec<BodyF64> {
    let mut rng = SplitMix64::new(seed);
    let mut bodies: Vec<BodyF64> = (0..body_count)
        .map(|_| {
            let position = point_in_annulus(&mut rng, 0.0, CLUSTER_RADIUS);
            let vx = rng.range(-CLUSTER_SPEED, CLUSTER_SPEED);
            let vy = rng.range(-CLUSTER_SPEED, CLUSTER_SPEED);
            let weight = rng.range(CLUSTER_WEIGHT.0, CLUSTER_WEIGHT.1);
            BodyF64 {
                position,
                velocity: (vx, vy),
                mass: weight,
            }
        })
        .collect();
    let total_weight: f64 = bodies.iter().map(|body| body.mass).sum();
    for body in &mut bodies {
        body.mass *= CLUSTER_TOTAL_MASS / total_weight;
    }
    bodies
}

#[cfg(test)]
mod tests;
