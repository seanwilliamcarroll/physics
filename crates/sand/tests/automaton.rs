//! The automaton's behaviour (`docs/11-falling-sand.md`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::SplitMix64;
use sand::{Grid, Material};

fn floored(width: usize, height: usize, seed: u64) -> Grid {
    let mut grid = Grid::new(width, height, seed).unwrap();
    for x in 0..width {
        grid.set(x, height - 1, Material::Stone);
    }
    grid
}

fn signed(count: usize) -> i64 {
    i64::try_from(count).unwrap()
}

fn counts(grid: &Grid) -> [usize; 6] {
    Material::ALL.map(|material| grid.count(material))
}

/// A random grid: 30% sand, 30% water, 10% stone.
fn random(width: usize, height: usize, seed: u64) -> Grid {
    let mut grid = Grid::new(width, height, seed).unwrap();
    let mut rng = SplitMix64::new(seed ^ 0xa5a5);
    for y in 0..height {
        for x in 0..width {
            let material = match rng.next_unit_f64() {
                roll if roll < 0.3 => Material::Sand,
                roll if roll < 0.6 => Material::Water,
                roll if roll < 0.7 => Material::Stone,
                _ => Material::Empty,
            };
            grid.set(x, y, material);
        }
    }
    grid
}

#[test]
fn moving_never_creates_or_destroys_a_material() {
    for seed in [1, 2, 3] {
        let mut grid = random(80, 60, seed);
        let start = counts(&grid);
        for _ in 0..2000 {
            grid.step();
            assert_eq!(counts(&grid), start, "seed {seed} at step {}", grid.steps());
        }
    }
}

#[test]
fn a_falling_column_falls_one_row_a_step_and_keeps_its_shape() {
    // Bottom-up, each grain moves once a step: scanning top-down, the
    // column would fall all the way in one step.
    let mut grid = Grid::new(5, 40, 1).unwrap();
    for y in 0..10 {
        grid.set(2, y, Material::Sand);
    }
    for steps in 1..=20 {
        grid.step();
        let column: Vec<usize> = (0..40)
            .filter(|&y| grid.get(2, y) == Some(Material::Sand))
            .collect();
        assert_eq!(
            column,
            (steps..steps + 10).collect::<Vec<_>>(),
            "after {steps} steps"
        );
    }
}

#[test]
fn water_spreads_at_most_its_dispersion_a_step() {
    let mut grid = floored(41, 3, 2);
    grid.set(20, 1, Material::Water);
    let mut previous_x = 20_i64;
    for _ in 0..30 {
        grid.step();
        let water_x = signed(
            (0..41)
                .find(|&x| grid.get(x, 1) == Some(Material::Water))
                .unwrap(),
        );
        assert!(
            (water_x - previous_x).abs() <= signed(sand::DISPERSION),
            "{previous_x} -> {water_x}"
        );
        previous_x = water_x;
    }
}

/// A pour of 3,000 grains at the centre of a `width`-wide grid, a grain a
/// step, then settled: it must pile symmetrically. Measured over four
/// grids: the left-right imbalance at most 0.60% of the mass, the centre
/// of mass within 0.075 cells of the pour; bounds ~5x.
fn pour_piles_symmetrically(width: usize, seed: u64) {
    let mut grid = floored(width, 120, seed);
    let centre = width / 2;
    for _ in 0..3000 {
        if grid.get(centre, 0) == Some(Material::Empty) {
            grid.set(centre, 0, Material::Sand);
        }
        grid.step();
    }
    let mut settling_steps = 0;
    while grid.step() > 0 {
        settling_steps += 1;
        assert!(settling_steps < 1000, "width {width}: never settled");
    }
    let (mut balance, mut moment, mut total) = (0_i64, 0_i64, 0_i64);
    for y in 0..120 {
        for x in 0..width {
            if grid.get(x, y) == Some(Material::Sand) {
                let from_centre = signed(x) - signed(centre);
                balance += from_centre.signum();
                moment += from_centre;
                total += 1;
            }
        }
    }
    assert_eq!(total, 3000);
    // Both far below 2^31: exact through i32.
    let per_grain = |sum: i64| f64::from(i32::try_from(sum).unwrap()) / 3000.0;
    let (imbalance, offset) = (per_grain(balance), per_grain(moment));
    assert!(
        imbalance.abs() < 0.03,
        "width {width} seed {seed}: imbalance {imbalance}"
    );
    assert!(
        offset.abs() < 0.4,
        "width {width} seed {seed}: centre off by {offset}"
    );
}

/// One grid on every push (about 5 s); all four in the slow tier.
#[test]
fn a_centred_pour_piles_symmetrically_and_settles() {
    pour_piles_symmetrically(201, 1);
}

#[test]
#[ignore = "slow: cargo xtask slow"]
fn slow_a_centred_pour_piles_symmetrically_on_every_grid() {
    for (width, seed) in [(201, 1), (201, 2), (201, 3), (151, 4)] {
        pour_piles_symmetrically(width, seed);
    }
}

/// 400 water cells poured at one wall of a 60-wide box: every column ends
/// within one cell of the others (measured 6–7, the mean 6.67).
#[test]
fn water_finds_its_level() {
    let mut grid = floored(60, 40, 5);
    let mut poured = 0;
    for _ in 0..3000 {
        if poured < 400 && grid.get(2, 0) == Some(Material::Empty) {
            grid.set(2, 0, Material::Water);
            poured += 1;
        }
        grid.step();
    }
    assert_eq!(grid.count(Material::Water), 400);
    let column_heights: Vec<usize> = (0..60)
        .map(|x| {
            (0..39)
                .filter(|&y| grid.get(x, y) == Some(Material::Water))
                .count()
        })
        .collect();
    let lowest = column_heights.iter().min().unwrap();
    let highest = column_heights.iter().max().unwrap();
    assert!(highest - lowest <= 1, "{column_heights:?}");
}

#[test]
fn sand_sinks_through_water_and_water_doesnt_sink_through_sand() {
    // A grain dropped on a water column ends at the bottom, the water above it.
    let mut grid = floored(1, 12, 1);
    for y in 5..11 {
        grid.set(0, y, Material::Water);
    }
    grid.set(0, 0, Material::Sand);
    for _ in 0..40 {
        grid.step();
    }
    assert_eq!(grid.get(0, 10), Some(Material::Sand));
    assert!((5..10).all(|y| grid.get(0, y) == Some(Material::Water)));
    // Water on sand stays on top.
    let mut grid = floored(1, 6, 1);
    grid.set(0, 4, Material::Sand);
    grid.set(0, 3, Material::Water);
    for _ in 0..10 {
        grid.step();
    }
    assert_eq!(
        (grid.get(0, 3), grid.get(0, 4)),
        (Some(Material::Water), Some(Material::Sand))
    );
}

#[test]
fn stone_never_moves() {
    let mut grid = Grid::new(10, 10, 1).unwrap();
    grid.set(5, 0, Material::Stone);
    for _ in 0..20 {
        grid.step();
    }
    assert_eq!(grid.get(5, 0), Some(Material::Stone));
}
