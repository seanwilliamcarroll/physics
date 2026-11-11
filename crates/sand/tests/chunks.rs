//! Chunks are an optimization, not a model change (`docs/11-falling-sand.md`,
//! "Chunks"): updating only awake chunks is bit-identical to updating
//! every cell, over random grids and random paint between steps.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::SplitMix64;
use proptest::prelude::*;
use sand::{Grid, Material};
use test_support::proptest_config;

/// A random grid of `w × h`, `fill` of its cells non-empty.
fn random(w: usize, h: usize, seed: u64, fill: f64) -> Grid {
    let mut g = Grid::new(w, h, seed).unwrap();
    let mut rng = SplitMix64::new(seed);
    for y in 0..h {
        for x in 0..w {
            if rng.next_unit_f64() < fill {
                // Any non-empty material, lava and steam included (their
                // chances keep chunks awake: `Chunks::keep`).
                let m = Material::ALL[1 + (rng.next_u64() % 5) as usize];
                g.set(x, y, m);
            }
        }
    }
    g
}

/// A paint between steps: `(after step, x, y, material code)`.
type Paint = (usize, usize, usize, u8);

proptest! {
    #![proptest_config(proptest_config())]

    #[test]
    fn chunked_updates_match_updating_everything(
        // Sizes spanning partial chunks at the edges (CHUNK = 32).
        w in 20_usize..110,
        h in 20_usize..90,
        seed in any::<u64>(),
        fill in 0.05_f64..0.6,
        paints in prop::collection::vec((0_usize..150, any::<usize>(), any::<usize>(), 0_u8..6), 0..40),
    ) {
        let mut chunked = random(w, h, seed, fill);
        let mut full = chunked.clone();
        full.set_chunked(false);
        let paints: Vec<Paint> = paints;
        for step in 0..150 {
            for &(_, x, y, code) in paints.iter().filter(|p| p.0 == step) {
                let m = Material::from_code(code).unwrap();
                chunked.set(x % w, y % h, m);
                full.set(x % w, y % h, m);
            }
            let (a, b) = (chunked.step(), full.step());
            prop_assert_eq!(a, b, "moves at step {}", step);
            prop_assert!(chunked.cells() == full.cells(), "cells differ after step {} ({}x{})", step, w, h);
        }
    }
}

#[test]
fn a_still_grid_sleeps_and_paint_wakes_it() {
    let mut g = Grid::new(128, 96, 1).unwrap();
    for x in 0..128 {
        g.set(x, 95, Material::Stone);
    }
    // Painting wakes chunks for this step and the next; nothing moves, so
    // after two steps every chunk is asleep.
    g.step();
    g.step();
    assert_eq!(g.awake_chunks(), (0, 4 * 3));
    // A grain at the top wakes its chunk and neighbours.
    g.set(70, 0, Material::Sand);
    let (awake, _) = g.awake_chunks();
    assert_eq!(
        awake,
        3 * 2,
        "the grain's chunk and its neighbours (top row)"
    );
}
