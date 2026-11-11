//! Determinism: the same run twice is identical, and golden hashes pin it,
//! native and wasm (`cargo xtask test-wasm`; `docs/04-testing.md`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::Fnv1a;
use sand::{Grid, Material};

/// A scripted scene: a stone floor and a shelf, sand and water poured from
/// two spouts for 300 steps, then 300 more: falling, piling, levelling.
fn run() -> u64 {
    let (w, h) = (96, 64);
    let mut g = Grid::new(w, h, 42).unwrap();
    for x in 0..w {
        g.set(x, h - 1, Material::Stone);
    }
    for x in 20..50 {
        g.set(x, 40, Material::Stone);
    }
    for k in 0..600 {
        if k < 300 {
            g.set(30, 0, Material::Sand);
            g.set(70, 0, Material::Water);
        }
        g.step();
    }
    let mut hash = Fnv1a::new();
    hash.write(g.cells());
    hash.finish()
}

#[test]
fn a_run_is_repeatable() {
    assert_eq!(run(), run());
}

/// The golden hash: a change in results fails here, intended or not.
const GOLDEN: u64 = 0xfd72_9b85_0ae9_652d;

#[test]
fn the_golden_hash_is_unchanged() {
    let h = run();
    assert_eq!(h, GOLDEN, "if intended, set GOLDEN = {h:#018x}");
}

/// Lava poured onto a water pool for 200 steps, then 400 more: reactions,
/// steam rising and condensing, slow lava.
fn run_lava() -> u64 {
    let (w, h) = (80, 48);
    let mut g = Grid::new(w, h, 7).unwrap();
    for x in 0..w {
        g.set(x, h - 1, Material::Stone);
    }
    for y in 36..h - 1 {
        for x in 10..70 {
            g.set(x, y, Material::Water);
        }
    }
    for k in 0..600 {
        if k < 200 {
            g.set(40, 0, Material::Lava);
        }
        g.step();
    }
    let mut hash = Fnv1a::new();
    hash.write(g.cells());
    hash.finish()
}

/// The lava scene's golden, as [`GOLDEN`].
const GOLDEN_LAVA: u64 = 0x92f2_9f42_e1fc_94b7;

#[test]
fn the_lava_golden_hash_is_unchanged() {
    let h = run_lava();
    assert_eq!(run_lava(), h, "repeatable");
    assert_eq!(h, GOLDEN_LAVA, "if intended, set GOLDEN_LAVA = {h:#018x}");
}
