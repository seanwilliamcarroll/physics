//! How many lanes the boids' lane loop (`lanes.rs`) uses on each target,
//! per neighbour search: chosen at compile time, here and only here (the
//! one target `cfg` for it; `docs/perf-code-audit-guide.md`, §1–3).
//! `SWARM_LANES` (`knobs.rs`) overrides both, for experiments.
//!
//! From the lane sweep (`experiments/swarm-lanes/results/{llm,m4}`,
//! 2026-11-16; Zen 5 and the M4, natively and in wasm under wasmtime and
//! V8), at 10,000 boids. Sorted runs the loop on short spans (one cell's
//! boids), where 16 lanes leave more leftovers and cost more per span: 8
//! is best natively everywhere. Brute force runs it on the whole flock
//! and follows the vector width. In wasm, LLVM compiles 8 lanes badly
//! (half scalar) and 16 cleanly: 16 for both. A lane count sets the sums'
//! order, so targets differ in the last bits (allowed:
//! `docs/04-testing.md`).

/// Brute force's lanes, then sorted's, on this target; in brackets the
/// sweep's time at 10,000 boids against the other count.
const TARGET: (usize, usize) = if cfg!(target_arch = "wasm32") {
    // V8: 16 for both (brute force 49 ms against 137 at 8 on Zen 5;
    // sorted 2.0 against 5.7).
    (16, 16)
} else if cfg!(target_arch = "aarch64") {
    // The M4: brute force 8 (43.6 ms, 16 the same), sorted 8 (1.42 ms
    // against 1.73).
    (8, 8)
} else if cfg!(all(target_arch = "x86_64", target_feature = "avx512f")) {
    // Zen 5 native: brute force 16 fills a 512-bit register (13.1 ms
    // against 19.8); sorted 8 (1.04 against 1.35).
    (16, 8)
} else if cfg!(all(target_arch = "x86_64", target_feature = "avx2")) {
    // x86-64-v3: 8 for both (brute force 21.4 ms against 24.9; sorted
    // 1.11 against 1.49).
    (8, 8)
} else if cfg!(target_arch = "x86_64") {
    // The SSE2 baseline: brute force 16 (48.0 ms, 8 within 2%), sorted 8
    // (1.81 against 1.93).
    (16, 8)
} else {
    (16, 8)
};

/// Brute force's lanes: the whole flock through the lane loop.
pub(crate) const BRUTE_LANES: usize = match super::knobs::LANES {
    Some(n) => n,
    None => TARGET.0,
};

/// Sorted's lanes: each cell's span through the lane loop.
pub(crate) const SORTED_LANES: usize = match super::knobs::LANES {
    Some(n) => n,
    None => TARGET.1,
};

const _: () = assert!(BRUTE_LANES.is_power_of_two() && SORTED_LANES.is_power_of_two());
