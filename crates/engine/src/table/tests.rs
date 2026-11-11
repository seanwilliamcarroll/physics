use super::{Table, rolling_spin, slip};
use crate::Vec2;

#[test]
fn coefficients_are_checked() {
    assert!(Table::new(0.2, 0.01, 9.81).is_some());
    assert!(Table::new(0.0, 0.0, 9.81).is_some(), "frictionless cloth");
    assert!(Table::new(-0.1, 0.01, 9.81).is_none());
    assert!(Table::new(0.2, f64::NAN, 9.81).is_none());
    assert!(Table::new(0.2, 0.01, 0.0).is_none());
}

#[test]
fn a_rolling_ball_doesnt_slip() {
    let (v, r) = (Vec2::new(1.5, -0.5), 0.03);
    assert_eq!(slip(v, rolling_spin(v, r), r), Vec2::ZERO);
    // No spin: the bottom slips at the ball's own velocity.
    assert_eq!(slip(v, Vec2::ZERO, r), v);
}
