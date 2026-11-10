use core::num::NonZeroU32;

use super::{CRADLE_BALLS, CRADLE_LENGTH, CRADLE_RADIUS, cradle};
use crate::Solver;

#[test]
fn pins_and_balls_hang_touching_with_the_pulled_ones_on_their_circle() {
    let w = cradle::<f64>(Solver::Impulse, NonZeroU32::MIN, CRADLE_BALLS, 2).unwrap();
    let p = &w.particles;
    assert_eq!(p.len(), 2 * CRADLE_BALLS, "a pin and a ball each");
    assert_eq!(w.constraints().len(), CRADLE_BALLS, "a rod each");
    for k in 0..CRADLE_BALLS {
        let (pin, ball) = (p.pos()[2 * k], p.pos()[2 * k + 1]);
        assert_eq!(p.inv_mass()[2 * k], 0.0, "pin {k} is static");
        // Every ball is on its rod's circle: rest, or pulled out.
        assert!(
            ((ball - pin).length() - CRADLE_LENGTH).abs() < 1e-12,
            "ball {k}"
        );
        if k > 0 {
            let spacing = pin.x - p.pos()[2 * (k - 1)].x;
            assert!(
                (spacing - 2.0 * CRADLE_RADIUS).abs() < 1e-12,
                "pins one diameter apart"
            );
        }
    }
    // Balls 1 and 2 pulled left (and up); the rest hang straight down.
    for k in 0..CRADLE_BALLS {
        let (pin, ball) = (p.pos()[2 * k], p.pos()[2 * k + 1]);
        assert_eq!(ball.x < pin.x, k < 2, "ball {k}");
    }
    // Hanging neighbors touch exactly.
    let (b3, b4) = (p.pos()[5], p.pos()[7]);
    assert!(((b4 - b3).length() - 2.0 * CRADLE_RADIUS).abs() < 1e-12);
}

#[test]
fn more_pulled_than_balls_pulls_them_all() {
    let w = cradle::<f64>(Solver::Xpbd, NonZeroU32::MIN, 3, 9).unwrap();
    let p = &w.particles;
    assert!((0..3).all(|k| p.pos()[2 * k + 1].x < p.pos()[2 * k].x));
}
