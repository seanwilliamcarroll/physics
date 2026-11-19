use super::Vec2;
use crate::Scalar;
use crate::test_util::s;

fn v<S: Scalar>(x: f64, y: f64) -> Vec2<S> {
    Vec2::new(s(x), s(y))
}

fn zero_is_additive_identity<S: Scalar>() {
    let vector = v::<S>(1.5, -2.0);
    assert_eq!(vector + Vec2::ZERO, vector);
    assert_eq!(Vec2::<S>::ZERO, v(0.0, 0.0));
}
for_each_scalar!(zero_is_additive_identity);

fn add_sub_neg_are_componentwise<S: Scalar>() {
    let (first, second) = (v::<S>(1.0, 2.0), v::<S>(0.5, -4.0));
    assert_eq!(first + second, v(1.5, -2.0));
    assert_eq!(first - second, v(0.5, 6.0));
    assert_eq!(-first, v(-1.0, -2.0));
}
for_each_scalar!(add_sub_neg_are_componentwise);

fn compound_assignment_matches_binary_ops<S: Scalar>() {
    let (first, second) = (v::<S>(1.0, 2.0), v::<S>(0.5, -4.0));
    let mut running = first;
    running += second;
    assert_eq!(running, first + second);
    running -= second;
    assert_eq!(running, first);
}
for_each_scalar!(compound_assignment_matches_binary_ops);

fn scale_and_divide_by_scalar<S: Scalar>() {
    let vector = v::<S>(3.0, -1.5);
    assert_eq!(vector * s(2.0), v(6.0, -3.0));
    assert_eq!(vector / s(2.0), v(1.5, -0.75));
    assert_eq!(vector * S::ONE, vector);
    assert_eq!(vector * S::ZERO, Vec2::ZERO);
}
for_each_scalar!(scale_and_divide_by_scalar);

fn dot_is_sum_of_products<S: Scalar>() {
    let (first, second) = (v::<S>(1.0, 2.0), v::<S>(3.0, -4.0));
    assert_eq!(first.dot(second), s(-5.0));
    assert_eq!(first.dot(second), second.dot(first));
}
for_each_scalar!(dot_is_sum_of_products);

fn cross_is_antisymmetric_and_zero_on_self<S: Scalar>() {
    let (first, second) = (v::<S>(1.0, 2.0), v::<S>(3.0, -4.0));
    assert_eq!(first.cross(second), s(-10.0)); // 1*(-4) - 2*3
    assert_eq!(first.cross(second), -second.cross(first));
    assert_eq!(first.cross(first), S::ZERO);
    // Right-handed: x cross y = +1 (counterclockwise is positive).
    assert_eq!(v::<S>(1.0, 0.0).cross(v(0.0, 1.0)), S::ONE);
}
for_each_scalar!(cross_is_antisymmetric_and_zero_on_self);

fn perp_rotates_counterclockwise_by_90_degrees<S: Scalar>() {
    assert_eq!(v::<S>(1.0, 0.0).perp(), v(0.0, 1.0));
    let first = v::<S>(3.0, -1.5);
    assert_eq!(first.perp().perp(), -first);
    assert_eq!(first.dot(first.perp()), S::ZERO);
    // perp and cross agree: first x second = perp(first) . second
    let second = v::<S>(0.5, 2.0);
    assert_eq!(first.cross(second), first.perp().dot(second));
}
for_each_scalar!(perp_rotates_counterclockwise_by_90_degrees);

fn length_of_3_4_5_triangle_is_exact<S: Scalar>() {
    let vector = v::<S>(3.0, -4.0);
    assert_eq!(vector.length_sq(), s(25.0));
    assert_eq!(vector.length(), s(5.0));
    assert_eq!(Vec2::<S>::ZERO.length(), S::ZERO);
}
for_each_scalar!(length_of_3_4_5_triangle_is_exact);
