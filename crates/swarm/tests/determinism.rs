//! Determinism: the same run twice is identical, and a golden hash pins
//! it, native and wasm (`cargo xtask test-wasm`; `docs/04-testing.md`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::Fnv1a;
use swarm::{Arena, Flock, Params};

/// 200 boids, 300 steps, brute force.
fn run() -> u64 {
    let mut f = Flock::new(200, Arena::new(640.0, 480.0).unwrap(), Params::ECE4760, 42).unwrap();
    for _ in 0..300 {
        f.step();
    }
    let mut h = Fnv1a::new();
    h.write(&f.state_bytes().collect::<Vec<u8>>());
    h.finish()
}

#[test]
fn a_run_is_repeatable() {
    assert_eq!(run(), run());
}

/// The golden hash: a change in results fails here, intended or not.
const GOLDEN: u64 = 0xace2_ba4f_edff_f414;

#[test]
fn the_golden_hash_is_unchanged() {
    let h = run();
    assert_eq!(h, GOLDEN, "if intended, set GOLDEN = {h:#018x}");
}
