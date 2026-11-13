use super::{crosses, passed_through};
use crate::Vec2;

#[test]
fn passing_through_needs_a_deep_pass_between_the_ends() {
    let v = Vec2::new;
    // Head-on through each other: yes.
    assert!(passed_through(v(-1.0, 0.0), v(1.0, 0.0), 0.05));
    // A pass 0.04 off-centre, inside the half-reach 0.05: yes; 0.06: no.
    assert!(passed_through(v(-1.0, 0.04), v(1.0, 0.04), 0.05));
    assert!(!passed_through(v(-1.0, 0.06), v(1.0, 0.06), 0.05));
    // Approaching and bouncing back the same side: no.
    assert!(!passed_through(v(-1.0, 0.0), v(-0.5, 0.0), 0.05));
    // Ending inside isn't passing through (it's an overlap).
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
    // Away from the origin and not axis-aligned (the targeted mutation
    // run: about the origin, `b − a` and `b + a` agree in sign).
    let (q0, q1) = (v(1.0, 1.0), v(3.0, 2.0));
    assert!(crosses(v(2.0, 3.0), v(2.0, 0.0), q0, q1), "down through");
    assert!(
        crosses(v(2.5, 0.0), v(1.5, 3.0), q0, q1),
        "slanted, up through"
    );
    assert!(!crosses(v(2.0, 3.0), v(2.0, 1.6), q0, q1), "short of it");
    assert!(!crosses(v(4.0, 3.0), v(4.0, 0.0), q0, q1), "past its end");
}

// count_tunnels itself (the full mutation run: only `passed_through` and
// `crosses` were tested, through the ball–ball page case; the segment and
// wall branches and the candidate cell weren't).

use super::count_tunnels;
use crate::collision::{Segment, Statics, Wall};
use crate::{Mass, Particles, Radius, Restitution, UnitVec2};

const R: f64 = 0.05;

/// Circles at `after`, as if they'd moved there from `before` in one
/// substep; returns the count against `walls` and `segments`.
fn count(
    before: &[(f64, f64)],
    after: &[(f64, f64)],
    walls: &[Wall<f64>],
    segments: &[Segment<f64>],
) -> u32 {
    let mut p = Particles::new();
    for &(x, y) in after {
        p.add_circle(
            Vec2::new(x, y),
            Vec2::ZERO,
            Mass::new(1.0).unwrap(),
            Radius::new(R).unwrap(),
        );
    }
    let before: Vec<Vec2<f64>> = before.iter().map(|&(x, y)| Vec2::new(x, y)).collect();
    count_tunnels(&before, &p, Statics { walls, segments }, &mut Vec::new())
}

#[test]
fn a_pair_is_found_however_far_apart_it_started() {
    // A starts 1 m from B (20 radii: far outside a cell of the diameters
    // alone) and jumps clean through it: the cell grows by how far
    // anything moved, so the pair is still a candidate.
    assert_eq!(
        count(
            &[(-1.0, 0.0), (0.0, 0.0)],
            &[(1.0, 0.0), (0.0, 0.0)],
            &[],
            &[]
        ),
        1
    );
    // Two such passes, far apart: two.
    let before = [(-1.0, 0.0), (0.0, 0.0), (-1.0, 5.0), (0.0, 5.0)];
    let after = [(1.0, 0.0), (0.0, 0.0), (1.0, 5.0), (0.0, 5.0)];
    assert_eq!(count(&before, &after, &[], &[]), 2);
    // Stopping short isn't passing through.
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
    let e = Restitution::new(0.8).unwrap();
    let cushion = [Segment::new(Vec2::new(-1.0, 0.0), Vec2::new(1.0, 0.0), e)];
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
    // Both ways round.
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
        count(&[(0.0, 1.0)], &[(0.0, -2.0 * R)], &floor, &[]),
        1,
        "behind it"
    );
    // Overlapping by less than a radius is a contact, not a tunnel.
    assert_eq!(
        count(&[(0.0, 1.0)], &[(0.0, -0.5 * R)], &floor, &[]),
        0,
        "overlap"
    );
    assert_eq!(count(&[(0.0, 1.0)], &[(0.0, 0.5)], &floor, &[]), 0, "clear");
    // Behind two walls: one count each.
    let corner = [floor[0], Wall::through(Vec2::ZERO, UnitVec2::X)];
    assert_eq!(count(&[(1.0, 1.0)], &[(-1.0, -1.0)], &corner, &[]), 2);
}

#[test]
fn statics_and_points_never_tunnel() {
    let floor = [Wall::through(Vec2::ZERO, UnitVec2::Y)];
    // A static circle behind the wall (inverse mass 0): not counted.
    let mut p = Particles::new();
    p.add_circle(
        Vec2::new(0.0, -1.0),
        Vec2::ZERO,
        Mass::new(1.0).unwrap(),
        Radius::new(R).unwrap(),
    );
    assert!(p.set_body(0, Vec2::new(0.0, -1.0), 0.0, R));
    let statics = Statics {
        walls: &floor,
        segments: &[],
    };
    assert_eq!(
        count_tunnels(&[Vec2::new(0.0, 1.0)], &p, statics, &mut Vec::new()),
        0
    );
    // A point (radius 0) behind it: not counted either.
    let mut p = Particles::new();
    p.add(Vec2::new(0.0, -1.0), Vec2::ZERO, Mass::new(1.0).unwrap());
    assert_eq!(
        count_tunnels(&[Vec2::new(0.0, 1.0)], &p, statics, &mut Vec::new()),
        0
    );
}

/// From the full mutation run of 2026-11-12: the cell grows with twice
/// the furthest move. A jump of 2 m hid a cell of `2 / moved` (also 1 at
/// moved = 2); 10 m doesn't.
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
