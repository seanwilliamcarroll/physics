//! Ready-made worlds, shared by tests and demos: the scene you test is the
//! scene you demo. All in SI units.

use crate::rng::SplitMix64;
use crate::{
    ConfigError, Integrator, PairwiseGravity, Scalar, Softening, UniformGravity, Vec2, World,
};

/// Standard gravity g₀, m/s²: a magnitude, applied downward (y is up) as
/// `(0, -g₀)`. Exact by definition (3rd CGPM, 1901), not a measurement.
pub const STANDARD_GRAVITY: f64 = 9.80665;

/// Newtonian constant of gravitation G, m³ kg⁻¹ s⁻²: CODATA 2018
/// recommended value (relative standard uncertainty 2.2 × 10⁻⁵). Unlike
/// [`STANDARD_GRAVITY`] this is a measurement, not a definition.
pub const GRAVITATIONAL_CONSTANT: f64 = 6.674_30e-11;

/// Substeps per fixed step for [`Fountain`]. One is enough: symplectic
/// Euler's error under constant gravity is ½ g h t (`tests/invariants.rs`),
/// about 8 cm after 1 s of flight at 60 Hz, invisible at demo scale.
pub const FOUNTAIN_SUBSTEPS: u32 = 1;

/// Launch velocity ranges for [`Fountain`], m/s: `(min, max)`.
pub const FOUNTAIN_VX: (f64, f64) = (-2.0, 2.0);
pub const FOUNTAIN_VY: (f64, f64) = (8.0, 12.0);

/// The M0 demo: unit-mass particles launched from the origin with random
/// upward velocities under standard gravity, relaunched once they fall
/// below the launch height.
///
/// Owns the PRNG, so the whole run (initial launch and every respawn) is
/// deterministic for a given seed. Randomness is drawn in `f64` and
/// converted once, so every scalar type sees the same values (up to its own
/// rounding).
pub struct Fountain {
    rng: SplitMix64,
}

impl Fountain {
    #[must_use]
    pub const fn new(seed: u64) -> Self {
        Self {
            rng: SplitMix64::new(seed),
        }
    }

    /// Builds a world with `n` freshly launched particles.
    ///
    /// # Errors
    /// Only if the fixed configuration were invalid (it isn't:
    /// [`FOUNTAIN_SUBSTEPS`] is nonzero); the `Result` comes from [`World::new`].
    pub fn world<S: Scalar>(&mut self, n: usize) -> Result<World<S>, ConfigError> {
        let mut w = World::new(Integrator::SymplecticEuler, FOUNTAIN_SUBSTEPS)?;
        w.add_force(UniformGravity::new(Vec2::new(
            S::ZERO,
            -S::from_f64(STANDARD_GRAVITY),
        )));
        for _ in 0..n {
            let vel = self.launch_velocity();
            w.particles.add(Vec2::ZERO, vel, S::ONE);
        }
        Ok(w)
    }

    /// Relaunches every dynamic particle below the launch height (y < 0)
    /// from the origin with a new random velocity. Returns how many.
    ///
    /// A teleport, not physics: it breaks momentum and energy conservation
    /// on purpose. Call it between steps, never inside invariant tests.
    pub fn respawn_fallen<S: Scalar>(&mut self, w: &mut World<S>) -> usize {
        let p = &mut w.particles;
        let mut count = 0;
        for ((x, v), &inv_mass) in p.pos.iter_mut().zip(&mut p.vel).zip(&p.inv_mass) {
            if inv_mass != S::ZERO && x.y < S::ZERO {
                *x = Vec2::ZERO;
                *v = self.launch_velocity();
                count += 1;
            }
        }
        count
    }

    fn launch_velocity<S: Scalar>(&mut self) -> Vec2<S> {
        let vx = self.rng.range(FOUNTAIN_VX.0, FOUNTAIN_VX.1);
        let vy = self.rng.range(FOUNTAIN_VY.0, FOUNTAIN_VY.1);
        Vec2::new(S::from_f64(vx), S::from_f64(vy))
    }
}

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
pub const CLUSTER_SUBSTEPS: u32 = 1;

/// Newtonian gravity in SI units ([`GRAVITATIONAL_CONSTANT`]) with the
/// given softening: the only force the gravity scenes use. Rebuilding a
/// scene's force with a new ε is `clear_forces` + `add_force(gravity(ε))`.
#[must_use]
pub fn gravity<S: Scalar>(softening: Softening<S>) -> PairwiseGravity<S> {
    PairwiseGravity::new(S::from_f64(GRAVITATIONAL_CONSTANT), softening)
}

