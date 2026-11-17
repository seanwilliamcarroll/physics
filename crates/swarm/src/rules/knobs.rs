//! Build settings for the boids' lane loop (`Seen::add_span`), read at
//! compile time from the environment (cargo rebuilds when they change):
//!
//! - `SWARM_LANES`: how many partial sums each running sum is split into
//!   (a power of two, 1 to 64; default 16). 1 is one running sum, the
//!   loop as written without lanes.
//! - `SWARM_SUM`: `ordered` (default) or `algebraic`. Algebraic adds with
//!   `f32::algebraic_add`, which lets the compiler reorder them (and so
//!   vectorize the sums however it likes).
//!
//! - `SWARM_LOOP`: `lanes` (default) or `grouped`. Grouped makes one pass
//!   over the candidates per `SWARM_GROUP` lanes instead of one for all of
//!   them, so only that many lanes' sums are live (they fit in registers:
//!   no spills), at the price of reading the candidates once a pass.
//! - `SWARM_GROUP`: lanes a grouped pass (a power of two up to
//!   `SWARM_LANES`); by default one vector register's worth of `f32`: 16
//!   with AVX-512, 8 with AVX, else 4.
//!
//! `SWARM_LANES` and `SWARM_SUM` change the order of additions, so the
//! results' bits: the golden hashes are for their defaults, and skip when
//! either is set. `SWARM_LOOP` and `SWARM_GROUP` don't: each lane still
//! adds its candidates in the same order, so the goldens must hold.
//! Experiments for now (`experiments/swarm-lanes/`).

/// Partial sums in the lane loop.
pub(crate) const LANES: usize = lanes(option_env!("SWARM_LANES"));

/// How the lane loop adds.
pub(crate) const SUM: Sum = sum(option_env!("SWARM_SUM"));

/// How the lane loop walks the candidates.
pub(crate) const LOOP: Loop = lane_loop(option_env!("SWARM_LOOP"));

/// Lanes a grouped pass.
pub(crate) const GROUP: usize = group(option_env!("SWARM_GROUP"), LANES);

/// The lane loop's shapes (`SWARM_LOOP`).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum Loop {
    /// All `LANES` lanes' sums in one pass.
    Lanes,
    /// One pass per `GROUP` lanes.
    Grouped,
}

/// One vector register's worth of `f32` lanes on this target.
const fn register_lanes() -> usize {
    if cfg!(target_feature = "avx512f") {
        16
    } else if cfg!(target_feature = "avx") {
        8
    } else {
        4
    }
}

/// `SWARM_LOOP` as a [`Loop`]; a bad value fails the build.
pub(crate) const fn lane_loop(setting: Option<&str>) -> Loop {
    match setting {
        None => Loop::Lanes,
        Some(text) if same(text.as_bytes(), b"lanes") => Loop::Lanes,
        Some(text) if same(text.as_bytes(), b"grouped") => Loop::Grouped,
        Some(_) => panic_at_build("SWARM_LOOP: `lanes` or `grouped`"),
    }
}

/// `SWARM_GROUP` as a number (by default a register's worth), at most
/// `lanes`; a bad value fails the build.
pub(crate) const fn group(setting: Option<&str>, lanes: usize) -> usize {
    let n = match setting {
        None => register_lanes(),
        Some(text) => match number(text) {
            Some(n) => n,
            None => panic_at_build("SWARM_GROUP: not a number"),
        },
    };
    assert!(n.is_power_of_two(), "SWARM_GROUP: not a power of two");
    if n < lanes { n } else { lanes }
}

/// The lane loop's additions.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum Sum {
    /// `a + b`: in the order written, as Rust promises.
    Ordered,
    /// `a.algebraic_add(b)`: the compiler may reassociate.
    Algebraic,
}

const DEFAULT_LANES: usize = 16;

/// `SWARM_LANES` as a number; a bad value fails the build.
pub(crate) const fn lanes(setting: Option<&str>) -> usize {
    let Some(text) = setting else {
        return DEFAULT_LANES;
    };
    let Some(n) = number(text) else {
        panic_at_build("SWARM_LANES: not a number")
    };
    assert!(n.is_power_of_two(), "SWARM_LANES: not a power of two");
    assert!(n <= 64, "SWARM_LANES: at most 64");
    n
}

/// `SWARM_SUM` as a [`Sum`]; a bad value fails the build.
pub(crate) const fn sum(setting: Option<&str>) -> Sum {
    match setting {
        None => Sum::Ordered,
        Some(text) if same(text.as_bytes(), b"ordered") => Sum::Ordered,
        Some(text) if same(text.as_bytes(), b"algebraic") => Sum::Algebraic,
        Some(_) => panic_at_build("SWARM_SUM: `ordered` or `algebraic`"),
    }
}

/// Decimal digits as a number, if that's all `text` is and it's at most a
/// thousand.
const fn number(text: &str) -> Option<usize> {
    let mut digits = text.as_bytes();
    if digits.is_empty() {
        return None;
    }
    let mut n = 0;
    while let [d, rest @ ..] = digits {
        if !d.is_ascii_digit() || n > 1_000 {
            return None;
        }
        n = n * 10 + (*d - b'0') as usize;
        digits = rest;
    }
    if n > 1_000 { None } else { Some(n) }
}

/// Byte equality, usable in a `const fn`.
const fn same(a: &[u8], b: &[u8]) -> bool {
    match (a, b) {
        ([], []) => true,
        ([x, a_rest @ ..], [y, b_rest @ ..]) => *x == *y && same(a_rest, b_rest),
        _ => false,
    }
}

/// A bad setting: evaluated in a `const`, the panic is a build error.
#[expect(
    clippy::panic,
    reason = "a bad build setting must fail the build; in const evaluation a panic does"
)]
const fn panic_at_build(message: &str) -> ! {
    panic!("{}", message)
}
