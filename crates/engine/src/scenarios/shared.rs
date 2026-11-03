//! What several scenes share: physical constants, SI gravity, the checks
//! every scene constant goes through, and the rejection sampler.

use crate::rng::SplitMix64;
use crate::{ConfigError, Mass, PairwiseGravity, Scalar, Softening, Vec2, World};

/// Standard gravity g₀, m/s²: a magnitude, applied downward (y is up) as
/// `(0, -g₀)`. Exact by definition (3rd CGPM, 1901), not a measurement.
pub const STANDARD_GRAVITY: f64 = 9.80665;

/// Newtonian constant of gravitation G, m³ kg⁻¹ s⁻²: CODATA 2018
/// recommended value (relative standard uncertainty 2.2 × 10⁻⁵). Unlike
/// [`STANDARD_GRAVITY`] this is a measurement, not a definition.
pub const GRAVITATIONAL_CONSTANT: f64 = 6.674_30e-11;

/// Newtonian gravity in SI units ([`GRAVITATIONAL_CONSTANT`]) with the
/// given softening: the only force the gravity scenes use. Rebuilding a
/// scene's force with a new ε is `clear_forces` + `add_force(newtonian(ε))`.
#[must_use]
pub fn newtonian<S: Scalar>(softening: Softening<S>) -> PairwiseGravity<S> {
    PairwiseGravity::new(S::from_f64(GRAVITATIONAL_CONSTANT), softening)
}

/// Checks a scene's softening constant once, in `S`.
pub(super) fn softening<S: Scalar>(eps: f64) -> Result<Softening<S>, ConfigError> {
    Softening::new(S::from_f64(eps)).ok_or(ConfigError::InvalidSoftening)
}

/// Checks a scene's computed mass once, in `S`.
pub(super) fn mass<S: Scalar>(m: f64) -> Result<Mass<S>, ConfigError> {
    Mass::new(S::from_f64(m)).ok_or(ConfigError::InvalidMass)
}

/// A point uniform in the annulus `inner ≤ r ≤ outer` around the origin
/// (`inner = 0`: the disk), by rejection sampling: draw in the bounding
/// square, keep points inside. No `sin`/`cos` (see [`cluster`]). For the
/// full disk a try is accepted with probability π/4, so ~1.3 tries on
/// average; the disk scene's annulus is nearly as good.
pub(super) fn point_in_annulus(rng: &mut SplitMix64, inner: f64, outer: f64) -> (f64, f64) {
    loop {
        let (x, y) = (rng.range(-outer, outer), rng.range(-outer, outer));
        let r_sq = x * x + y * y;
        if inner * inner <= r_sq && r_sq <= outer * outer {
            return (x, y);
        }
    }
}

/// One body as a scene computes it, in `f64`, before conversion to the
/// engine's scalar: setup math runs in `f64` once, not once per scalar
/// type (`.wasm` size; see `docs/03-wasm-shell.md`).
pub(super) struct BodyF64 {
    pub(super) pos: (f64, f64),
    pub(super) vel: (f64, f64),
    /// kg.
    pub(super) mass: f64,
}

/// Converts `bodies` to `S` and adds them to `w`, each mass checked once.
pub(super) fn add_bodies<S: Scalar>(
    w: &mut World<S>,
    bodies: impl IntoIterator<Item = BodyF64>,
) -> Result<(), ConfigError> {
    let vec = |(x, y): (f64, f64)| Vec2::new(S::from_f64(x), S::from_f64(y));
    for b in bodies {
        w.particles.add(vec(b.pos), vec(b.vel), mass(b.mass)?);
    }
    Ok(())
}

#[cfg(test)]
mod tests;
