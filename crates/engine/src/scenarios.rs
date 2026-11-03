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

/// Body mass range for [`cluster`], kg: `(min, max)`. With G ≈ 6.7 × 10⁻¹¹,
/// `G m` is 0.3–1.3 m³/s², so bodies a meter apart accelerate at about
/// 1 m/s²: visible motion within seconds at demo scale, in SI units.
pub const CLUSTER_MASS: (f64, f64) = (0.5e10, 2.0e10);

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
/// of [`CLUSTER_RADIUS`], masses in [`CLUSTER_MASS`], small random
/// velocities. Deterministic per seed.
///
/// Positions use rejection sampling (draw in the square, keep points
/// inside the disk) rather than `r = R√u, θ = 2πv`: no `sin`/`cos`, whose
/// last bits depend on the platform's libm, so the scene is bit-identical
/// on every platform, which cross-platform golden hashes rely on.
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't:
/// [`CLUSTER_SUBSTEPS`] is nonzero, [`CLUSTER_SOFTENING`] positive).
pub fn cluster<S: Scalar>(n: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS)?;
    w.add_force(cluster_gravity()?);
    let mut rng = SplitMix64::new(seed);
    let r = CLUSTER_RADIUS;
    for _ in 0..n {
        // Accepts with probability π/4 per try, so ~1.3 tries on average.
        let (x, y) = loop {
            let (x, y) = (rng.range(-r, r), rng.range(-r, r));
            if x * x + y * y <= r * r {
                break (x, y);
            }
        };
        let vx = rng.range(-CLUSTER_SPEED, CLUSTER_SPEED);
        let vy = rng.range(-CLUSTER_SPEED, CLUSTER_SPEED);
        let mass = rng.range(CLUSTER_MASS.0, CLUSTER_MASS.1);
        w.particles.add(
            Vec2::new(S::from_f64(x), S::from_f64(y)),
            Vec2::new(S::from_f64(vx), S::from_f64(vy)),
            S::from_f64(mass),
        );
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
