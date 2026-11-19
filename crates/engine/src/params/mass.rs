//! Mass: checked once at construction, trusted afterwards
//! (`docs/type-invariants.md`, item 1).

use crate::Scalar;

/// A dynamic particle's mass, kg: positive and finite, with a positive,
/// finite inverse.
///
/// Every solver weights by `inverse_mass = 1 / m`, so a bad mass (zero,
/// negative, NaN, infinite, or so small that `1 / m` overflows) would
/// corrupt every force and constraint touching the particle, far from the
/// cause. [`Mass::new`] rejects those once; [`Particles::add`] takes a
/// `Mass`, so storage never re-checks. Static particles have no `Mass`:
/// [`Particles::add_static`] is the only way to get `inverse_mass = 0`.
///
/// [`Particles::add`]: crate::Particles::add
/// [`Particles::add_static`]: crate::Particles::add_static
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Mass<S> {
    mass: S,
    inv: S,
}

impl<S: Scalar> Mass<S> {
    pub const ONE: Self = Self {
        mass: S::ONE,
        inv: S::ONE,
    };

    /// `Some` if `mass > 0`, `mass` is finite, and `1 / mass` is finite and
    /// `> 0`.
    ///
    /// `mass > 0` rejects zero, negatives, and NaN. Finiteness is read
    /// through [`Scalar::to_f64`] (lossless for `f32`/`f64`, ±∞ included);
    /// a fixed-point scalar has no infinities, so it passes there trivially.
    ///
    /// The inverse gets the same check, because a positive, finite mass can
    /// still overflow: `1 / 1e-39` is `+∞` in `f32`. A fixed-point `1 /
    /// mass` rounds to 0 for large masses, which would make a dynamic
    /// particle silently static.
    #[must_use]
    pub fn new(mass: S) -> Option<Self> {
        if !(mass > S::ZERO && mass.to_f64().is_finite()) {
            return None;
        }
        let inv = S::ONE / mass;
        (inv > S::ZERO && inv.to_f64().is_finite()).then_some(Self { mass, inv })
    }

    #[must_use]
    pub const fn get(self) -> S {
        self.mass
    }

    /// `1 / mass`, kg⁻¹: what the particle stores.
    #[must_use]
    pub const fn inverse(self) -> S {
        self.inv
    }
}

/// `Mass::new` for a mass known to be valid: shorthand for unit tests
/// (`test-support` has its own copy for integration tests).
#[cfg(test)]
pub(crate) fn kg<S: Scalar>(mass: f64) -> Mass<S> {
    Mass::new(S::from_f64(mass)).unwrap()
}

#[cfg(test)]
mod tests;
