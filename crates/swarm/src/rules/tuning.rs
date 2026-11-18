//! How many lanes the boids' lane loop (`lanes.rs`) uses on each target,
//! per neighbour search, and how the grid's scalar candidate test writes
//! its masks: chosen at compile time, here and only here (the one target
//! `cfg` for them; `docs/perf-code-audit-guide.md`, §1–3). `SWARM_LANES`
//! and `SWARM_MASK` (`knobs.rs`) override them, for experiments.
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

use super::knobs::Mask;

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

/// The scalar masks' form (the grid's `Seen::add_masked`, Vicsek's
/// `add_headings` and `image`), from the mask sweep
/// (`experiments/swarm-mask/results/{llm,m4}`, 2026-11-18; Grid at
/// 100,000 boids). Natively, a select: the M4 35.7 ms against 37.7
/// converted, Zen 5 at SSE2 36.1 against 43.4 (−17%), at AVX2 42.7
/// against 45.4. In wasm, a converted integer: V8 compiles a wasm float
/// `select` to `fcsel` on arm64 but to a branch on x86 (which has no
/// select for float registers), so selects put back the branches the
/// masks removed: llm's V8 42.5 ms converted against 64.9 selected; the
/// M4's V8 37.7 selected against 40.8 converted, the smaller loss. One
/// wasm runs on both.
const TARGET_MASK: Mask = if cfg!(target_arch = "wasm32") {
    Mask::Convert
} else {
    Mask::Select
};

/// The scalar masks' form on this target.
pub(crate) const MASK: Mask = match super::knobs::MASK {
    Some(m) => m,
    None => TARGET_MASK,
};
