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
        AntParams {
            deposit: crate::MAX_DEPOSIT * 1.001,
            ..d
        },
        AntParams {
            deposit: f32::NAN,
            ..d
        },
        AntParams { deposit: -1.0, ..d },
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

#[test]
fn before_the_first_step_the_ants_move_with_the_nest() {
    let mut c = Colony::new(60, 40, 5, (10.0, 10.0, 2.0), AntParams::DEFAULT, 1).unwrap();
    assert!(c.set_nest(40.0, 30.0, 3.0));
    assert!(c.ants().all(|a| (a.x, a.y) == (40.0, 30.0)));
    c.step();
    let before: Vec<(f32, f32)> = c.ants().map(|a| (a.x, a.y)).collect();
    assert!(c.set_nest(5.0, 5.0, 2.0));
    let after: Vec<(f32, f32)> = c.ants().map(|a| (a.x, a.y)).collect();
    assert_eq!(before, after, "after the first step they stay");
}

/// The fields diffuse with cached open-neighbour counts: stale counts
/// after a wall goes up would divide by too many (mass lost into the
/// wall), and after one comes down by too few (mass made).
#[test]
fn diffusion_conserves_mass_after_walls_are_painted_and_erased() {
    let p = AntParams {
        wiggle: 0.0,
        diffusion: 0.5,
        decay: 0.0,
        ..AntParams::DEFAULT
    };
    let mut c = Colony::new(60, 40, 1, (55.0, 35.0, 2.0), p, 1).unwrap();
    if let Some(a) = c.ants.first_mut() {
        (a.x, a.y, a.cos, a.sin) = (20.0, 20.0, 1.0, 0.0);
    }
    let total = |c: &Colony| c.field(Pheromone::Home).total();
    // Each step adds exactly its deposits: measured, the worst step is
    // off by 1.5e-7 (f32 rounding); 2e-6 allowed. Stale counts lose 0.12
    // in the first walled step.
    let check = |c: &mut Colony, what: &str| {
        for _ in 0..10 {
            let before = total(c);
            c.step();
            let added = c.last_deposits(Pheromone::Home);
            assert!(
                (total(c) - before - added).abs() < 2e-6,
                "{what}: {before} + {added} became {}",
                total(c)
            );
        }
    };
    check(&mut c, "open");
    assert!(c.paint_wall(22.0, 18.0, 1.5) > 0);
    check(&mut c, "walled");
    assert!(c.erase(22.0, 18.0, 1.5) > 0);
    check(&mut c, "erased");
}

// The tests below close gaps a mutation run found (4b299dd; the note in
// `docs/04-testing.md`, "Mutation testing").

#[test]
fn a_cell_index_stops_at_the_far_edges() {
    let c = one(20.0, 20.0);
    assert_eq!(c.index(59.9, 39.9), Some(39 * 60 + 59));
    // x = width is outside, not the next row's first cell.
    assert_eq!(c.index(60.0, 5.0), None);
    assert_eq!(c.index(5.0, 40.0), None);
    assert_eq!(c.index(-0.5, 5.0), None);
}

