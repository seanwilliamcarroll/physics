//! [`orbit`]: a star and a planet on a softened Kepler orbit (M1).

use core::num::NonZeroU32;

use super::shared::{GRAVITATIONAL_CONSTANT, gravity, mass, softening};
use crate::{ConfigError, Integrator, PairwiseGravity, Scalar, Vec2, World};

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
pub const ORBIT_SUBSTEPS: NonZeroU32 = NonZeroU32::MIN;

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
/// [`ORBIT_SOFTENING`] positive, and the masses positive and far from `S`'s
/// range limits).
pub fn orbit<S: Scalar>(integrator: Integrator, speed_ratio: f64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(integrator, ORBIT_SUBSTEPS);
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
        mass(star_mass)?,
    );
    w.particles.add(
        vec(d * planet_share, 0.0),
        vec(0.0, v_rel * planet_share),
        mass(planet_mass)?,
    );
    Ok(w)
}

#[cfg(test)]
mod tests;
