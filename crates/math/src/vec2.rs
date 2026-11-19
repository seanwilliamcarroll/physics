//! [`Vec2<S>`]: a 2-component math vector over any [`Scalar`].

use core::ops::{Add, AddAssign, Div, Mul, Neg, Sub, SubAssign};

use crate::Scalar;

/// A 2D vector.
///
/// Scaling is always `v * s`: `s * v` would need `impl Mul<Vec2<S>> for S`,
/// which the orphan rule forbids for a generic `S`.
#[derive(Copy, Clone, Debug, PartialEq, Default)]
#[must_use]
pub struct Vec2<S> {
    pub x: S,
    pub y: S,
}

impl<S: Scalar> Vec2<S> {
    pub const ZERO: Self = Self::new(S::ZERO, S::ZERO);

    pub const fn new(x: S, y: S) -> Self {
        Self { x, y }
    }

    /// `(x, y)` from `f64`s, each rounded into `S` ([`Scalar::from_f64`]).
    pub fn from_f64(x: f64, y: f64) -> Self {
        Self::new(S::from_f64(x), S::from_f64(y))
    }

    #[must_use]
    pub fn dot(self, other: Self) -> S {
        self.x * other.x + self.y * other.y
    }

    /// 2D cross product (z of the 3D cross): positive when `other` is
    /// counterclockwise from `self`.
    #[must_use]
    pub fn cross(self, other: Self) -> S {
        self.x * other.y - self.y * other.x
    }

    /// Rotates by +90°: `(x, y) -> (-y, x)`. Exact: no trig.
    pub fn perp(self) -> Self {
        Self::new(-self.y, self.x)
    }

    /// Squared length: no `sqrt`, so prefer it for comparisons.
    #[must_use]
    pub fn length_sq(self) -> S {
        self.dot(self)
    }

    /// Length: hides a `sqrt` (costly on fixed point); see [`length_sq`](Self::length_sq).
    #[must_use]
    pub fn length(self) -> S {
        self.length_sq().sqrt()
    }
}

impl<S: Scalar> Add for Vec2<S> {
    type Output = Self;
    fn add(self, other: Self) -> Self {
        Self::new(self.x + other.x, self.y + other.y)
    }
}

impl<S: Scalar> Sub for Vec2<S> {
    type Output = Self;
    fn sub(self, other: Self) -> Self {
        Self::new(self.x - other.x, self.y - other.y)
    }
}

impl<S: Scalar> Neg for Vec2<S> {
    type Output = Self;
    fn neg(self) -> Self {
        Self::new(-self.x, -self.y)
    }
}

impl<S: Scalar> AddAssign for Vec2<S> {
    fn add_assign(&mut self, other: Self) {
        self.x += other.x;
        self.y += other.y;
    }
}

impl<S: Scalar> SubAssign for Vec2<S> {
    fn sub_assign(&mut self, other: Self) {
        self.x -= other.x;
        self.y -= other.y;
    }
}

impl<S: Scalar> Mul<S> for Vec2<S> {
    type Output = Self;
    fn mul(self, factor: S) -> Self {
        Self::new(self.x * factor, self.y * factor)
    }
}

/// Two divisions, not a reciprocal and two multiplies: `x * (1/d)` rounds
/// differently from `x / d`, and on fixed point a reciprocal loses precision.
impl<S: Scalar> Div<S> for Vec2<S> {
    type Output = Self;
    fn div(self, divisor: S) -> Self {
        Self::new(self.x / divisor, self.y / divisor)
    }
}

#[cfg(test)]
mod tests;
