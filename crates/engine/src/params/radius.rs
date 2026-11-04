//! [`Radius`]: a circle's r > 0, finite (M6).

use crate::Scalar;

/// A circle's radius, m: a value known to be positive and finite
/// (`docs/08-collision.md`, "Shapes"). Particles without one are points
/// that never collide (radius 0 in [`Particles`](crate::Particles)), so
/// a `Radius` is never 0.
///
/// Written out like [`Stiffness`](crate::Stiffness): "finite" isn't kept by
/// narrowing to `f32`, so `cast` can fail.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Radius<S>(S);

impl<S: Scalar> Radius<S> {
    /// `Some` if `r > 0` and finite (NaN fails `r > 0`).
    #[must_use]
    pub fn new(r: S) -> Option<Self> {
        (r > S::ZERO && r.to_f64().is_finite()).then_some(Self(r))
    }

    /// r, m.
    #[must_use]
    pub const fn get(self) -> S {
        self.0
    }

    /// The same r in another scalar type, re-checked: `None` if it
    /// overflows there.
    #[must_use]
    pub fn cast<T: Scalar>(self) -> Option<Radius<T>> {
        Radius::new(T::from_f64(self.0.to_f64()))
    }
}

#[cfg(test)]
mod tests;
