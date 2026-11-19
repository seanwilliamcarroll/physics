use super::{Body, CONTACT_MARGIN, Contact, broadphase_cell, find_contacts};
use crate::collision::{Segment, Statics};
use crate::params::kg;
use crate::{ParticleId, Particles, Radius, Restitution, UnitVec2, Vec2, Wall};

const DT: f64 = 0.01;
const RADIUS: f64 = 0.1;

type Spec = ((f64, f64), (f64, f64));

fn circles(specs: &[Spec]) -> Particles<f64> {
    let mut particles = Particles::new();
    for &((x, y), (vx, vy)) in specs {
        particles.add_circle(
            Vec2::new(x, y),
            Vec2::new(vx, vy),
            kg(1.0),
            Radius::new(RADIUS).unwrap(),
        );
    }
    particles
}

fn contacts(particles: &Particles<f64>, walls: &[Wall<f64>]) -> Vec<Contact<f64>> {
    let (mut pairs, mut out) = (Vec::new(), Vec::new());
    let statics = Statics {
        walls,
        segments: &[],
    };
    find_contacts(particles, statics, DT, &mut pairs, &mut out);
    out
}

#[test]
fn overlapping_circles_touch_with_a_negative_gap() {
    let particles = circles(&[((0.0, 0.0), (0.0, 0.0)), ((0.15, 0.0), (0.0, 0.0))]);
    let found = contacts(&particles, &[]);
    assert_eq!(found.len(), 1);
    assert_eq!(
        (found[0].a, found[0].b),
        (ParticleId(0), Body::Particle(ParticleId(1)))
    );
    assert_eq!(
        found[0].normal.get(),
        Vec2::new(1.0, 0.0),
        "from a toward b"
    );
    assert!((found[0].gap + 0.05).abs() < 1e-15, "{}", found[0].gap);
}

#[test]
fn a_gap_counts_only_if_it_can_close_this_substep() {
    // 1 cm apart. Closing at 2 m/s covers 2 cm in dt = 0.01 s: a
    // speculative contact. At 0.5 m/s (5 mm) or separating: none.
    let fast = circles(&[((0.0, 0.0), (1.0, 0.0)), ((0.21, 0.0), (-1.0, 0.0))]);
    let found = contacts(&fast, &[]);
    assert_eq!(found.len(), 1);
    assert!((found[0].gap - 0.01).abs() < 1e-15);
    let slow = circles(&[((0.0, 0.0), (0.25, 0.0)), ((0.21, 0.0), (-0.25, 0.0))]);
    assert_eq!(contacts(&slow, &[]).len(), 0);
    let apart = circles(&[((0.0, 0.0), (-5.0, 0.0)), ((0.21, 0.0), (5.0, 0.0))]);
    assert_eq!(contacts(&apart, &[]).len(), 0);
}

#[test]
fn walls_push_along_their_normal() {
    let floor = Wall::through(Vec2::ZERO, UnitVec2::Y);
    let particles = circles(&[((3.0, 0.08), (0.0, 0.0))]);
    let found = contacts(&particles, &[floor]);
    assert_eq!(found.len(), 1);
    assert_eq!(found[0].b, Body::Wall(0));
    assert_eq!(
        found[0].normal.get(),
        Vec2::new(0.0, -1.0),
        "from the ball into the wall"
    );
    assert!((found[0].gap + 0.02).abs() < 1e-15);
    let high = circles(&[((3.0, 1.0), (0.0, 0.0))]);
    assert_eq!(contacts(&high, &[floor]).len(), 0);
}

#[test]
fn coincident_centers_separate_along_x() {
    let particles = circles(&[((1.0, 1.0), (0.0, 0.0)), ((1.0, 1.0), (0.0, 0.0))]);
    let found = contacts(&particles, &[]);
    assert_eq!(found[0].normal.get(), Vec2::new(1.0, 0.0));
    assert!((found[0].gap + 2.0 * RADIUS).abs() < 1e-15);
}

#[test]
fn immovable_pairs_and_points_make_no_contacts() {
    let mut particles = Particles::<f64>::new();
    particles.add_static(Vec2::ZERO);
    particles.add_static(Vec2::ZERO);
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    particles.add_circle(
        Vec2::ZERO,
        Vec2::ZERO,
        kg(1.0),
        Radius::new(RADIUS).unwrap(),
    );
    assert_eq!(contacts(&particles, &[]).len(), 0);
}

