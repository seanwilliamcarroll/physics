use core::num::NonZeroU32;

use super::{CRADLE_BALLS, CRADLE_LENGTH, CRADLE_RADIUS, cradle};
use crate::Solver;

#[test]
fn pins_and_balls_hang_touching_with_the_pulled_ones_on_their_circle() {
    let world = cradle::<f64>(Solver::Impulse, NonZeroU32::MIN, CRADLE_BALLS, 2).unwrap();
    let particles = &world.particles;
    assert_eq!(particles.len(), 2 * CRADLE_BALLS, "a pin and a ball each");
    assert_eq!(world.constraints().len(), CRADLE_BALLS, "a rod each");
    for index in 0..CRADLE_BALLS {
        let (pin, ball) = (particles.pos()[2 * index], particles.pos()[2 * index + 1]);
        assert_eq!(
            particles.inv_mass()[2 * index],
            0.0,
            "pin {index} is static"
        );
        // Every ball is on its rod's circle: rest, or pulled out.
        assert!(
            ((ball - pin).length() - CRADLE_LENGTH).abs() < 1e-12,
            "ball {index}"
        );
        if index > 0 {
            let spacing = pin.x - particles.pos()[2 * (index - 1)].x;
            assert!(
                (spacing - 2.0 * CRADLE_RADIUS).abs() < 1e-12,
                "pins one diameter apart"
            );
        }
    }
    // Balls 1 and 2 pulled left (and up); the rest hang straight down.
    for index in 0..CRADLE_BALLS {
        let (pin, ball) = (particles.pos()[2 * index], particles.pos()[2 * index + 1]);
        assert_eq!(ball.x < pin.x, index < 2, "ball {index}");
    }
    // Hanging neighbors touch exactly.
    let (ball_3, ball_4) = (particles.pos()[5], particles.pos()[7]);
    assert!(((ball_4 - ball_3).length() - 2.0 * CRADLE_RADIUS).abs() < 1e-12);
}

#[test]
fn more_pulled_than_balls_pulls_them_all() {
    let world = cradle::<f64>(Solver::Xpbd, NonZeroU32::MIN, 3, 9).unwrap();
    let particles = &world.particles;
    assert!((0..3).all(|index| particles.pos()[2 * index + 1].x < particles.pos()[2 * index].x));
}
