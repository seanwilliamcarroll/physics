use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};

use super::{Slime, SlimeParams, wrap_cell, wrap_position};

#[test]
fn sizes_and_params_are_checked() {
    let d = SlimeParams::DEFAULT;
    assert!(d.checked().is_some());
    for bad in [
        SlimeParams { step: 0.0, ..d },
        SlimeParams { decay: 2.0, ..d },
        SlimeParams { turn: 4.0, ..d },
        SlimeParams {
            deposit: crate::MAX_DEPOSIT * 1.001,
            ..d
        },
        SlimeParams {
            deposit: f32::NAN,
            ..d
        },
        SlimeParams { deposit: -1.0, ..d },
    ] {
        assert!(bad.checked().is_none(), "{bad:?}");
    }
    let most = SlimeParams {
        deposit: crate::MAX_DEPOSIT,
        ..d
    };
    assert!(most.checked().is_some(), "the cap itself is allowed");
    assert!(Slime::new(0, 10, d, 1).is_none());
    assert!(Slime::new(64, 0, d, 1).is_none());
    assert!(
        Slime::new(2, 10, d, 1).is_none(),
        "a step of half the world"
    );
    let s = Slime::new(64, 500, d, 1).unwrap();
    assert!(
        s.positions()
            .all(|(x, y)| (0.0..64.0).contains(&x) && (0.0..64.0).contains(&y))
    );
}

#[test]
fn agents_wrap_and_deposit_where_they_land() {
    let p = SlimeParams {
        diffusion: 0.0,
        decay: 0.0,
        ..SlimeParams::DEFAULT
    };
    let mut s = Slime::new(32, 1, p, 1).unwrap();
    (s.x[0], s.y[0], s.cos[0], s.sin[0]) = (31.5, 10.5, 1.0, 0.0);
    s.step();
    assert!((s.x[0] - 0.5).abs() < 1e-5, "wrapped: {}", s.x[0]);
    assert_eq!(s.field.get(0, 10), Some(5.0));
}

#[test]
fn an_agent_turns_toward_the_stronger_side() {
    let p = SlimeParams {
        diffusion: 0.0,
        decay: 0.0,
        ..SlimeParams::DEFAULT
    };
    let mut s = Slime::new(64, 1, p, 1).unwrap();
    (s.x[0], s.y[0], s.cos[0], s.sin[0]) = (20.5, 20.5, 1.0, 0.0);
    // Something at the +SA sensor: (20.5 + 9 cos 22.5°, 20.5 + 9 sin 22.5°).
    let (a, o) = (p.sensor_angle, p.sensor_offset);
    let (sx, sy) = (20.5 + o * a.cos(), 20.5 + o * a.sin());
    let cell = |v: f32| math::convert::f64_to_usize(f64::from(v.floor())).unwrap();
    assert!(s.field.deposit(cell(sx), cell(sy), 10.0));
    s.step();
    let turned = s.sin[0].atan2(s.cos[0]);
    assert!((turned - p.turn).abs() < 1e-5, "turned {turned}");
}

#[test]
fn nodes_deposit_every_step() {
    let p = SlimeParams {
        diffusion: 0.0,
        decay: 0.0,
        deposit: 0.0,
        ..SlimeParams::DEFAULT
    };
    let mut s = Slime::new(32, 1, p, 1).unwrap();
    assert!(s.add_node(5, 5, 2.0) && !s.add_node(40, 5, 1.0) && !s.add_node(1, 1, -1.0));
    for _ in 0..3 {
        s.step();
    }
    assert_eq!(s.field.get(5, 5), Some(6.0));
    s.clear_nodes();
    assert_eq!(s.nodes(), []);
}

/// Values around every branch of the wraps: inside, one world out each
/// way, the boundaries and their neighbours in `f32`, far out, and the
/// non-finite.
fn wrap_cases(l: f32) -> Vec<f32> {
    let mut out = vec![f32::NAN, f32::INFINITY, f32::NEG_INFINITY, 1e30, -1e30];
    for base in [
        -3.0 * l,
        -2.0 * l,
        -l,
        -1.0,
        -0.0,
        0.0,
        1.0,
        0.5 * l,
        l,
        2.0 * l,
        3.0 * l,
    ] {
        for v in [
            base.next_down().next_down(),
            base.next_down(),
            base,
            base.next_up(),
            base + 0.25,
            base + 7.75,
        ] {
            out.push(v);
        }
    }
    out.extend([-1e-9, -1e-30, -f32::MIN_POSITIVE]);
    out
}

#[test]
fn wrap_cell_is_floor_mod_side_everywhere() {
    for side in [1_usize, 7, 96, 512] {
        let l = usize_to_f64(side);
        for v in wrap_cases(f64_to_f32(l)) {
            let general = f64_to_usize(f64::from(v.floor()).rem_euclid(l))
                .unwrap_or(0)
                .min(side - 1);
            assert_eq!(wrap_cell(v, side), general, "v = {v:e}, side = {side}");
        }
    }
}

#[test]
fn wrap_position_is_rem_euclid_bit_for_bit() {
    for l in [1.0_f32, 7.0, 96.0, 512.0] {
        for v in wrap_cases(l) {
            let r = v.rem_euclid(l);
            let general = if r >= l { 0.0 } else { r };
            assert_eq!(
                wrap_position(v, l).to_bits(),
                general.to_bits(),
                "v = {v:e}, l = {l}"
            );
        }
    }
}

#[test]
fn a_node_deposits_at_most_the_cap() {
    let mut s = Slime::new(64, 10, SlimeParams::DEFAULT, 1).unwrap();
    assert!(s.add_node(3, 3, crate::MAX_DEPOSIT));
    for bad in [
        crate::MAX_DEPOSIT * 1.001,
        f32::MAX,
        f32::INFINITY,
        f32::NAN,
        -1.0,
    ] {
        assert!(!s.add_node(3, 3, bad), "{bad}");
    }
    assert_eq!(s.nodes().len(), 1);
    assert!(!s.add_node(64, 3, 1.0) && !s.add_node(3, 64, 1.0));
}
