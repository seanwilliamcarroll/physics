use super::{CLUSTER_RADIUS, CLUSTER_SPEED, CLUSTER_TOTAL_MASS, CLUSTER_WEIGHT, cluster};
use crate::test_util::{assert_same_up_to_rounding, time_step};
use crate::{Force, Integrator, Vec2};

#[test]
fn cluster_places_n_bodies_in_the_disk_with_bounded_mass_and_speed() {
    let w = cluster::<f64>(200, 4).unwrap();
    assert_eq!(w.particles.len(), 200);
    assert!(
        w.particles
            .pos()
            .iter()
            .all(|x| x.length() <= CLUSTER_RADIUS)
    );
    assert!(
        w.particles
            .vel()
            .iter()
            .all(|v| v.x.abs() <= CLUSTER_SPEED && v.y.abs() <= CLUSTER_SPEED)
    );
    // Fixed total, whatever N; relative weights keep their spread.
    let masses: Vec<f64> = w.particles.inv_mass().iter().map(|iw| 1.0 / iw).collect();
    let total: f64 = masses.iter().sum();
    assert!((total - CLUSTER_TOTAL_MASS).abs() <= 1e-12 * CLUSTER_TOTAL_MASS);
    let (lo, hi) = masses
        .iter()
        .fold((f64::INFINITY, 0.0_f64), |(lo, hi), &m| {
            (lo.min(m), hi.max(m))
        });
    assert!(hi / lo <= CLUSTER_WEIGHT.1 / CLUSTER_WEIGHT.0);
}

#[test]
fn cluster_is_deterministic_per_seed() {
    let a = cluster::<f32>(16, 1).unwrap();
    let b = cluster::<f32>(16, 1).unwrap();
    let c = cluster::<f32>(16, 2).unwrap();
    assert_eq!(a.particles.pos(), b.particles.pos());
    assert_eq!(a.particles.vel(), b.particles.vel());
    assert_ne!(a.particles.pos(), c.particles.pos());
}

#[test]
fn cluster_gravity_is_the_force_the_cluster_uses() {
    use super::cluster_gravity;
    let w = cluster::<f64>(8, 3).unwrap();
    let mut acc = vec![Vec2::ZERO; 8];
    cluster_gravity::<f64>()
        .unwrap()
        .accumulate(&w.particles, &mut acc);
    let mut stepped = cluster::<f64>(8, 3).unwrap();
    stepped.set_integrator(Integrator::ExplicitEuler);
    let v0 = stepped.particles.vel().to_vec();
    stepped.step(time_step(1.0)); // explicit Euler: v1 = v0 + a(x0) * 1
    for ((v1, v0), a) in stepped.particles.vel().iter().zip(&v0).zip(&acc) {
        assert_same_up_to_rounding(*v1 - *v0, *a, *v0);
    }
}
