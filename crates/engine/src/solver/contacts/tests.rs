use super::{Contacts, pair_key};
use crate::collision::{Body, Contact, Statics};
use crate::params::kg;
use crate::{ParticleId, Particles, Radius, Restitution, UnitVec2, Vec2, Wall};

fn contact(first: usize, second: Body) -> Contact<f64> {
    Contact {
        a: ParticleId(first),
        b: second,
        normal: UnitVec2::X,
        gap: 0.0,
    }
}

/// A contact's key must differ for every pair of bodies, or the warm start
/// hands one contact another's impulse. Particles, walls and segments, by
/// the same index.
#[test]
fn every_pair_of_bodies_has_its_own_key() {
    let mut keys = Vec::new();
    for first in 0..4 {
        for index in 0..4 {
            for second in [
                Body::Particle(ParticleId(index)),
                Body::Wall(index),
                Body::Segment(index),
            ] {
                keys.push(pair_key(&contact(first, second)));
            }
        }
    }
    let key_count = keys.len();
    keys.sort_unstable();
    keys.dedup();
    assert_eq!(keys.len(), key_count, "48 contacts, 48 keys");
}

#[test]
fn clearing_forgets_the_contacts() {
    let mut contacts = Contacts::<f64>::new();
    contacts.list.push(contact(0, Body::Wall(0)));
    contacts.clear();
    assert_eq!(contacts.list.len(), 0);
}

/// A contact's resting speed, below which it doesn't bounce, is
/// `2 |a_rel| h` (the speed its relative acceleration gives over two
/// substeps).
#[test]
fn a_contact_s_resting_speed_is_twice_its_acceleration_over_a_substep() {
    let floor = Wall::through(Vec2::ZERO, UnitVec2::Y);
    let mut particles = Particles::<f64>::new();
    let _ = particles.add_circle(
        Vec2::new(3.0, 0.099),
        Vec2::ZERO,
        kg(1.0),
        Radius::new(0.1).unwrap(),
    );
    let (gravity, dt) = (9.81, 0.01);
    let mut contacts = Contacts::new();
    let statics = Statics {
        walls: &[floor],
        segments: &[],
    };
    contacts.find(
        &particles,
        statics,
        Restitution::ELASTIC,
        &[Vec2::new(0.0, -gravity)],
        dt,
        true,
    );
    assert_eq!(contacts.list.len(), 1);
    assert!(
        (contacts.rest_speed[0] - 2.0 * gravity * dt).abs() < 1e-15,
        "{}",
        contacts.rest_speed[0]
    );
}
