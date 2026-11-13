use super::{Spring, SpringForce};
use crate::params::kg;
use crate::test_util::accel;
use crate::{Damping, Particles, Stiffness, Vec2};

fn k(v: f64) -> Stiffness<f64> {
    Stiffness::new(v).unwrap()
}

fn two_bodies(gap: f64) -> Particles<f64> {
    let mut p = Particles::new();
    let _ = p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    let _ = p.add(Vec2::new(gap, 0.0), Vec2::ZERO, kg(3.0));
    p
}

#[test]
fn stretched_spring_pulls_both_ends_together_equal_and_opposite() {
    let mut p = two_bodies(1.0);
    let ids = (crate::ParticleId(0), crate::ParticleId(1));
    let spring = Spring::between(&p, ids.0, ids.1, k(100.0), Damping::NONE).unwrap();
    assert_eq!(spring.rest(), 1.0);
    // Stretch by 0.1 m: |F| = k x = 10 N.
    p.pos[1] = Vec2::new(1.1, 0.0);
    let a = accel(&p, &SpringForce::new(vec![spring]));
    let (f0, f1) = (a[0] * 1.0, a[1] * 3.0);
    assert!(
        (f0.x - 10.0).abs() < 1e-9 && (f1.x + 10.0).abs() < 1e-9,
        "{a:?}"
    );
    assert_eq!(f0 + f1, Vec2::ZERO, "equal and opposite");
}

#[test]
fn damper_resists_relative_velocity_only() {
    let mut p = two_bodies(1.0);
    let spring = Spring::between(
        &p,
        crate::ParticleId(0),
        crate::ParticleId(1),
        k(100.0),
        Damping::new(2.0).unwrap(),
    )
    .unwrap();
    // At rest length, separating at 0.5 m/s: |F| = c v = 1 N, pulling in.
    p.vel[1] = Vec2::new(0.5, 0.0);
    let a = accel(&p, &SpringForce::new(vec![spring]));
    assert!(
        (a[0].x - 1.0).abs() < 1e-12 && (a[1].x * 3.0 + 1.0).abs() < 1e-12,
        "{a:?}"
    );
    // Moving together (no relative velocity): no damping force.
    p.vel[0] = Vec2::new(0.5, 0.0);
    assert_eq!(
        accel(&p, &SpringForce::new(vec![spring])),
        [Vec2::ZERO, Vec2::ZERO]
    );
}

#[test]
fn static_ends_are_not_moved_and_coincident_ends_are_skipped() {
    let mut p = Particles::new();
    let pin = p.add_static(Vec2::ZERO);
    let bob = p.add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    let spring = Spring::with_rest(&p, pin, bob, 0.5, k(10.0), Damping::NONE).unwrap();
    let a = accel(&p, &SpringForce::new(vec![spring]));
    assert_eq!(a[0], Vec2::ZERO);
    assert!((a[1].x + 5.0).abs() < 1e-12, "{a:?}");
    p.pos[1] = Vec2::ZERO;
    assert_eq!(
        accel(&p, &SpringForce::new(vec![spring])),
        [Vec2::ZERO, Vec2::ZERO]
    );
    assert!(Spring::with_rest(&p, pin, pin, 1.0, k(1.0), Damping::NONE).is_none());
    assert!(Spring::with_rest(&p, pin, bob, -1.0, k(1.0), Damping::NONE).is_none());
}

#[test]
fn potential_is_half_k_x_squared() {
    let mut p = two_bodies(1.0);
    let spring = Spring::between(
        &p,
        crate::ParticleId(0),
        crate::ParticleId(1),
        k(100.0),
        Damping::NONE,
    )
    .unwrap();
    let f = SpringForce::new(vec![spring]);
    assert_eq!(f.potential(&p), 0.0);
    p.pos[1] = Vec2::new(1.2, 0.0);
    assert!(
        (f.potential(&p) - 2.0).abs() < 1e-12,
        "½ · 100 · 0.2² = 2 J"
    );
}

// From the full cargo-mutants run: the ends check, live stiffness and
// damping, and the potential's sign could each change unnoticed.

