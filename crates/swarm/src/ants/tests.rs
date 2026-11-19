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
fn colony_with_one_ant(x: f32, y: f32) -> Colony {
    let params = AntParams {
        wiggle: 0.0,
        diffusion: 0.0,
        decay: 0.0,
        ..AntParams::DEFAULT
    };
    let mut colony = Colony::new(60, 40, 1, (55.0, 35.0, 2.0), params, 1).unwrap();
    if let Some(ant) = colony.ants.first_mut() {
        (ant.x, ant.y, ant.cos, ant.sin) = (x, y, 1.0, 0.0);
    }
    colony
}

fn only_ant(colony: &Colony) -> super::Ant {
    colony.ants().next().unwrap()
}

#[test]
fn params_and_sizes_are_checked() {
    let defaults = AntParams::DEFAULT;
    assert!(defaults.checked().is_some());
    for bad in [
        AntParams {
            speed: 0.0,
            ..defaults
        },
        AntParams {
            deposit: crate::MAX_DEPOSIT * 1.001,
            ..defaults
        },
        AntParams {
            deposit: f32::NAN,
            ..defaults
        },
        AntParams {
            deposit: -1.0,
            ..defaults
        },
        AntParams {
            decay: 1.5,
            ..defaults
        },
        AntParams {
            sensor_angle: 4.0,
            ..defaults
        },
        AntParams {
            falloff: f32::NAN,
            ..defaults
        },
    ] {
        assert!(bad.checked().is_none(), "{bad:?}");
    }
    assert!(Colony::new(0, 10, 1, (1.0, 1.0, 1.0), defaults, 1).is_none());
    assert!(Colony::new(10, 10, 0, (1.0, 1.0, 1.0), defaults, 1).is_none());
    assert!(
        Colony::new(10, 10, 1, (10.0, 1.0, 1.0), defaults, 1).is_none(),
        "nest outside"
    );
    assert!(
        Colony::new(10, 10, 1, (1.0, 1.0, 0.0), defaults, 1).is_none(),
        "nest of radius 0"
    );
}

#[test]
fn a_searching_ant_turns_toward_the_stronger_food_trail() {
    // Food pheromone ahead and to the right (+y is the +SA side here).
    let mut colony = colony_with_one_ant(20.0, 20.0);
    let (sensor_angle, sensor_distance) = (
        AntParams::DEFAULT.sensor_angle,
        AntParams::DEFAULT.sensor_distance,
    );
    let (trail_x, trail_y) = (
        20.0 + sensor_distance * sensor_angle.cos(),
        20.0 + sensor_distance * sensor_angle.sin(),
    );
    assert!(
        colony
            .food_field
            .deposit(trail_x as usize, trail_y as usize, 5.0)
    );
    colony.step();
    let ant = only_ant(&colony);
    let turned = ant.sin.atan2(ant.cos);
    assert!((turned - sensor_angle).abs() < 1e-5, "turned {turned}");
    // Nothing anywhere: straight on.
    let mut colony = colony_with_one_ant(20.0, 20.0);
    colony.step();
    assert_eq!((only_ant(&colony).cos, only_ant(&colony).sin), (1.0, 0.0));
    assert_eq!((only_ant(&colony).x, only_ant(&colony).y), (21.0, 20.0));
}

#[test]
fn food_is_taken_and_carried_home_with_u_turns() {
    let mut colony = colony_with_one_ant(20.0, 20.0);
    colony.paint_food(21.5, 20.5, 0.0, 3);
    colony.step();
    let ant = only_ant(&colony);
    assert!(ant.carrying && ant.steps_since_leaving == 1, "{ant:?}");
    assert_eq!((ant.cos, ant.sin), (-1.0, -0.0), "a U-turn");
    assert_eq!(colony.food_in_world(), 2);
    assert!(
        colony.field(Pheromone::Food).total() > 0.0,
        "carrying ants lay food pheromone"
    );
    // At the nest: delivered, searching again, a U-turn.
    assert!(colony.set_nest(19.5, 20.0, 1.0));
    colony.step();
    let ant = only_ant(&colony);
    assert!(!ant.carrying && colony.delivered() == 1, "{ant:?}");
    assert_eq!(colony.carrying(), 0);
}

