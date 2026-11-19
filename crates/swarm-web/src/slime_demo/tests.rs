use super::{SlimeDemo, ramp};
use crate::abi;
use crate::demo::BACKGROUND;

#[test]
fn sizes_params_and_nodes_are_checked() {
    assert!(SlimeDemo::new(0, 10, 2, 1).is_none());
    assert!(SlimeDemo::new(64, 10, 5, 1).is_none());
    let mut demo = SlimeDemo::new(64, 500, 2, 1).unwrap();
    assert_eq!(demo.view(), 128);
    assert_eq!(demo.param(abi::SLIME_DECAY), Some(f64::from(0.1_f32)));
    assert!(
        demo.set_param(abi::SLIME_DECAY, 0.2)
            && !demo.set_param(abi::SLIME_DECAY, 2.0)
            && !demo.set_param(99, 1.0)
    );
    assert!(
        demo.add_node(10.0, 10.0, 50.0)
            && !demo.add_node(-1.0, 3.0, 5.0)
            && !demo.add_node(70.0, 3.0, 5.0)
    );
    assert!(!demo.add_node(f64::NAN, 3.0, 5.0));
    for _ in 1..abi::MAX_NODES {
        assert!(demo.add_node(1.0, 1.0, 1.0));
    }
    assert!(!demo.add_node(1.0, 1.0, 1.0), "past the cap");
    demo.clear_nodes();
    assert_eq!(demo.advance(0.2), 12);
}

#[test]
fn the_ramp_runs_from_the_background_up() {
    assert_eq!(ramp(0.0), BACKGROUND);
    assert_eq!(ramp(1.0), 0xffc2_f4ff);
    let mut demo = SlimeDemo::new(32, 300, 1, 1).unwrap();
    for _ in 0..20 {
        demo.advance(1.0 / 60.0 + 1e-9);
    }
    let pixels = demo.render().to_vec();
    assert_eq!(pixels.len(), 32 * 32);
    assert!(
        pixels.iter().any(|&pixel| pixel != BACKGROUND),
        "the field shows"
    );
}

#[test]
fn the_ramp_is_smooth_and_passes_through_its_stops() {
    let byte_of = |colour: u32, channel: u32| i64::from((colour >> (8 * channel)) & 0xff);
    let mut last = ramp(0.0);
    for position in 1..=1000_u32 {
        let colour = ramp(f64::from(position) / 1000.0);
        for channel in 0..3 {
            let step = (byte_of(colour, channel) - byte_of(last, channel)).abs();
            // The steepest segment: 196 over 0.35, under 1 a step.
            assert!(
                step <= 1,
                "position {position}/1000, channel {channel}: a jump of {step}"
            );
        }
        last = colour;
    }
    // The stop at 0.4: (31, 111, 139).
    assert_eq!(ramp(0.4), 0xff8b_6f1f);
}

#[test]
fn each_cell_is_drawn_through_the_ramp_as_a_scale_square() {
    let mut demo = SlimeDemo::new(16, 200, 3, 2).unwrap();
    for _ in 0..10 {
        demo.advance(1.0 / 60.0 + 1e-9);
    }
    let values = demo.slime.field().values().to_vec();
    assert!(values.iter().any(|&value| value > 0.0));
    let pixels = demo.render().to_vec();
    assert_eq!(pixels.len(), 48 * 48);
    for cell_y in 0..16 {
        for cell_x in 0..16 {
            let value = values[cell_y * 16 + cell_x].max(0.0);
            let ramp_index = (f64::from(value / (value + 5.0)) * 255.0).round();
            let want = ramp(ramp_index / 255.0);
            for y in cell_y * 3..cell_y * 3 + 3 {
                for x in cell_x * 3..cell_x * 3 + 3 {
                    assert_eq!(
                        pixels[y * 48 + x],
                        want,
                        "cell ({cell_x}, {cell_y}) at ({x}, {y})"
                    );
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
    let at = |demo: &SlimeDemo| demo.slime.positions().collect::<Vec<_>>();
    assert_ne!(at(&on), at(&off), "the same seed, with and without sensing");
    assert!(on.add_node(3.0, 3.0, 1.0));
    on.clear_nodes();
    assert_eq!(on.slime.nodes().len(), 0);
}
