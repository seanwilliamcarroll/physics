use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};

use super::{Slime, SlimeParams, wrap_cell, wrap_position};

#[test]
fn sizes_and_params_are_checked() {
    let defaults = SlimeParams::DEFAULT;
    assert!(defaults.checked().is_some());
    for bad in [
        SlimeParams {
            step_distance: 0.0,
            ..defaults
        },
        SlimeParams {
            decay: 2.0,
            ..defaults
        },
        SlimeParams {
            turn: 4.0,
            ..defaults
        },
        SlimeParams {
            deposit: crate::MAX_DEPOSIT * 1.001,
            ..defaults
        },
        SlimeParams {
            deposit: f32::NAN,
            ..defaults
        },
        SlimeParams {
            deposit: -1.0,
            ..defaults
        },
    ] {
        assert!(bad.checked().is_none(), "{bad:?}");
    }
    let most = SlimeParams {
        deposit: crate::MAX_DEPOSIT,
        ..defaults
    };
    assert!(most.checked().is_some(), "the cap itself is allowed");
    assert!(Slime::new(0, 10, defaults, 1).is_none());
    assert!(Slime::new(64, 0, defaults, 1).is_none());
    assert!(
        Slime::new(2, 10, defaults, 1).is_none(),
        "a step of half the world"
    );
    let slime = Slime::new(64, 500, defaults, 1).unwrap();
    assert!(
        slime
            .positions()
            .all(|(x, y)| (0.0..64.0).contains(&x) && (0.0..64.0).contains(&y))
    );
}

#[test]
fn agents_wrap_and_deposit_where_they_land() {
    let params = SlimeParams {
        diffusion: 0.0,
        decay: 0.0,
        ..SlimeParams::DEFAULT
    };
    let mut slime = Slime::new(32, 1, params, 1).unwrap();
    (slime.x[0], slime.y[0], slime.cos[0], slime.sin[0]) = (31.5, 10.5, 1.0, 0.0);
    slime.step();
    assert!((slime.x[0] - 0.5).abs() < 1e-5, "wrapped: {}", slime.x[0]);
    assert_eq!(slime.field.get(0, 10), Some(5.0));
}

#[test]
fn an_agent_turns_toward_the_stronger_side() {
    let params = SlimeParams {
        diffusion: 0.0,
        decay: 0.0,
        ..SlimeParams::DEFAULT
    };
    let mut slime = Slime::new(64, 1, params, 1).unwrap();
    (slime.x[0], slime.y[0], slime.cos[0], slime.sin[0]) = (20.5, 20.5, 1.0, 0.0);
    let (sensor_angle, sensor_offset) = (params.sensor_angle, params.sensor_offset);
    let (sensor_x, sensor_y) = (
        20.5 + sensor_offset * sensor_angle.cos(),
        20.5 + sensor_offset * sensor_angle.sin(),
    );
    let cell =
        |coordinate: f32| math::convert::f64_to_usize(f64::from(coordinate.floor())).unwrap();
    assert!(slime.field.deposit(cell(sensor_x), cell(sensor_y), 10.0));
    slime.step();
    let turned = slime.sin[0].atan2(slime.cos[0]);
    assert!((turned - params.turn).abs() < 1e-5, "turned {turned}");
}

#[test]
fn nodes_deposit_every_step() {
    let params = SlimeParams {
        diffusion: 0.0,
        decay: 0.0,
        deposit: 0.0,
        ..SlimeParams::DEFAULT
    };
    let mut slime = Slime::new(32, 1, params, 1).unwrap();
    assert!(
        slime.add_node(5, 5, 2.0) && !slime.add_node(40, 5, 1.0) && !slime.add_node(1, 1, -1.0)
    );
    for _ in 0..3 {
        slime.step();
    }
    assert_eq!(slime.field.get(5, 5), Some(6.0));
    slime.clear_nodes();
    assert_eq!(slime.nodes(), []);
}

/// Values around every branch of the wraps: inside, one world out each
/// way, the boundaries and their neighbours in `f32`, far out, and the
/// non-finite.
fn wrap_cases(side_length: f32) -> Vec<f32> {
    let mut cases = vec![f32::NAN, f32::INFINITY, f32::NEG_INFINITY, 1e30, -1e30];
    for base in [
        -3.0 * side_length,
        -2.0 * side_length,
        -side_length,
        -1.0,
        -0.0,
        0.0,
        1.0,
        0.5 * side_length,
        side_length,
        2.0 * side_length,
        3.0 * side_length,
    ] {
        for value in [
            base.next_down().next_down(),
            base.next_down(),
            base,
            base.next_up(),
            base + 0.25,
            base + 7.75,
        ] {
            cases.push(value);
        }
    }
    cases.extend([-1e-9, -1e-30, -f32::MIN_POSITIVE]);
    cases
}

