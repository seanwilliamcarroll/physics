//! [`collapse`]: a cold cloud falling in on itself (M2).

use super::cluster::{CLUSTER_RADIUS, CLUSTER_SUBSTEPS, cluster_gravity};
use super::shared::{mass, point_in_annulus};
use crate::rng::SplitMix64;
use crate::{ConfigError, Integrator, Scalar, Vec2, World};

/// Total mass of [`collapse`], kg, shared equally: `G M` = 2 m³/s², so the
/// free-fall scale `√(R³ / G M)` is 2 s at [`CLUSTER_RADIUS`] whatever N.
pub const COLLAPSE_TOTAL_MASS: f64 = 3.0e10;

/// A cold cloud: `n` equal-mass bodies uniform in a disk of
/// [`CLUSTER_RADIUS`], all at rest, so gravity pulls it in on itself.
/// Zero momentum and center-of-mass motion by construction. Deterministic
/// per seed.
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't:
/// [`CLUSTER_SOFTENING`](super::CLUSTER_SOFTENING) positive, and the masses
/// positive and far from `S`'s range limits).
pub fn collapse<S: Scalar>(n: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS);
    w.add_force(cluster_gravity()?);
    #[expect(
        clippy::cast_precision_loss,
        reason = "body counts are far below 2^53, so the conversion is exact"
    )]
    let m = mass(COLLAPSE_TOTAL_MASS / n.max(1) as f64)?;
    let mut rng = SplitMix64::new(seed);
    for _ in 0..n {
        let (x, y) = point_in_annulus(&mut rng, 0.0, CLUSTER_RADIUS);
        w.particles.add(Vec2::from_f64(x, y), Vec2::ZERO, m);
    }
    Ok(w)
}

#[cfg(test)]
mod tests;
