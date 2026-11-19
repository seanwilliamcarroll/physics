//! [`disk`]: a heavy center with orbiters on enclosed-mass circular orbits.

use super::cluster::{CLUSTER_SOFTENING, CLUSTER_SUBSTEPS, cluster_gravity};
use super::shared::{BodyF64, GRAVITATIONAL_CONSTANT, add_bodies, point_in_annulus};
use crate::rng::SplitMix64;
use crate::sort_key::{SortKey, f64_key, sort};
use crate::{ConfigError, Integrator, Scalar, World};
use math::convert::usize_to_f64;

/// Outer radius of [`disk`], m: the same as the cluster's, so the scenarios
/// share a view.
pub const DISK_RADIUS: f64 = 2.0;

/// Inner radius of [`disk`], m: 3 × the softening ([`CLUSTER_SOFTENING`]),
/// so no orbiter starts inside the center's softened core, where the
/// circular speed formula would put it on a slow, barely bound orbit. Also
/// bounds the fastest orbit: period ≈ 0.6 s, about 35 steps at 60 Hz.
pub const DISK_INNER_RADIUS: f64 = 0.3;

/// Mass of [`disk`]'s central body, kg: `G M` ≈ 3.3 m³/s², so an orbiter
/// at [`DISK_RADIUS`] takes about 10 s per orbit.
pub const DISK_CENTRAL_MASS: f64 = 5.0e10;

/// Total mass of [`disk`]'s orbiters, kg, shared equally: 1/5 of the
/// center. Fixed rather than per body, so the time scale doesn't change
/// with N, and small next to the center, so the enclosed-mass speeds are
/// close to right (see [`disk`]).
pub const DISK_ORBITERS_TOTAL_MASS: f64 = 1.0e10;

/// A heavy body at the origin and `body_count - 1` equal-mass orbiters
/// scattered over the annulus [`DISK_INNER_RADIUS`]..[`DISK_RADIUS`], each
/// launched counterclockwise at the circular speed for the mass inside its
/// radius (center plus closer orbiters), under the softened force. Looks
/// like a stable disk at first; orbiter–orbiter pulls then make it chaotic.
///
/// The enclosed mass is an approximation: Newton's shell theorem doesn't
/// hold for 1/r² gravity in a plane, so mass *outside* a radius still pulls.
/// The heavy center keeps the error small. Every velocity then gets the
/// same boost that makes total momentum zero, which leaves the speeds
/// relative to the center unchanged. Only `sqrt`, no trig: bit-identical
/// across platforms. Deterministic per seed.
///
/// # Errors
/// Only if a fixed constant were invalid (it isn't).
pub fn disk<S: Scalar>(body_count: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut world = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS);
    world.add_force(cluster_gravity()?);
    add_bodies(&mut world, disk_bodies(body_count, seed))?;
    Ok(world)
}

/// [`disk`]'s bodies in `f64`, center first. Not generic, so the setup
/// (including its sort) is compiled once rather than once per scalar type
/// in the `.wasm`.
pub(super) fn disk_bodies(body_count: usize, seed: u64) -> Vec<BodyF64> {
    let Some(orbiter_count) = body_count.checked_sub(1) else {
        return Vec::new();
    };
    let mut rng = SplitMix64::new(seed);
    let positions: Vec<(f64, f64)> = (0..orbiter_count)
        .map(|_| point_in_annulus(&mut rng, DISK_INNER_RADIUS, DISK_RADIUS))
        .collect();
    let orbiter_mass = DISK_ORBITERS_TOTAL_MASS / usize_to_f64(orbiter_count.max(1));

    // Enclosed mass: the center plus every orbiter strictly closer in.
    // Sorted squared radii make that a binary search per orbiter, sorted
    // through the engine's one key type (`sort_key.rs`: an f64 key in total
    // order) rather than its own f64 sort (~6 KB of `.wasm`); equal radii
    // are indistinguishable, so the unstable order is moot.
    let radii_squared: Vec<f64> = positions.iter().map(|&(x, y)| x * x + y * y).collect();
    let mut keys: Vec<SortKey> = radii_squared
        .iter()
        .enumerate()
        .map(|(index, &radius_squared)| (f64_key(radius_squared), 0, index))
        .collect();
    sort(&mut keys);
    let sorted_radii_squared: Vec<f64> = keys
        .iter()
        .filter_map(|&(_, _, index)| radii_squared.get(index).copied())
        .collect();
    let softening_squared = CLUSTER_SOFTENING * CLUSTER_SOFTENING;
    let velocities: Vec<(f64, f64)> = positions
        .iter()
        .map(|&(x, y)| {
            let radius_squared = x * x + y * y;
            let closer_count =
                usize_to_f64(sorted_radii_squared.partition_point(|&other| other < radius_squared));
            let enclosed_mass = DISK_CENTRAL_MASS + orbiter_mass * closer_count;
            // v² / r = G M r / (r² + ε²)^(3/2), as for `orbit_relative_speed`.
            let softened_squared = radius_squared + softening_squared;
            let speed = (GRAVITATIONAL_CONSTANT * enclosed_mass * radius_squared
                / (softened_squared * softened_squared.sqrt()))
            .sqrt();
            // Counterclockwise unit tangent: (-y, x) / r.
            let radius = radius_squared.sqrt();
            (-y / radius * speed, x / radius * speed)
        })
        .collect();

    // Boost into the zero-momentum frame: subtract P / M_total from all.
    let (momentum_x, momentum_y) =
        velocities
            .iter()
            .fold((0.0, 0.0), |(momentum_x, momentum_y), &(vx, vy)| {
                (
                    momentum_x + orbiter_mass * vx,
                    momentum_y + orbiter_mass * vy,
                )
            });
    let total_mass = DISK_CENTRAL_MASS + DISK_ORBITERS_TOTAL_MASS;
    let (boost_x, boost_y) = (-momentum_x / total_mass, -momentum_y / total_mass);
    let center = BodyF64 {
        position: (0.0, 0.0),
        velocity: (boost_x, boost_y),
        mass: DISK_CENTRAL_MASS,
    };
    let orbiters = positions
        .into_iter()
        .zip(velocities)
        .map(|(position, (vx, vy))| BodyF64 {
            position,
            velocity: (vx + boost_x, vy + boost_y),
            mass: orbiter_mass,
        });
    core::iter::once(center).chain(orbiters).collect()
}

#[cfg(test)]
mod tests;
