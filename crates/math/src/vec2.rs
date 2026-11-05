//! [`Vec2<S>`]: a 2-component math vector over any [`Scalar`].

use core::ops::{Add, AddAssign, Div, Mul, Neg, Sub, SubAssign};

use crate::Scalar;

/// A 2D vector (position, velocity, acceleration, direction).
///
/// `#[must_use]`: every operation returns a new value, so discarding one is
/// a bug (`v.perp();` does not rotate `v`).
///
/// Scaling is always written `v * s`. `s * v` would need
/// `impl Mul<Vec2<S>> for S`, which the orphan rule forbids for a generic `S`.
#[derive(Copy, Clone, Debug, PartialEq, Default)]
#[must_use]
pub struct Vec2<S> {
    pub x: S,
    pub y: S,
}

impl<S: Scalar> Vec2<S> {
    /// The zero vector.
    pub const ZERO: Self = Self::new(S::ZERO, S::ZERO);

    pub const fn new(x: S, y: S) -> Self {
        Self { x, y }
    }

    /// `(x, y)` from `f64`s, each rounded into `S` ([`Scalar::from_f64`]):
    /// scene constants and boundary values, written once in `f64`.
    pub fn from_f64(x: f64, y: f64) -> Self {
        Self::new(S::from_f64(x), S::from_f64(y))
    }

    /// Dot product: `x1*x2 + y1*y2`.
    #[must_use]
    pub fn dot(self, o: Self) -> S {
        self.x * o.x + self.y * o.y
    }

    /// 2D cross product: the z component of the 3D cross, `x1*y2 - y1*x2`.
    ///
    /// Positive when `o` is counterclockwise from `self`. Equals
    /// `self.perp().dot(o)`.
    #[must_use]
    pub fn cross(self, o: Self) -> S {
        self.x * o.y - self.y * o.x
    }

    /// Rotates by +90° (counterclockwise): `(x, y) -> (-y, x)`.
    ///
    /// Exact on every scalar type: no trig, no rounding.
    pub fn perp(self) -> Self {
        Self::new(-self.y, self.x)
    }

    /// Squared length. Prefer this over [`length`](Self::length) for
    /// comparisons: no `sqrt`.
    #[must_use]
    pub fn length_sq(self) -> S {
        self.dot(self)
    }

    /// Length. Hides a `sqrt`, the main per-call cost on fixed point;
    /// avoid in hot paths when [`length_sq`](Self::length_sq) will do.
    #[must_use]
    pub fn length(self) -> S {
        self.length_sq().sqrt()
    }
}

impl<S: Scalar> Add for Vec2<S> {
    type Output = Self;
    fn add(self, o: Self) -> Self {
        Self::new(self.x + o.x, self.y + o.y)
    }
}

impl<S: Scalar> Sub for Vec2<S> {
    type Output = Self;
    fn sub(self, o: Self) -> Self {
        Self::new(self.x - o.x, self.y - o.y)
    }
}

impl<S: Scalar> Neg for Vec2<S> {
    type Output = Self;
    fn neg(self) -> Self {
        Self::new(-self.x, -self.y)
    }
}

impl<S: Scalar> AddAssign for Vec2<S> {
    fn add_assign(&mut self, o: Self) {
        self.x += o.x;
        self.y += o.y;
    }
}

impl<S: Scalar> SubAssign for Vec2<S> {
    fn sub_assign(&mut self, o: Self) {
        self.x -= o.x;
        self.y -= o.y;
    }
}

/// Scale: `v * s`.
impl<S: Scalar> Mul<S> for Vec2<S> {
    type Output = Self;
    fn mul(self, k: S) -> Self {
        Self::new(self.x * k, self.y * k)
    }
}

/// Divide by a scalar: `v / s`.
///
/// Two divisions, not one reciprocal and two multiplies: `x * (1/k)` rounds
/// differently from `x / k`, and on fixed point a reciprocal loses precision.
impl<S: Scalar> Div<S> for Vec2<S> {
    type Output = Self;
    fn div(self, k: S) -> Self {
        Self::new(self.x / k, self.y / k)
    }
}

#[cfg(test)]
mod tests;
