//! [`Softening`]: Plummer softening length ε ≥ 0.

use crate::Scalar;

checked_param! {
    /// Plummer softening length ε, meters: a value known to be `≥ 0`.
    ///
    /// ε = 0 is valid: pure 1/r², which blows up on a close pass. Negative
    /// ε (meaningless as a length) and NaN are rejected, so the force never
    /// has to re-check. (Squaring would make a negative ε harmless, but
    /// silently: a sign error at the boundary, e.g. a bad slider value,
    /// should be reported, not absorbed.)
    Softening, |softening| softening >= S::ZERO
}

impl<S: Scalar> Softening<S> {
    pub const ZERO: Self = Self(S::ZERO);

    /// ε², m²: the only form the force uses.
    #[must_use]
    pub fn squared(self) -> S {
        self.0 * self.0
    }
}

#[cfg(test)]
mod tests;