#[test]
fn a_disc_is_clipped_to_the_world_edge_by_edge() {
    let c = one(20.0, 20.0);
    let cells = |x: f32, y: f32, r: f32| {
        let mut v = c.disc(x, y, r);
        v.sort_unstable();
        v
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
    let mut c = one(20.0, 20.0);
    assert_eq!(c.paint_food(10.5, 10.5, 0.0, 7), 7);
    // On top of what's there: only the added amount counts.
    assert_eq!(c.paint_food(10.5, 10.5, 0.0, 5), 5);
    assert_eq!((c.painted(), c.food_in_world()), (12, 12));
    assert_eq!(c.food().get(10 * 60 + 10), Some(&12));
    assert_eq!(c.food().len(), 60 * 40);
    // Erasing an empty cell changes nothing; a cell with food, one cell.
    assert_eq!(c.erase(30.5, 30.5, 0.0), 0);
    assert_eq!(c.erase(10.5, 10.5, 0.0), 1);
    assert_eq!((c.painted(), c.food_in_world()), (0, 0));
    // A wall erased counts too.
    assert_eq!(c.paint_wall(30.5, 30.5, 0.0), 1);
    assert_eq!(c.erase(30.5, 30.5, 0.0), 1);
}

#[test]
fn a_new_wall_removes_the_pheromone_under_it_and_only_there() {
    let mut c = one(20.0, 20.0);
    for _ in 0..5 {
        c.step();
    }
    // The ant walked +x from (20, 20): a trail in row 20.
    let at = |c: &Colony, x: usize| c.field(Pheromone::Home).get(x, 20).unwrap();
    assert!(at(&c, 22) > 0.0 && at(&c, 24) > 0.0);
    c.paint_wall(22.5, 20.5, 0.0);
    assert_eq!(at(&c, 22), 0.0, "under the wall");
    assert!(at(&c, 24) > 0.0, "beside it");
}

#[test]
fn walls_and_the_outside_read_worse_than_any_trail() {
    let mut c = one(20.0, 20.0);
    c.paint_wall(30.5, 30.5, 0.0);
    assert_eq!(c.sense(Pheromone::Home, 30.5, 30.5), -1.0);
    assert_eq!(c.sense(Pheromone::Food, -1.0, 5.0), -1.0);
    assert_eq!(c.sense(Pheromone::Home, 5.5, 5.5), 0.0);
}

#[test]
fn the_nest_moves_only_to_a_usable_place() {
    let mut c = one(20.0, 20.0);
    let was = c.nest();
    assert_eq!(was, (55.0, 35.0, 2.0));
    for (x, y, r) in [
        (f32::NAN, 5.0, 1.0),
        (5.0, f32::NAN, 1.0),
        (5.0, 5.0, f32::NAN),
        (5.0, 5.0, 0.0),
        (-0.1, 5.0, 1.0),
        (5.0, -0.1, 1.0),
        (60.0, 5.0, 1.0),
        (5.0, 40.0, 1.0),
    ] {
        assert!(!c.set_nest(x, y, r), "({x}, {y}, {r})");
        assert_eq!(c.nest(), was, "refused: unchanged");
    }
    // The corners of the usable range.
    assert!(c.set_nest(0.0, 0.0, 0.5));
    assert!(c.set_nest(59.9, 39.9, 0.5));
    assert_eq!(c.nest(), (59.9, 39.9, 0.5));
}

#[test]
fn params_are_replaced_only_by_usable_ones() {
    let mut c = one(20.0, 20.0);
    let was = c.params();
    assert!(!c.set_params(AntParams { speed: 0.0, ..was }));
    assert_eq!(c.params(), was);
    let new = AntParams { speed: 0.5, ..was };
    assert!(c.set_params(new));
    assert_eq!(c.params(), new);
}

#[test]
fn the_counts_count() {
    let mut c = Colony::new(60, 40, 3, (30.0, 20.0, 2.0), AntParams::DEFAULT, 1).unwrap();
    assert_eq!((c.len(), c.is_empty(), c.steps()), (3, false, 0));
    c.step();
    c.step();
    assert_eq!(c.steps(), 2);
}

/// With sensing off an ant turns by a uniform angle in `[−turn, turn]`
/// each step: the random-walk baseline. 2,000 turns of one slow ant
/// (it never reaches a wall). Measured: extremes −0.998 and +0.9996 of
/// turn, mean 0.002 of turn; bounds 0.95 and 0.05, and any change to the
/// formula's arithmetic leaves the range entirely.
#[test]
fn without_sensing_the_turn_is_uniform_within_the_turn_angle() {
    let p = AntParams {
        wiggle: 0.0,
        speed: 1e-3,
        ..AntParams::DEFAULT
    };
    let mut c = Colony::new(60, 40, 1, (30.0, 20.0, 2.0), p, 3).unwrap();
    c.set_sensing(false);
    let (mut lo, mut hi, mut sum) = (f32::INFINITY, f32::NEG_INFINITY, 0.0_f32);
    let mut before = ant(&c);
    for _ in 0..2000 {
        c.step();
        let now = ant(&c);
        // The signed angle from the old heading to the new.
        let turned = libm::atan2f(
            before.cos * now.sin - before.sin * now.cos,
            before.cos * now.cos + before.sin * now.sin,
        );
        (lo, hi, sum) = (lo.min(turned), hi.max(turned), sum + turned);
        before = now;
    }
    let t = p.turn;
    assert!(lo >= -t - 1e-4 && hi <= t + 1e-4, "[{lo}, {hi}] past ±{t}");
    assert!(
        lo < -0.95 * t && hi > 0.95 * t,
        "[{lo}, {hi}] short of ±{t}"
    );
    assert!((sum / 2000.0).abs() < 0.05 * t, "mean {}", sum / 2000.0);
}
