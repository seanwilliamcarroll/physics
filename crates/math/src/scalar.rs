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
pub trait Scalar:
    Copy
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
mod tests {
    use super::Scalar;

    /// Runs a generic test body once per scalar type.
    macro_rules! for_each_scalar {
        ($name:ident) => {
            mod $name {
                #[test]
                fn f32() {
                    super::$name::<f32>();
                }
                #[test]
                fn f64() {
                    super::$name::<f64>();
                }
            }
        };
    }

    fn s<S: Scalar>(v: f64) -> S {
        S::from_f64(v)
    }

    fn constants_are_identities<S: Scalar>() {
        let x = s::<S>(2.5);
        assert_eq!(x + S::ZERO, x);
        assert_eq!(x * S::ONE, x);
        assert_eq!(x * S::ZERO, S::ZERO);
    }
    for_each_scalar!(constants_are_identities);

    fn round_trip_is_exact_for_representable_values<S: Scalar>() {
        // Dyadic rationals with few bits are exact in both f32 and f64
        // (and in Q16.16 later), so the round trip must be lossless.
        for v in [0.0, 1.0, -1.0, 0.5, -3.25, 1024.0, 1.0 / 64.0] {
            assert_eq!(s::<S>(v).to_f64(), v, "value {v}");
        }
    }
    for_each_scalar!(round_trip_is_exact_for_representable_values);

    #[test]
    fn f32_round_trip_rounds_to_nearest_f32() {
        // 0.1 is not representable; from_f64 must round, not panic or truncate.
        assert_eq!(f32::from_f64(0.1).to_f64(), f64::from(0.1_f32));
    }

    fn sqrt_of_perfect_squares_is_exact<S: Scalar>() {
        // IEEE sqrt is correctly rounded, so exact results stay exact.
        for (sq, root) in [(0.0, 0.0), (1.0, 1.0), (4.0, 2.0), (6.25, 2.5)] {
            assert_eq!(s::<S>(sq).sqrt(), s::<S>(root), "sqrt({sq})");
        }
    }
    for_each_scalar!(sqrt_of_perfect_squares_is_exact);

    fn abs_flips_negatives_only<S: Scalar>() {
        assert_eq!(s::<S>(-3.0).abs(), s::<S>(3.0));
        assert_eq!(s::<S>(3.0).abs(), s::<S>(3.0));
        assert_eq!(S::ZERO.abs(), S::ZERO);
    }
    for_each_scalar!(abs_flips_negatives_only);

    fn operators_match_f64_reference<S: Scalar>() {
        let (a, b) = (s::<S>(6.0), s::<S>(1.5));
        assert_eq!((a + b).to_f64(), 7.5);
        assert_eq!((a - b).to_f64(), 4.5);
        assert_eq!((a * b).to_f64(), 9.0);
        assert_eq!((a / b).to_f64(), 4.0);
        assert_eq!((-a).to_f64(), -6.0);
        let mut c = a;
        c += b;
        c -= s(0.5);
        assert_eq!(c.to_f64(), 7.0);
        assert!(b < a);
    }
    for_each_scalar!(operators_match_f64_reference);
}
