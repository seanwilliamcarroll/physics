use super::{SlimeDemo, ramp};
use crate::abi;
use crate::demo::BACKGROUND;

#[test]
fn sizes_params_and_nodes_are_checked() {
    assert!(SlimeDemo::new(0, 10, 2, 1).is_none());
    assert!(SlimeDemo::new(64, 10, 5, 1).is_none());
    let mut d = SlimeDemo::new(64, 500, 2, 1).unwrap();
    assert_eq!(d.view(), 128);
    assert_eq!(d.param(abi::SLIME_DECAY), Some(f64::from(0.1_f32)));
    assert!(
        d.set_param(abi::SLIME_DECAY, 0.2)
            && !d.set_param(abi::SLIME_DECAY, 2.0)
            && !d.set_param(99, 1.0)
    );
    assert!(
        d.add_node(10.0, 10.0, 50.0) && !d.add_node(-1.0, 3.0, 5.0) && !d.add_node(70.0, 3.0, 5.0)
    );
    assert!(!d.add_node(f64::NAN, 3.0, 5.0));
    for _ in 1..abi::MAX_NODES {
        assert!(d.add_node(1.0, 1.0, 1.0));
    }
    assert!(!d.add_node(1.0, 1.0, 1.0), "past the cap");
    d.clear_nodes();
    assert_eq!(d.advance(0.2), 12);
}

#[test]
fn the_ramp_runs_from_the_background_up() {
    assert_eq!(ramp(0.0), BACKGROUND);
    assert_eq!(ramp(1.0), 0xffc2_f4ff);
    let mut d = SlimeDemo::new(32, 300, 1, 1).unwrap();
    for _ in 0..20 {
        d.advance(1.0 / 60.0 + 1e-9);
    }
    let px = d.render().to_vec();
    assert_eq!(px.len(), 32 * 32);
    assert!(px.iter().any(|&p| p != BACKGROUND), "the field shows");
}

// Found by the full mutation run of 2026-11-12.

#[test]
fn the_ramp_is_smooth_and_passes_through_its_stops() {
    let ch = |c: u32, k: u32| i64::from((c >> (8 * k)) & 0xff);
    let mut last = ramp(0.0);
    for k in 1..=1000_u32 {
        let c = ramp(f64::from(k) / 1000.0);
        for channel in 0..3 {
            let step = (ch(c, channel) - ch(last, channel)).abs();
            // The steepest segment: 196 over 0.35, under 1 a step.
            assert!(step <= 1, "t {k}/1000, channel {channel}: a jump of {step}");
        }
        last = c;
    }
    // The stop at 0.4: (31, 111, 139).
    assert_eq!(ramp(0.4), 0xff8b_6f1f);
}

#[test]
fn each_cell_is_drawn_through_the_ramp_as_a_scale_square() {
    let mut d = SlimeDemo::new(16, 200, 3, 2).unwrap();
    for _ in 0..10 {
        d.advance(1.0 / 60.0 + 1e-9);
    }
    let values = d.slime.field().values().to_vec();
    assert!(values.iter().any(|&v| v > 0.0));
    let px = d.render().to_vec();
    assert_eq!(px.len(), 48 * 48);
    for cy in 0..16 {
        for cx in 0..16 {
            let v = values[cy * 16 + cx].max(0.0);
            let k = (f64::from(v / (v + 5.0)) * 255.0).round();
            let want = ramp(k / 255.0);
            for y in cy * 3..cy * 3 + 3 {
                for x in cx * 3..cx * 3 + 3 {
                    assert_eq!(px[y * 48 + x], want, "cell ({cx}, {cy}) at ({x}, {y})");
                }
            }
        }
    }
}

#[test]
fn sensing_and_clearing_nodes_reach_the_model() {
    let mut on = SlimeDemo::new(32, 300, 1, 4).unwrap();
    let mut off = SlimeDemo::new(32, 300, 1, 4).unwrap();
    off.set_sensing(false);
    for _ in 0..30 {
        on.advance(1.0 / 60.0 + 1e-9);
        off.advance(1.0 / 60.0 + 1e-9);
    }
    let at = |d: &SlimeDemo| d.slime.positions().collect::<Vec<_>>();
    assert_ne!(at(&on), at(&off), "the same seed, with and without sensing");
    assert!(on.add_node(3.0, 3.0, 1.0));
    on.clear_nodes();
    assert_eq!(on.slime.nodes().len(), 0);
}
