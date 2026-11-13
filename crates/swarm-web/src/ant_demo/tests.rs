use super::{AntDemo, CARRYING, FOOD, NEST, SEARCHING, WALL};
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

// Found by the full mutation run of 2026-11-12: the trail colours, the
// nest's rim, and squares past the right edge were never checked.

/// The blue (home) or green (food) level a trail value adds, as drawn.
fn level(v: f32) -> u32 {
    let t = (v.max(0.0) * 50.0).ln_1p() / (5.0_f32 * 50.0).ln_1p();
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "0..=255"
    )]
    let k = (t.min(1.0) * 255.0).round() as u32;
    k
}

#[test]
fn trails_are_drawn_on_a_log_scale_over_the_background() {
    let mut d = AntDemo::new(40, 30, 20, 2, 3).unwrap();
    for _ in 0..120 {
        d.advance(1.0 / 60.0 + 1e-9);
    }
    let home = d.colony.field(swarm::Pheromone::Home).values().to_vec();
    let food = d.colony.field(swarm::Pheromone::Food).values().to_vec();
    assert!(
        home.iter().filter(|&&v| v > 0.0).count() > 20,
        "trails to look at"
    );
    let px = d.render().to_vec();
    let (bb, bg, br) = (
        (BACKGROUND >> 16) & 0xff,
        (BACKGROUND >> 8) & 0xff,
        BACKGROUND & 0xff,
    );
    let mut checked = 0;
    for cy in 0..30 {
        for cx in 0..40 {
            let (b, g) = (level(home[cy * 40 + cx]), level(food[cy * 40 + cx]));
            let want = 0xff00_0000 | ((bb + b).min(255) << 16) | ((bg + g).min(255) << 8) | br;
            let block: Vec<u32> = (0..4)
                .map(|k| px[(cy * 2 + k / 2) * 80 + cx * 2 + k % 2])
                .collect();
            // Ants and the nest's rim are drawn over some cells.
            if block
                .iter()
                .any(|&p| [SEARCHING, CARRYING, NEST].contains(&p))
            {
                continue;
            }
            assert_eq!(block, vec![want; 4], "cell ({cx}, {cy})");
            checked += 1;
        }
    }
    assert!(checked > 1000, "{checked} cells checked");
}

#[test]
fn the_nest_rim_is_a_circle_and_is_cut_at_the_right_edge() {
    // A nest near the right edge: part of the rim falls outside, and must
    // not wrap onto the next rows' left.
    // Drawn at 2 px a cell, so a square's size is tested too.
    let mut d = AntDemo::new(60, 40, 1, 2, 1).unwrap();
    assert_eq!(d.paint(abi::TOOL_NEST, 58.5, 20.5, 5.0, 0), Some(1));
    let px = d.render().to_vec();
    let mut rim = std::collections::BTreeSet::new();
    for k in 0..72_u8 {
        let a = f32::from(k) * core::f32::consts::TAU / 72.0;
        let (x, y) = (58.5 + 5.0 * libm::cosf(a), 20.5 + 5.0 * libm::sinf(a));
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
            let p = px[y * 120 + x];
            if rim.contains(&(x / 2, y / 2)) {
                assert!(p == NEST || p == SEARCHING, "({x}, {y}) is on the rim");
            } else {
                assert_ne!(p, NEST, "({x}, {y}) is off the rim");
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
    let at = |d: &AntDemo| d.colony.ants().map(|a| (a.x, a.y)).collect::<Vec<_>>();
    assert_ne!(at(&on), at(&off), "the same seed, with and without sensing");
}
