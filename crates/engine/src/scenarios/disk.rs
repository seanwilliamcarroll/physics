//! [`disk`]: a heavy center with orbiters on enclosed-mass circular orbits
//! (M2).

use super::cluster::{CLUSTER_SOFTENING, CLUSTER_SUBSTEPS, cluster_gravity};
use super::shared::{BodyF64, GRAVITATIONAL_CONSTANT, mass, point_in_annulus};
use crate::rng::SplitMix64;
use crate::{ConfigError, Integrator, Scalar, Vec2, World};

/// Outer radius of [`disk`], m: the same as the cluster's, so the scenes
/// share a view.
pub const DISK_RADIUS: f64 = 2.0;

/// Inner radius of [`disk`], m: 3 ε ([`CLUSTER_SOFTENING`]), so no orbiter
/// starts inside the center's softened core, where the circular speed
/// formula would put it on a slow, barely bound orbit. Also bounds the
/// fastest orbit: period ≈ 0.6 s, about 35 steps at 60 Hz.
pub const DISK_INNER_RADIUS: f64 = 0.3;

/// Mass of [`disk`]'s central body, kg: `G M` ≈ 3.3 m³/s², so an orbiter
/// at [`DISK_RADIUS`] takes about 10 s per orbit.
pub const DISK_CENTRAL_MASS: f64 = 5.0e10;

/// Total mass of [`disk`]'s orbiters, kg, shared equally: 1/5 of the
/// center. Fixed rather than per body, so the time scale doesn't change
/// with N, and small next to the center, so the enclosed-mass speeds are
/// close to right (see [`disk`]).
pub const DISK_ORBITERS_TOTAL_MASS: f64 = 1.0e10;

/// A heavy body at the origin and `n - 1` equal-mass orbiters scattered
/// over the annulus [`DISK_INNER_RADIUS`]..[`DISK_RADIUS`], each launched
/// counterclockwise at the circular speed for the mass inside its radius
/// (center plus closer orbiters), under the softened force. Looks like a
/// stable disk at first; orbiter–orbiter pulls then make it chaotic.
///
/// The enclosed mass is an approximation: Newton's shell theorem doesn't
/// hold for 1/r² gravity in a plane, so mass *outside* a radius still pulls.
/// The heavy center keeps the error small. Every velocity then gets the
/// same boost that makes total momentum zero, which leaves the speeds
/// relative to the center unchanged. Only `sqrt`, no trig: bit-identical
/// across platforms. Deterministic per seed.
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't:
/// [`CLUSTER_SOFTENING`] positive, and the masses positive and far from
/// `S`'s range limits).
pub fn disk<S: Scalar>(n: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS);
    w.add_force(cluster_gravity()?);
    let vec = |(x, y): (f64, f64)| Vec2::new(S::from_f64(x), S::from_f64(y));
    for (pos, vel, m) in disk_bodies(n, seed) {
        w.particles.add(vec(pos), vec(vel), mass(m)?);
    }
    Ok(w)
}

/// [`disk`]'s bodies in `f64`, center first. Not generic, so the setup (including its sort) is compiled once
/// rather than once per scalar type in the `.wasm`.
pub(super) fn disk_bodies(n: usize, seed: u64) -> Vec<BodyF64> {
    let Some(orbiters) = n.checked_sub(1) else {
        return Vec::new();
    };
    let mut rng = SplitMix64::new(seed);
    let pos: Vec<(f64, f64)> = (0..orbiters)
        .map(|_| point_in_annulus(&mut rng, DISK_INNER_RADIUS, DISK_RADIUS))
        .collect();
    #[expect(
        clippy::cast_precision_loss,
        reason = "orbiter counts are far below 2^53, so the conversion is exact"
    )]
    let m = DISK_ORBITERS_TOTAL_MASS / orbiters.max(1) as f64;

    // Enclosed mass: the center plus every orbiter strictly closer in.
    // Sorted squared radii make that a binary search per orbiter.
    // Unstable: equal f64 keys are indistinguishable, and std's unstable
    // sort is smaller in the `.wasm` (~7.4 KB vs ~8.9 KB stable).
    let mut r_sq_sorted: Vec<f64> = pos.iter().map(|&(x, y)| x * x + y * y).collect();
    r_sq_sorted.sort_unstable_by(f64::total_cmp);
    let eps_sq = CLUSTER_SOFTENING * CLUSTER_SOFTENING;
    let vel: Vec<(f64, f64)> = pos
        .iter()
        .map(|&(x, y)| {
            let r_sq = x * x + y * y;
            #[expect(
                clippy::cast_precision_loss,
                reason = "orbiter counts are far below 2^53, so the conversion is exact"
            )]
            let closer = r_sq_sorted.partition_point(|&q| q < r_sq) as f64;
            let enclosed = DISK_CENTRAL_MASS + m * closer;
            // v² / r = G M r / (r² + ε²)^(3/2), as for `orbit_relative_speed`.
            let q = r_sq + eps_sq;
            let speed = (GRAVITATIONAL_CONSTANT * enclosed * r_sq / (q * q.sqrt())).sqrt();
            // Counterclockwise unit tangent: (-y, x) / r.
            let r = r_sq.sqrt();
            (-y / r * speed, x / r * speed)
        })
        .collect();

    // Boost into the zero-momentum frame: subtract P / M_total from all.
    let (px, py) = vel
        .iter()
        .fold((0.0, 0.0), |(px, py), &(vx, vy)| (px + m * vx, py + m * vy));
    let total = DISK_CENTRAL_MASS + DISK_ORBITERS_TOTAL_MASS;
    let (bx, by) = (-px / total, -py / total);
    core::iter::once(((0.0, 0.0), (bx, by), DISK_CENTRAL_MASS))
        .chain(
            pos.into_iter()
                .zip(vel)
                .map(|(p, (vx, vy))| (p, (vx + bx, vy + by), m)),
        )
        .collect()
}

#[cfg(test)]
mod tests;