#[test]
fn a_spring_refuses_an_end_outside_the_particles() {
    let p = two_bodies(1.0);
    let (a, b, outside) = (
        crate::ParticleId(0),
        crate::ParticleId(1),
        crate::ParticleId(2),
    );
    let spring = |a, b| Spring::with_rest(&p, a, b, 1.0, k(1.0), Damping::NONE);
    assert!(spring(a, b).is_some());
    assert!(spring(outside, b).is_none() && spring(a, outside).is_none());
}

#[test]
fn the_potential_is_half_k_stretch_squared_and_follows_live_k() {
    let mut p = two_bodies(1.0);
    let spring = Spring::between(
        &p,
        crate::ParticleId(0),
        crate::ParticleId(1),
        k(100.0),
        Damping::NONE,
    )
    .unwrap();
    let f = SpringForce::new(vec![spring]);
    for (gap, expect) in [(1.1, 0.5), (0.9, 0.5), (1.0, 0.0)] {
        p.pos[1] = Vec2::new(gap, 0.0);
        // ½ · 100 · 0.1² = 0.5 J, stretched or compressed.
        assert!((f.potential(&p) - expect).abs() < 1e-12, "gap {gap}");
    }
    p.pos[1] = Vec2::new(1.1, 0.0);
    assert!(
        (f.with_stiffness(k(200.0)).potential(&p) - 1.0).abs() < 1e-12,
        "k doubled"
    );
}

#[test]
fn live_damping_reaches_every_spring() {
    let mut p = two_bodies(1.0);
    p.vel[1] = Vec2::new(1.0, 0.0); // separating at 1 m/s
    let spring = Spring::between(
        &p,
        crate::ParticleId(0),
        crate::ParticleId(1),
        k(100.0),
        Damping::NONE,
    )
    .unwrap();
    let undamped = SpringForce::new(vec![spring]);
    assert_eq!(
        accel(&p, &undamped)[0],
        Vec2::ZERO,
        "at rest length, no damper"
    );
    // c = 2 N·s/m at 1 m/s: 2 N on the 1 kg end, toward the other.
    let damped = undamped.with_damping(Damping::new(2.0).unwrap());
    assert!((accel(&p, &damped)[0].x - 2.0).abs() < 1e-12);
}

/// `½ k x²` per spring, summed (the full mutation run: `L + rest` in
/// place of `L − rest` survived; M5's energy plot reads this).
#[test]
fn potential_is_half_k_stretch_squared_summed() {
    let mut p = two_bodies(1.0);
    let _ = p.add(Vec2::new(0.0, 2.0), Vec2::ZERO, kg(1.0));
    let ids = [
        crate::ParticleId(0),
        crate::ParticleId(1),
        crate::ParticleId(2),
    ];
    let a = Spring::between(&p, ids[0], ids[1], k(100.0), Damping::NONE).unwrap();
    let b = Spring::between(&p, ids[0], ids[2], k(10.0), Damping::NONE).unwrap();
    let force = SpringForce::new(vec![a, b]);
    assert_eq!(force.potential(&p), 0.0, "at rest length");
    // Stretch the first by 0.1 and compress the second by 0.5.
    p.pos[1] = Vec2::new(1.1, 0.0);
    p.pos[2] = Vec2::new(0.0, 1.5);
    let expected = 0.5 * 100.0 * 0.1 * 0.1 + 0.5 * 10.0 * 0.5 * 0.5;
    assert!(
        (force.potential(&p) - expected).abs() < 1e-12,
        "{}",
        force.potential(&p)
    );
}

/// From the full mutation run of 2026-11-12: the potential was only
/// measured with one end at the origin, where `xb − xa` and `xb + xa`
/// agree.
#[test]
fn potential_is_the_same_away_from_the_origin() {
    let mut p = Particles::new();
    let _ = p.add(Vec2::new(5.0, 3.0), Vec2::ZERO, kg(1.0));
    let _ = p.add(Vec2::new(6.0, 3.0), Vec2::ZERO, kg(1.0));
    let ids = (crate::ParticleId(0), crate::ParticleId(1));
    let f = SpringForce::new(vec![
        Spring::between(&p, ids.0, ids.1, k(4.0), Damping::NONE).unwrap(),
    ]);
    assert_eq!(f.potential(&p), 0.0, "at rest");
    p.pos[1] = Vec2::new(7.0, 3.0);
    assert!((f.potential(&p) - 2.0).abs() < 1e-12, "½ · 4 · 1²");
}