#[test]
fn a_wall_ahead_turns_the_ant_around_in_place() {
    let mut colony = colony_with_one_ant(20.0, 20.0);
    colony.paint_wall(21.5, 20.5, 0.0);
    colony.step();
    let ant = only_ant(&colony);
    assert_eq!((ant.x, ant.y, ant.cos), (20.0, 20.0, -1.0));
    // The edge of the world too.
    let mut at_edge = colony_with_one_ant(59.5, 20.0);
    at_edge.step();
    assert_eq!((only_ant(&at_edge).x, only_ant(&at_edge).cos), (59.5, -1.0));
}

#[test]
fn deposits_weaken_with_distance_from_the_source() {
    let mut colony = colony_with_one_ant(20.0, 20.0);
    for _ in 0..10 {
        colony.step();
    }
    // Searching: home pheromone, q e^(−k s) for s = 0..9 (the step count
    // since leaving the nest, which is far away: it counts from the start).
    let falloff = AntParams::DEFAULT.falloff;
    let expected: f32 = (0..10).map(|steps| (-falloff * steps as f32).exp()).sum();
    assert!((colony.field(Pheromone::Home).total() as f32 - expected).abs() < 1e-4);
}

#[test]
fn painting_far_outside_the_world_paints_nothing_and_returns() {
    // Stepping an f64 by 1.0 from 1e30 never advanced: it hung.
    let mut colony = colony_with_one_ant(20.0, 20.0);
    assert_eq!(colony.paint_food(1e30, 1e30, 3.0, 5), 0);
    assert_eq!(colony.paint_wall(-1e30, 5.0, 3.0), 0);
    assert_eq!(colony.erase(f32::INFINITY, 5.0, 3.0), 0);
    // A huge radius is clipped to the world.
    assert_eq!(colony.paint_food(30.0, 20.0, 1e30, 1), 60 * 40);
}

#[test]
fn before_the_first_step_the_ants_move_with_the_nest() {
    let mut colony = Colony::new(60, 40, 5, (10.0, 10.0, 2.0), AntParams::DEFAULT, 1).unwrap();
    assert!(colony.set_nest(40.0, 30.0, 3.0));
    assert!(colony.ants().all(|ant| (ant.x, ant.y) == (40.0, 30.0)));
    colony.step();
    let before: Vec<(f32, f32)> = colony.ants().map(|ant| (ant.x, ant.y)).collect();
    assert!(colony.set_nest(5.0, 5.0, 2.0));
    let after: Vec<(f32, f32)> = colony.ants().map(|ant| (ant.x, ant.y)).collect();
    assert_eq!(before, after, "after the first step they stay");
}

/// The fields diffuse with cached open-neighbour counts: stale counts
/// after a wall goes up would divide by too many (mass lost into the
/// wall), and after one comes down by too few (mass made).
#[test]
fn diffusion_conserves_mass_after_walls_are_painted_and_erased() {
    let params = AntParams {
        wiggle: 0.0,
        diffusion: 0.5,
        decay: 0.0,
        ..AntParams::DEFAULT
    };
    let mut colony = Colony::new(60, 40, 1, (55.0, 35.0, 2.0), params, 1).unwrap();
    if let Some(ant) = colony.ants.first_mut() {
        (ant.x, ant.y, ant.cos, ant.sin) = (20.0, 20.0, 1.0, 0.0);
    }
    let total = |colony: &Colony| colony.field(Pheromone::Home).total();
    // Each step adds exactly its deposits: measured, the worst step is
    // off by 1.5e-7 (f32 rounding); 2e-6 allowed. Stale counts lose 0.12
    // in the first walled step.
    let check = |colony: &mut Colony, what: &str| {
        for _ in 0..10 {
            let before = total(colony);
            colony.step();
            let added = colony.last_deposits(Pheromone::Home);
            assert!(
                (total(colony) - before - added).abs() < 2e-6,
                "{what}: {before} + {added} became {}",
                total(colony)
            );
        }
    };
    check(&mut colony, "open");
    assert!(colony.paint_wall(22.0, 18.0, 1.5) > 0);
    check(&mut colony, "walled");
    assert!(colony.erase(22.0, 18.0, 1.5) > 0);
    check(&mut colony, "erased");
}

