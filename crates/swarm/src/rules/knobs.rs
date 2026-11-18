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
//! - `SWARM_MASK`: how the scalar candidate tests (the grid's
//!   `Seen::add_masked`, Vicsek's `add_headings` and `image`) write their
//!   masks: `convert` (a bool converted to a float), `select`
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
