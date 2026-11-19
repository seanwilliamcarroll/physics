use core::num::NonZeroU32;

use super::{BREAK_BALL_MASS, BREAK_BALL_RADIUS, BREAK_ROWS, BREAK_SPEED, break_shot};
use crate::diagnostics::momentum;
use crate::{Solver, Vec2};

/// The rack's nearest-neighbor distance (the cue ball, particle 0, left
/// out).
fn nearest_neighbor_distance(world: &crate::World<f64>) -> f64 {
    let rack = &world.particles.pos()[1..];
    let mut nearest = f64::INFINITY;
    for (index, ball) in rack.iter().enumerate() {
        for other in &rack[index + 1..] {
            nearest = nearest.min((*other - *ball).length());
        }
    }
    nearest
}

#[test]
fn a_cue_ball_and_a_rack_of_ten() {
    let world = break_shot::<f64>(Solver::Impulse, NonZeroU32::MIN, 0.0).unwrap();
    assert_eq!(world.particles.len(), 1 + BREAK_ROWS * (BREAK_ROWS + 1) / 2);
    // Only the cue ball moves: the momentum is all its own.
    assert_eq!(
        momentum(&world.particles),
        Vec2::new(BREAK_BALL_MASS * BREAK_SPEED, 0.0)
    );
}

#[test]
fn the_rack_touches_or_keeps_its_gap() {
    for gap in [0.0, 0.002, 0.01] {
        let world = break_shot::<f64>(Solver::Xpbd, NonZeroU32::MIN, gap).unwrap();
        let wanted = 2.0 * BREAK_BALL_RADIUS + gap;
        let measured = nearest_neighbor_distance(&world);
        assert!(
            (measured - wanted).abs() < 1e-12,
            "gap {gap}: neighbors {measured} apart, want {wanted}"
        );
    }
}
