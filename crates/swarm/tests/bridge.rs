//! The double bridge (`docs/15-swarm.md`, "The double bridge as built"):
//! nest and food joined by two corridors, in the spirit of Goss et al.
//! (1989; not read): the setup and the measurement are ours. Traffic is
//! counted as crossings of a gate halfway along each arm (occupancy would
//! favour the longer).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]
#![expect(
    clippy::cast_possible_truncation,
    clippy::cast_sign_loss,
    clippy::cast_precision_loss,
    reason = "small, in-range geometry in a test"
)]

use swarm::{AntParams, Colony};

const WIDTH: usize = 140;
const HEIGHT: usize = 120;
/// The row the nest and food chambers sit on.
const CENTRE_Y: f32 = 60.0;
/// The gate: the arms are counted where they cross this column.
const GATE_X: f32 = 70.0;

/// Walls, a nest chamber (x = 18), a food chamber (x = 122), and two arms:
/// each leaves the chamber, goes out to `CENTRE_Y ∓ offset`, across, and
/// back.
fn bridge(params: AntParams, seed: u64, upper_offset: f32, lower_offset: f32) -> Colony {
    let mut colony = Colony::new(WIDTH, HEIGHT, 400, (18.0, CENTRE_Y, 5.0), params, seed).unwrap();
    for y in (0..HEIGHT).step_by(8) {
        for x in (0..WIDTH).step_by(8) {
            colony.paint_wall(x as f32 + 4.0, y as f32 + 4.0, 7.0);
        }
    }
    colony.erase(18.0, CENTRE_Y, 12.0);
    colony.erase(122.0, CENTRE_Y, 12.0);
    let erase_line = |colony: &mut Colony, from: (f32, f32), to: (f32, f32)| {
        let segments = ((to.0 - from.0).abs() + (to.1 - from.1).abs()).max(1.0) as usize;
        for segment in 0..=segments {
            let fraction = segment as f32 / segments as f32;
            colony.erase(
                from.0 + (to.0 - from.0) * fraction,
                from.1 + (to.1 - from.1) * fraction,
                2.5,
            );
        }
    };
    for (sign, offset) in [(-1.0_f32, upper_offset), (1.0, lower_offset)] {
        let arm_y = CENTRE_Y + sign * offset;
        erase_line(&mut colony, (28.0, CENTRE_Y + sign * 8.0), (34.0, arm_y));
        erase_line(&mut colony, (34.0, arm_y), (106.0, arm_y));
        erase_line(&mut colony, (106.0, arm_y), (112.0, CENTRE_Y + sign * 8.0));
    }
    colony.paint_food(122.0, CENTRE_Y, 7.0, 200);
    colony
}

/// Crossings of the gate in each arm (upper: y < `CENTRE_Y`; lower: y >
/// `CENTRE_Y`), and the food delivered.
fn traffic(
    params: AntParams,
    seed: u64,
    upper_offset: f32,
    lower_offset: f32,
    sensing: bool,
) -> (u64, u64, u64) {
    let mut colony = bridge(params, seed, upper_offset, lower_offset);
    colony.set_sensing(sensing);
    let mut previous: Vec<(f32, f32)> = colony.ants().map(|ant| (ant.x, ant.y)).collect();
    let (mut upper_crossings, mut lower_crossings) = (0, 0);
    for step in 0..4000 {
        colony.step();
        let now: Vec<(f32, f32)> = colony.ants().map(|ant| (ant.x, ant.y)).collect();
        if step >= 1000 {
            for (before, after) in previous.iter().zip(&now) {
                if (before.0 < GATE_X) != (after.0 < GATE_X) {
                    if after.1 < CENTRE_Y {
                        upper_crossings += 1;
                    } else {
                        lower_crossings += 1;
                    }
                }
            }
        }
        previous = now;
    }
    (upper_crossings, lower_crossings, colony.delivered())
}

/// The upper arm's share of the traffic.
fn share(upper_offset: f32, lower_offset: f32, sensing: bool, seed: u64) -> f64 {
    let (upper, lower, _) = traffic(
        AntParams::DEFAULT,
        seed,
        upper_offset,
        lower_offset,
        sensing,
    );
    upper as f64 / (upper + lower).max(1) as f64
}

/// Short arm ~78 cells, long ~126 (1.6×). Measured over 8 seeds (steps
/// 1,000–4,000): with trails the short arm carries 0.71–0.77 of the
/// traffic, every seed; a random walk in the same bridge 0.49–0.61 (the
/// geometry's own bias). Bound, 4 seeds: every trail run above every
/// random walk by 0.05.
#[test]
fn trails_prefer_the_shorter_arm_beyond_the_geometry() {
    let with_trails: Vec<f64> = (1..=4).map(|seed| share(12.0, 36.0, true, seed)).collect();
    let random_walk: Vec<f64> = (1..=4).map(|seed| share(12.0, 36.0, false, seed)).collect();
    let best_walk = random_walk.iter().copied().fold(0.0, f64::max);
    for &trails in &with_trails {
        assert!(
            trails > best_walk + 0.05,
            "trails {with_trails:?} vs walk {random_walk:?}"
        );
    }
}

/// Equal arms: **no symmetry breaking**. Measured over 8 seeds: each arm
/// 0.41–0.56 of the traffic, as a random walk's 0.45–0.54. Real ants are
/// reported to concentrate on one of two equal branches (Deneubourg et
/// al.'s line of work, not read); our colony splits. Pinned so a change
/// that alters it shows: every seed within 0.3–0.7.
#[test]
fn equal_arms_split_rather_than_choose() {
    for seed in 1..=4 {
        let upper_share = share(24.0, 24.0, true, seed);
        assert!(
            (0.3..=0.7).contains(&upper_share),
            "seed {seed}: {upper_share}"
        );
    }
}
