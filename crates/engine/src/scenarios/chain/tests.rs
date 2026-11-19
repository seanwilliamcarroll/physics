use core::num::NonZeroU32;

use super::{CHAIN_LENGTH, CHAIN_LINK_MASS, CHAIN_LINKS, chain};
use crate::{ConfigError, Constraint, Solver, Vec2};

#[test]
fn pin_then_link_particles_level_with_it_ending_in_the_bob() {
    let world = chain::<f64>(Solver::Xpbd, NonZeroU32::MIN, 4, 100.0).unwrap();
    let particles = &world.particles;
    assert_eq!(particles.len(), 5);
    assert_eq!(particles.inverse_mass()[0], 0.0, "the pin is static");
    let expected_x = [0.0, 0.25, 0.5, 0.75, 1.0].map(|fraction| fraction * CHAIN_LENGTH);
    for (position, expected) in particles.positions().iter().zip(expected_x) {
        assert_eq!(*position, Vec2::new(expected, 0.0));
    }
    assert!(
        particles
            .velocities()
            .iter()
            .all(|&velocity| velocity == Vec2::ZERO)
    );
    let link_inverse_mass = 1.0 / CHAIN_LINK_MASS;
    assert_eq!(particles.inverse_mass()[1..4], [link_inverse_mass; 3]);
    let bob_inverse_mass = link_inverse_mass / 100.0;
    assert!(
        (particles.inverse_mass()[4] - bob_inverse_mass).abs()
            <= 4.0 * f64::EPSILON * bob_inverse_mass
    );
}

#[test]
fn links_join_neighbors_with_equal_lengths() {
    let world = chain::<f64>(Solver::Impulse, NonZeroU32::MIN, CHAIN_LINKS, 100.0).unwrap();
    let constraints = world.constraints();
    assert_eq!(constraints.len(), CHAIN_LINKS);
    let segment = CHAIN_LENGTH / 10.0;
    assert_eq!(CHAIN_LINKS, 10, "segment above assumes the default count");
    for (index, rod) in constraints.iter().enumerate() {
        let [first, second] = rod.bodies();
        assert_eq!((first.index(), second.index()), (index, index + 1));
        assert!(
            (rod.length() - segment).abs() <= 4.0 * f64::EPSILON,
            "{index}"
        );
    }
    assert_eq!(world.solver(), Solver::Impulse);
}

#[test]
fn one_link_is_a_pendulum_with_the_bob_mass() {
    let world = chain::<f64>(Solver::Xpbd, NonZeroU32::MIN, 1, 100.0).unwrap();
    assert_eq!(world.particles.len(), 2);
    assert_eq!(world.constraints().len(), 1);
    assert_eq!(world.particles.positions()[1], Vec2::new(CHAIN_LENGTH, 0.0));
}

#[test]
fn zero_links_is_just_the_pin() {
    let world = chain::<f64>(Solver::Xpbd, NonZeroU32::MIN, 0, 100.0).unwrap();
    assert_eq!(world.particles.len(), 1);
    assert_eq!(world.constraints().len(), 0);
}

#[test]
fn bad_mass_ratios_are_invalid_masses_whatever_the_link_count() {
    for ratio in [0.0, -1.0, f64::NAN, f64::INFINITY] {
        for links in [0, 3] {
            let error = chain::<f32>(Solver::Xpbd, NonZeroU32::MIN, links, ratio).err();
            assert_eq!(error, Some(ConfigError::InvalidMass), "{ratio} {links}");
        }
    }
}

#[test]
fn substeps_are_the_ones_given() {
    let world = chain::<f32>(Solver::Xpbd, NonZeroU32::new(20).unwrap(), 3, 1.0).unwrap();
    assert_eq!(world.substeps().get(), 20);
}
