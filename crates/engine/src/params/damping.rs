//! [`Damping`]: a spring's damper c ≥ 0, finite (M5).

use crate::Scalar;

/// Damping coefficient c, N·s/m: a value known to be `≥ 0` and finite. 0
/// is undamped. Applied along the spring, to the relative velocity of its
/// ends, in every stepper (`docs/07-soft-bodies.md`). Written out, like
/// [`Stiffness`](crate::Stiffness), because narrowing can overflow.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Damping<S>(S);

impl<S: Scalar> Damping<S> {
    /// No damping.
    pub const NONE: Self = Self(S::ZERO);

    /// `Some` if `c ≥ 0` and finite (NaN fails `c ≥ 0`).
    #[must_use]
    pub fn new(c: S) -> Option<Self> {
        (c >= S::ZERO && c.to_f64().is_finite()).then_some(Self(c))
    }

    /// c, N·s/m.
    #[must_use]
    pub const fn get(self) -> S {
        self.0
    }

    /// The same c in another scalar type, re-checked: `None` if it
    /// overflows there.
    #[must_use]
    pub fn cast<T: Scalar>(self) -> Option<Damping<T>> {
        Damping::new(T::from_f64(self.0.to_f64()))
    }
}

#[cfg(test)]
mod tests;
