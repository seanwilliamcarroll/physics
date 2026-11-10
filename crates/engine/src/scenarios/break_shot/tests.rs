use core::num::NonZeroU32;

use super::{BREAK_BALL_MASS, BREAK_BALL_RADIUS, BREAK_ROWS, BREAK_SPEED, break_shot};
use crate::diagnostics::momentum;
use crate::{Solver, Vec2};

/// The rack's nearest-neighbor distance (the cue ball, particle 0, left
/// out).
fn nearest(w: &crate::World<f64>) -> f64 {
    let rack = &w.particles.pos()[1..];
    let mut best = f64::INFINITY;
    for (i, a) in rack.iter().enumerate() {
        for b in &rack[i + 1..] {
            best = best.min((*b - *a).length());
        }
    }
    best
}

#[test]
fn a_cue_ball_and_a_rack_of_ten() {
    let w = break_shot::<f64>(Solver::Impulse, NonZeroU32::MIN, 0.0).unwrap();
    assert_eq!(w.particles.len(), 1 + BREAK_ROWS * (BREAK_ROWS + 1) / 2);
    // Only the cue ball moves: the momentum is all its own.
    assert_eq!(
        momentum(&w.particles),
        Vec2::new(BREAK_BALL_MASS * BREAK_SPEED, 0.0)
    );
}

#[test]
fn the_rack_touches_or_keeps_its_gap() {
    for gap in [0.0, 0.002, 0.01] {
        let w = break_shot::<f64>(Solver::Xpbd, NonZeroU32::MIN, gap).unwrap();
        let want = 2.0 * BREAK_BALL_RADIUS + gap;
        let got = nearest(&w);
        assert!(
            (got - want).abs() < 1e-12,
            "gap {gap}: neighbors {got} apart, want {want}"
        );
    }
}
