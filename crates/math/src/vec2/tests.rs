use super::Vec2;
use crate::Scalar;
use crate::test_util::s;

fn v<S: Scalar>(x: f64, y: f64) -> Vec2<S> {
    Vec2::new(s(x), s(y))
}

fn zero_is_additive_identity<S: Scalar>() {
    let a = v::<S>(1.5, -2.0);
    assert_eq!(a + Vec2::ZERO, a);
    assert_eq!(Vec2::<S>::ZERO, v(0.0, 0.0));
}
for_each_scalar!(zero_is_additive_identity);

fn add_sub_neg_are_componentwise<S: Scalar>() {
    let (a, b) = (v::<S>(1.0, 2.0), v::<S>(0.5, -4.0));
    assert_eq!(a + b, v(1.5, -2.0));
    assert_eq!(a - b, v(0.5, 6.0));
    assert_eq!(-a, v(-1.0, -2.0));
}
for_each_scalar!(add_sub_neg_are_componentwise);

fn compound_assignment_matches_binary_ops<S: Scalar>() {
    let (a, b) = (v::<S>(1.0, 2.0), v::<S>(0.5, -4.0));
    let mut c = a;
    c += b;
    assert_eq!(c, a + b);
    c -= b;
    assert_eq!(c, a);
}
for_each_scalar!(compound_assignment_matches_binary_ops);

fn scale_and_divide_by_scalar<S: Scalar>() {
    let a = v::<S>(3.0, -1.5);
    assert_eq!(a * s(2.0), v(6.0, -3.0));
    assert_eq!(a / s(2.0), v(1.5, -0.75));
    assert_eq!(a * S::ONE, a);
    assert_eq!(a * S::ZERO, Vec2::ZERO);
}
for_each_scalar!(scale_and_divide_by_scalar);

fn dot_is_sum_of_products<S: Scalar>() {
    let (a, b) = (v::<S>(1.0, 2.0), v::<S>(3.0, -4.0));
    assert_eq!(a.dot(b), s(-5.0));
    assert_eq!(a.dot(b), b.dot(a));
}
for_each_scalar!(dot_is_sum_of_products);

fn cross_is_antisymmetric_and_zero_on_self<S: Scalar>() {
    let (a, b) = (v::<S>(1.0, 2.0), v::<S>(3.0, -4.0));
    assert_eq!(a.cross(b), s(-10.0)); // 1*(-4) - 2*3
    assert_eq!(a.cross(b), -b.cross(a));
    assert_eq!(a.cross(a), S::ZERO);
    // Right-handed: x cross y = +1 (counterclockwise is positive).
    assert_eq!(v::<S>(1.0, 0.0).cross(v(0.0, 1.0)), S::ONE);
}
for_each_scalar!(cross_is_antisymmetric_and_zero_on_self);

fn perp_rotates_counterclockwise_by_90_degrees<S: Scalar>() {
    assert_eq!(v::<S>(1.0, 0.0).perp(), v(0.0, 1.0));
    let a = v::<S>(3.0, -1.5);
    assert_eq!(a.perp().perp(), -a);
    assert_eq!(a.dot(a.perp()), S::ZERO);
    // perp and cross agree: a x b = perp(a) . b
    let b = v::<S>(0.5, 2.0);
    assert_eq!(a.cross(b), a.perp().dot(b));
}
for_each_scalar!(perp_rotates_counterclockwise_by_90_degrees);

fn length_of_3_4_5_triangle_is_exact<S: Scalar>() {
    let a = v::<S>(3.0, -4.0);
    assert_eq!(a.length_sq(), s(25.0));
    assert_eq!(a.length(), s(5.0));
    assert_eq!(Vec2::<S>::ZERO.length(), S::ZERO);
}
for_each_scalar!(length_of_3_4_5_triangle_is_exact);
