use crate::test_util::s;
use crate::{Scalar, Vec2};

fn v<S: Scalar>(x: f64, y: f64) -> Vec2<S> {
    Vec2::new(s(x), s(y))
}

fn splits_a_vector_into_length_and_direction<S: Scalar>() {
    let (len, dir) = v::<S>(3.0, 4.0).length_and_direction().unwrap();
    assert_eq!(len, s(5.0));
    assert_eq!(dir.get(), v(0.6, 0.8));
}
for_each_scalar!(splits_a_vector_into_length_and_direction);

fn zero_has_no_direction<S: Scalar>() {
    assert!(Vec2::<S>::ZERO.length_and_direction().is_none());
    assert!(Vec2::<S>::ZERO.normalized().is_none());
}
for_each_scalar!(zero_has_no_direction);

/// NaN fails `len > 0`, so a NaN vector has no direction either.
fn nan_has_no_direction<S: Scalar>() {
    assert!(v::<S>(f64::NAN, 1.0).normalized().is_none());
}
for_each_scalar!(nan_has_no_direction);

/// Each component divided by the length (correctly rounded), not
/// multiplied by `1 / len`: bit-identical to the `d / len` it replaces,
/// so golden hashes don't move.
fn divides_componentwise<S: Scalar>() {
    let d = v::<S>(1.0, 2.0);
    let len = d.length();
    assert_eq!(d.normalized().unwrap().get(), d / len);
}
for_each_scalar!(divides_componentwise);

fn scales_and_negates<S: Scalar>() {
    let dir = v::<S>(0.0, 2.0).normalized().unwrap();
    assert_eq!(dir * s(3.0), v(0.0, 3.0));
    assert_eq!((-dir).get(), v(0.0, -1.0));
    assert_eq!(dir.dot(v(5.0, 7.0)), s(7.0));
}
for_each_scalar!(scales_and_negates);
