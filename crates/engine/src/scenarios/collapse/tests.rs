use crate::Vec2;
use crate::diagnostics::center_of_mass;
use crate::scenarios::{CLUSTER_RADIUS, COLLAPSE_TOTAL_MASS, collapse};

#[test]
fn cold_cloud_in_the_disk() {
    let world = collapse::<f64>(64, 1).unwrap();
    let particles = &world.particles;
    assert_eq!(particles.len(), 64);
    assert!(
        particles
            .velocities()
            .iter()
            .all(|&velocity| velocity == Vec2::ZERO)
    );
    assert!(
        particles
            .positions()
            .iter()
            .all(|position| position.length() <= CLUSTER_RADIUS)
    );
    let total: f64 = particles
        .inverse_mass()
        .iter()
        .map(|inverse_mass| 1.0 / inverse_mass)
        .sum();
    assert!((total - COLLAPSE_TOTAL_MASS).abs() <= 1e-12 * COLLAPSE_TOTAL_MASS);
}

#[test]
fn is_deterministic_per_seed() {
    let (first, repeat, other_seed) = (
        collapse::<f32>(30, 7).unwrap(),
        collapse::<f32>(30, 7).unwrap(),
        collapse::<f32>(30, 8).unwrap(),
    );
    assert_eq!(first.particles.positions(), repeat.particles.positions());
    assert_ne!(
        first.particles.positions(),
        other_seed.particles.positions()
    );
}

#[test]
fn falls_in_on_itself() {
    // Mean distance from the center of mass shrinks: it collapses
    // rather than drifting or expanding. 1 s is about half the
    // free-fall scale; measured 0.83-0.85 of the start over seeds 2-4.
    let mean_radius = |world: &crate::World<f64>| {
        let center = center_of_mass(&world.particles).unwrap();
        let positions = world.particles.positions();
        positions
            .iter()
            .map(|position| (*position - center).length())
            .sum::<f64>()
            / 64.0
    };
    let mut world = collapse::<f64>(64, 2).unwrap();
    let start_radius = mean_radius(&world);
    crate::test_util::run(&mut world, 60);
    assert!(
        mean_radius(&world) < 0.9 * start_radius,
        "{} vs {start_radius}",
        mean_radius(&world)
    );
}
