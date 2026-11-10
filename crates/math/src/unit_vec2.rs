//! [`UnitVec2<S>`]: a direction, length 1 by construction
//! (`docs/type-invariants.md` item 3).

use core::ops::{Mul, Neg};

use crate::{Scalar, Vec2};

/// A unit-length direction: a constraint gradient, a spring's axis, (M6) a
/// contact normal.
///
/// The field is private, so the only way to get one is
/// [`Vec2::normalized`] or [`Vec2::length_and_direction`], which return
/// `None` for the zero vector (and NaN): the degenerate case `x / |x|`
/// would otherwise divide by zero, and each call site must decide what
/// "no direction" means for it.
#[derive(Copy, Clone, Debug, PartialEq)]
#[must_use]
pub struct UnitVec2<S>(Vec2<S>);

impl<S: Scalar> UnitVec2<S> {
    /// `+x`, exactly unit length in every scalar type.
    pub const X: Self = Self(Vec2::new(S::ONE, S::ZERO));
    /// `+y`, exactly unit length in every scalar type.
    pub const Y: Self = Self(Vec2::new(S::ZERO, S::ONE));

    /// The direction as a plain vector.
    pub const fn get(self) -> Vec2<S> {
        self.0
    }

    /// Dot product with any vector: its component along this direction.
    #[must_use]
    pub fn dot(self, o: Vec2<S>) -> S {
        self.0.dot(o)
    }
}

impl<S: Scalar> Vec2<S> {
    /// This vector's length and direction, or `None` if it has none (zero,
    /// or a component infinite or NaN).
    ///
    /// Divides each component by the length (correctly rounded), not by
    /// multiplying with `1 / len`. When `x² + y²` isn't a normal number
    /// (it over- or underflowed) the vector is first divided by its larger
    /// component, as `hypot` does: before that, a huge finite vector
    /// (`f32` past ~1.8e19) came back as a "unit" vector of length 0, an
    /// infinite one as NaN, and a tiny nonzero one as no direction
    /// (found by the math property tests). The length is then `∞` only if
    /// the true length exceeds the type's range. Every vector whose
    /// `x² + y²` is normal gets exactly the old arithmetic.
    #[must_use]
    pub fn length_and_direction(self) -> Option<(S, UnitVec2<S>)> {
        let len_sq = self.length_sq();
        if len_sq.is_normal() {
            let len = len_sq.sqrt();
            return Some((len, UnitVec2(self / len)));
        }
        let (ax, ay) = (self.x.abs(), self.y.abs());
        let big = if ay > ax { ay } else { ax };
        // `big > 0` is false for NaN too; ∞ has no direction.
        if !(big > S::ZERO && big.to_f64().is_finite()) {
            return None;
        }
        let scaled = self / big;
        let len = scaled.length();
        Some((big * len, UnitVec2(scaled / len)))
    }

    /// This vector's direction, or `None` (see
    /// [`length_and_direction`](Self::length_and_direction)).
    #[must_use]
    pub fn normalized(self) -> Option<UnitVec2<S>> {
        self.length_and_direction().map(|(_, dir)| dir)
    }
}

impl<S: Scalar> Neg for UnitVec2<S> {
    type Output = Self;
    fn neg(self) -> Self {
        Self(-self.0)
    }
}

/// Scaling leaves the unit circle, so it returns a plain [`Vec2`].
impl<S: Scalar> Mul<S> for UnitVec2<S> {
    type Output = Vec2<S>;
    fn mul(self, s: S) -> Vec2<S> {
        self.0 * s
    }
}

#[cfg(test)]
mod tests;
