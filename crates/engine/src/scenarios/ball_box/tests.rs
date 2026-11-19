use core::num::NonZeroU32;

use super::{BOX_BALL_RADIUS, BOX_BALLS, BOX_HALF_WIDTH, BOX_HEIGHT, BOX_MAX_BALLS, ball_box};
use crate::Solver;

#[test]
fn balls_start_inside_the_box_apart_from_each_other() {
    let world = ball_box::<f64>(Solver::Impulse, NonZeroU32::MIN, BOX_MAX_BALLS, 7).unwrap();
    let particles = &world.particles;
    assert_eq!(particles.len(), BOX_MAX_BALLS);
    let radius = BOX_BALL_RADIUS;
    for (index, position) in particles.positions().iter().enumerate() {
        assert!(
            position.x - radius > -BOX_HALF_WIDTH && position.x + radius < BOX_HALF_WIDTH,
            "ball {index} x {}",
            position.x
        );
        assert!(
            position.y - radius > 0.0 && position.y + radius < BOX_HEIGHT,
            "ball {index} y {}",
            position.y
        );
        for (other_index, other) in particles.positions().iter().enumerate().skip(index + 1) {
            assert!(
                (*other - *position).length() > 2.0 * radius,
                "balls {index} and {other_index} overlap"
            );
        }
    }
}

#[test]
fn more_balls_than_slots_are_clamped_and_seeds_repeat() {
    let many = ball_box::<f64>(Solver::Xpbd, NonZeroU32::MIN, 10 * BOX_MAX_BALLS, 1).unwrap();
    assert_eq!(many.particles.len(), BOX_MAX_BALLS);
    let first = ball_box::<f64>(Solver::Xpbd, NonZeroU32::MIN, BOX_BALLS, 3).unwrap();
    let repeat = ball_box::<f64>(Solver::Xpbd, NonZeroU32::MIN, BOX_BALLS, 3).unwrap();
    let other_seed = ball_box::<f64>(Solver::Xpbd, NonZeroU32::MIN, BOX_BALLS, 4).unwrap();
    assert_eq!(first.particles.positions(), repeat.particles.positions());
    assert_eq!(first.particles.velocities(), repeat.particles.velocities());
    assert_ne!(
        first.particles.velocities(),
        other_seed.particles.velocities(),
        "another seed, another box"
    );
}
