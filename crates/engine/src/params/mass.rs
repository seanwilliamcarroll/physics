//! Mass: checked once at construction, trusted afterwards
//! (`docs/type-invariants.md`, item 1).

use crate::Scalar;

/// A dynamic particle's mass, kg: positive and finite, with a positive,
/// finite inverse.
///
/// Every solver weights by `inv_mass = 1 / m`, so a bad mass (zero,
/// negative, NaN, infinite, or so small that `1 / m` overflows) would
/// corrupt every force and constraint touching the particle, far from the
/// cause. [`Mass::new`] rejects those once; [`Particles::add`] takes a
/// `Mass`, so storage never re-checks. Static particles have no `Mass`:
/// [`Particles::add_static`] is the only way to get `inv_mass = 0`.
///
/// [`Particles::add`]: crate::Particles::add
/// [`Particles::add_static`]: crate::Particles::add_static
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Mass<S> {
    mass: S,
    /// `1 / mass`, computed once in [`Mass::new`]: exactly the value
    /// `Particles::add` used to compute itself, so results are unchanged.
    inv: S,
}

impl<S: Scalar> Mass<S> {
    /// One kilogram.
    pub const ONE: Self = Self {
        mass: S::ONE,
        inv: S::ONE,
    };

    /// `Some` if `m > 0`, `m` is finite, and `1 / m` is finite and `> 0`.
    ///
    /// `m > 0` rejects zero, negatives, and NaN (NaN fails every
    /// comparison). `Scalar` has no `is_finite`, so finiteness is read
    /// through [`Scalar::to_f64`], which is lossless for `f32`/`f64` (both
    /// widen exactly, ±∞ included). It runs once per particle at setup,
    /// not in a hot loop. A fixed-point scalar has no infinities, so the
    /// check passes trivially there. (`m - m == 0` would test finiteness
    /// without `to_f64`, but leans on `∞ - ∞ = NaN`: harder to read.)
    ///
    /// The inverse gets the same check, because a positive, finite `m`
    /// can still overflow: `1 / 1e-39` is `+∞` in `f32`. `1 / m > 0`
    /// can't fail in IEEE floats (`1 / f64::MAX` is subnormal, not 0), but
    /// a fixed-point `1 / m` rounds to 0 for large `m`, which would make a
    /// dynamic particle silently static.
    #[must_use]
    pub fn new(m: S) -> Option<Self> {
        if !(m > S::ZERO && m.to_f64().is_finite()) {
            return None;
        }
        let inv = S::ONE / m;
        (inv > S::ZERO && inv.to_f64().is_finite()).then_some(Self { mass: m, inv })
    }

    /// The mass, kg.
    #[must_use]
    pub const fn get(self) -> S {
        self.mass
    }

    /// `1 / mass`, kg⁻¹: what the particle stores.
    #[must_use]
    pub const fn inv(self) -> S {
        self.inv
    }
}

/// `Mass::new(m)` for a mass known to be valid: shorthand for unit tests.
/// (`test-support` has its own copy for integration tests; unit tests
/// can't use that crate, see its crate docs.)
#[cfg(test)]
pub(crate) fn kg<S: Scalar>(m: f64) -> Mass<S> {
    Mass::new(S::from_f64(m)).unwrap()
}

#[cfg(test)]
mod tests;
