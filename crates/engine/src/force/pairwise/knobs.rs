//! Build settings for pairwise gravity, read at compile time from the
//! environment (cargo rebuilds when they change):
//!
//! - `GRAVITY_LANES`: how many partial sums body i's sum is split into (a
//!   power of two, 1 to 64; default 16). It sets the order of additions,
//!   so it **changes the results' bits**: the golden hashes are for the
//!   default, and the same value must be used on every target that should
//!   agree (native and wasm).
//! - `GRAVITY_PLAIN_BELOW`: below this many bodies the plain loop runs
//!   instead (default 64). Changes the bits of smaller
//!   worlds, like `GRAVITY_LANES`.
//! - `GRAVITY_LOOP`: `two-pass` (default) or `blocked`. The two do the same
//!   arithmetic in the same order, so they give identical bits (tested);
//!   only speed differs, so it may differ per target.
//!
//! Defaults from the sweep in `docs/gravity-vectorize.md`: two-pass with 16
//! lanes was the best single choice at 4,096 bodies across Zen 5, the M4,
//! and wasm with `simd128` under wasmtime and V8.

/// Body i's partial sums: pair j goes to lane j mod `LANES`.
pub(super) const LANES: usize = lanes(option_env!("GRAVITY_LANES"));

/// Which loop runs.
pub(super) const LOOP: PairLoop = pair_loop(option_env!("GRAVITY_LOOP"));

/// Below this many bodies the plain loop (one pair at a time, body i's sum
/// in order) runs instead: the vector loops' per-body setup costs more than
/// it saves on short rows. Measured: `docs/gravity-vectorize.md`.
pub(super) const PLAIN_BELOW: usize = plain_below(option_env!("GRAVITY_PLAIN_BELOW"));

/// The two vector loops (`two_pass.rs`, `blocked.rs`).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(super) enum PairLoop {
    /// Pass 1 computes every pair's force for body i into scratch arrays
    /// (nothing summed across pairs, so the compiler vectorizes it at the
    /// target's full width); pass 2 sums them in lanes.
    TwoPass,
    /// One pass in blocks of `LANES` pairs, body i's lanes updated as it
    /// goes: no scratch arrays, but at most `LANES` wide.
    Blocked,
}

const DEFAULT_LANES: usize = 16;
pub(super) const DEFAULT_PLAIN_BELOW: usize = 64;

/// `GRAVITY_LANES` as a number; a bad value fails the build.
pub(super) const fn lanes(setting: Option<&str>) -> usize {
    let Some(text) = setting else {
        return DEFAULT_LANES;
    };
    let Some(n) = number(text) else {
        panic_at_build("GRAVITY_LANES: not a number")
    };
    assert!(n.is_power_of_two(), "GRAVITY_LANES: not a power of two");
    assert!(n <= 64, "GRAVITY_LANES: at most 64");
    n
}

/// `GRAVITY_PLAIN_BELOW` as a number; a bad value fails the build.
pub(super) const fn plain_below(setting: Option<&str>) -> usize {
    let Some(text) = setting else {
        return DEFAULT_PLAIN_BELOW;
    };
    let Some(n) = number(text) else {
        panic_at_build("GRAVITY_PLAIN_BELOW: not a number")
    };
    n
}

/// Decimal digits as a number, if that's all `text` is and it's at most a
/// million (no setting here needs more).
const fn number(text: &str) -> Option<usize> {
    let mut digits = text.as_bytes();
    if digits.is_empty() {
        return None;
    }
    let mut n = 0;
    while let [d, rest @ ..] = digits {
        if !d.is_ascii_digit() || n > 1_000_000 {
            return None;
        }
        n = n * 10 + (*d - b'0') as usize;
        digits = rest;
    }
    if n > 1_000_000 { None } else { Some(n) }
}

/// A bad setting: evaluated in a `const`, the panic is a build error.
#[expect(
    clippy::panic,
    reason = "a bad build setting must fail the build; in const evaluation a panic does"
)]
const fn panic_at_build(message: &str) -> ! {
    panic!("{}", message)
}

/// `GRAVITY_LOOP` as a [`PairLoop`]; a bad value fails the build.
pub(super) const fn pair_loop(setting: Option<&str>) -> PairLoop {
    match setting {
        None => PairLoop::TwoPass,
        Some(text) if same(text.as_bytes(), b"two-pass") => PairLoop::TwoPass,
        Some(text) if same(text.as_bytes(), b"blocked") => PairLoop::Blocked,
        Some(_) => panic_at_build("GRAVITY_LOOP: `two-pass` or `blocked`"),
    }
}

/// Byte equality, usable in a `const fn`.
const fn same(a: &[u8], b: &[u8]) -> bool {
    match (a, b) {
        ([], []) => true,
        ([x, a_rest @ ..], [y, b_rest @ ..]) => *x == *y && same(a_rest, b_rest),
        _ => false,
    }
}
