//! Narrowphase properties (`docs/numerical-testing-checklist.md` §2.5,
//! circle–circle and circle–wall): a contact doesn't depend on which body
//! is called `a`, or on where the pair sits, and every contact reported
//! has a unit normal and a finite gap.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::collision::{Body, Contact, find_contacts};
use engine::{Particles, Radius, Vec2, Wall};
use proptest::prelude::*;
use test_support::{kg, proptest_config};

/// One substep, s (the speculative margin's horizon).
const H: f64 = 0.01;
/// Translation leaves gaps and normals equal up to the rounding of moving
/// positions by up to 1e3 m: a position there rounds by ~2e-13 m, so
/// 1e-9 is a wide margin (ours), not a measurement.
const MOVE_TOL: f64 = 1e-9;

/// A circle: position in a 1 m box, velocity up to 5 m/s, radius 1–20 cm.
type Circle = ((f64, f64), (f64, f64), f64);

fn circle() -> impl Strategy<Value = Circle> {
    (
        (-0.5..0.5_f64, -0.5..0.5_f64),
        (-5.0..5.0_f64, -5.0..5.0_f64),
        0.01..0.2_f64,
    )
}

fn particles(circles: &[Circle], offset: (f64, f64)) -> Particles<f64> {
    let mut p = Particles::new();
    for &((x, y), (vx, vy), r) in circles {
        p.add_circle(
            Vec2::new(x + offset.0, y + offset.1),
            Vec2::new(vx, vy),
            kg(1.0),
            Radius::new(r).unwrap(),
        );
    }
    p
}

fn contacts(p: &Particles<f64>, walls: &[Wall<f64>]) -> Vec<Contact<f64>> {
    let (mut pairs, mut out) = (Vec::new(), Vec::new());
    find_contacts(p, walls, H, &mut pairs, &mut out);
    out
}

/// Every contact: a unit normal, a finite gap.
fn well_formed(c: &[Contact<f64>]) -> Result<(), TestCaseError> {
    for k in c {
        let n = k.normal.get();
        prop_assert!((n.length() - 1.0).abs() < 1e-12, "normal {n:?}");
        prop_assert!(k.gap.is_finite(), "gap {}", k.gap);
    }
    Ok(())
}

proptest! {
    #![proptest_config(proptest_config())]

    #[test]
    fn swapping_the_pair_flips_the_normal_and_keeps_the_gap(a in circle(), b in circle()) {
        let ab = contacts(&particles(&[a, b], (0.0, 0.0)), &[]);
        let ba = contacts(&particles(&[b, a], (0.0, 0.0)), &[]);
        prop_assert_eq!(ab.len(), ba.len(), "a contact either way or neither");
        well_formed(&ab)?;
        if let (Some(x), Some(y)) = (ab.first(), ba.first()) {
            prop_assert_eq!(x.gap.to_bits(), y.gap.to_bits(), "the same gap");
            prop_assert_eq!(x.normal.get(), -y.normal.get(), "the normal, from a toward b, flips");
        }
    }

    #[test]
    fn moving_the_pair_keeps_its_contact(
        a in circle(),
        b in circle(),
        offset in (-1e3..1e3_f64, -1e3..1e3_f64),
    ) {
        let here = contacts(&particles(&[a, b], (0.0, 0.0)), &[]);
        let there = contacts(&particles(&[a, b], offset), &[]);
        well_formed(&there)?;
        // A pair right at the speculative threshold may round either way.
        if here.len() == there.len() {
            for (x, y) in here.iter().zip(&there) {
                prop_assert!((x.gap - y.gap).abs() < MOVE_TOL, "gap {} vs {}", x.gap, y.gap);
                prop_assert!((x.normal.get() - y.normal.get()).length() < MOVE_TOL);
            }
        }
    }

    #[test]
    fn wall_contacts_are_well_formed(c in prop::collection::vec(circle(), 0..8), angle in 0.0..std::f64::consts::TAU) {
        // A wall through the origin, any orientation.
        let normal = Vec2::new(angle.cos(), angle.sin()).normalized().unwrap();
        let wall = Wall::through(Vec2::ZERO, normal);
        let found = contacts(&particles(&c, (0.0, 0.0)), &[wall]);
        well_formed(&found)?;
        for k in found.iter().filter(|k| matches!(k.b, Body::Wall(_))) {
            prop_assert_eq!(k.normal.get(), -normal.get(), "a wall pushes along its normal");
        }
    }
}
