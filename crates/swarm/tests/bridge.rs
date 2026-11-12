//! S3's double bridge (`docs/15-swarm.md`, S3.4): nest and food joined
//! by two corridors, in the spirit of Goss et al. (1989; not read): the
//! setup and the measurement are ours. Traffic is counted as crossings
//! of a gate halfway along each arm (occupancy would favour the longer).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]
#![expect(
    clippy::cast_possible_truncation,
    clippy::cast_sign_loss,
    clippy::cast_precision_loss,
    reason = "small, in-range geometry in a test"
)]

use swarm::{AntParams, Colony};

const W: usize = 140;
const H: usize = 120;
const CY: f32 = 60.0;

/// Walls, a nest chamber (x = 18), a food chamber (x = 122), and two arms:
/// each leaves the chamber, goes out to `CY ∓ off`, across, and back.
fn bridge(p: AntParams, seed: u64, upper: f32, lower: f32) -> Colony {
    let mut c = Colony::new(W, H, 400, (18.0, CY, 5.0), p, seed).unwrap();
    for y in (0..H).step_by(8) {
        for x in (0..W).step_by(8) {
            c.paint_wall(x as f32 + 4.0, y as f32 + 4.0, 7.0);
        }
    }
    c.erase(18.0, CY, 12.0);
    c.erase(122.0, CY, 12.0);
    let line = |c: &mut Colony, a: (f32, f32), b: (f32, f32)| {
        let n = ((b.0 - a.0).abs() + (b.1 - a.1).abs()).max(1.0) as usize;
        for k in 0..=n {
            let t = k as f32 / n as f32;
            c.erase(a.0 + (b.0 - a.0) * t, a.1 + (b.1 - a.1) * t, 2.5);
        }
    };
    for (sign, off) in [(-1.0_f32, upper), (1.0, lower)] {
        let y = CY + sign * off;
        line(&mut c, (28.0, CY + sign * 8.0), (34.0, y));
        line(&mut c, (34.0, y), (106.0, y));
        line(&mut c, (106.0, y), (112.0, CY + sign * 8.0));
    }
    c.paint_food(122.0, CY, 7.0, 200);
    c
}

/// Crossings of x = 70 in each arm (upper: y < CY; lower: y > CY).
fn traffic(p: AntParams, seed: u64, upper: f32, lower: f32, sensing: bool) -> (u64, u64, u64) {
    let mut c = bridge(p, seed, upper, lower);
    c.set_sensing(sensing);
    let mut prev: Vec<(f32, f32)> = c.ants().map(|a| (a.x, a.y)).collect();
    let (mut up, mut down) = (0, 0);
    for k in 0..4000 {
        c.step();
        let now: Vec<(f32, f32)> = c.ants().map(|a| (a.x, a.y)).collect();
        if k >= 1000 {
            for (a, b) in prev.iter().zip(&now) {
                if (a.0 < 70.0) != (b.0 < 70.0) {
                    if b.1 < CY { up += 1 } else { down += 1 }
                }
            }
        }
        prev = now;
    }
    (up, down, c.delivered())
}

fn share(upper: f32, lower: f32, sensing: bool, seed: u64) -> f64 {
    let (a, b, _) = traffic(AntParams::DEFAULT, seed, upper, lower, sensing);
    a as f64 / (a + b).max(1) as f64
}

/// Short arm ~78 cells, long ~126 (1.6×). Measured over 8 seeds (steps
/// 1,000–4,000): with trails the short arm carries 0.71–0.77 of the
/// traffic, every seed; a random walk in the same bridge 0.49–0.61 (the
/// geometry's own bias). Bound, 4 seeds: every trail run above every
/// random walk by 0.05.
#[test]
fn trails_prefer_the_shorter_arm_beyond_the_geometry() {
    let with: Vec<f64> = (1..=4).map(|s| share(12.0, 36.0, true, s)).collect();
    let walk: Vec<f64> = (1..=4).map(|s| share(12.0, 36.0, false, s)).collect();
    let best_walk = walk.iter().copied().fold(0.0, f64::max);
    for &w in &with {
        assert!(w > best_walk + 0.05, "trails {with:?} vs walk {walk:?}");
    }
}

/// Equal arms: **no symmetry breaking**. Measured over 8 seeds: each arm
/// 0.41–0.56 of the traffic, as a random walk's 0.45–0.54. Real ants are
/// reported to concentrate on one of two equal branches (Deneubourg et
/// al.'s line of work, not read); our colony splits. Pinned so a change
/// that alters it shows: every seed within 0.3–0.7.
#[test]
fn equal_arms_split_rather_than_choose() {
    for s in 1..=4 {
        let x = share(24.0, 24.0, true, s);
        assert!((0.3..=0.7).contains(&x), "seed {s}: {x}");
    }
}
