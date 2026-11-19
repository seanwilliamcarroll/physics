//! Chunks are an optimization, not a model change (`docs/11-falling-sand.md`,
//! "Chunks"): updating only awake chunks is bit-identical to updating
//! every cell, over random grids and random paint between steps.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::SplitMix64;
use proptest::prelude::*;
use sand::{Grid, Material};
use test_support::proptest_config;

/// A random `width × height` grid, `fill` of its cells non-empty.
fn random(width: usize, height: usize, seed: u64, fill: f64) -> Grid {
    let mut grid = Grid::new(width, height, seed).unwrap();
    let mut rng = SplitMix64::new(seed);
    for y in 0..height {
        for x in 0..width {
            if rng.next_unit_f64() < fill {
                // Any non-empty material, lava and steam included (their
                // chances keep chunks awake).
                let material = Material::ALL[1 + (rng.next_u64() % 5) as usize];
                grid.set(x, y, material);
            }
        }
    }
    grid
}

/// A paint between steps: `(after step, x, y, material code)`.
type Paint = (usize, usize, usize, u8);

proptest! {
    #![proptest_config(proptest_config())]

    #[test]
    fn chunked_updates_match_updating_everything(
        // Sizes spanning partial chunks at the edges (CHUNK_SIDE = 32).
        width in 20_usize..110,
        height in 20_usize..90,
        seed in any::<u64>(),
        fill in 0.05_f64..0.6,
        paints in prop::collection::vec((0_usize..150, any::<usize>(), any::<usize>(), 0_u8..6), 0..40),
    ) {
        let mut chunked = random(width, height, seed, fill);
        let mut every_cell = chunked.clone();
        every_cell.set_chunked(false);
        let paints: Vec<Paint> = paints;
        for step in 0..150 {
            for &(_, x, y, code) in paints.iter().filter(|paint| paint.0 == step) {
                let material = Material::from_code(code).unwrap();
                chunked.set(x % width, y % height, material);
                every_cell.set(x % width, y % height, material);
            }
            let (chunked_moves, every_cell_moves) = (chunked.step(), every_cell.step());
            prop_assert_eq!(chunked_moves, every_cell_moves, "moves at step {}", step);
            prop_assert!(
                chunked.cells() == every_cell.cells(),
                "cells differ after step {} ({}x{})", step, width, height
            );
        }
    }
}

#[test]
fn a_still_grid_sleeps_and_paint_wakes_it() {
    let mut grid = Grid::new(128, 96, 1).unwrap();
    for x in 0..128 {
        grid.set(x, 95, Material::Stone);
    }
    // Painting wakes chunks for this step and the next; nothing moves, so
    // after two steps every chunk is asleep.
    grid.step();
    grid.step();
    assert_eq!(grid.awake_chunks(), (0, 4 * 3));
    // A grain at the top wakes its chunk and neighbours.
    grid.set(70, 0, Material::Sand);
    let (awake, _) = grid.awake_chunks();
    assert_eq!(
        awake,
        3 * 2,
        "the grain's chunk and its neighbours (top row)"
    );
}
