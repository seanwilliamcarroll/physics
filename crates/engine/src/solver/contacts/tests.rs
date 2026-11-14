use super::{Contacts, pair_key};
use crate::collision::{Body, Contact, Statics};
use crate::params::kg;
use crate::{ParticleId, Particles, Radius, Restitution, UnitVec2, Vec2, Wall};

fn contact(a: usize, b: Body) -> Contact<f64> {
    Contact {
        a: ParticleId(a),
        b,
        normal: UnitVec2::X,
        gap: 0.0,
    }
}

/// From the full mutation run of 2026-11-12: a contact's key must differ
/// for every pair of bodies, or the warm start hands one contact
/// another's impulse. Particles, walls and segments, by the same index.
#[test]
fn every_pair_of_bodies_has_its_own_key() {
    let mut keys = Vec::new();
    for a in 0..4 {
        for i in 0..4 {
            for b in [
                Body::Particle(ParticleId(i)),
                Body::Wall(i),
                Body::Segment(i),
            ] {
                keys.push(pair_key(&contact(a, b)));
            }
        }
    }
    let n = keys.len();
    keys.sort_unstable();
    keys.dedup();
    assert_eq!(keys.len(), n, "48 contacts, 48 keys");
}

#[test]
fn clearing_forgets_the_contacts() {
    let mut c = Contacts::<f64>::new();
    c.list.push(contact(0, Body::Wall(0)));
    c.clear();
    assert_eq!(c.list.len(), 0);
}

/// From the fifth mutation run: a contact's resting speed, below which it
/// doesn't bounce, is `2 |a_rel| h` (the speed its relative acceleration
/// gives over two substeps). Nothing read it.
#[test]
fn a_contact_s_resting_speed_is_twice_its_acceleration_over_a_substep() {
    let floor = Wall::through(Vec2::ZERO, UnitVec2::Y);
    let mut p = Particles::<f64>::new();
    let _ = p.add_circle(
        Vec2::new(3.0, 0.099),
        Vec2::ZERO,
        kg(1.0),
        Radius::new(0.1).unwrap(),
    );
    let (g, h) = (9.81, 0.01);
    let mut c = Contacts::new();
    let statics = Statics {
        walls: &[floor],
        segments: &[],
    };
    c.find(
        &p,
        statics,
        Restitution::ELASTIC,
        &[Vec2::new(0.0, -g)],
        h,
        true,
    );
    assert_eq!(c.list.len(), 1);
    assert!(
        (c.rest_speed[0] - 2.0 * g * h).abs() < 1e-15,
        "{}",
        c.rest_speed[0]
    );
}
