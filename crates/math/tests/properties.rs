//! Vector identities and edge inputs (`docs/numerical-testing-checklist.md`
//! §2.1, PROP and FUZZ), for `f32` and `f64`. The identities that hold
//! exactly in IEEE arithmetic are checked bit for bit.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::{Scalar, Vec2};
use proptest::prelude::*;

/// Cases per property (`PROPTEST_CASES` overrides).
fn config() -> ProptestConfig {
    let mut config = ProptestConfig::default();
    if std::env::var_os("PROPTEST_CASES").is_none() {
        config.cases = 256;
    }
    config
}

/// A component across most of the normal range, either sign:
/// log-uniform magnitude from 1e-30 to 1e30 (inside `f32`'s range, so the
/// same values test both types; in `f32` their squares over- and
/// underflow, which is the point).
fn component() -> impl Strategy<Value = f64> {
    (-30.0..30.0_f64, any::<bool>()).prop_map(|(exponent, negative)| {
        let magnitude = 10f64.powf(exponent);
        if negative { -magnitude } else { magnitude }
    })
}

fn v<S: Scalar>(x: f64, y: f64) -> Vec2<S> {
    Vec2::from_f64(x, y)
}

/// Bit-for-bit equality (so NaN isn't papered over), except that +0 and
/// −0 match: `x − x` is +0, so `−(b × a)` is −0 where `a × b` is +0
/// (products that underflowed).
fn same<S: Scalar>(left: S, right: S) -> bool {
    left.to_f64().to_bits() == right.to_f64().to_bits() || (left == S::ZERO && right == S::ZERO)
}

fn epsilon<S: Scalar>() -> f64 {
    if size_of::<S>() == size_of::<f32>() {
        f64::from(f32::EPSILON)
    } else {
        f64::EPSILON
    }
}

fn exact_identities<S: Scalar>(
    first_parts: (f64, f64),
    second_parts: (f64, f64),
) -> Result<(), TestCaseError> {
    let (first, second) = (
        v::<S>(first_parts.0, first_parts.1),
        v::<S>(second_parts.0, second_parts.1),
    );
    // The identities hold while the products are finite: in `f32`,
    // components past ~1.8e19 overflow them (∞ − ∞ is NaN).
    let finite = |x: S| x.to_f64().is_finite();
    if !(finite(first.dot(second))
        && finite(first.cross(second))
        && finite(first.length_sq())
        && finite(first.x * first.y))
    {
        return Ok(());
    }
    prop_assert!(same(first.dot(second), second.dot(first)), "dot commutes");
    prop_assert!(
        same(first.cross(second), -second.cross(first)),
        "cross anticommutes"
    );
    // perp swaps the components and negates one: the squared length is
    // the same sum, and x(−y) + yx is exactly 0.
    prop_assert!(
        same(first.perp().length_sq(), first.length_sq()),
        "perp keeps the length"
    );
    prop_assert!(same(first.dot(first.perp()), S::ZERO), "perp is orthogonal");
    Ok(())
}

fn directions_are_unit<S: Scalar>(parts: (f64, f64)) -> Result<(), TestCaseError> {
    let vector = v::<S>(parts.0, parts.1);
    // Every finite nonzero vector has a direction, however big or small
    // (its x² + y² may over- or underflow).
    let Some((length, direction)) = vector.length_and_direction() else {
        return Err(TestCaseError::fail(format!("{vector:?} has no direction")));
    };
    let unit_length = direction.get().length().to_f64();
    prop_assert!(
        (unit_length - 1.0).abs() <= 4.0 * epsilon::<S>(),
        "|direction| = {unit_length}"
    );
    // The direction times the length is the vector again (relative,
    // component-wise in f64: a length in `S` would overflow again).
    let rebuilt = direction.get() * length;
    let larger_component = vector.x.abs().to_f64().max(vector.y.abs().to_f64());
    let relative_error = (rebuilt.x.to_f64() - vector.x.to_f64())
        .abs()
        .max((rebuilt.y.to_f64() - vector.y.to_f64()).abs())
        / larger_component;
    prop_assert!(relative_error <= 4.0 * epsilon::<S>(), "{relative_error:e}");
    Ok(())
}

proptest! {
    #![proptest_config(config())]

    #[test]
    fn exact_vector_identities(
        first in (component(), component()),
        second in (component(), component()),
    ) {
        exact_identities::<f64>(first, second)?;
        exact_identities::<f32>(first, second)?;
    }

    #[test]
    fn every_finite_nonzero_vector_has_a_unit_direction(parts in (component(), component())) {
        directions_are_unit::<f64>(parts)?;
        directions_are_unit::<f32>(parts)?;
    }
}

/// The edge inputs (§2.1 FUZZ): each has a defined answer, never NaN.
#[test]
fn edge_vectors_have_a_defined_direction_or_none() {
    let direction_of = |x: f64, y: f64| {
        v::<f64>(x, y)
            .normalized()
            .map(|direction| (direction.get().x, direction.get().y))
    };
    let direction_of_f32 = |x: f32, y: f32| {
        Vec2::new(x, y)
            .normalized()
            .map(|direction| (direction.get().x, direction.get().y))
    };
    // No direction: zero, or ∞ or NaN anywhere.
    for (x, y) in [
        (0.0, 0.0),
        (-0.0, 0.0),
        (f64::INFINITY, 0.0),
        (1.0, f64::NEG_INFINITY),
        (f64::NAN, 1.0),
    ] {
        assert_eq!(direction_of(x, y), None, "({x}, {y})");
    }
    // Huge: x² overflows, but the direction is still a unit vector.
    assert_eq!(direction_of(1e200, 0.0), Some((1.0, 0.0)));
    assert_eq!(direction_of_f32(1e20, 0.0), Some((1.0, 0.0)));
    let diagonal = core::f64::consts::FRAC_1_SQRT_2;
    let (x, y) = direction_of(f64::MAX, f64::MAX).unwrap();
    assert!((x - diagonal).abs() < 1e-15 && (y - diagonal).abs() < 1e-15);
    // Tiny: x² underflows, but the direction exists.
    assert_eq!(
        direction_of(5e-324, 0.0),
        Some((1.0, 0.0)),
        "the smallest subnormal"
    );
    assert_eq!(direction_of_f32(1e-30, 0.0), Some((1.0, 0.0)));
    assert_eq!(direction_of(0.0, -1e-170), Some((0.0, -1.0)));
    // A length past the type's range is ∞; the direction is still right.
    let (length, direction) = v::<f64>(f64::MAX, f64::MAX).length_and_direction().unwrap();
    assert!(length.is_infinite() && (direction.get().length() - 1.0).abs() < 1e-15);
}
