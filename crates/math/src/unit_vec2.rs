//! [`UnitVec2<S>`]: a direction, length 1 by construction
//! (`docs/type-invariants.md` item 3).

use core::ops::{Mul, Neg};

use crate::{Scalar, Vec2};

/// A unit-length direction. The field is private: the only way to get one is
/// [`Vec2::normalized`] or [`Vec2::length_and_direction`], which return
/// `None` for the zero vector (and NaN), so each call site decides what "no
/// direction" means.
#[derive(Copy, Clone, Debug, PartialEq)]
#[must_use]
pub struct UnitVec2<S>(Vec2<S>);

impl<S: Scalar> UnitVec2<S> {
    pub const X: Self = Self(Vec2::new(S::ONE, S::ZERO));
    pub const Y: Self = Self(Vec2::new(S::ZERO, S::ONE));

    pub const fn get(self) -> Vec2<S> {
        self.0
    }

    #[must_use]
    pub fn dot(self, other: Vec2<S>) -> S {
        self.0.dot(other)
    }
}

impl<S: Scalar> Vec2<S> {
    /// This vector's length and direction, or `None` if it has none (zero,
    /// or a component infinite or NaN).
    ///
    /// Divides by the length (correctly rounded), not by `1 / length`. If
    /// `x² + y²` over- or underflowed, the vector is first divided by its
    /// larger component, as `hypot` does. The length is `∞` only if the true
    /// length exceeds the type's range.
    #[must_use]
    pub fn length_and_direction(self) -> Option<(S, UnitVec2<S>)> {
        let length_squared = self.length_sq();
        if length_squared.is_normal() {
            let length = length_squared.sqrt();
            return Some((length, UnitVec2(self / length)));
        }
        let (abs_x, abs_y) = (self.x.abs(), self.y.abs());
        let larger_component = if abs_y > abs_x { abs_y } else { abs_x };
        // `> 0` is false for NaN too; ∞ has no direction.
        if !(larger_component > S::ZERO && larger_component.to_f64().is_finite()) {
            return None;
        }
        let scaled = self / larger_component;
        let scaled_length = scaled.length();
        Some((
            larger_component * scaled_length,
            UnitVec2(scaled / scaled_length),
        ))
    }

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
    fn mul(self, factor: S) -> Vec2<S> {
        self.0 * factor
    }
}

#[cfg(test)]
mod tests;
