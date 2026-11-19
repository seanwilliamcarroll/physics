use engine::scenarios::{POOL_BALL_MASS, POOL_BALL_RADIUS, POOL_CUE, POOL_LENGTH, pool_table};
use engine::{Mass, Radius, Solver, Vec2};

use super::respot_in;

/// A scratched cue ball goes on the head spot or, if a ball is there, the
/// first clear place behind it.
#[test]
fn a_blocked_head_spot_respots_behind_it() {
    let (mass, radius) = (
        Mass::new(POOL_BALL_MASS).unwrap(),
        Radius::new(POOL_BALL_RADIUS).unwrap(),
    );
    let head_spot_x = -POOL_LENGTH / 4.0;
    let clearance = 2.0 * POOL_BALL_RADIUS;
    let mut world = pool_table::<f64>(Solver::Impulse, core::num::NonZeroU32::MIN).unwrap();
    // The cue ball (particle 0) mid-table, then a ball on the head spot
    // and one a ball's width behind it.
    let cue = world.add_circle(Vec2::new(0.5, 0.0), Vec2::ZERO, mass, radius);
    assert_eq!(cue, POOL_CUE);
    for x in [head_spot_x, head_spot_x - clearance] {
        world.add_circle(Vec2::new(x, 0.0), Vec2::ZERO, mass, radius);
    }
    assert!(!respot_in(&mut world), "the cue ball is in play");
    assert!(world.retire(POOL_CUE));
    assert!(respot_in(&mut world));
    // Behind both balls, clear of every one, and no further back than the
    // next free slot needs (slots are a ball's width apart; touching
    // exactly can round either way, so the bound allows one more).
    let cue = world.particles().pos()[0];
    assert!(cue.y == 0.0 && cue.x < head_spot_x - clearance, "{cue:?}");
    assert!(cue.x >= head_spot_x - 3.0 * clearance - 1e-12, "{cue:?}");
    for other in &world.particles().pos()[1..] {
        assert!(
            (*other - cue).length() >= clearance,
            "{cue:?} overlaps {other:?}"
        );
    }
}
