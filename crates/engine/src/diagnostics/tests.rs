use super::{
    center_of_mass, constraint_potential, gravity_potential, kinetic_energy, momentum,
    rotational_energy, total_energy,
};
use crate::params::kg;
use crate::{PairwiseGravity, Softening};
use crate::{Particles, Vec2};

fn two_dynamic_one_static() -> Particles<f64> {
    let mut particles = Particles::new();
    particles.add(Vec2::ZERO, Vec2::new(3.0, 4.0), kg(2.0)); // |v|² = 25
    particles.add(Vec2::ZERO, Vec2::new(-1.0, 0.5), kg(4.0));
    particles.add_static(Vec2::new(9.0, 9.0));
    particles
}

#[test]
fn momentum_sums_m_v_over_dynamic_particles() {
    assert_eq!(momentum(&two_dynamic_one_static()), Vec2::new(2.0, 10.0));
}

#[test]
fn kinetic_energy_sums_half_m_v_squared() {
    assert_eq!(kinetic_energy(&two_dynamic_one_static()), 27.5);
}

#[test]
fn static_particles_contribute_nothing_even_if_moving() {
    // A static particle with a velocity must be skipped, not divided by zero.
    let mut particles = Particles::<f64>::new();
    particles.add_static(Vec2::ZERO);
    particles.velocities_mut()[0] = Vec2::new(1.0, 1.0);
    assert_eq!(momentum(&particles), Vec2::ZERO);
    assert_eq!(kinetic_energy(&particles), 0.0);
}

#[test]
fn empty_is_zero() {
    let particles = Particles::<f32>::new();
    assert_eq!(momentum(&particles), Vec2::ZERO);
    assert_eq!(kinetic_energy(&particles), 0.0);
}

#[test]
fn center_of_mass_is_mass_weighted_and_skips_static() {
    let mut particles = Particles::<f64>::new();
    particles.add(Vec2::new(0.0, 0.0), Vec2::ZERO, kg(1.0));
    particles.add(Vec2::new(4.0, 2.0), Vec2::ZERO, kg(3.0)); // (0*1 + 4*3)/4 = 3
    particles.add_static(Vec2::new(100.0, 100.0));
    assert_eq!(center_of_mass(&particles), Some(Vec2::new(3.0, 1.5)));
}

#[test]
fn center_of_mass_is_none_without_dynamic_particles() {
    let mut particles = Particles::<f32>::new();
    assert_eq!(center_of_mass(&particles), None);
    particles.add_static(Vec2::new(1.0, 1.0));
    assert_eq!(center_of_mass(&particles), None);
}

const G: f64 = 6.674_30e-11;

#[test]
fn potential_of_a_pair_is_the_softened_plummer_form() {
    let (mass_1, mass_2, distance, epsilon) = (1.0e10, 3.0e10, 2.0, 0.1);
    let mut particles = Particles::new();
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(mass_1));
    particles.add(Vec2::new(distance, 0.0), Vec2::ZERO, kg(mass_2));
    let potential = gravity_potential(
        &particles,
        &PairwiseGravity::new(G, Softening::new(epsilon).unwrap()),
    );
    let expect = -G * mass_1 * mass_2 / (distance * distance + epsilon * epsilon).sqrt();
    assert!(
        (potential - expect).abs() <= 1e-12 * expect.abs(),
        "{potential} vs {expect}"
    );
}

#[test]
fn potential_sums_every_pair_once() {
    // A 3-4-5 triangle, unsoftened: U = -G m² (1/3 + 1/4 + 1/5).
    let mass = 1.0e10;
    let mut particles = Particles::new();
    for (x, y) in [(0.0, 0.0), (3.0, 0.0), (0.0, 4.0)] {
        particles.add(Vec2::new(x, y), Vec2::ZERO, kg(mass));
    }
    let potential = gravity_potential(
        &particles,
        &PairwiseGravity::new(G, Softening::new(0.0).unwrap()),
    );
    let expect = -G * mass * mass * (1.0 / 3.0 + 1.0 / 4.0 + 1.0 / 5.0);
    assert!(
        (potential - expect).abs() <= 1e-12 * expect.abs(),
        "{potential} vs {expect}"
    );
}

#[test]
fn potential_skips_static_and_coincident_unsoftened_pairs() {
    let gravity = PairwiseGravity::new(G, Softening::new(0.0).unwrap());
    let mut particles = Particles::new();
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0e10));
    particles.add_static(Vec2::new(1.0, 0.0));
    assert_eq!(gravity_potential(&particles, &gravity), 0.0);
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0e10)); // coincident with body 0
    assert!(gravity_potential(&particles, &gravity).is_finite());
    assert_eq!(gravity_potential(&particles, &gravity), 0.0);
}

