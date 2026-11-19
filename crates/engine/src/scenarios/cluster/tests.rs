use super::{CLUSTER_RADIUS, CLUSTER_SPEED, CLUSTER_TOTAL_MASS, CLUSTER_WEIGHT, cluster};
use crate::test_util::{assert_same_up_to_rounding, time_step};
use crate::{Force, Integrator, Vec2};

#[test]
fn cluster_places_n_bodies_in_the_disk_with_bounded_mass_and_speed() {
    let world = cluster::<f64>(200, 4).unwrap();
    assert_eq!(world.particles.len(), 200);
    assert!(
        world
            .particles
            .pos()
            .iter()
            .all(|position| position.length() <= CLUSTER_RADIUS)
    );
    assert!(
        world
            .particles
            .vel()
            .iter()
            .all(|velocity| velocity.x.abs() <= CLUSTER_SPEED && velocity.y.abs() <= CLUSTER_SPEED)
    );
    // Fixed total, whatever N; relative weights keep their spread.
    let masses: Vec<f64> = world
        .particles
        .inv_mass()
        .iter()
        .map(|inverse_mass| 1.0 / inverse_mass)
        .collect();
    let total: f64 = masses.iter().sum();
    assert!((total - CLUSTER_TOTAL_MASS).abs() <= 1e-12 * CLUSTER_TOTAL_MASS);
    let (lightest, heaviest) = masses
        .iter()
        .fold((f64::INFINITY, 0.0_f64), |(lightest, heaviest), &mass| {
            (lightest.min(mass), heaviest.max(mass))
        });
    assert!(heaviest / lightest <= CLUSTER_WEIGHT.1 / CLUSTER_WEIGHT.0);
}

#[test]
fn cluster_is_deterministic_per_seed() {
    let first = cluster::<f32>(16, 1).unwrap();
    let repeat = cluster::<f32>(16, 1).unwrap();
    let other_seed = cluster::<f32>(16, 2).unwrap();
    assert_eq!(first.particles.pos(), repeat.particles.pos());
    assert_eq!(first.particles.vel(), repeat.particles.vel());
    assert_ne!(first.particles.pos(), other_seed.particles.pos());
}

#[test]
fn cluster_gravity_is_the_force_the_cluster_uses() {
    use super::cluster_gravity;
    let world = cluster::<f64>(8, 3).unwrap();
    let mut accelerations = vec![Vec2::ZERO; 8];
    cluster_gravity::<f64>()
        .unwrap()
        .accumulate(&world.particles, &mut accelerations);
    let mut stepped = cluster::<f64>(8, 3).unwrap();
    stepped.set_integrator(Integrator::ExplicitEuler);
    let start_velocities = stepped.particles.vel().to_vec();
    stepped.step(time_step(1.0)); // explicit Euler: v1 = v0 + a(x0) * 1
    for ((end, start), acceleration) in stepped
        .particles
        .vel()
        .iter()
        .zip(&start_velocities)
        .zip(&accelerations)
    {
        assert_same_up_to_rounding(*end - *start, *acceleration, *start);
    }
}
