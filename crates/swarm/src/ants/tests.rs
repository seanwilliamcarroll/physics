// Small in-range test values: casts between them can't lose anything
// that matters here.
#![expect(
    clippy::cast_possible_truncation,
    clippy::cast_sign_loss,
    clippy::cast_precision_loss,
    reason = "test arithmetic on small, in-range values"
)]

use super::{AntParams, Colony, Pheromone};

/// One ant at `(x, y)` heading +x, in a 60 × 40 world with the nest far
/// away; no wiggle, no diffusion or decay, so a step is exactly the rule.
fn one(x: f32, y: f32) -> Colony {
    let p = AntParams {
        wiggle: 0.0,
        diffusion: 0.0,
        decay: 0.0,
        ..AntParams::DEFAULT
    };
    let mut c = Colony::new(60, 40, 1, (55.0, 35.0, 2.0), p, 1).unwrap();
    if let Some(a) = c.ants.first_mut() {
        (a.x, a.y, a.cos, a.sin) = (x, y, 1.0, 0.0);
    }
    c
}

fn ant(c: &Colony) -> super::Ant {
    c.ants().next().unwrap()
}

#[test]
fn params_and_sizes_are_checked() {
    let d = AntParams::DEFAULT;
    assert!(d.checked().is_some());
    for bad in [
        AntParams { speed: 0.0, ..d },
        AntParams { decay: 1.5, ..d },
        AntParams {
            sensor_angle: 4.0,
            ..d
        },
        AntParams {
            falloff: f32::NAN,
            ..d
        },
    ] {
        assert!(bad.checked().is_none(), "{bad:?}");
    }
    assert!(Colony::new(0, 10, 1, (1.0, 1.0, 1.0), d, 1).is_none());
    assert!(Colony::new(10, 10, 0, (1.0, 1.0, 1.0), d, 1).is_none());
    assert!(
        Colony::new(10, 10, 1, (10.0, 1.0, 1.0), d, 1).is_none(),
        "nest outside"
    );
    assert!(
        Colony::new(10, 10, 1, (1.0, 1.0, 0.0), d, 1).is_none(),
        "nest of radius 0"
    );
}

#[test]
fn a_searching_ant_turns_toward_the_stronger_food_trail() {
    // Food pheromone ahead and to the right (+y is the +SA side here).
    let mut c = one(20.0, 20.0);
    let (sa, sd) = (
        AntParams::DEFAULT.sensor_angle,
        AntParams::DEFAULT.sensor_distance,
    );
    let (rx, ry) = (20.0 + sd * sa.cos(), 20.0 + sd * sa.sin());
    assert!(c.food_field.deposit(rx as usize, ry as usize, 5.0));
    c.step();
    let a = ant(&c);
    let turned = a.sin.atan2(a.cos);
    assert!((turned - sa).abs() < 1e-5, "turned {turned}");
    // Nothing anywhere: straight on.
    let mut c = one(20.0, 20.0);
    c.step();
    assert_eq!((ant(&c).cos, ant(&c).sin), (1.0, 0.0));
    assert_eq!((ant(&c).x, ant(&c).y), (21.0, 20.0));
}

#[test]
fn food_is_taken_and_carried_home_with_u_turns() {
    let mut c = one(20.0, 20.0);
    c.paint_food(21.5, 20.5, 0.0, 3);
    c.step();
    let a = ant(&c);
    assert!(a.carrying && a.since == 1, "{a:?}");
    assert_eq!((a.cos, a.sin), (-1.0, -0.0), "a U-turn");
    assert_eq!(c.food_in_world(), 2);
    assert!(
        c.field(Pheromone::Food).total() > 0.0,
        "carrying ants lay food pheromone"
    );
    // At the nest: delivered, searching again, a U-turn.
    assert!(c.set_nest(19.5, 20.0, 1.0));
    c.step();
    let a = ant(&c);
    assert!(!a.carrying && c.delivered() == 1, "{a:?}");
    assert_eq!(c.carrying(), 0);
}

#[test]
fn a_wall_ahead_turns_the_ant_around_in_place() {
    let mut c = one(20.0, 20.0);
    c.paint_wall(21.5, 20.5, 0.0);
    c.step();
    let a = ant(&c);
    assert_eq!((a.x, a.y, a.cos), (20.0, 20.0, -1.0));
    // The edge of the world too.
    let mut e = one(59.5, 20.0);
    e.step();
    assert_eq!((ant(&e).x, ant(&e).cos), (59.5, -1.0));
}

#[test]
fn deposits_weaken_with_distance_from_the_source() {
    let mut c = one(20.0, 20.0);
    for _ in 0..10 {
        c.step();
    }
    // Searching: home pheromone, q e^(−k s) for s = 0..9 (since resets at
    // the nest, which is far away: s counts from the start).
    let k = AntParams::DEFAULT.falloff;
    let expected: f32 = (0..10).map(|s| (-k * s as f32).exp()).sum();
    assert!((c.field(Pheromone::Home).total() as f32 - expected).abs() < 1e-4);
}

#[test]
fn painting_far_outside_the_world_paints_nothing_and_returns() {
    // Stepping an f64 by 1.0 from 1e30 never advanced: it hung.
    let mut c = one(20.0, 20.0);
    assert_eq!(c.paint_food(1e30, 1e30, 3.0, 5), 0);
    assert_eq!(c.paint_wall(-1e30, 5.0, 3.0), 0);
    assert_eq!(c.erase(f32::INFINITY, 5.0, 3.0), 0);
    // A huge radius is clipped to the world.
    assert_eq!(c.paint_food(30.0, 20.0, 1e30, 1), 60 * 40);
}
