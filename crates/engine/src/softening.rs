//! Softening length ε: checked once at construction, trusted afterwards
//! (`docs/type-invariants.md`, item 2).

use crate::Scalar;

/// Plummer softening length ε, meters: a value known to be `≥ 0`.
///
/// ε = 0 is valid: pure 1/r², what the M2 demo shows blowing up on a close
/// pass. Negative ε (meaningless as a length) and NaN are rejected by
/// [`Softening::new`], so the force never has to re-check. (Squaring would
/// make a negative ε harmless, but silently: a sign error at the boundary,
/// e.g. a bad slider value, should be reported, not absorbed.)
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Softening<S>(S);

impl<S: Scalar> Softening<S> {
    /// No softening: pure 1/r².
    pub const ZERO: Self = Self(S::ZERO);

    /// `Some` if `eps ≥ 0`. NaN fails every comparison, so the same check
    /// rejects it. (+∞ passes and gives zero force: harmless, not useful.)
    #[must_use]
    pub fn new(eps: S) -> Option<Self> {
        (eps >= S::ZERO).then_some(Self(eps))
    }

    /// ε, meters.
    #[must_use]
    pub const fn get(self) -> S {
        self.0
    }

    /// ε², m²: the only form the force uses.
    #[must_use]
    pub fn squared(self) -> S {
        self.0 * self.0
    }
}

#[cfg(test)]
mod tests;
