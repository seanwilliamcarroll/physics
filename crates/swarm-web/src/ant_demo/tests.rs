use super::{AntDemo, CARRYING, FOOD, WALL};
use crate::abi;
use crate::demo::BACKGROUND;

#[test]
fn sizes_tools_and_params_are_checked() {
    assert!(AntDemo::new(0, 50, 10, 3, 1).is_none());
    assert!(AntDemo::new(100, 50, 10, 0, 1).is_none());
    let mut d = AntDemo::new(100, 50, 10, 3, 1).unwrap();
    assert_eq!(d.view(), (300, 150));
    let added = d.paint(abi::TOOL_FOOD, 80.0, 25.0, 3.0, 5).unwrap();
    assert!(added > 0 && added.is_multiple_of(5), "{added}");
    assert_eq!(d.colony().food_in_world(), added);
    assert_eq!(
        d.paint(abi::TOOL_FOOD, 80.0, 25.0, 3.0, abi::MAX_FOOD + 1),
        None
    );
    assert!(d.paint(abi::TOOL_WALL, 50.0, 25.0, 2.0, 0).unwrap() > 0);
    assert!(d.paint(abi::TOOL_ERASE, 50.0, 25.0, 2.0, 0).unwrap() > 0);
    assert_eq!(d.paint(abi::TOOL_NEST, 20.0, 20.0, 4.0, 0), Some(1));
    assert_eq!(d.colony().nest(), (20.0, 20.0, 4.0));
    assert_eq!(d.paint(99, 1.0, 1.0, 1.0, 0), None);
    assert_eq!(d.paint(abi::TOOL_WALL, f64::NAN, 1.0, 1.0, 0), None);
    assert_eq!(
        d.paint(
            abi::TOOL_WALL,
            1.0,
            1.0,
            f64::from(abi::MAX_ANT_BRUSH) + 1.0,
            0
        ),
        None
    );
    assert_eq!(
        d.param(abi::ANT_DECAY),
        Some(f64::from(swarm::AntParams::DEFAULT.decay))
    );
    assert!(
        d.set_param(abi::ANT_DECAY, 0.02)
            && !d.set_param(abi::ANT_DECAY, 2.0)
            && !d.set_param(99, 1.0)
    );
    assert_eq!(d.param(abi::ANT_PARAM_COUNT), None);
    assert_eq!(d.advance(0.2), 12);
}

#[test]
fn render_shows_walls_food_and_ants() {
    let mut d = AntDemo::new(60, 40, 1, 2, 1).unwrap();
    d.paint(abi::TOOL_WALL, 30.5, 10.5, 0.0, 0);
    d.paint(abi::TOOL_FOOD, 40.5, 10.5, 0.0, 3);
    let px = d.render().to_vec();
    let at = |cx: usize, cy: usize| px[cy * 2 * 120 + cx * 2];
    assert_eq!((at(30, 10), at(40, 10)), (WALL, FOOD));
    assert_eq!(at(55, 35), BACKGROUND, "nothing there");
    assert!(px.contains(&0xffe8_e8e8), "the ant");
    assert!(!px.contains(&CARRYING));
}
