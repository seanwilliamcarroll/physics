use core::num::NonZeroU32;

use super::{CHAIN_LENGTH, CHAIN_LINK_MASS, CHAIN_LINKS, chain};
use crate::{ConfigError, Constraint, Solver, Vec2};

#[test]
fn pin_then_link_particles_level_with_it_ending_in_the_bob() {
    let w = chain::<f64>(Solver::Xpbd, NonZeroU32::MIN, 4, 100.0).unwrap();
    let p = &w.particles;
    assert_eq!(p.len(), 5);
    assert_eq!(p.inv_mass()[0], 0.0, "the pin is static");
    let xs = [0.0, 0.25, 0.5, 0.75, 1.0].map(|f| f * CHAIN_LENGTH);
    for (x, want) in p.pos().iter().zip(xs) {
        assert_eq!(*x, Vec2::new(want, 0.0));
    }
    assert!(p.vel().iter().all(|&v| v == Vec2::ZERO));
    let link = 1.0 / CHAIN_LINK_MASS;
    assert_eq!(p.inv_mass()[1..4], [link; 3]);
    let bob = link / 100.0;
    assert!((p.inv_mass()[4] - bob).abs() <= 4.0 * f64::EPSILON * bob);
}

#[test]
fn links_join_neighbors_with_equal_lengths() {
    let w = chain::<f64>(Solver::Impulse, NonZeroU32::MIN, CHAIN_LINKS, 100.0).unwrap();
    let c = w.constraints();
    assert_eq!(c.len(), CHAIN_LINKS);
    let segment = CHAIN_LENGTH / 10.0;
    assert_eq!(CHAIN_LINKS, 10, "segment above assumes the default count");
    for (i, rod) in c.iter().enumerate() {
        let [a, b] = rod.bodies();
        assert_eq!((a.index(), b.index()), (i, i + 1));
        assert!((rod.length() - segment).abs() <= 4.0 * f64::EPSILON, "{i}");
    }
    assert_eq!(w.solver(), Solver::Impulse);
}

#[test]
fn one_link_is_a_pendulum_with_the_bob_mass() {
    let w = chain::<f64>(Solver::Xpbd, NonZeroU32::MIN, 1, 100.0).unwrap();
    assert_eq!(w.particles.len(), 2);
    assert_eq!(w.constraints().len(), 1);
    assert_eq!(w.particles.pos()[1], Vec2::new(CHAIN_LENGTH, 0.0));
}

#[test]
fn zero_links_is_just_the_pin() {
    let w = chain::<f64>(Solver::Xpbd, NonZeroU32::MIN, 0, 100.0).unwrap();
    assert_eq!(w.particles.len(), 1);
    assert_eq!(w.constraints().len(), 0);
}

#[test]
fn bad_mass_ratios_are_invalid_masses_whatever_the_link_count() {
    for ratio in [0.0, -1.0, f64::NAN, f64::INFINITY] {
        for links in [0, 3] {
            let got = chain::<f32>(Solver::Xpbd, NonZeroU32::MIN, links, ratio).err();
            assert_eq!(got, Some(ConfigError::InvalidMass), "{ratio} {links}");
        }
    }
}

#[test]
fn substeps_are_the_ones_given() {
    let w = chain::<f32>(Solver::Xpbd, NonZeroU32::new(20).unwrap(), 3, 1.0).unwrap();
    assert_eq!(w.substeps(), 20);
}