#[test]
fn contacts_come_in_a_deterministic_order() {
    let floor = Wall::through(Vec2::ZERO, UnitVec2::Y);
    let particles = circles(&[
        ((0.0, 0.05), (0.0, 0.0)),
        ((0.15, 0.05), (0.0, 0.0)),
        ((0.3, 0.05), (0.0, 0.0)),
    ]);
    let keys: Vec<_> = contacts(&particles, &[floor])
        .iter()
        .map(|contact| (contact.a.0, contact.b))
        .collect();
    assert_eq!(
        keys,
        vec![
            (0, Body::Particle(ParticleId(1))),
            (1, Body::Particle(ParticleId(2))),
            (0, Body::Wall(0)),
            (1, Body::Wall(0)),
            (2, Body::Wall(0)),
        ]
    );
}

#[test]
fn resting_neighbors_within_the_margin_are_contacts() {
    let near = circles(&[((0.0, 0.0), (0.0, 0.0)), ((0.2005, 0.0), (0.0, 0.0))]);
    assert_eq!(contacts(&near, &[]).len(), 1);
    let far = circles(&[((0.0, 0.0), (0.0, 0.0)), ((0.202, 0.0), (0.0, 0.0))]);
    assert_eq!(contacts(&far, &[]).len(), 0);
}

#[test]
fn the_cell_is_both_diameters_plus_the_fastest_travel_plus_the_margin() {
    let mut particles = Particles::<f64>::new();
    particles.add_circle(
        Vec2::ZERO,
        Vec2::new(3.0, 0.0),
        kg(1.0),
        Radius::new(0.1).unwrap(),
    );
    particles.add_circle(
        Vec2::ZERO,
        Vec2::new(0.0, 4.0),
        kg(1.0),
        Radius::new(0.05).unwrap(),
    );
    particles.add(Vec2::ZERO, Vec2::new(100.0, 0.0), kg(1.0));
    let want = 2.0 * 0.1 + 2.0 * 4.0 * DT + CONTACT_MARGIN;
    assert!(
        (broadphase_cell(&particles, DT) - want).abs() < 1e-15,
        "{}",
        broadphase_cell(&particles, DT)
    );
}

#[test]
fn points_and_pins_make_no_wall_contacts() {
    let floor = Wall::through(Vec2::ZERO, UnitVec2::Y);
    let mut particles = Particles::<f64>::new();
    particles.add(Vec2::new(0.0, 0.0), Vec2::new(0.0, -1.0), kg(1.0));
    particles.add_static(Vec2::new(1.0, 0.0));
    assert_eq!(contacts(&particles, &[floor]).len(), 0);
}

#[test]
fn a_segment_contact_points_from_the_circle_to_the_segment() {
    let segments = [Segment::new(
        Vec2::new(-1.0, 0.0),
        Vec2::new(1.0, 0.0),
        Restitution::ELASTIC,
    )];
    let statics = Statics {
        walls: &[],
        segments: &segments,
    };
    let particles = circles(&[((0.0, 0.08), (0.0, 0.0)), ((1.5, 0.0), (0.0, 0.0))]);
    let (mut pairs, mut found) = (Vec::new(), Vec::new());
    find_contacts(&particles, statics, DT, &mut pairs, &mut found);
    assert_eq!(found.len(), 1, "the far ball is clear of the end");
    assert_eq!((found[0].a, found[0].b), (ParticleId(0), Body::Segment(0)));
    assert_eq!(found[0].normal.get(), Vec2::new(0.0, -1.0));
    assert!((found[0].gap + 0.02).abs() < 1e-15, "{}", found[0].gap);
}

#[test]
fn a_glancing_pair_that_touches_mid_substep_is_a_contact() {
    // Passing side by side 0.19 m apart (reach 0.2) at 10 m/s relative:
    // along the start's normal (+x, from 0.4 m behind) they close at
    // 10 m/s, but the true path grazes. The swept test decides: they
    // touch within dt = 0.01 s only when the start is close enough.
    let near = circles(&[((0.0, 0.0), (0.0, 0.0)), ((-0.08, 0.19), (10.0, 0.0))]);
    assert_eq!(contacts(&near, &[]).len(), 1);
    let far = circles(&[((0.0, 0.0), (0.0, 0.0)), ((-0.4, 0.19), (10.0, 0.0))]);
    assert_eq!(contacts(&far, &[]).len(), 0);
}

#[test]
fn a_circle_touches_a_pinned_circle() {
    for pinned in [0, 1] {
        let mut particles = circles(&[((0.0, 0.0), (0.0, 0.0)), ((0.15, 0.0), (0.0, 0.0))]);
        let position = particles.positions()[pinned];
        assert!(particles.set_body(pinned, position, 0.0, RADIUS));
        let found = contacts(&particles, &[]);
        assert_eq!(found.len(), 1, "pinned {pinned}");
        assert!((found[0].gap + 0.05).abs() < 1e-15, "{}", found[0].gap);
    }
}
