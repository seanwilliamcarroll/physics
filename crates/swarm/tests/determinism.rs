//! Determinism: the same run twice is identical, and a golden hash pins
//! it, native and wasm (`cargo xtask test-wasm`; `docs/04-testing.md`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::Fnv1a;
use swarm::{Arena, Flock, Neighbours, Params};

/// 200 boids, 300 steps, neighbours found `how`.
fn run_with(how: Neighbours) -> u64 {
    let mut f = Flock::new(200, Arena::new(640.0, 480.0).unwrap(), Params::ECE4760, 42).unwrap();
    f.set_neighbours(how);
    for _ in 0..300 {
        f.step();
    }
    let mut h = Fnv1a::new();
    h.write(&f.state_bytes().collect::<Vec<u8>>());
    h.finish()
}

fn run() -> u64 {
    run_with(Neighbours::Brute)
}

#[test]
fn a_run_is_repeatable() {
    assert_eq!(run(), run());
    assert_eq!(run_with(Neighbours::Grid), run_with(Neighbours::Grid));
}

/// The golden hash: a change in results fails here, intended or not.
const GOLDEN: u64 = 0x3936_c982_06e6_75ed;

#[test]
fn the_golden_hash_is_unchanged() {
    let h = run();
    assert_eq!(h, GOLDEN, "if intended, set GOLDEN = {h:#018x}");
}

/// The same run through the grid: its sums meet neighbours in another
/// order, so another hash.
const GOLDEN_GRID: u64 = 0xf01d_80f3_c341_7b71;

#[test]
fn the_grid_golden_hash_is_unchanged() {
    let h = run_with(Neighbours::Grid);
    assert_eq!(h, GOLDEN_GRID, "if intended, set GOLDEN_GRID = {h:#018x}");
}

/// And sorted (the default): lane sums, another order again.
const GOLDEN_SORTED: u64 = 0x63d2_df7d_ad03_a772;

#[test]
fn the_sorted_golden_hash_is_unchanged() {
    let h = run_with(Neighbours::Sorted);
    assert_eq!(
        h, GOLDEN_SORTED,
        "if intended, set GOLDEN_SORTED = {h:#018x}"
    );
}

/// The Vicsek model: 400 particles at ρ = 4, η = 2, 300 steps
/// (`libm`'s sin and cos: the same bits on wasm).
fn run_vicsek() -> u64 {
    let mut v = swarm::Vicsek::new(400, 10.0, swarm::VicsekParams::paper(2.0), 42).unwrap();
    for _ in 0..300 {
        v.step();
    }
    let mut h = Fnv1a::new();
    h.write(&v.state_bytes().collect::<Vec<u8>>());
    h.finish()
}

const GOLDEN_VICSEK: u64 = 0x95da_8d6f_33a2_1b2d;

#[test]
fn the_vicsek_golden_hash_is_unchanged() {
    let h = run_vicsek();
    assert_eq!(h, run_vicsek(), "repeatable");
    assert_eq!(
        h, GOLDEN_VICSEK,
        "if intended, set GOLDEN_VICSEK = {h:#018x}"
    );
}
