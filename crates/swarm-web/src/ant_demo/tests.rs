use super::{AntDemo, CARRYING, FOOD, NEST, SEARCHING, WALL};
use crate::abi;
use crate::demo::BACKGROUND;

#[test]
fn sizes_tools_and_params_are_checked() {
    assert!(AntDemo::new(0, 50, 10, 3, 1).is_none());
    assert!(AntDemo::new(100, 50, 10, 0, 1).is_none());
    let mut demo = AntDemo::new(100, 50, 10, 3, 1).unwrap();
    assert_eq!(demo.view(), (300, 150));
    let added = demo.paint(abi::TOOL_FOOD, 80.0, 25.0, 3.0, 5).unwrap();
    assert!(added > 0 && added.is_multiple_of(5), "{added}");
    assert_eq!(demo.colony().food_in_world(), added);
    assert_eq!(
        demo.paint(abi::TOOL_FOOD, 80.0, 25.0, 3.0, abi::MAX_FOOD + 1),
        None
    );
    assert!(demo.paint(abi::TOOL_WALL, 50.0, 25.0, 2.0, 0).unwrap() > 0);
    assert!(demo.paint(abi::TOOL_ERASE, 50.0, 25.0, 2.0, 0).unwrap() > 0);
    assert_eq!(demo.paint(abi::TOOL_NEST, 20.0, 20.0, 4.0, 0), Some(1));
    assert_eq!(demo.colony().nest(), (20.0, 20.0, 4.0));
    assert_eq!(demo.paint(99, 1.0, 1.0, 1.0, 0), None);
    assert_eq!(demo.paint(abi::TOOL_WALL, f64::NAN, 1.0, 1.0, 0), None);
    assert_eq!(
        demo.paint(
            abi::TOOL_WALL,
            1.0,
            1.0,
            f64::from(abi::MAX_ANT_BRUSH) + 1.0,
            0
        ),
        None
    );
    assert_eq!(
        demo.param(abi::ANT_DECAY),
        Some(f64::from(swarm::AntParams::DEFAULT.decay))
    );
    assert!(
        demo.set_param(abi::ANT_DECAY, 0.02)
            && !demo.set_param(abi::ANT_DECAY, 2.0)
            && !demo.set_param(99, 1.0)
    );
    assert_eq!(demo.param(abi::ANT_PARAM_COUNT), None);
    assert_eq!(demo.advance(0.2), 12);
}

#[test]
fn render_shows_walls_food_and_ants() {
    let mut demo = AntDemo::new(60, 40, 1, 2, 1).unwrap();
    demo.paint(abi::TOOL_WALL, 30.5, 10.5, 0.0, 0);
    demo.paint(abi::TOOL_FOOD, 40.5, 10.5, 0.0, 3);
    let pixels = demo.render().to_vec();
    let at = |cell_x: usize, cell_y: usize| pixels[cell_y * 2 * 120 + cell_x * 2];
    assert_eq!((at(30, 10), at(40, 10)), (WALL, FOOD));
    assert_eq!(at(55, 35), BACKGROUND, "nothing there");
    assert!(pixels.contains(&0xffe8_e8e8), "the ant");
    assert!(!pixels.contains(&CARRYING));
}

fn level(value: f32) -> u32 {
    let intensity = (value.max(0.0) * 50.0).ln_1p() / (5.0_f32 * 50.0).ln_1p();
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "0..=255"
    )]
    let level = (intensity.min(1.0) * 255.0).round() as u32;
    level
}

#[test]
fn trails_are_drawn_on_a_log_scale_over_the_background() {
    let mut demo = AntDemo::new(40, 30, 20, 2, 3).unwrap();
    for _ in 0..120 {
        demo.advance(1.0 / 60.0 + 1e-9);
    }
    let home = demo.colony.field(swarm::Pheromone::Home).values().to_vec();
    let food = demo.colony.field(swarm::Pheromone::Food).values().to_vec();
    assert!(
        home.iter().filter(|&&value| value > 0.0).count() > 20,
        "trails to look at"
    );
    let pixels = demo.render().to_vec();
    let (base_blue, base_green, base_red) = (
        (BACKGROUND >> 16) & 0xff,
        (BACKGROUND >> 8) & 0xff,
        BACKGROUND & 0xff,
    );
    let mut checked = 0;
    for cell_y in 0..30 {
        for cell_x in 0..40 {
            let (blue_add, green_add) = (
                level(home[cell_y * 40 + cell_x]),
                level(food[cell_y * 40 + cell_x]),
            );
            let want = 0xff00_0000
                | ((base_blue + blue_add).min(255) << 16)
                | ((base_green + green_add).min(255) << 8)
                | base_red;
            let block: Vec<u32> = (0..4)
                .map(|offset| pixels[(cell_y * 2 + offset / 2) * 80 + cell_x * 2 + offset % 2])
                .collect();
            // Ants and the nest's rim are drawn over some cells.
            if block
                .iter()
                .any(|&pixel| [SEARCHING, CARRYING, NEST].contains(&pixel))
            {
                continue;
            }
            assert_eq!(block, vec![want; 4], "cell ({cell_x}, {cell_y})");
            checked += 1;
        }
    }
    assert!(checked > 1000, "{checked} cells checked");
}

#[test]
fn the_nest_rim_is_a_circle_and_is_cut_at_the_right_edge() {
    // A nest near the right edge: part of the rim falls outside, and must
    // not wrap onto the next rows' left.
    // Drawn at 2 pixels a cell, so a square's size is tested too.
    let mut demo = AntDemo::new(60, 40, 1, 2, 1).unwrap();
    assert_eq!(demo.paint(abi::TOOL_NEST, 58.5, 20.5, 5.0, 0), Some(1));
    let pixels = demo.render().to_vec();
    let mut rim = std::collections::BTreeSet::new();
    for step in 0..72_u8 {
        let angle = f32::from(step) * core::f32::consts::TAU / 72.0;
        let (x, y) = (
            58.5 + 5.0 * libm::cosf(angle),
            20.5 + 5.0 * libm::sinf(angle),
        );
        #[expect(
            clippy::cast_possible_truncation,
            clippy::cast_sign_loss,
            reason = "inside"
        )]
        let (x, y) = (x.floor() as usize, y.floor() as usize);
        if x < 60 {
            rim.insert((x, y));
        }
    }
    for y in 0..80 {
        for x in 0..120 {
            let pixel = pixels[y * 120 + x];
            if rim.contains(&(x / 2, y / 2)) {
                assert!(
                    pixel == NEST || pixel == SEARCHING,
                    "({x}, {y}) is on the rim"
                );
            } else {
                assert_ne!(pixel, NEST, "({x}, {y}) is off the rim");
            }
        }
    }
}

#[test]
fn sensing_reaches_the_colony() {
    let mut on = AntDemo::new(40, 30, 30, 1, 5).unwrap();
    let mut off = AntDemo::new(40, 30, 30, 1, 5).unwrap();
    off.set_sensing(false);
    for _ in 0..60 {
        on.advance(1.0 / 60.0 + 1e-9);
        off.advance(1.0 / 60.0 + 1e-9);
    }
    let at = |demo: &AntDemo| {
        demo.colony
            .ants()
            .map(|ant| (ant.x, ant.y))
            .collect::<Vec<_>>()
    };
    assert_ne!(at(&on), at(&off), "the same seed, with and without sensing");
}
