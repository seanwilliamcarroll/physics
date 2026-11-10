//! Vector identities and edge inputs (`docs/numerical-testing-checklist.md`
//! §2.1, PROP and FUZZ), for `f32` and `f64`. The identities that hold
//! exactly in IEEE arithmetic are checked bit for bit.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::{Scalar, Vec2};
use proptest::prelude::*;

/// Cases per property (`PROPTEST_CASES` overrides), as in `test-support`.
fn config() -> ProptestConfig {
    let mut c = ProptestConfig::default();
    if std::env::var_os("PROPTEST_CASES").is_none() {
        c.cases = 256;
    }
    c
}

/// A component across most of the normal range, either sign:
/// log-uniform magnitude from 1e-30 to 1e30 (inside `f32`'s range, so the
/// same values test both types; in `f32` their squares over- and
/// underflow, which is the point).
fn component() -> impl Strategy<Value = f64> {
    (-30.0..30.0_f64, any::<bool>()).prop_map(|(e, neg)| {
        let m = 10f64.powf(e);
        if neg { -m } else { m }
    })
}

fn v<S: Scalar>(x: f64, y: f64) -> Vec2<S> {
    Vec2::from_f64(x, y)
}

/// Bit-for-bit equality (so NaN isn't papered over), except that +0 and
/// −0 match: `x − x` is +0, so `−(b × a)` is −0 where `a × b` is +0
/// (products that underflowed).
fn same<S: Scalar>(a: S, b: S) -> bool {
    a.to_f64().to_bits() == b.to_f64().to_bits() || (a == S::ZERO && b == S::ZERO)
}

/// Machine epsilon of `S`.
fn eps<S: Scalar>() -> f64 {
    if size_of::<S>() == size_of::<f32>() {
        f64::from(f32::EPSILON)
    } else {
        f64::EPSILON
    }
}

fn exact_identities<S: Scalar>(a: (f64, f64), b: (f64, f64)) -> Result<(), TestCaseError> {
    let (a, b) = (v::<S>(a.0, a.1), v::<S>(b.0, b.1));
    // The identities hold while the products are finite: in `f32`,
    // components past ~1.8e19 overflow them (∞ − ∞ is NaN).
    let finite = |x: S| x.to_f64().is_finite();
    if !(finite(a.dot(b)) && finite(a.cross(b)) && finite(a.length_sq()) && finite(a.x * a.y)) {
        return Ok(());
    }
    // Products commute and negation is exact, so these are exact.
    prop_assert!(same(a.dot(b), b.dot(a)), "dot commutes");
    prop_assert!(same(a.cross(b), -b.cross(a)), "cross anticommutes");
    // perp swaps the components and negates one: the squared length is
    // the same sum, and x(−y) + yx is exactly 0.
    prop_assert!(
        same(a.perp().length_sq(), a.length_sq()),
        "perp keeps the length"
    );
    prop_assert!(same(a.dot(a.perp()), S::ZERO), "perp is orthogonal");
    Ok(())
}

fn directions_are_unit<S: Scalar>(a: (f64, f64)) -> Result<(), TestCaseError> {
    let a = v::<S>(a.0, a.1);
    // Every finite nonzero vector has a direction, however big or small
    // (its x² + y² may over- or underflow).
    let Some((len, dir)) = a.length_and_direction() else {
        return Err(TestCaseError::fail(format!("{a:?} has no direction")));
    };
    let unit = dir.get().length().to_f64();
    prop_assert!((unit - 1.0).abs() <= 4.0 * eps::<S>(), "|dir| = {unit}");
    // The direction times the length is the vector again (relative,
    // component-wise in f64: a length in `S` would overflow again).
    let back = dir.get() * len;
    let big = a.x.abs().to_f64().max(a.y.abs().to_f64());
    let err = (back.x.to_f64() - a.x.to_f64())
        .abs()
        .max((back.y.to_f64() - a.y.to_f64()).abs())
        / big;
    prop_assert!(err <= 4.0 * eps::<S>(), "{err:e}");
    Ok(())
}

proptest! {
    #![proptest_config(config())]

    #[test]
    fn exact_vector_identities(a in (component(), component()), b in (component(), component())) {
        exact_identities::<f64>(a, b)?;
        exact_identities::<f32>(a, b)?;
    }

    #[test]
    fn every_finite_nonzero_vector_has_a_unit_direction(a in (component(), component())) {
        directions_are_unit::<f64>(a)?;
        directions_are_unit::<f32>(a)?;
    }
}

/// The edge inputs (§2.1 FUZZ): each has a defined answer, never NaN.
#[test]
fn edge_vectors_have_a_defined_direction_or_none() {
    let dir = |x: f64, y: f64| v::<f64>(x, y).normalized().map(|d| (d.get().x, d.get().y));
    let dir32 = |x: f32, y: f32| Vec2::new(x, y).normalized().map(|d| (d.get().x, d.get().y));
    // No direction: zero, or ∞ or NaN anywhere.
    for (x, y) in [
        (0.0, 0.0),
        (-0.0, 0.0),
        (f64::INFINITY, 0.0),
        (1.0, f64::NEG_INFINITY),
        (f64::NAN, 1.0),
    ] {
        assert_eq!(dir(x, y), None, "({x}, {y})");
    }
    // Huge: x² overflows (this gave a "unit" vector of length 0).
    assert_eq!(dir(1e200, 0.0), Some((1.0, 0.0)));
    assert_eq!(dir32(1e20, 0.0), Some((1.0, 0.0)));
    let diagonal = core::f64::consts::FRAC_1_SQRT_2;
    let (x, y) = dir(f64::MAX, f64::MAX).unwrap();
    assert!((x - diagonal).abs() < 1e-15 && (y - diagonal).abs() < 1e-15);
    // Tiny: x² underflows (this gave no direction).
    assert_eq!(dir(5e-324, 0.0), Some((1.0, 0.0)), "the smallest subnormal");
    assert_eq!(dir32(1e-30, 0.0), Some((1.0, 0.0)));
    assert_eq!(dir(0.0, -1e-170), Some((0.0, -1.0)));
    // A length past the type's range is ∞; the direction is still right.
    let (len, d) = v::<f64>(f64::MAX, f64::MAX).length_and_direction().unwrap();
    assert!(len.is_infinite() && (d.get().length() - 1.0).abs() < 1e-15);
}
