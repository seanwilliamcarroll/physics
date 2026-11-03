//! [`cluster`]: `n` bodies drifting under mutual softened gravity (M1, M2).

use core::num::NonZeroU32;

use super::shared::{BodyF64, gravity, mass, point_in_annulus, softening};
use crate::rng::SplitMix64;
use crate::{ConfigError, Integrator, PairwiseGravity, Scalar, Vec2, World};

/// Radius of the disk [`cluster`] fills, m.
pub const CLUSTER_RADIUS: f64 = 2.0;

/// Total mass of [`cluster`], kg, whatever N: `G M` ≈ 13 m³/s². Fixed so
/// the time scale doesn't change with N. Per-body mass ranges (as before
/// M2.6) made N = 1024 collapse and fling every body out of view within
/// 0.5 s, while N = 256 kept most. The value is the 16-body golden run's
/// former mean total (16 × 1.25 × 10¹⁰), so small clusters behave as
/// before.
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

/// Softening ε for [`cluster`], m: 1/20 of the radius, so close passes
/// give a bounded kick instead of flinging bodies apart.
pub const CLUSTER_SOFTENING: f64 = 0.1;

/// Substeps for [`cluster`]: one; tests probe conservation, not accuracy.
pub const CLUSTER_SUBSTEPS: NonZeroU32 = NonZeroU32::MIN;

/// The force [`cluster`] adds: [`gravity`] with [`CLUSTER_SOFTENING`].
/// Public so energy readouts use exactly the scene's force (like
/// [`orbit_gravity`](super::orbit_gravity)).
///
/// # Errors
/// Only if [`CLUSTER_SOFTENING`] were invalid (it isn't: it's positive).
pub fn cluster_gravity<S: Scalar>() -> Result<PairwiseGravity<S>, ConfigError> {
    softening(CLUSTER_SOFTENING).map(gravity)
}

/// `n` bodies under mutual softened gravity: positions uniform in a disk
/// of [`CLUSTER_RADIUS`], masses in proportion to weights drawn from
/// [`CLUSTER_WEIGHT`] and summing to [`CLUSTER_TOTAL_MASS`], small random
/// velocities. Deterministic per seed.
///
/// Positions use rejection sampling (`point_in_annulus` in `shared.rs`) rather than
/// `r = R√u, θ = 2πv`: no `sin`/`cos`, whose last bits depend on the
/// platform's libm, so the scene is bit-identical on every platform, which
/// cross-platform golden hashes rely on.
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't:
/// [`CLUSTER_SOFTENING`] positive, and the masses positive and far from
/// `S`'s range limits).
pub fn cluster<S: Scalar>(n: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS);
    w.add_force(cluster_gravity()?);
    let vec = |(x, y): (f64, f64)| Vec2::new(S::from_f64(x), S::from_f64(y));
    for (pos, vel, m) in cluster_bodies(n, seed) {
        w.particles.add(vec(pos), vec(vel), mass(m)?);
    }
    Ok(w)
}

/// [`cluster`]'s bodies in `f64` (not generic: compiled once). Weights
/// are drawn per body in the same pass as position and velocity, then
/// scaled to the total.
pub(super) fn cluster_bodies(n: usize, seed: u64) -> Vec<BodyF64> {
    let mut rng = SplitMix64::new(seed);
    let mut bodies: Vec<BodyF64> = (0..n)
        .map(|_| {
            let pos = point_in_annulus(&mut rng, 0.0, CLUSTER_RADIUS);
            let vx = rng.range(-CLUSTER_SPEED, CLUSTER_SPEED);
            let vy = rng.range(-CLUSTER_SPEED, CLUSTER_SPEED);
            let weight = rng.range(CLUSTER_WEIGHT.0, CLUSTER_WEIGHT.1);
            (pos, (vx, vy), weight)
        })
        .collect();
    let total_weight: f64 = bodies.iter().map(|b| b.2).sum();
    for b in &mut bodies {
        b.2 *= CLUSTER_TOTAL_MASS / total_weight;
    }
    bodies
}

#[cfg(test)]
mod tests;
