//! Determinism: the same run twice is identical (`docs/04-testing.md`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use sand::{Grid, Material};

/// A scripted scene: a stone floor and a shelf, sand and water poured from
/// two spouts for 300 steps, then 300 more: falling, piling, levelling.
fn run() -> Vec<u8> {
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
    g.cells().to_vec()
}

#[test]
fn a_run_is_repeatable() {
    assert!(run() == run(), "two runs differ");
}

/// Lava poured onto a water pool for 200 steps, then 400 more: reactions,
/// steam rising and condensing, slow lava.
fn run_lava() -> Vec<u8> {
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
    g.cells().to_vec()
}

#[test]
fn the_lava_run_is_repeatable() {
    assert!(run_lava() == run_lava(), "two runs differ");
}
