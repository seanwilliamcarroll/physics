use core::num::NonZeroU32;

use super::{DOUBLE_PENDULUM_LENGTH, DOUBLE_PENDULUM_MASS, DoublePendulumStart, double_pendulum};
use crate::{Constraint, Solver, Vec2};

#[test]
fn pin_and_two_rods_level_with_it() {
    let world = double_pendulum::<f64>(
        Solver::Impulse,
        NonZeroU32::MIN,
        DoublePendulumStart::Horizontal,
        0.0,
    )
    .unwrap();
    let particles = &world.particles;
    let length = DOUBLE_PENDULUM_LENGTH;
    assert_eq!(
        particles.pos(),
        [
            Vec2::ZERO,
            Vec2::new(length, 0.0),
            Vec2::new(2.0 * length, 0.0)
        ]
    );
    assert!(
        particles
            .vel()
            .iter()
            .all(|&velocity| velocity == Vec2::ZERO)
    );
    let bob_inverse_mass = 1.0 / DOUBLE_PENDULUM_MASS;
    assert_eq!(
        particles.inv_mass(),
        [0.0, bob_inverse_mass, bob_inverse_mass]
    );
    let rods = world.constraints();
    assert_eq!(rods.len(), 2);
    for (index, rod) in rods.iter().enumerate() {
        let [first, second] = rod.bodies();
        assert_eq!((first.index(), second.index()), (index, index + 1));
        assert!((rod.length() - length).abs() <= 4.0 * f64::EPSILON * length);
    }
    assert_eq!(world.solver(), Solver::Impulse);
}

#[test]
fn offset_moves_only_the_tip_and_only_in_y() {
    let base = double_pendulum::<f64>(
        Solver::Xpbd,
        NonZeroU32::MIN,
        DoublePendulumStart::Horizontal,
        0.0,
    )
    .unwrap();
    let nudged = double_pendulum::<f64>(
        Solver::Xpbd,
        NonZeroU32::MIN,
        DoublePendulumStart::Horizontal,
        1e-9,
    )
    .unwrap();
    let (base_positions, nudged_positions) = (base.particles.pos(), nudged.particles.pos());
    assert_eq!(base_positions[..2], nudged_positions[..2]);
    assert_eq!(
        nudged_positions[2],
        base_positions[2] + Vec2::new(0.0, 1e-9)
    );
}

#[test]
fn substeps_are_the_ones_given() {
    let world = double_pendulum::<f32>(
        Solver::Xpbd,
        NonZeroU32::new(20).unwrap(),
        DoublePendulumStart::Horizontal,
        0.0,
    )
    .unwrap();
    assert_eq!(world.substeps().get(), 20);
}

#[test]
fn raised_start_puts_both_rods_at_135_degrees() {
    let world = double_pendulum::<f64>(
        Solver::Impulse,
        NonZeroU32::MIN,
        DoublePendulumStart::Raised,
        0.0,
    )
    .unwrap();
    let component = 0.5_f64.sqrt();
    let positions = world.particles.pos();
    assert_eq!(positions[1], crate::Vec2::new(component, component));
    assert_eq!(
        positions[2],
        crate::Vec2::new(2.0 * component, 2.0 * component)
    );
    // Rods keep their 1 m length.
    for rod in world.constraints() {
        assert!((rod.length() - DOUBLE_PENDULUM_LENGTH).abs() < 1e-15);
    }
}

/// From the raised start, the offset moves the tip perpendicular to the
/// rods (counterclockwise), not along y. From the level start the
/// `offset · dy` terms are 0, so their signs go untested there.
#[test]
fn offset_from_the_raised_start_is_perpendicular_to_the_rods() {
    let tip_at = |offset: f64| {
        double_pendulum::<f64>(
            Solver::Impulse,
            NonZeroU32::MIN,
            DoublePendulumStart::Raised,
            offset,
        )
        .unwrap()
        .particles
        .pos()[2]
    };
    let component = 0.5_f64.sqrt();
    let moved = tip_at(0.01) - tip_at(0.0);
    // (−h, h) · 0.01: counterclockwise from the rods' direction (h, h).
    assert!(
        (moved - Vec2::new(-0.01 * component, 0.01 * component)).length() < 1e-15,
        "{moved:?}"
    );
}