#[test]
fn total_energy_is_kinetic_plus_potential() {
    let gravity = PairwiseGravity::new(G, Softening::new(0.1).unwrap());
    let particles = two_dynamic_one_static();
    let sum = kinetic_energy(&particles) + gravity_potential(&particles, &gravity);
    assert_eq!(total_energy(&particles, &gravity).to_bits(), sum.to_bits());
}

#[test]
fn uniform_potential_is_m_g_h_over_dynamic_particles() {
    use super::uniform_gravity_potential;
    use crate::UniformGravity;
    let particles = two_dynamic_one_static();
    let mut particles_with_extra = particles.clone();
    particles_with_extra.add(Vec2::new(0.0, 3.0), Vec2::ZERO, kg(2.0));
    let gravity = UniformGravity::new(Vec2::new(0.0, -10.0));
    // Only the new 2 kg body at 3 m counts: 2 * 10 * 3 = 60 J.
    assert_eq!(uniform_gravity_potential(&particles, &gravity), 0.0);
    assert_eq!(
        uniform_gravity_potential(&particles_with_extra, &gravity),
        60.0
    );
}

#[test]
fn constraint_error_is_max_and_rms_of_c() {
    use super::constraint_error;
    use crate::DistanceConstraint;
    let mut particles = Particles::<f64>::new();
    let first = particles.add_static(Vec2::ZERO);
    let second = particles.add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    let third = particles.add(Vec2::new(0.0, 2.0), Vec2::ZERO, kg(1.0));
    let rods = [
        DistanceConstraint::between(&particles, first, second).unwrap(),
        DistanceConstraint::between(&particles, first, third).unwrap(),
    ];
    assert_eq!(constraint_error(&particles, &rods), Some((0.0, 0.0)));
    particles.positions[1] = Vec2::new(1.03, 0.0);
    particles.positions[2] = Vec2::new(0.0, 1.96);
    let (max, rms) = constraint_error(&particles, &rods).unwrap();
    assert!((max - 0.04).abs() < 1e-12);
    assert!((rms - f64::midpoint(0.03 * 0.03, 0.04 * 0.04).sqrt()).abs() < 1e-12);
    assert_eq!(
        constraint_error::<f64, DistanceConstraint<f64>>(&particles, &[]),
        None
    );
}

#[test]
fn constraint_potential_is_half_c_squared_over_alpha_for_soft_rods_only() {
    use crate::{Compliance, DistanceConstraint};
    let mut particles = Particles::new();
    let pin = particles.add_static(Vec2::ZERO).id();
    let first = particles.add(Vec2::new(1.2, 0.0), Vec2::ZERO, kg(1.0));
    let second = particles.add(Vec2::new(0.0, -0.5), Vec2::ZERO, kg(1.0));
    let rod = |x, y, length, alpha: f64| {
        DistanceConstraint::with_length(&particles, x, y, length, Compliance::new(alpha).unwrap())
            .unwrap()
    };
    // Stretched 0.2 m at α = 0.01: ½ · 0.04 / 0.01 = 2 J. Compressed
    // 0.25 m at α = 0.05: ½ · 0.0625 / 0.05 = 0.625 J. Rigid (α = 0),
    // stretched 0.3 m: none.
    let soft = [rod(pin, first, 1.0, 0.01), rod(pin, second, 0.75, 0.05)];
    let rigid = rod(first, second, 1.0, 0.0);
    assert!((constraint_potential(&particles, &soft[..1]) - 2.0).abs() < 1e-12);
    assert!((constraint_potential(&particles, &soft) - 2.625).abs() < 1e-12);
    assert_eq!(constraint_potential(&particles, &[rigid]), 0.0);
    let all = [soft[0], rigid, soft[1]];
    assert!((constraint_potential(&particles, &all) - 2.625).abs() < 1e-12);
    assert_eq!(constraint_potential(&Particles::<f64>::new(), &soft), 0.0);
}

/// `m R² |ω|² / 5` over spinning circles; statics and points carry none.
#[test]
fn rotational_energy_skips_statics_and_points() {
    let mut particles = Particles::new();
    particles.add_circle(
        Vec2::ZERO,
        Vec2::ZERO,
        kg(2.0),
        crate::Radius::new(0.5).unwrap(),
    );
    particles.add_circle(
        Vec2::new(5.0, 0.0),
        Vec2::ZERO,
        kg(1.0),
        crate::Radius::new(0.5).unwrap(),
    );
    assert!(
        particles.set_body(1, Vec2::new(5.0, 0.0), 0.0, 0.5),
        "a static circle"
    );
    particles.add(Vec2::new(9.0, 0.0), Vec2::ZERO, kg(1.0));
    let spin = [
        Vec2::new(3.0, 4.0),
        Vec2::new(1.0, 0.0),
        Vec2::new(1.0, 0.0),
    ];
    assert_eq!(rotational_energy(&particles, &spin), 2.5);
}
