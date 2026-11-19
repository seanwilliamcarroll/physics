use super::Scalar;
use crate::test_util::s;

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
    for value in [0.0, 1.0, -1.0, 0.5, -3.25, 1024.0, 1.0 / 64.0] {
        assert_eq!(s::<S>(value).to_f64(), value, "value {value}");
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
    let (six, one_and_half) = (s::<S>(6.0), s::<S>(1.5));
    assert_eq!((six + one_and_half).to_f64(), 7.5);
    assert_eq!((six - one_and_half).to_f64(), 4.5);
    assert_eq!((six * one_and_half).to_f64(), 9.0);
    assert_eq!((six / one_and_half).to_f64(), 4.0);
    assert_eq!((-six).to_f64(), -6.0);
    let mut total = six;
    total += one_and_half;
    total -= s(0.5);
    assert_eq!(total.to_f64(), 7.0);
    assert!(one_and_half < six);
}
for_each_scalar!(operators_match_f64_reference);
