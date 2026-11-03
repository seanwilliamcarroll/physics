//! The [`Scalar`] trait: the numeric type the engine is generic over.
//!
//! See `docs/02-core-types.md`. Every method here is something a future
//! fixed-point type must implement, so methods are added only when a force or
//! solver needs them, and none may assume `NaN`, infinity, or free `sqrt`.

use core::fmt::Debug;
use core::ops::{Add, AddAssign, Div, Mul, Neg, Sub, SubAssign};

/// A real-number stand-in: `f32`, `f64`, and later fixed point.
///
/// Swapped at compile time via generics, so arithmetic is monomorphized and
/// costs nothing over using the concrete type directly.
///
/// `'static`: scalars are plain values that never borrow, so this rules out
/// nothing, and it lets generic code box values containing `S` (e.g.
/// `Box<dyn Force<S>>` in the engine) without repeating the bound everywhere.
pub trait Scalar:
    'static
    + Copy
    + PartialOrd
    + Debug
    + Add<Output = Self>
    + Sub<Output = Self>
    + Mul<Output = Self>
    + Div<Output = Self>
    + Neg<Output = Self>
    + AddAssign
    + SubAssign
{
    /// Additive identity.
    const ZERO: Self;
    /// Multiplicative identity.
    const ONE: Self;

    /// Converts from `f64`, rounding to the nearest representable value.
    ///
    /// For setup (literals, configuration), not hot loops: precompute
    /// constants like `G` and `dt` once, outside the step.
    #[must_use]
    fn from_f64(v: f64) -> Self;

    /// Lossless readout for tests, diagnostics, and rendering.
    /// Not a computation path.
    #[must_use]
    fn to_f64(self) -> f64;

    /// Square root. Not free on fixed point: count calls in hot paths.
    #[must_use]
    fn sqrt(self) -> Self;

    /// Absolute value.
    #[must_use]
    fn abs(self) -> Self;
}

// The impls call `f64::sqrt(self)` rather than `self.sqrt()`. Both resolve to
// the inherent method (inherent methods win over trait methods), but the
// explicit form makes it obvious this isn't recursing into `Scalar::sqrt`.

impl Scalar for f64 {
    const ZERO: Self = 0.0;
    const ONE: Self = 1.0;

    fn from_f64(v: f64) -> Self {
        v
    }

    fn to_f64(self) -> f64 {
        self
    }

    fn sqrt(self) -> Self {
        f64::sqrt(self)
    }

    fn abs(self) -> Self {
        f64::abs(self)
    }
}

impl Scalar for f32 {
    const ZERO: Self = 0.0;
    const ONE: Self = 1.0;

    #[expect(
        clippy::cast_possible_truncation,
        reason = "narrowing is the point: `as` rounds to the nearest f32"
    )]
    fn from_f64(v: f64) -> Self {
        v as f32
    }

    fn to_f64(self) -> f64 {
        f64::from(self)
    }

    fn sqrt(self) -> Self {
        f32::sqrt(self)
    }

    fn abs(self) -> Self {
        f32::abs(self)
    }
}

#[cfg(test)]
mod tests;