/// Checks a scene's softening constant once, in `S`.
fn softening<S: Scalar>(eps: f64) -> Result<Softening<S>, ConfigError> {
    Softening::new(S::from_f64(eps)).ok_or(ConfigError::InvalidSoftening)
}

/// The force [`cluster`] adds: [`gravity`] with [`CLUSTER_SOFTENING`].
/// Public so energy readouts use exactly the scene's force (like
/// [`orbit_gravity`]).
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
/// Positions use rejection sampling ([`point_in_annulus`]) rather than
/// `r = R√u, θ = 2πv`: no `sin`/`cos`, whose last bits depend on the
/// platform's libm, so the scene is bit-identical on every platform, which
/// cross-platform golden hashes rely on.
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't:
/// [`CLUSTER_SUBSTEPS`] is nonzero, [`CLUSTER_SOFTENING`] positive).
pub fn cluster<S: Scalar>(n: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS)?;
    w.add_force(cluster_gravity()?);
    let vec = |(x, y): (f64, f64)| Vec2::new(S::from_f64(x), S::from_f64(y));
    for (pos, vel, mass) in cluster_bodies(n, seed) {
        w.particles.add(vec(pos), vec(vel), S::from_f64(mass));
    }
    Ok(w)
}

/// [`cluster`]'s bodies in `f64` (not generic: compiled once). Weights
/// are drawn per body in the same pass as position and velocity, then
/// scaled to the total.
fn cluster_bodies(n: usize, seed: u64) -> Vec<BodyF64> {
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

/// A point uniform in the annulus `inner ≤ r ≤ outer` around the origin
/// (`inner = 0`: the disk), by rejection sampling: draw in the bounding
/// square, keep points inside. No `sin`/`cos` (see [`cluster`]). For the
/// full disk a try is accepted with probability π/4, so ~1.3 tries on
/// average; the disk scene's annulus is nearly as good.
fn point_in_annulus(rng: &mut SplitMix64, inner: f64, outer: f64) -> (f64, f64) {
    loop {
        let (x, y) = (rng.range(-outer, outer), rng.range(-outer, outer));
        let r_sq = x * x + y * y;
        if inner * inner <= r_sq && r_sq <= outer * outer {
            return (x, y);
        }
    }
}

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
/// [`CLUSTER_SUBSTEPS`] is nonzero, [`CLUSTER_SOFTENING`] positive).
pub fn disk<S: Scalar>(n: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS)?;
    w.add_force(cluster_gravity()?);
    let vec = |(x, y): (f64, f64)| Vec2::new(S::from_f64(x), S::from_f64(y));
    for (pos, vel, mass) in disk_bodies(n, seed) {
        w.particles.add(vec(pos), vec(vel), S::from_f64(mass));
    }
    Ok(w)
}

/// One body in `f64` before conversion: `(position, velocity, mass)`.
type BodyF64 = ((f64, f64), (f64, f64), f64);

/// [`disk`]'s bodies in `f64`, center first. Not generic, so the setup (including its sort) is compiled once
/// rather than once per scalar type in the `.wasm`.
fn disk_bodies(n: usize, seed: u64) -> Vec<BodyF64> {
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
/// [`CLUSTER_SUBSTEPS`] is nonzero, [`CLUSTER_SOFTENING`] positive).
pub fn collapse<S: Scalar>(n: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS)?;
    w.add_force(cluster_gravity()?);
    #[expect(
        clippy::cast_precision_loss,
        reason = "body counts are far below 2^53, so the conversion is exact"
    )]
    let m = S::from_f64(COLLAPSE_TOTAL_MASS / n.max(1) as f64);
    let mut rng = SplitMix64::new(seed);
    for _ in 0..n {
        let (x, y) = point_in_annulus(&mut rng, 0.0, CLUSTER_RADIUS);
        w.particles
            .add(Vec2::new(S::from_f64(x), S::from_f64(y)), Vec2::ZERO, m);
    }
    Ok(w)
}

/// Star–planet separation for [`orbit`], m.
pub const ORBIT_SEPARATION: f64 = 2.0;

/// Nominal period for [`orbit`], s: the unsoftened Kepler period that
/// fixes the total mass. About 3 s keeps a few orbits on screen per
/// demo-minute while each orbit still spans many 60 Hz steps.
pub const ORBIT_NOMINAL_PERIOD: f64 = 3.0;