#[test]
fn wrap_cell_is_floor_mod_side_everywhere() {
    for side in [1_usize, 7, 96, 512] {
        let side_length = usize_to_f64(side);
        for coordinate in wrap_cases(f64_to_f32(side_length)) {
            let general = f64_to_usize(f64::from(coordinate.floor()).rem_euclid(side_length))
                .unwrap_or(0)
                .min(side - 1);
            assert_eq!(
                wrap_cell(coordinate, side),
                general,
                "coordinate = {coordinate:e}, side = {side}"
            );
        }
    }
}

#[test]
fn wrap_position_is_rem_euclid() {
    for side_length in [1.0_f32, 7.0, 96.0, 512.0] {
        for position in wrap_cases(side_length) {
            let remainder = position.rem_euclid(side_length);
            let general = if remainder >= side_length {
                0.0
            } else {
                remainder
            };
            let got = wrap_position(position, side_length);
            // NaN for NaN; otherwise inside [0, side_length), and the same
            // place on the torus as `rem_euclid`'s to rounding (in fact the
            // same bits): a distance that wraps, so side_length − tiny and 0
            // are close.
            if general.is_nan() {
                assert!(
                    got.is_nan(),
                    "position = {position:e}, side_length = {side_length}: {got}"
                );
            } else {
                assert!(
                    (0.0..side_length).contains(&got),
                    "position = {position:e}, side_length = {side_length}: {got}"
                );
                let distance = (got - general).abs();
                assert!(
                    distance.min(side_length - distance) <= 4.0 * f32::EPSILON * side_length,
                    "position = {position:e}, side_length = {side_length}: {got} vs {general}"
                );
            }
        }
    }
}

#[test]
fn a_node_deposits_at_most_the_cap() {
    let mut slime = Slime::new(64, 10, SlimeParams::DEFAULT, 1).unwrap();
    assert!(slime.add_node(3, 3, crate::MAX_DEPOSIT));
    for bad in [
        crate::MAX_DEPOSIT * 1.001,
        f32::MAX,
        f32::INFINITY,
        f32::NAN,
        -1.0,
    ] {
        assert!(!slime.add_node(3, 3, bad), "{bad}");
    }
    assert_eq!(slime.nodes().len(), 1);
    assert!(!slime.add_node(64, 3, 1.0) && !slime.add_node(3, 64, 1.0));
}

#[test]
fn the_accessors_report_the_system() {
    let mut slime = Slime::new(64, 500, SlimeParams::DEFAULT, 1).unwrap();
    assert_eq!(
        (slime.side(), slime.len(), slime.is_empty(), slime.steps()),
        (64, 500, false, 0)
    );
    let positions: Vec<(f32, f32)> = slime.positions().collect();
    assert_eq!(positions.len(), 500);
    assert_eq!(positions[7], (slime.x[7], slime.y[7]));
    slime.step();
    slime.step();
    assert_eq!(slime.steps(), 2);
}

#[test]
fn params_are_replaced_only_by_usable_ones_that_fit_the_world() {
    let defaults = SlimeParams::DEFAULT;
    let mut slime = Slime::new(16, 10, defaults, 1).unwrap();
    let slower = SlimeParams {
        step_distance: 0.5,
        ..defaults
    };
    assert!(slime.set_params(slower));
    assert_eq!(slime.params(), slower);
    assert!(!slime.set_params(SlimeParams {
        decay: 2.0,
        ..defaults
    }));
    assert_eq!(slime.params(), slower, "a refusal changes nothing");
    assert!(!slime.set_params(SlimeParams {
        step_distance: 8.0,
        ..defaults
    }));
    assert!(slime.set_params(SlimeParams {
        step_distance: 7.9,
        ..defaults
    }));
}

/// How many agents turned each way in one step: `[left, straight,
/// right]` (by the turn angle), from their headings before and after.
fn turns(before: &Slime, after: &Slime) -> [usize; 3] {
    let mut counts = [0; 3];
    for agent in 0..before.len() {
        let (cos, sin) = (before.cos[agent], before.sin[agent]);
        let (new_cos, new_sin) = (after.cos[agent], after.sin[agent]);
        let cross = cos * new_sin - sin * new_cos;
        let direction = if cross.abs() < 1e-4 {
            1
        } else if cross < 0.0 {
            0
        } else {
            2
        };
        counts[direction] += 1;
    }
    counts
}

#[test]
fn on_an_empty_field_a_sensing_agent_goes_straight() {
    let before = Slime::new(64, 300, SlimeParams::DEFAULT, 3).unwrap();
    let mut after = before.clone();
    after.step();
    assert_eq!(turns(&before, &after), [0, 300, 0]);
}

#[test]
fn without_sensing_left_straight_and_right_are_equally_likely() {
    let mut before = Slime::new(64, 3000, SlimeParams::DEFAULT, 5).unwrap();
    before.set_sensing(false);
    let mut after = before.clone();
    after.step();
    let [left, straight, right] = turns(&before, &after);
    // 1000 each expected; σ = √(3000 · ⅓ · ⅔) ≈ 26, so ±130 is 5σ.
    for (what, count) in [("left", left), ("straight", straight), ("right", right)] {
        assert!((870..=1130).contains(&count), "{what}: {count} of 3000");
    }
}
