//! What pairwise gravity runs on each target: per scalar, which vector loop
//! and how many lanes, and below how many bodies the plain loop runs
//! instead. Chosen at compile time, here and only here: this is the one
//! place a target `cfg` appears (`docs/perf-code-audit-guide.md`, §1–3).
//! The build settings (`knobs.rs`, `GRAVITY_*`) override it.
//!
//! The values come from `experiments/gravity-vectorize/results/` at 4,096
//! bodies. A lane count sets the order of body i's sum, so targets differ
//! in the last bits (allowed: `docs/04-testing.md`).

/// The two vector loops (`two_pass.rs`, `blocked.rs`).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(super) enum PairLoop {
    /// Pass 1 computes every pair's force for body i into scratch arrays
    /// (nothing summed across pairs, so the compiler vectorizes it at the
    /// target's full width); pass 2 sums them in lanes.
    TwoPass,
    /// One pass in blocks of `L` pairs, body i's lanes updated as it goes:
    /// no scratch arrays, but at most `L` wide.
    Blocked,
}

/// One scalar's choice: the loop, and body i's partial sums (pair j in
/// lane j mod `lanes`; a power of two).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(super) struct Kernel {
    pub(super) pair_loop: PairLoop,
    pub(super) lanes: usize,
}

/// A target's choices.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(super) struct Tuning {
    pub(super) f64: Kernel,
    pub(super) f32: Kernel,
    /// Below this many bodies, the plain loop: the vector loops' per-body
    /// setup costs more than it saves on short rows. Measured at 16 and
    /// 128 on every target (the plain loop wins at 16, loses at 128).
    pub(super) plain_below: usize,
}

const TWO_PASS_16: Kernel = Kernel {
    pair_loop: PairLoop::TwoPass,
    lanes: 16,
};

const fn blocked(lanes: usize) -> Kernel {
    Kernel {
        pair_loop: PairLoop::Blocked,
        lanes,
    }
}

const PLAIN_BELOW: usize = 64;

/// This target's choices. `f32` is fastest two-pass at 16 lanes everywhere;
/// `f64` is bound by `sqrt` and `div`; the figures below are `f64` times at
/// 4,096 bodies, with the change against two-pass at 16 lanes.
const TARGET: Tuning = if cfg!(target_arch = "wasm32") {
    // V8: blocked, 4 lanes: 7.08 ms on the M4 (−15%), 9.96 on Zen 5 (−8%).
    Tuning {
        f64: blocked(4),
        f32: TWO_PASS_16,
        plain_below: PLAIN_BELOW,
    }
} else if cfg!(target_arch = "aarch64") {
    // The M4: blocked, 1 lane, 7.95 ms (−8%). Not blocked at 4: LLVM's
    // ordered reductions made it 1.7× slower (`experiments/llvm-ordered-reductions`).
    Tuning {
        f64: blocked(1),
        f32: TWO_PASS_16,
        plain_below: PLAIN_BELOW,
    }
} else if cfg!(all(target_arch = "x86_64", target_feature = "avx2")) {
    // AVX2 and AVX-512: two-pass, 16 lanes (Zen 5: 6.67 ms at x86-64-v3,
    // 3.20 native).
    Tuning {
        f64: TWO_PASS_16,
        f32: TWO_PASS_16,
        plain_below: PLAIN_BELOW,
    }
} else if cfg!(target_arch = "x86_64") {
    // The SSE2 baseline: blocked, 8 lanes, 10.06 ms on Zen 5 (−8%).
    Tuning {
        f64: blocked(8),
        f32: TWO_PASS_16,
        plain_below: PLAIN_BELOW,
    }
} else {
    // Anything else: the best single choice across what was measured.
    Tuning {
        f64: TWO_PASS_16,
        f32: TWO_PASS_16,
        plain_below: PLAIN_BELOW,
    }
};

/// The target's choices with the build settings applied (a setting
/// applies to both scalars).
pub(super) const TUNING: Tuning = Tuning {
    f64: overridden(TARGET.f64),
    f32: overridden(TARGET.f32),
    plain_below: match super::knobs::PLAIN_BELOW {
        Some(threshold) => threshold,
        None => TARGET.plain_below,
    },
};

/// `kernel` with the loop and lane settings applied, where set.
const fn overridden(kernel: Kernel) -> Kernel {
    Kernel {
        pair_loop: match super::knobs::LOOP {
            Some(pair_loop) => pair_loop,
            None => kernel.pair_loop,
        },
        lanes: match super::knobs::LANES {
            Some(lane_count) => lane_count,
            None => kernel.lanes,
        },
    }
}

/// `f64`'s and `f32`'s lane counts, as constants: a lane count is a const
/// generic of the loops.
pub(super) const F64_LANES: usize = TUNING.f64.lanes;
pub(super) const F32_LANES: usize = TUNING.f32.lanes;

const _: () = assert!(F64_LANES.is_power_of_two() && F32_LANES.is_power_of_two());
