use super::Segment;
use crate::{Restitution, Vec2};

fn seg() -> Segment<f64> {
    Segment::new(
        Vec2::new(0.0, 0.0),
        Vec2::new(2.0, 0.0),
        Restitution::ELASTIC,
    )
}

#[test]
fn the_closest_point_is_on_the_side_or_an_end() {
    let s = seg();
    assert_eq!(s.closest(Vec2::new(0.5, 3.0)), Vec2::new(0.5, 0.0));
    assert_eq!(s.closest(Vec2::new(-1.0, 1.0)), Vec2::new(0.0, 0.0));
    assert_eq!(s.closest(Vec2::new(5.0, -1.0)), Vec2::new(2.0, 0.0));
}

#[test]
fn toward_points_from_the_circle_to_the_segment() {
    let (d, n) = seg().toward(Vec2::new(1.0, 0.5));
    assert_eq!((d, n.get()), (0.5, Vec2::new(0.0, -1.0)));
    // Past an end: toward the endpoint, diagonally.
    let (d, n) = seg().toward(Vec2::new(3.0, 1.0));
    assert!((d - 2.0_f64.sqrt()).abs() < 1e-15);
    assert!((n.get() - Vec2::new(-1.0, -1.0) / 2.0_f64.sqrt()).length() < 1e-15);
}

#[test]
fn a_centre_on_the_segment_or_a_point_segment_still_has_a_direction() {
    let (d, n) = seg().toward(Vec2::new(1.0, 0.0));
    assert_eq!(
        (d, n.get()),
        (0.0, Vec2::new(0.0, -1.0)),
        "left-hand normal"
    );
    let point = Segment::new(
        Vec2::new(1.0, 1.0),
        Vec2::new(1.0, 1.0),
        Restitution::ELASTIC,
    );
    assert_eq!(point.closest(Vec2::new(4.0, 5.0)), Vec2::new(1.0, 1.0));
    let (d, n) = point.toward(Vec2::new(1.0, 1.0));
    assert_eq!((d, n.get()), (0.0, Vec2::new(1.0, 0.0)));
}
