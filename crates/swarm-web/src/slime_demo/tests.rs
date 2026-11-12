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
