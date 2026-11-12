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
fn run_vicsek(brute_force: bool) -> u64 {
    let mut v = swarm::Vicsek::new(400, 10.0, swarm::VicsekParams::paper(2.0), 42).unwrap();
    v.set_brute_force(brute_force);
    for _ in 0..300 {
        v.step();
    }
    let mut h = Fnv1a::new();
    h.write(&v.state_bytes().collect::<Vec<u8>>());
    h.finish()
}

const GOLDEN_VICSEK: u64 = 0x95da_8d6f_33a2_1b2d;
/// Through the periodic grid (the default): the sums in cell order.
const GOLDEN_VICSEK_GRID: u64 = 0x575e_de0c_9e4a_d022;

#[test]
fn the_vicsek_golden_hashes_are_unchanged() {
    let (brute, grid) = (run_vicsek(true), run_vicsek(false));
    assert_eq!(
        (brute, grid),
        (run_vicsek(true), run_vicsek(false)),
        "repeatable"
    );
    assert_eq!(
        brute, GOLDEN_VICSEK,
        "if intended, set GOLDEN_VICSEK = {brute:#018x}"
    );
    assert_eq!(
        grid, GOLDEN_VICSEK_GRID,
        "if intended, set GOLDEN_VICSEK_GRID = {grid:#018x}"
    );
}

/// Ant foraging: 300 ants, a food patch and a wall, 400 steps; ants and
/// both fields hashed.
fn run_ants() -> u64 {
    let mut c = swarm::Colony::new(
        120,
        80,
        300,
        (20.0, 40.0, 5.0),
        swarm::AntParams::DEFAULT,
        42,
    )
    .unwrap();
    c.paint_food(95.0, 40.0, 6.0, 20);
    c.paint_wall(60.0, 30.0, 4.0);
    for _ in 0..400 {
        c.step();
    }
    let mut h = Fnv1a::new();
    h.write(&c.state_bytes());
    h.finish()
}

const GOLDEN_ANTS: u64 = 0xd20c_5b5f_d1ae_0911;

#[test]
fn the_ants_golden_hash_is_unchanged() {
    let h = run_ants();
    assert_eq!(h, run_ants(), "repeatable");
    assert_eq!(h, GOLDEN_ANTS, "if intended, set GOLDEN_ANTS = {h:#018x}");
}

/// Physarum: 3,000 agents and a node on a 96² field, 300 steps.
fn run_slime() -> u64 {
    let mut s = swarm::Slime::new(96, 3000, swarm::SlimeParams::DEFAULT, 42).unwrap();
    s.add_node(20, 20, 4.0);
    for _ in 0..300 {
        s.step();
    }
    let mut h = Fnv1a::new();
    h.write(&s.state_bytes());
    h.finish()
}

const GOLDEN_SLIME: u64 = 0x59c1_57e9_4d5c_3901;

#[test]
fn the_slime_golden_hash_is_unchanged() {
    let h = run_slime();
    assert_eq!(h, run_slime(), "repeatable");
    assert_eq!(h, GOLDEN_SLIME, "if intended, set GOLDEN_SLIME = {h:#018x}");
}
