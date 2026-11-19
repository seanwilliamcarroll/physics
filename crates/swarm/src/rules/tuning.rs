//! Per-target choices, made at compile time here and only here: lane
//! counts, the grid's mask form, how Sorted's spans end
//! (`docs/perf-code-audit-guide.md`, §1–3). `knobs.rs` overrides them for
//! experiments. Figures are from the sweeps in `experiments/swarm-lanes/`,
//! `swarm-mask/` and `sorted-edges/`. A lane count sets the sums' order, so
//! targets differ in the last bits (allowed: `docs/04-testing.md`).

use super::knobs::{Mask, Tail};

/// Brute force's lanes, then sorted's, at 10,000 boids.
const TARGET: (usize, usize) = if cfg!(target_arch = "wasm32") {
    // V8: brute 16 (49 ms against 137 at 8: LLVM compiles 8 half scalar).
    // Sorted 8 with a masked tail: 1.49 ms against 1.63 at 16, whose sums
    // spill (137 stack stores against 14).
    (16, 8)
} else if cfg!(target_arch = "aarch64") {
    // M4: brute 8 (43.6 ms, 16 the same), sorted 8 (1.42 against 1.73).
    (8, 8)
} else if cfg!(all(target_arch = "x86_64", target_feature = "avx512f")) {
    // Zen 5: brute 16 fills a 512-bit register (13.1 against 19.8);
    // sorted 8 (1.04 against 1.35).
    (16, 8)
} else if cfg!(all(target_arch = "x86_64", target_feature = "avx2")) {
    // x86-64-v3: 8 (brute 21.4 against 24.9; sorted 1.11 against 1.49).
    (8, 8)
} else if cfg!(target_arch = "x86_64") {
    // SSE2: brute 16 (48.0 ms, 8 within 2%), sorted 8 (1.81 against 1.93).
    (16, 8)
} else {
    (16, 8)
};

pub(crate) const BRUTE_LANES: usize = match super::knobs::LANES {
    Some(lanes) => lanes,
    None => TARGET.0,
};

pub(crate) const SORTED_LANES: usize = match super::knobs::LANES {
    Some(lanes) => lanes,
    None => TARGET.1,
};

const _: () = assert!(BRUTE_LANES.is_power_of_two() && SORTED_LANES.is_power_of_two());

/// The grid's mask form (`Seen::add_masked`), Grid at 100,000 boids.
/// Natively a select: M4 35.7 ms against 37.7 converted, Zen 5 at SSE2
/// 36.1 against 43.4. In wasm a converted integer: V8 on x86 turns a float
/// `select` back into a branch (42.5 ms converted against 64.9 selected;
/// on the M4 the loss is smaller, 37.7 against 40.8), and one wasm runs
/// on both.
const TARGET_MASK: Mask = if cfg!(target_arch = "wasm32") {
    Mask::Convert
} else {
    Mask::Select
};

pub(crate) const GRID_MASK: Mask = match super::knobs::MASK {
    Some(mask) => mask,
    None => TARGET_MASK,
};

/// Sorted's span edges: one set of lanes per boid, a table-masked tail
/// block, truncating cell lookup, everywhere. Against scalar tails, per-span
/// lanes and `floor`, at 10,000 and 100,000 boids: Zen 5 −26% to −38%, the
/// M4 −7%/−31%, V8 −2% to −19%. The masked block drops the tail's
/// branches (Zen 5 branch misses 3.6% → 0.3%). At 1,000 boids V8 is
/// 7–20% slower; large flocks first. Truncating saves x86's baseline a
/// `floorf` call.
const TARGET_EDGES: (bool, Tail, bool) = (true, Tail::Table, true);

pub(crate) const PER_BOID: bool = match super::knobs::PER_BOID {
    Some(per_boid) => per_boid,
    None => TARGET_EDGES.0,
};

pub(crate) const TAIL: Tail = match super::knobs::TAIL {
    Some(tail) => tail,
    None => TARGET_EDGES.1,
};

pub(crate) const TRUNCATE_CELL: bool = match super::knobs::TRUNCATE_CELL {
    Some(truncate) => truncate,
    None => TARGET_EDGES.2,
};
