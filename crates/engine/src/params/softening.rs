//! [`Softening`]: Plummer softening length ε ≥ 0 (M2).

use crate::Scalar;

checked_param! {
    /// Plummer softening length ε, meters: a value known to be `≥ 0`.
    ///
    /// ε = 0 is valid: pure 1/r², what the M2 demo shows blowing up on a
    /// close pass. Negative ε (meaningless as a length) and NaN are
    /// rejected, so the force never has to re-check. (Squaring would make a
    /// negative ε harmless, but silently: a sign error at the boundary, e.g.
    /// a bad slider value, should be reported, not absorbed.) +∞ passes and
    /// gives zero force: harmless, not useful.
    Softening, |eps| eps >= S::ZERO
}

impl<S: Scalar> Softening<S> {
    /// No softening: pure 1/r².
    pub const ZERO: Self = Self(S::ZERO);

    /// ε², m²: the only form the force uses.
    #[must_use]
    pub fn squared(self) -> S {
        self.0 * self.0
    }
}

#[cfg(test)]
mod tests;
