//! Build settings for the boids' lane loop (`Seen::add_span`), read at
//! compile time from the environment (cargo rebuilds when they change):
//!
//! - `SWARM_LANES`: partial sums per running sum (a power of two, 1 to 64),
//!   overriding the target's (`tuning.rs`); 1 is no lanes.
//! - `SWARM_SUM`: `ordered` (default) or `algebraic` (the compiler may
//!   reorder the additions).
//! - `SWARM_SPAN`: `per-span` or `per-boid`, when Sorted adds its lanes
//!   into the sums.
//! - `SWARM_TAIL`: `scalar`, `masked` (one more block, masked by comparing
//!   lane numbers) or `table` (mask from a table), a span's leftovers.
//! - `SWARM_CELL`: `floor` or `truncate`, the grid's cell coordinates.
//! - `SWARM_MASK`: `convert`, `select`, `bits`, `value` or `branch`, how
//!   `Seen::add_masked` writes its masks.
//!
//! Unset settings take the target's value. Lanes and sum change the
//! results' last bits; the others give the same values. Swept in
//! `experiments/swarm-lanes/`, `swarm-mask/` and `sorted-edges/`.

pub(crate) const LANES: Option<usize> = lanes(option_env!("SWARM_LANES"));

pub(crate) const SUM: Sum = sum(option_env!("SWARM_SUM"));

pub(crate) const PER_BOID: Option<bool> = choice(
    option_env!("SWARM_SPAN"),
    "SWARM_SPAN",
    b"per-span",
    b"per-boid",
);

pub(crate) const TAIL: Option<Tail> = tail(option_env!("SWARM_TAIL"));

pub(crate) const TRUNCATE_CELL: Option<bool> = choice(
    option_env!("SWARM_CELL"),
    "SWARM_CELL",
    b"floor",
    b"truncate",
);

pub(crate) const MASK: Option<Mask> = mask(option_env!("SWARM_MASK"));

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

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum Tail {
    /// One at a time, branching (`Seen::add`).
    Scalar,
    /// One more block, masked by comparing lane numbers.
    Masked,
    /// The same block, its mask a window on a table of zeros then ones.
    Table,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum Sum {
    /// `a + b`: in the order written, as Rust promises.
    Ordered,
    /// `a.algebraic_add(b)`: the compiler may reassociate.
    Algebraic,
}

/// The parsers: a bad value fails the build.
pub(crate) const fn lanes(setting: Option<&str>) -> Option<usize> {
    let Some(text) = setting else {
        return None;
    };
    let Some(lanes) = number(text) else {
        panic_at_build("SWARM_LANES: not a number")
    };
    assert!(lanes.is_power_of_two(), "SWARM_LANES: not a power of two");
    assert!(lanes <= 64, "SWARM_LANES: at most 64");
    Some(lanes)
}

pub(crate) const fn sum(setting: Option<&str>) -> Sum {
    match setting {
        None => Sum::Ordered,
        Some(text) if same(text.as_bytes(), b"ordered") => Sum::Ordered,
        Some(text) if same(text.as_bytes(), b"algebraic") => Sum::Algebraic,
        Some(_) => panic_at_build("SWARM_SUM: `ordered` or `algebraic`"),
    }
}

pub(crate) const fn mask(setting: Option<&str>) -> Option<Mask> {
    let Some(text) = setting else {
        return None;
    };
    let bytes = text.as_bytes();
    if same(bytes, b"convert") {
        Some(Mask::Convert)
    } else if same(bytes, b"select") {
        Some(Mask::Select)
    } else if same(bytes, b"bits") {
        Some(Mask::Bits)
    } else if same(bytes, b"value") {
        Some(Mask::Value)
    } else if same(bytes, b"branch") {
        Some(Mask::Branch)
    } else {
        panic_at_build("SWARM_MASK: `convert`, `select`, `bits`, `value` or `branch`")
    }
}

pub(crate) const fn tail(setting: Option<&str>) -> Option<Tail> {
    let Some(text) = setting else {
        return None;
    };
    let bytes = text.as_bytes();
    if same(bytes, b"scalar") {
        Some(Tail::Scalar)
    } else if same(bytes, b"masked") {
        Some(Tail::Masked)
    } else if same(bytes, b"table") {
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

const fn number(text: &str) -> Option<usize> {
    let mut digits = text.as_bytes();
    if digits.is_empty() {
        return None;
    }
    let mut value: usize = 0;
    while let [digit, rest @ ..] = digits {
        if !digit.is_ascii_digit() {
            return None;
        }
        // Checked: a long string is refused, not overflowed.
        let Some(tens) = value.checked_mul(10) else {
            return None;
        };
        let Some(next) = tens.checked_add((*digit - b'0') as usize) else {
            return None;
        };
        value = next;
        digits = rest;
    }
    if value > 1_000 { None } else { Some(value) }
}

const fn same(left: &[u8], right: &[u8]) -> bool {
    match (left, right) {
        ([], []) => true,
        ([left_byte, left_rest @ ..], [right_byte, right_rest @ ..]) => {
            *left_byte == *right_byte && same(left_rest, right_rest)
        }
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
