//! Build settings for the boids' lane loop (`Seen::add_span`), read at
//! compile time from the environment (cargo rebuilds when they change):
//!
//! - `SWARM_LANES`: how many partial sums each running sum is split into
//!   (a power of two, 1 to 64), overriding each target's (`tuning.rs`)
//!   for both neighbour searches. 1 is one running sum, the loop as
//!   written without lanes.
//! - `SWARM_SUM`: `ordered` (default) or `algebraic`. Algebraic adds with
//!   `f32::algebraic_add`, which lets the compiler reorder them (and so
//!   vectorize the sums however it likes).
//! - `SWARM_SPAN`, `SWARM_TAIL`, `SWARM_CELL`: Sorted's span edges, for
//!   `experiments/sorted-edges/`; unset, the target's (`tuning.rs`).
//!   `SWARM_SPAN`: `per-span` (each span's lanes added into the sums at
//!   its end) or `per-boid` (one set of lanes for a boid's three spans,
//!   added once). `SWARM_TAIL`: `scalar` (a span's last few candidates
//!   one at a time, branching), `masked` (one more block, its lanes
//!   outside the leftovers masked out by comparing lane numbers) or
//!   `table` (the same block, its mask loaded from a table of zeros then
//!   ones). `SWARM_CELL`: `floor` or `truncate` (the grid's cell
//!   coordinates without `floor`: the same for the non-negative values it
//!   takes; x86's baseline has no float rounding instruction, so `floor`
//!   is a call).
//! - `SWARM_MASK`: how the grid's scalar candidate test (`Seen::add_masked`)
//!   writes its masks: `convert` (a bool converted to a float), `select`
//!   (`if c { 1.0 } else { 0.0 }`), `bits` (the bits of `1.0`, masked by the
//!   bool's all-ones), `value` (each term selected, no multiply) or
//!   `branch` (the branching `Seen::add`). Unset, the target's (`tuning.rs`).
//!
//! The first two change the order of additions, so the results' last
//! bits; the mask forms give the same values. Swept in
//! `experiments/swarm-lanes/` and `experiments/swarm-mask/`.

/// Partial sums in the lane loop.
pub(crate) const LANES: Option<usize> = lanes(option_env!("SWARM_LANES"));

/// How the lane loop adds.
pub(crate) const SUM: Sum = sum(option_env!("SWARM_SUM"));

/// Whether Sorted adds one set of lanes per boid (`SWARM_SPAN`), if set.
pub(crate) const PER_BOID: Option<bool> = choice(
    option_env!("SWARM_SPAN"),
    "SWARM_SPAN",
    b"per-span",
    b"per-boid",
);

/// How Sorted adds a span's leftovers (`SWARM_TAIL`), if set.
pub(crate) const TAIL: Option<Tail> = tail(option_env!("SWARM_TAIL"));

/// Whether the grid's cell coordinates truncate instead of `floor`
/// (`SWARM_CELL`), if set.
pub(crate) const TRUNCATE_CELL: Option<bool> = choice(
    option_env!("SWARM_CELL"),
    "SWARM_CELL",
    b"floor",
    b"truncate",
);

/// How the grid's candidate test masks, if set.
pub(crate) const MASK: Option<Mask> = mask(option_env!("SWARM_MASK"));

/// The forms of `Seen::add_masked`'s masks (`SWARM_MASK`).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum Mask {
    /// `f32::from(u8::from(c))`: an integer converted.
    Convert,
    /// `if c { 1.0 } else { 0.0 }`: a select.
    Select,
    /// `f32::from_bits(1.0_f32.to_bits() & u32::from(c).wrapping_neg())`.
    Bits,
    /// Each term selected (`if c { x } else { 0.0 }`), no multiply.
    Value,
    /// The branching `Seen::add`.
    Branch,
}

/// How Sorted adds a span's leftovers, fewer than a block (`SWARM_TAIL`).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum Tail {
    /// One at a time, branching (`Seen::add`).
    Scalar,
    /// One more block, the lanes outside the leftovers masked out by
    /// comparing lane numbers.
    Masked,
    /// The same block, its mask a window on a table of zeros then ones.
    Table,
}

/// The lane loop's additions.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum Sum {
    /// `a + b`: in the order written, as Rust promises.
    Ordered,
    /// `a.algebraic_add(b)`: the compiler may reassociate.
    Algebraic,
}

/// `SWARM_LANES` as a number; a bad value fails the build.
pub(crate) const fn lanes(setting: Option<&str>) -> Option<usize> {
    let Some(text) = setting else {
        return None;
    };
    let Some(n) = number(text) else {
        panic_at_build("SWARM_LANES: not a number")
    };
    assert!(n.is_power_of_two(), "SWARM_LANES: not a power of two");
    assert!(n <= 64, "SWARM_LANES: at most 64");
    Some(n)
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

/// `SWARM_MASK` as a [`Mask`]; a bad value fails the build.
pub(crate) const fn mask(setting: Option<&str>) -> Option<Mask> {
    let Some(text) = setting else {
        return None;
    };
    let t = text.as_bytes();
    if same(t, b"convert") {
        Some(Mask::Convert)
    } else if same(t, b"select") {
        Some(Mask::Select)
    } else if same(t, b"bits") {
        Some(Mask::Bits)
    } else if same(t, b"value") {
        Some(Mask::Value)
    } else if same(t, b"branch") {
        Some(Mask::Branch)
    } else {
        panic_at_build("SWARM_MASK: `convert`, `select`, `bits`, `value` or `branch`")
    }
}

/// `SWARM_TAIL` as a [`Tail`]; a bad value fails the build.
pub(crate) const fn tail(setting: Option<&str>) -> Option<Tail> {
    let Some(text) = setting else {
        return None;
    };
    let t = text.as_bytes();
    if same(t, b"scalar") {
        Some(Tail::Scalar)
    } else if same(t, b"masked") {
        Some(Tail::Masked)
    } else if same(t, b"table") {
        Some(Tail::Table)
    } else {
        panic_at_build("SWARM_TAIL: `scalar`, `masked` or `table`")
    }
}

/// A two-way setting: `off` is `false`, `on` is `true`, unset `None`;
/// anything else fails the build, naming `name`.
pub(crate) const fn choice(
    setting: Option<&str>,
    name: &str,
    off: &[u8],
    on: &[u8],
) -> Option<bool> {
    match setting {
        None => None,
        Some(text) if same(text.as_bytes(), off) => Some(false),
        Some(text) if same(text.as_bytes(), on) => Some(true),
        Some(_) => panic_at_build(name),
    }
}

/// Decimal digits as a number, if that's all `text` is and it's at most a
/// thousand.
const fn number(text: &str) -> Option<usize> {
    let mut digits = text.as_bytes();
    if digits.is_empty() {
        return None;
    }
    let mut n: usize = 0;
    while let [d, rest @ ..] = digits {
        if !d.is_ascii_digit() {
            return None;
        }
        // Checked: a long string is refused, not overflowed.
        let Some(tens) = n.checked_mul(10) else {
            return None;
        };
        let Some(next) = tens.checked_add((*d - b'0') as usize) else {
            return None;
        };
        n = next;
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

#[cfg(test)]
mod tests;
