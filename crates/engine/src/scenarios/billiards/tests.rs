use core::num::NonZeroU32;

use super::{
    POOL_BALL_RADIUS, POOL_LENGTH, POOL_RACK, POOL_WIDTH, pool_break, pool_rack, pool_table,
};
use crate::{ConfigError, Solver, Vec2};

#[test]
fn the_table_has_six_rails_twelve_jaws_and_six_pockets() {
    let w = pool_table::<f64>(Solver::Impulse, NonZeroU32::MIN).unwrap();
    assert_eq!((w.segments().len(), w.pockets().len()), (18, 6));
    assert!(w.table().is_some() && w.particles().is_empty());
}

#[test]
fn the_rack_is_sixteen_balls_on_the_table_touching_not_overlapping() {
    let w = pool_rack::<f64>(Solver::Xpbd, NonZeroU32::MIN).unwrap();
    let pos = w.particles().pos();
    assert_eq!(pos.len(), 16);
    let r = POOL_BALL_RADIUS;
    for (i, x) in pos.iter().enumerate() {
        assert!(
            x.x.abs() < POOL_LENGTH / 2.0 - r && x.y.abs() < POOL_WIDTH / 2.0 - r,
            "{i}"
        );
        for (j, y) in pos.iter().enumerate().skip(i + 1) {
            assert!(
                (*y - *x).length() > 2.0 * r - 1e-12,
                "balls {i} and {j} overlap"
            );
        }
    }
    // The apex on the foot spot, its neighbours touching it.
    assert_eq!(pos[1], Vec2::new(POOL_LENGTH / 4.0, 0.0));
    assert!(((pos[2] - pos[1]).length() - 2.0 * r).abs() < 1e-12);
    // Every number once.
    let mut numbers = POOL_RACK.to_vec();
    numbers.sort_unstable();
    assert_eq!(numbers, (1..=15).collect::<Vec<u8>>());
}

#[test]
fn a_break_is_checked_and_moves_only_the_cue_ball() {
    let w = pool_break::<f64>(Solver::Impulse, NonZeroU32::MIN, 10.0, 0.0).unwrap();
    assert_eq!(w.particles().vel()[0], Vec2::new(10.0, 0.0));
    assert!(w.particles().vel()[1..].iter().all(|v| *v == Vec2::ZERO));
    for (speed, tip) in [
        (f64::NAN, 0.0),
        (-1.0, 0.0),
        (5.0, 0.6),
        (f64::INFINITY, 0.0),
    ] {
        assert_eq!(
            pool_break::<f64>(Solver::Impulse, NonZeroU32::MIN, speed, tip).err(),
            Some(ConfigError::InvalidShot)
        );
    }
}
