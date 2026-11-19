//! [`Damping`]: a spring's damper c ≥ 0, finite.

use crate::Scalar;

checked_param! {
    /// Damping coefficient c, N·s/m: a value known to be `≥ 0` and finite. 0
    /// is undamped. Applied along the spring, to the relative velocity of its
    /// ends, in every stepper (`docs/07-soft-bodies.md`).
    Damping, |damping| damping >= S::ZERO
}

impl<S: Scalar> Damping<S> {
    pub const NONE: Self = Self(S::ZERO);
}

#[cfg(test)]
mod tests;
