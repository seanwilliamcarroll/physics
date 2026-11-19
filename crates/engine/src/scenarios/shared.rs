//! What several scenarios share: physical constants, SI gravity, the checks
//! every scenario constant goes through, and the rejection sampler.

use crate::rng::SplitMix64;
use crate::{ConfigError, Mass, PairwiseGravity, Radius, Scalar, Softening, Vec2, World};

/// Standard gravity g₀, m/s²: a magnitude, applied downward (y is up) as
/// `(0, -g₀)`. Exact by definition (3rd CGPM, 1901), not a measurement.
pub const STANDARD_GRAVITY: f64 = 9.80665;

/// Newtonian constant of gravitation G, m³ kg⁻¹ s⁻²: CODATA 2018
/// recommended value (relative standard uncertainty 2.2 × 10⁻⁵). Unlike
/// [`STANDARD_GRAVITY`] this is a measurement, not a definition.
pub const GRAVITATIONAL_CONSTANT: f64 = 6.674_30e-11;

/// Newtonian gravity in SI units ([`GRAVITATIONAL_CONSTANT`]) with the
/// given softening: the only force the gravity scenarios use. Rebuilding a
/// scenario's force with a new softening is `clear_forces` +
/// `add_force(newtonian(softening))`.
#[must_use]
pub fn newtonian<S: Scalar>(softening: Softening<S>) -> PairwiseGravity<S> {
    PairwiseGravity::new(S::from_f64(GRAVITATIONAL_CONSTANT), softening)
}

pub(super) fn softening<S: Scalar>(length: f64) -> Result<Softening<S>, ConfigError> {
    Softening::new(S::from_f64(length)).ok_or(ConfigError::InvalidSoftening)
}

pub(super) fn mass<S: Scalar>(kilograms: f64) -> Result<Mass<S>, ConfigError> {
    Mass::new(S::from_f64(kilograms)).ok_or(ConfigError::InvalidMass)
}

pub(super) fn radius<S: Scalar>(meters: f64) -> Result<Radius<S>, ConfigError> {
    Radius::new(S::from_f64(meters)).ok_or(ConfigError::InvalidRadius)
}

/// A point uniform in the annulus `inner_radius ≤ r ≤ outer_radius` around
/// the origin (`inner_radius = 0`: the disk), by rejection sampling: draw in
/// the bounding square, keep points inside. No `sin`/`cos` (see
/// [`cluster`]). For the full disk a try is accepted with probability π/4,
/// so ~1.3 tries on average; the disk scenario's annulus is nearly as good.
pub(super) fn point_in_annulus(
    rng: &mut SplitMix64,
    inner_radius: f64,
    outer_radius: f64,
) -> (f64, f64) {
    loop {
        let (x, y) = (
            rng.range(-outer_radius, outer_radius),
            rng.range(-outer_radius, outer_radius),
        );
        let distance_squared = x * x + y * y;
        if inner_radius * inner_radius <= distance_squared
            && distance_squared <= outer_radius * outer_radius
        {
            return (x, y);
        }
    }
}

/// One body as a scenario computes it, in `f64`, before conversion to the
/// engine's scalar: setup math runs in `f64` once, not once per scalar
/// type (`.wasm` size; see `docs/03-wasm-shell.md`).
pub(super) struct BodyF64 {
    pub(super) position: (f64, f64),
    pub(super) velocity: (f64, f64),
    pub(super) mass: f64,
}

pub(super) fn add_bodies<S: Scalar>(
    world: &mut World<S>,
    bodies: impl IntoIterator<Item = BodyF64>,
) -> Result<(), ConfigError> {
    let vec = |(x, y): (f64, f64)| Vec2::from_f64(x, y);
    for body in bodies {
        world
            .particles
            .add(vec(body.position), vec(body.velocity), mass(body.mass)?);
    }
    Ok(())
}

#[cfg(test)]
mod tests;
