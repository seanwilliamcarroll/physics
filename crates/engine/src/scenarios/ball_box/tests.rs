use core::num::NonZeroU32;

use super::{BOX_BALL_RADIUS, BOX_BALLS, BOX_HALF_WIDTH, BOX_HEIGHT, BOX_MAX_BALLS, ball_box};
use crate::Solver;

#[test]
fn balls_start_inside_the_box_apart_from_each_other() {
    let w = ball_box::<f64>(Solver::Impulse, NonZeroU32::MIN, BOX_MAX_BALLS, 7).unwrap();
    let p = &w.particles;
    assert_eq!(p.len(), BOX_MAX_BALLS);
    let r = BOX_BALL_RADIUS;
    for (i, x) in p.pos().iter().enumerate() {
        assert!(
            x.x - r > -BOX_HALF_WIDTH && x.x + r < BOX_HALF_WIDTH,
            "ball {i} x {}",
            x.x
        );
        assert!(x.y - r > 0.0 && x.y + r < BOX_HEIGHT, "ball {i} y {}", x.y);
        for (j, y) in p.pos().iter().enumerate().skip(i + 1) {
            assert!((*y - *x).length() > 2.0 * r, "balls {i} and {j} overlap");
        }
    }
}

#[test]
fn more_balls_than_slots_are_clamped_and_seeds_repeat() {
    let many = ball_box::<f64>(Solver::Xpbd, NonZeroU32::MIN, 10 * BOX_MAX_BALLS, 1).unwrap();
    assert_eq!(many.particles.len(), BOX_MAX_BALLS);
    let a = ball_box::<f64>(Solver::Xpbd, NonZeroU32::MIN, BOX_BALLS, 3).unwrap();
    let b = ball_box::<f64>(Solver::Xpbd, NonZeroU32::MIN, BOX_BALLS, 3).unwrap();
    let c = ball_box::<f64>(Solver::Xpbd, NonZeroU32::MIN, BOX_BALLS, 4).unwrap();
    assert_eq!(a.particles.pos(), b.particles.pos());
    assert_eq!(a.particles.vel(), b.particles.vel());
    assert_ne!(
        a.particles.vel(),
        c.particles.vel(),
        "another seed, another box"
    );
}
