use super::{Body, Contact, find_contacts};
use crate::params::kg;
use crate::{ParticleId, Particles, Radius, UnitVec2, Vec2, Wall};

const H: f64 = 0.01;
const R: f64 = 0.1;

/// A circle's ((x, y), (vx, vy)).
type Spec = ((f64, f64), (f64, f64));

fn circles(specs: &[Spec]) -> Particles<f64> {
    let mut p = Particles::new();
    for &((x, y), (vx, vy)) in specs {
        p.add_circle(
            Vec2::new(x, y),
            Vec2::new(vx, vy),
            kg(1.0),
            Radius::new(R).unwrap(),
        );
    }
    p
}

fn contacts(p: &Particles<f64>, walls: &[Wall<f64>]) -> Vec<Contact<f64>> {
    let (mut pairs, mut out) = (Vec::new(), Vec::new());
    find_contacts(p, walls, H, &mut pairs, &mut out);
    out
}

#[test]
fn overlapping_circles_touch_with_a_negative_gap() {
    let p = circles(&[((0.0, 0.0), (0.0, 0.0)), ((0.15, 0.0), (0.0, 0.0))]);
    let c = contacts(&p, &[]);
    assert_eq!(c.len(), 1);
    assert_eq!(
        (c[0].a, c[0].b),
        (ParticleId(0), Body::Particle(ParticleId(1)))
    );
    assert_eq!(c[0].normal.get(), Vec2::new(1.0, 0.0), "from a toward b");
    assert!((c[0].gap + 0.05).abs() < 1e-15, "{}", c[0].gap);
}

#[test]
fn a_gap_counts_only_if_it_can_close_this_substep() {
    // 1 cm apart. Closing at 2 m/s covers 2 cm in h = 0.01 s: a
    // speculative contact. At 0.5 m/s (5 mm) or separating: none.
    let fast = circles(&[((0.0, 0.0), (1.0, 0.0)), ((0.21, 0.0), (-1.0, 0.0))]);
    let c = contacts(&fast, &[]);
    assert_eq!(c.len(), 1);
    assert!((c[0].gap - 0.01).abs() < 1e-15);
    let slow = circles(&[((0.0, 0.0), (0.25, 0.0)), ((0.21, 0.0), (-0.25, 0.0))]);
    assert_eq!(contacts(&slow, &[]).len(), 0);
    let apart = circles(&[((0.0, 0.0), (-5.0, 0.0)), ((0.21, 0.0), (5.0, 0.0))]);
    assert_eq!(contacts(&apart, &[]).len(), 0);
}

#[test]
fn walls_push_along_their_normal() {
    // A floor at y = 0; the ball overlaps it by 2 cm.
    let floor = Wall::through(Vec2::ZERO, UnitVec2::Y);
    let p = circles(&[((3.0, 0.08), (0.0, 0.0))]);
    let c = contacts(&p, &[floor]);
    assert_eq!(c.len(), 1);
    assert_eq!(c[0].b, Body::Wall(0));
    assert_eq!(
        c[0].normal.get(),
        Vec2::new(0.0, -1.0),
        "from the ball into the wall"
    );
    assert!((c[0].gap + 0.02).abs() < 1e-15);
    // Well above and still: no contact.
    let high = circles(&[((3.0, 1.0), (0.0, 0.0))]);
    assert_eq!(contacts(&high, &[floor]).len(), 0);
}

#[test]
fn coincident_centers_separate_along_x() {
    let p = circles(&[((1.0, 1.0), (0.0, 0.0)), ((1.0, 1.0), (0.0, 0.0))]);
    let c = contacts(&p, &[]);
    assert_eq!(c[0].normal.get(), Vec2::new(1.0, 0.0));
    assert!((c[0].gap + 2.0 * R).abs() < 1e-15);
}

#[test]
fn immovable_pairs_and_points_make_no_contacts() {
    let mut p = Particles::<f64>::new();
    // Two static points and a point overlapping a circle: none collide.
    p.add_static(Vec2::ZERO);
    p.add_static(Vec2::ZERO);
    p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    p.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), Radius::new(R).unwrap());
    assert_eq!(contacts(&p, &[]).len(), 0);
}

#[test]
fn contacts_come_in_a_deterministic_order() {
    // Three overlapping in a row and a floor under all: pairs first
    // (sorted), then wall contacts by particle.
    let floor = Wall::through(Vec2::ZERO, UnitVec2::Y);
    let p = circles(&[
        ((0.0, 0.05), (0.0, 0.0)),
        ((0.15, 0.05), (0.0, 0.0)),
        ((0.3, 0.05), (0.0, 0.0)),
    ]);
    let keys: Vec<_> = contacts(&p, &[floor])
        .iter()
        .map(|c| (c.a.0, c.b))
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
