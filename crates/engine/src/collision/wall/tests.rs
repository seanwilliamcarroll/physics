use super::Wall;
use crate::Vec2;

#[test]
fn distance_is_signed_along_the_normal() {
    // A floor at y = -1, free above.
    let up = Vec2::new(0.0, 2.0).normalized().unwrap();
    let floor = Wall::<f64>::through(Vec2::new(5.0, -1.0), up);
    assert_eq!(floor.distance(Vec2::new(0.0, 0.5)), 1.5);
    assert_eq!(floor.distance(Vec2::new(-3.0, -1.0)), 0.0);
    assert_eq!(floor.distance(Vec2::new(0.0, -1.25)), -0.25);
    assert_eq!(floor.normal().get(), Vec2::new(0.0, 1.0));
}

#[test]
fn a_tilted_wall_measures_in_meters() {
    // Free side toward +x+y, through the origin.
    let n = Vec2::new(1.0, 1.0).normalized().unwrap();
    let w = Wall::<f64>::through(Vec2::ZERO, n);
    let d = w.distance(Vec2::new(1.0, 1.0));
    assert!((d - 2.0_f64.sqrt()).abs() < 1e-15, "{d}");
}
