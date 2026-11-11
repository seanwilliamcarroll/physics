//! The automaton's behaviour (M9, `docs/11-falling-sand.md`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::SplitMix64;
use sand::{Grid, Material};

/// A grid of `w × h` with a stone floor row at the bottom.
fn floored(w: usize, h: usize, seed: u64) -> Grid {
    let mut g = Grid::new(w, h, seed).unwrap();
    for x in 0..w {
        g.set(x, h - 1, Material::Stone);
    }
    g
}

/// A coordinate or count as `i64`, for signed differences.
fn signed(n: usize) -> i64 {
    i64::try_from(n).unwrap()
}

fn counts(g: &Grid) -> [usize; 4] {
    Material::ALL.map(|m| g.count(m))
}

/// A random grid: 30% sand, 30% water, 10% stone.
fn random(w: usize, h: usize, seed: u64) -> Grid {
    let mut g = Grid::new(w, h, seed).unwrap();
    let mut rng = SplitMix64::new(seed ^ 0xa5a5);
    for y in 0..h {
        for x in 0..w {
            let r = rng.next_unit_f64();
            let m = match r {
                r if r < 0.3 => Material::Sand,
                r if r < 0.6 => Material::Water,
                r if r < 0.7 => Material::Stone,
                _ => Material::Empty,
            };
            g.set(x, y, m);
        }
    }
    g
}

#[test]
fn moving_never_creates_or_destroys_a_material() {
    for seed in [1, 2, 3] {
        let mut g = random(80, 60, seed);
        let start = counts(&g);
        for _ in 0..2000 {
            g.step();
            assert_eq!(counts(&g), start, "seed {seed} at step {}", g.steps());
        }
    }
}

#[test]
fn a_falling_column_falls_one_row_a_step_and_keeps_its_shape() {
    // Bottom-up, each grain moves once a step: scanning top-down, the
    // column would fall all the way in one step.
    let mut g = Grid::new(5, 40, 1).unwrap();
    for y in 0..10 {
        g.set(2, y, Material::Sand);
    }
    for k in 1..=20 {
        g.step();
        let column: Vec<usize> = (0..40)
            .filter(|&y| g.get(2, y) == Some(Material::Sand))
            .collect();
        assert_eq!(column, (k..k + 10).collect::<Vec<_>>(), "after {k} steps");
    }
}

#[test]
fn water_spreads_at_most_its_dispersion_a_step() {
    let mut g = floored(41, 3, 2);
    g.set(20, 1, Material::Water);
    let mut x = 20_i64;
    for _ in 0..30 {
        g.step();
        let now = signed(
            (0..41)
                .find(|&x| g.get(x, 1) == Some(Material::Water))
                .unwrap(),
        );
        assert!((now - x).abs() <= signed(sand::DISPERSION), "{x} -> {now}");
        x = now;
    }
}

/// A pour of 3,000 grains at the centre, a grain a step, then settled.
/// Measured over four grids: the left-right imbalance at most 0.60% of the
/// mass, the centre of mass within 0.075 cells of the pour; bounds ~5x.
#[test]
fn a_centred_pour_piles_symmetrically_and_settles() {
    for (w, seed) in [(201, 1), (201, 2), (201, 3), (151, 4)] {
        let mut g = floored(w, 120, seed);
        let c = w / 2;
        for _ in 0..3000 {
            if g.get(c, 0) == Some(Material::Empty) {
                g.set(c, 0, Material::Sand);
            }
            g.step();
        }
        let mut settle = 0;
        while g.step() > 0 {
            settle += 1;
            assert!(settle < 1000, "w {w}: never settled");
        }
        let (mut balance, mut moment, mut total) = (0_i64, 0_i64, 0_i64);
        for y in 0..120 {
            for x in 0..w {
                if g.get(x, y) == Some(Material::Sand) {
                    let d = signed(x) - signed(c);
                    balance += d.signum();
                    moment += d;
                    total += 1;
                }
            }
        }
        assert_eq!(total, 3000);
        // Both far below 2^31: exact through i32.
        let ratio = |n: i64| f64::from(i32::try_from(n).unwrap()) / 3000.0;
        let (imbalance, offset) = (ratio(balance), ratio(moment));
        assert!(
            imbalance.abs() < 0.03,
            "w {w} seed {seed}: imbalance {imbalance}"
        );
        assert!(
            offset.abs() < 0.4,
            "w {w} seed {seed}: centre off by {offset}"
        );
    }
}

/// 400 water cells poured at one wall of a 60-wide box: every column ends
/// within one cell of the others (measured 6–7, the mean 6.67).
#[test]
fn water_finds_its_level() {
    let mut g = floored(60, 40, 5);
    let mut poured = 0;
    for _ in 0..3000 {
        if poured < 400 && g.get(2, 0) == Some(Material::Empty) {
            g.set(2, 0, Material::Water);
            poured += 1;
        }
        g.step();
    }
    assert_eq!(g.count(Material::Water), 400);
    let heights: Vec<usize> = (0..60)
        .map(|x| {
            (0..39)
                .filter(|&y| g.get(x, y) == Some(Material::Water))
                .count()
        })
        .collect();
    let (lo, hi) = (heights.iter().min().unwrap(), heights.iter().max().unwrap());
    assert!(hi - lo <= 1, "{heights:?}");
}

#[test]
fn sand_sinks_through_water_and_water_doesnt_sink_through_sand() {
    // A grain dropped on a water column ends at the bottom, the water above it.
    let mut g = floored(1, 12, 1);
    for y in 5..11 {
        g.set(0, y, Material::Water);
    }
    g.set(0, 0, Material::Sand);
    for _ in 0..40 {
        g.step();
    }
    assert_eq!(g.get(0, 10), Some(Material::Sand));
    assert!((5..10).all(|y| g.get(0, y) == Some(Material::Water)));
    // Water on sand stays on top.
    let mut g = floored(1, 6, 1);
    g.set(0, 4, Material::Sand);
    g.set(0, 3, Material::Water);
    for _ in 0..10 {
        g.step();
    }
    assert_eq!(
        (g.get(0, 3), g.get(0, 4)),
        (Some(Material::Water), Some(Material::Sand))
    );
}

#[test]
fn stone_never_moves() {
    let mut g = Grid::new(10, 10, 1).unwrap();
    g.set(5, 0, Material::Stone);
    for _ in 0..20 {
        g.step();
    }
    assert_eq!(g.get(5, 0), Some(Material::Stone));
}
