use crate::Vec2;
use crate::diagnostics::momentum;
use crate::scenarios::{
    CLUSTER_SOFTENING, DISK_CENTRAL_MASS, DISK_INNER_RADIUS, DISK_ORBITERS_TOTAL_MASS, DISK_RADIUS,
    GRAVITATIONAL_CONSTANT, disk,
};

#[test]
fn heavy_center_then_orbiters_in_the_annulus() {
    let world = disk::<f64>(50, 1).unwrap();
    let particles = &world.particles;
    assert_eq!(particles.len(), 50);
    assert_eq!(particles.pos()[0], Vec2::ZERO);
    assert_eq!(1.0 / particles.inv_mass()[0], DISK_CENTRAL_MASS);
    for (position, &inverse_mass) in particles.pos().iter().zip(particles.inv_mass()).skip(1) {
        let radius = position.length();
        assert!(
            (DISK_INNER_RADIUS..=DISK_RADIUS).contains(&radius),
            "radius = {radius}"
        );
        // Orbiters share DISK_ORBITERS_TOTAL_MASS equally.
        assert!(
            (1.0 / inverse_mass - DISK_ORBITERS_TOTAL_MASS / 49.0).abs()
                <= 1e-6 * DISK_ORBITERS_TOTAL_MASS
        );
    }
}

#[test]
fn small_counts() {
    assert_eq!(disk::<f32>(0, 1).unwrap().particles.len(), 0);
    let one = disk::<f32>(1, 1).unwrap();
    assert_eq!(one.particles.len(), 1);
    assert_eq!(one.particles.vel(), [Vec2::ZERO]);
}

#[test]
fn is_deterministic_per_seed() {
    let (first, repeat, other_seed) = (
        disk::<f32>(30, 7).unwrap(),
        disk::<f32>(30, 7).unwrap(),
        disk::<f32>(30, 8).unwrap(),
    );
    assert_eq!(first.particles.pos(), repeat.particles.pos());
    assert_eq!(first.particles.vel(), repeat.particles.vel());
    assert_ne!(first.particles.pos(), other_seed.particles.pos());
}

#[test]
fn net_momentum_is_zero() {
    let world = disk::<f64>(200, 3).unwrap();
    let particles = &world.particles;
    // Relative to one orbiter's momentum, a typical term in the sum.
    let typical = particles.vel()[1].length() / particles.inv_mass()[1];
    assert!(
        momentum(particles).length() <= 1e-10 * typical,
        "{:?}",
        momentum(particles)
    );
}

#[test]
fn launch_speeds_balance_the_enclosed_mass() {
    // Relative to the center, each orbiter moves counterclockwise at
    // the softened circular speed for the mass inside its radius:
    // v² (r² + ε²)^(3/2) / r² = G M_enc. Recomputed here the slow way.
    let world = disk::<f64>(100, 5).unwrap();
    let particles = &world.particles;
    let (positions, velocities, inverse_masses) =
        (particles.pos(), particles.vel(), particles.inv_mass());
    let softening_squared = CLUSTER_SOFTENING * CLUSTER_SOFTENING;
    for index in 1..particles.len() {
        let radius = positions[index].length();
        let enclosed_mass: f64 = (1..particles.len())
            .filter(|&other| positions[other].length_sq() < positions[index].length_sq())
            .map(|other| 1.0 / inverse_masses[other])
            .sum::<f64>()
            + DISK_CENTRAL_MASS;
        let relative_velocity = velocities[index] - velocities[0];
        let softened_squared = radius * radius + softening_squared;
        let left_side = relative_velocity.length_sq() * softened_squared * softened_squared.sqrt()
            / (radius * radius);
        let right_side = GRAVITATIONAL_CONSTANT * enclosed_mass;
        assert!(
            (left_side - right_side).abs() <= 1e-12 * right_side,
            "body {index}: {left_side} vs {right_side}"
        );
        // Tangential and counterclockwise: r x v > 0, r · v = 0.
        let (offset, velocity) = (positions[index] - positions[0], relative_velocity);
        assert!(offset.x * velocity.y - offset.y * velocity.x > 0.0);
        assert!(
            (offset.x * velocity.x + offset.y * velocity.y).abs()
                <= 1e-12 * radius * velocity.length()
        );
    }
}
