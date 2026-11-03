use super::{Spring, SpringForce};
use crate::params::kg;
use crate::{Damping, Force, Particles, Stiffness, Vec2};

fn k(v: f64) -> Stiffness<f64> {
    Stiffness::new(v).unwrap()
}

fn two_bodies(gap: f64) -> Particles<f64> {
    let mut p = Particles::new();
    let _ = p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    let _ = p.add(Vec2::new(gap, 0.0), Vec2::ZERO, kg(3.0));
    p
}

fn accel(p: &Particles<f64>, f: &SpringForce<f64>) -> Vec<Vec2<f64>> {
    let mut acc = vec![Vec2::ZERO; p.len()];
    f.accumulate(p, &mut acc);
    acc
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
