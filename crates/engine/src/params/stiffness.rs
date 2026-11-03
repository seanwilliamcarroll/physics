//! [`Stiffness`]: a force-based spring's k > 0, finite (M5).

use crate::Scalar;

/// Spring stiffness k, N/m: a value known to be positive and finite. A
/// force-based spring can't be rigid (k = ∞ is no force law); rigid
/// springs are compliant constraints with [`Compliance::RIGID`](crate::Compliance::RIGID).
///
/// Written out rather than with `checked_param!`: that macro's `cast`
/// is unchecked, which is sound for ranges like `[0, 1]`, but "finite"
/// isn't kept by narrowing (1e39 is finite in `f64`, `+∞` in `f32`), so
/// here `cast` can fail.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Stiffness<S>(S);

impl<S: Scalar> Stiffness<S> {
    /// `Some` if `k > 0` and finite (NaN fails `k > 0`).
    #[must_use]
    pub fn new(k: S) -> Option<Self> {
        (k > S::ZERO && k.to_f64().is_finite()).then_some(Self(k))
    }

    /// k, N/m.
    #[must_use]
    pub const fn get(self) -> S {
        self.0
    }

    /// The same k in another scalar type, re-checked: `None` if it
    /// overflows there.
    #[must_use]
    pub fn cast<T: Scalar>(self) -> Option<Stiffness<T>> {
        Stiffness::new(T::from_f64(self.0.to_f64()))
    }
}

#[cfg(test)]
mod tests;