#[test]
fn a_cell_index_stops_at_the_far_edges() {
    let colony = colony_with_one_ant(20.0, 20.0);
    assert_eq!(colony.index(59.9, 39.9), Some(39 * 60 + 59));
    // x = width is outside, not the next row's first cell.
    assert_eq!(colony.index(60.0, 5.0), None);
    assert_eq!(colony.index(5.0, 40.0), None);
    assert_eq!(colony.index(-0.5, 5.0), None);
}

#[test]
fn a_disc_is_clipped_to_the_world_edge_by_edge() {
    let colony = colony_with_one_ant(20.0, 20.0);
    let cells = |x: f32, y: f32, radius: f32| {
        let mut cells = colony.disc(x, y, radius);
        cells.sort_unstable();
        cells
    };
    // One cell, in the middle.
    assert_eq!(cells(10.5, 7.5, 0.0), [7 * 60 + 10]);
    // Entirely outside, on each side: nothing.
    for (x, y) in [(-3.0, 5.0), (63.0, 5.0), (5.0, -3.0), (5.0, 43.0)] {
        assert_eq!(cells(x, y, 1.0), [], "({x}, {y})");
    }
    // A small disc just outside whose box ends exactly at column or row
    // 0 (a cell is in if its centre is within √(r² + ½)): included.
    assert_eq!(cells(-0.2, 5.5, 0.2), [5 * 60]);
    assert_eq!(cells(5.5, -0.2, 0.2), [5]);
    // The last column and row themselves.
    assert_eq!(cells(59.5, 5.5, 0.0), [5 * 60 + 59]);
    assert_eq!(cells(5.5, 39.5, 0.0), [39 * 60 + 5]);
    // Not finite: nothing.
    assert_eq!(cells(f32::NAN, 5.0, 1.0), []);
    assert_eq!(cells(5.0, f32::INFINITY, 1.0), []);
}

#[test]
fn painted_food_is_counted_once_and_erasing_takes_it_back() {
    let mut colony = colony_with_one_ant(20.0, 20.0);
    assert_eq!(colony.paint_food(10.5, 10.5, 0.0, 7), 7);
    // On top of what's there: only the added amount counts.
    assert_eq!(colony.paint_food(10.5, 10.5, 0.0, 5), 5);
    assert_eq!((colony.painted(), colony.food_in_world()), (12, 12));
    assert_eq!(colony.food().get(10 * 60 + 10), Some(&12));
    assert_eq!(colony.food().len(), 60 * 40);
    // Erasing an empty cell changes nothing; a cell with food, one cell.
    assert_eq!(colony.erase(30.5, 30.5, 0.0), 0);
    assert_eq!(colony.erase(10.5, 10.5, 0.0), 1);
    assert_eq!((colony.painted(), colony.food_in_world()), (0, 0));
    // A wall erased counts too.
    assert_eq!(colony.paint_wall(30.5, 30.5, 0.0), 1);
    assert_eq!(colony.erase(30.5, 30.5, 0.0), 1);
}

#[test]
fn a_new_wall_removes_the_pheromone_under_it_and_only_there() {
    let mut colony = colony_with_one_ant(20.0, 20.0);
    for _ in 0..5 {
        colony.step();
    }
    // The ant walked +x from (20, 20): a trail in row 20.
    let at = |colony: &Colony, x: usize| colony.field(Pheromone::Home).get(x, 20).unwrap();
    assert!(at(&colony, 22) > 0.0 && at(&colony, 24) > 0.0);
    colony.paint_wall(22.5, 20.5, 0.0);
    assert_eq!(at(&colony, 22), 0.0, "under the wall");
    assert!(at(&colony, 24) > 0.0, "beside it");
}

