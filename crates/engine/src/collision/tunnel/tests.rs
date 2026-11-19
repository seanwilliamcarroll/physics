use super::{crosses, passed_through};
use crate::Vec2;

#[test]
fn passing_through_needs_a_deep_pass_between_the_ends() {
    let v = Vec2::new;
    assert!(passed_through(v(-1.0, 0.0), v(1.0, 0.0), 0.05));
    assert!(passed_through(v(-1.0, 0.04), v(1.0, 0.04), 0.05));
    assert!(!passed_through(v(-1.0, 0.06), v(1.0, 0.06), 0.05));
    assert!(!passed_through(v(-1.0, 0.0), v(-0.5, 0.0), 0.05));
    assert!(!passed_through(v(-1.0, 0.0), v(0.0, 0.01), 0.05));
}

#[test]
fn crossing_is_strict() {
    let v = Vec2::new;
    assert!(crosses(
        v(0.0, 1.0),
        v(0.0, -1.0),
        v(-1.0, 0.0),
        v(1.0, 0.0)
    ));
    assert!(
        !crosses(v(0.0, 1.0), v(0.0, 0.5), v(-1.0, 0.0), v(1.0, 0.0)),
        "short of it"
    );
    assert!(
        !crosses(v(2.0, 1.0), v(2.0, -1.0), v(-1.0, 0.0), v(1.0, 0.0)),
        "past the end"
    );
    // Away from the origin and not axis-aligned: about the origin,
    // `b − a` and `b + a` agree in sign.
    let (q0, q1) = (v(1.0, 1.0), v(3.0, 2.0));
    assert!(crosses(v(2.0, 3.0), v(2.0, 0.0), q0, q1), "down through");
    assert!(
        crosses(v(2.5, 0.0), v(1.5, 3.0), q0, q1),
        "slanted, up through"
    );
    assert!(!crosses(v(2.0, 3.0), v(2.0, 1.6), q0, q1), "short of it");
    assert!(!crosses(v(4.0, 3.0), v(4.0, 0.0), q0, q1), "past its end");
}

use super::count_tunnels;
use crate::collision::{Segment, Statics, Wall};
use crate::{Mass, Particles, Radius, Restitution, UnitVec2};

const RADIUS: f64 = 0.05;

fn count(
    before: &[(f64, f64)],
    after: &[(f64, f64)],
    walls: &[Wall<f64>],
    segments: &[Segment<f64>],
) -> u32 {
    let mut particles = Particles::new();
    for &(x, y) in after {
        particles.add_circle(
            Vec2::new(x, y),
            Vec2::ZERO,
            Mass::new(1.0).unwrap(),
            Radius::new(RADIUS).unwrap(),
        );
    }
    let before: Vec<Vec2<f64>> = before.iter().map(|&(x, y)| Vec2::new(x, y)).collect();
    count_tunnels(
        &before,
        &particles,
        Statics { walls, segments },
        &mut Vec::new(),
    )
}

#[test]
fn a_pair_is_found_however_far_apart_it_started() {
    assert_eq!(
        count(
            &[(-1.0, 0.0), (0.0, 0.0)],
            &[(1.0, 0.0), (0.0, 0.0)],
            &[],
            &[]
        ),
        1
    );
    let before = [(-1.0, 0.0), (0.0, 0.0), (-1.0, 5.0), (0.0, 5.0)];
    let after = [(1.0, 0.0), (0.0, 0.0), (1.0, 5.0), (0.0, 5.0)];
    assert_eq!(count(&before, &after, &[], &[]), 2);
    assert_eq!(
        count(
            &[(-1.0, 0.0), (0.0, 0.0)],
            &[(-0.5, 0.0), (0.0, 0.0)],
            &[],
            &[]
        ),
        0
    );
}

#[test]
fn a_path_across_a_segment_counts_once() {
    let restitution = Restitution::new(0.8).unwrap();
    let cushion = [Segment::new(
        Vec2::new(-1.0, 0.0),
        Vec2::new(1.0, 0.0),
        restitution,
    )];
    assert_eq!(
        count(&[(0.0, 0.5)], &[(0.0, -0.5)], &[], &cushion),
        1,
        "through"
    );
    assert_eq!(
        count(&[(0.0, 0.5)], &[(0.0, 0.1)], &[], &cushion),
        0,
        "short of it"
    );
    assert_eq!(
        count(&[(2.0, 0.5)], &[(2.0, -0.5)], &[], &cushion),
        0,
        "past its end"
    );
    assert_eq!(
        count(&[(0.3, -0.5)], &[(-0.3, 0.5)], &[], &cushion),
        1,
        "upward"
    );
}

#[test]
fn ending_behind_a_wall_by_more_than_the_radius_counts() {
    let floor = [Wall::through(Vec2::ZERO, UnitVec2::Y)];
    assert_eq!(
        count(&[(0.0, 1.0)], &[(0.0, -2.0 * RADIUS)], &floor, &[]),
        1,
        "behind it"
    );
    assert_eq!(
        count(&[(0.0, 1.0)], &[(0.0, -0.5 * RADIUS)], &floor, &[]),
        0,
        "overlap"
    );
    assert_eq!(count(&[(0.0, 1.0)], &[(0.0, 0.5)], &floor, &[]), 0, "clear");
    let corner = [floor[0], Wall::through(Vec2::ZERO, UnitVec2::X)];
    assert_eq!(count(&[(1.0, 1.0)], &[(-1.0, -1.0)], &corner, &[]), 2);
}

#[test]
fn statics_and_points_never_tunnel() {
    let floor = [Wall::through(Vec2::ZERO, UnitVec2::Y)];
    let mut particles = Particles::new();
    particles.add_circle(
        Vec2::new(0.0, -1.0),
        Vec2::ZERO,
        Mass::new(1.0).unwrap(),
        Radius::new(RADIUS).unwrap(),
    );
    assert!(particles.set_body(0, Vec2::new(0.0, -1.0), 0.0, RADIUS));
    let statics = Statics {
        walls: &floor,
        segments: &[],
    };
    assert_eq!(
        count_tunnels(&[Vec2::new(0.0, 1.0)], &particles, statics, &mut Vec::new()),
        0
    );
    let mut particles = Particles::new();
    particles.add(Vec2::new(0.0, -1.0), Vec2::ZERO, Mass::new(1.0).unwrap());
    assert_eq!(
        count_tunnels(&[Vec2::new(0.0, 1.0)], &particles, statics, &mut Vec::new()),
        0
    );
}

/// The cell grows with twice the furthest move; a 2 m jump alone can
/// hide a wrong formula (`2 / moved` is also 1 there), 10 m can't.
#[test]
fn a_ten_metre_jump_through_a_circle_is_found() {
    assert_eq!(
        count(
            &[(-5.0, 0.0), (0.0, 0.0)],
            &[(5.0, 0.0), (0.0, 0.0)],
            &[],
            &[]
        ),
        1
    );
}
