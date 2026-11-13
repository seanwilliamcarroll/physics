use super::{Contacts, pair_key};
use crate::collision::{Body, Contact};
use crate::{ParticleId, UnitVec2};

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