#[test]
fn walls_and_the_outside_read_worse_than_any_trail() {
    let mut colony = colony_with_one_ant(20.0, 20.0);
    colony.paint_wall(30.5, 30.5, 0.0);
    assert_eq!(colony.sense(Pheromone::Home, 30.5, 30.5), -1.0);
    assert_eq!(colony.sense(Pheromone::Food, -1.0, 5.0), -1.0);
    assert_eq!(colony.sense(Pheromone::Home, 5.5, 5.5), 0.0);
}

#[test]
fn the_nest_moves_only_to_a_usable_place() {
    let mut colony = colony_with_one_ant(20.0, 20.0);
    let was = colony.nest();
    assert_eq!(was, (55.0, 35.0, 2.0));
    for (x, y, radius) in [
        (f32::NAN, 5.0, 1.0),
        (5.0, f32::NAN, 1.0),
        (5.0, 5.0, f32::NAN),
        (5.0, 5.0, 0.0),
        (-0.1, 5.0, 1.0),
        (5.0, -0.1, 1.0),
        (60.0, 5.0, 1.0),
        (5.0, 40.0, 1.0),
    ] {
        assert!(!colony.set_nest(x, y, radius), "({x}, {y}, {radius})");
        assert_eq!(colony.nest(), was, "refused: unchanged");
    }
    // The corners of the usable range.
    assert!(colony.set_nest(0.0, 0.0, 0.5));
    assert!(colony.set_nest(59.9, 39.9, 0.5));
    assert_eq!(colony.nest(), (59.9, 39.9, 0.5));
}

#[test]
fn params_are_replaced_only_by_usable_ones() {
    let mut colony = colony_with_one_ant(20.0, 20.0);
    let was = colony.params();
    assert!(!colony.set_params(AntParams { speed: 0.0, ..was }));
    assert_eq!(colony.params(), was);
    let new = AntParams { speed: 0.5, ..was };
    assert!(colony.set_params(new));
    assert_eq!(colony.params(), new);
}

#[test]
fn the_counts_count() {
    let mut colony = Colony::new(60, 40, 3, (30.0, 20.0, 2.0), AntParams::DEFAULT, 1).unwrap();
    assert_eq!(
        (colony.len(), colony.is_empty(), colony.steps()),
        (3, false, 0)
    );
    colony.step();
    colony.step();
    assert_eq!(colony.steps(), 2);
}

/// With sensing off an ant turns by a uniform angle in `[−turn, turn]`
/// each step: the random-walk baseline. 2,000 turns of one slow ant
/// (it never reaches a wall). Measured: extremes −0.998 and +0.9996 of
/// turn, mean 0.002 of turn; bounds 0.95 and 0.05, and any change to the
/// formula's arithmetic leaves the range entirely.
#[test]
fn without_sensing_the_turn_is_uniform_within_the_turn_angle() {
    let params = AntParams {
        wiggle: 0.0,
        speed: 1e-3,
        ..AntParams::DEFAULT
    };
    let mut colony = Colony::new(60, 40, 1, (30.0, 20.0, 2.0), params, 3).unwrap();
    colony.set_sensing(false);
    let (mut smallest, mut largest, mut sum) = (f32::INFINITY, f32::NEG_INFINITY, 0.0_f32);
    let mut before = only_ant(&colony);
    for _ in 0..2000 {
        colony.step();
        let now = only_ant(&colony);
        // The signed angle from the old heading to the new.
        let turned = libm::atan2f(
            before.cos * now.sin - before.sin * now.cos,
            before.cos * now.cos + before.sin * now.sin,
        );
        (smallest, largest, sum) = (smallest.min(turned), largest.max(turned), sum + turned);
        before = now;
    }
    let turn = params.turn;
    assert!(
        smallest >= -turn - 1e-4 && largest <= turn + 1e-4,
        "[{smallest}, {largest}] past ±{turn}"
    );
    assert!(
        smallest < -0.95 * turn && largest > 0.95 * turn,
        "[{smallest}, {largest}] short of ±{turn}"
    );
    assert!((sum / 2000.0).abs() < 0.05 * turn, "mean {}", sum / 2000.0);
}
