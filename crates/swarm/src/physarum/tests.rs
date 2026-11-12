use super::{Slime, SlimeParams};

#[test]
fn sizes_and_params_are_checked() {
    let d = SlimeParams::DEFAULT;
    assert!(d.checked().is_some());
    for bad in [
        SlimeParams { step: 0.0, ..d },
        SlimeParams { decay: 2.0, ..d },
        SlimeParams { turn: 4.0, ..d },
    ] {
        assert!(bad.checked().is_none(), "{bad:?}");
    }
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