/// Planet mass / star mass. Small, so the star barely wobbles and the
/// orbit reads as "planet around star", but not zero: both bodies move,
/// so momentum conservation is still exercised.
pub const ORBIT_MASS_RATIO: f64 = 1.0e-3;

/// Softening ε for [`orbit`], m: 1/200 of the separation, so the force is
/// nearly pure 1/r² (period changes by < 10⁻⁴) while ε = 0 stays an
/// explicit choice for M2.
pub const ORBIT_SOFTENING: f64 = 0.01;

/// `speed_ratio` for a circular [`orbit`]: launch at exactly the circular
/// speed.
pub const ORBIT_CIRCULAR: f64 = 1.0;

/// Substeps for [`orbit`]: one, so `dt` is exactly what the integrators
/// are compared at.
pub const ORBIT_SUBSTEPS: u32 = 1;

/// Total mass, kg, from Kepler's third law for the nominal period:
/// `G M = 4π² d³ / T²` (about 5.3 × 10¹¹ kg). Evaluated at compile time.
pub const ORBIT_TOTAL_MASS: f64 = 4.0
    * core::f64::consts::PI
    * core::f64::consts::PI
    * ORBIT_SEPARATION
    * ORBIT_SEPARATION
    * ORBIT_SEPARATION
    / (GRAVITATIONAL_CONSTANT * ORBIT_NOMINAL_PERIOD * ORBIT_NOMINAL_PERIOD);

/// Relative speed for a circular orbit under the *softened* force, m/s:
/// `v² / d = G M d / (d² + ε²)^(3/2)`.
///
/// `(d² + ε²)^(3/2)` is computed as `q √q`, not `powf(1.5)`: `sqrt` is
/// correctly rounded everywhere (IEEE 754), `powf` comes from the
/// platform's libm and may differ in the last bits across targets.
#[must_use]
pub fn orbit_relative_speed() -> f64 {
    let (d, eps) = (ORBIT_SEPARATION, ORBIT_SOFTENING);
    let q = d * d + eps * eps;
    (GRAVITATIONAL_CONSTANT * ORBIT_TOTAL_MASS * d * d / (q * q.sqrt())).sqrt()
}

/// The actual (softened) period of the circular orbit, s: `2π d / v`.
#[must_use]
pub fn orbit_period() -> f64 {
    2.0 * core::f64::consts::PI * ORBIT_SEPARATION / orbit_relative_speed()
}

/// The force [`orbit`] adds: [`gravity`] with [`ORBIT_SOFTENING`]. Public
/// so energy readouts (`diagnostics::total_energy`) use exactly the scene's
/// force.
///
/// # Errors
/// Only if [`ORBIT_SOFTENING`] were invalid (it isn't: it's positive).
pub fn orbit_gravity<S: Scalar>() -> Result<PairwiseGravity<S>, ConfigError> {
    softening(ORBIT_SOFTENING).map(gravity)
}

/// A star and a planet [`ORBIT_SEPARATION`] apart, center of mass at the
/// origin and at rest, advanced by `integrator`.
///
/// `speed_ratio` scales the circular launch speed: 1 is a circle, below 1
/// an ellipse with the planet starting at apoapsis (the precession
/// tests use one). Must be positive: 0 drops the planet straight onto
/// the star.
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't:
/// [`ORBIT_SUBSTEPS`] is nonzero, [`ORBIT_SOFTENING`] positive).
pub fn orbit<S: Scalar>(integrator: Integrator, speed_ratio: f64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(integrator, ORBIT_SUBSTEPS)?;
    w.add_force(orbit_gravity()?);
    // Split the separation and the relative velocity by mass, so the
    // center of mass sits at the origin with zero momentum.
    let q = ORBIT_MASS_RATIO;
    let (star_mass, planet_mass) = (
        ORBIT_TOTAL_MASS / (1.0 + q),
        ORBIT_TOTAL_MASS * q / (1.0 + q),
    );
    let (star_share, planet_share) = (q / (1.0 + q), 1.0 / (1.0 + q));
    let v_rel = orbit_relative_speed() * speed_ratio;
    let d = ORBIT_SEPARATION;
    let vec = |x: f64, y: f64| Vec2::new(S::from_f64(x), S::from_f64(y));
    w.particles.add(
        vec(-d * star_share, 0.0),
        vec(0.0, -v_rel * star_share),
        S::from_f64(star_mass),
    );
    w.particles.add(
        vec(d * planet_share, 0.0),
        vec(0.0, v_rel * planet_share),
        S::from_f64(planet_mass),
    );
    Ok(w)
}

#[cfg(test)]
mod tests;
