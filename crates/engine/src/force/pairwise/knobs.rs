//! Build settings read from the environment at compile time; set, they
//! override `tuning.rs` for both scalars (`experiments/gravity-vectorize/`):
//!
//! - `GRAVITY_LANES`: partial sums per body (a power of two, 1 to 64); sets
//!   the order of additions, so the last bits.
//! - `GRAVITY_PLAIN_BELOW`: below this many bodies the plain loop runs.
//! - `GRAVITY_LOOP`: `two-pass` or `blocked` (same bits at equal lanes).

use super::tuning::PairLoop;

pub(super) const LANES: Option<usize> = lanes(option_env!("GRAVITY_LANES"));

pub(super) const LOOP: Option<PairLoop> = pair_loop(option_env!("GRAVITY_LOOP"));

pub(super) const PLAIN_BELOW: Option<usize> = plain_below(option_env!("GRAVITY_PLAIN_BELOW"));

/// `GRAVITY_LANES` as a number; a bad value fails the build.
pub(super) const fn lanes(setting: Option<&str>) -> Option<usize> {
    let Some(text) = setting else {
        return None;
    };
    let Some(lane_count) = number(text) else {
        panic_at_build("GRAVITY_LANES: not a number")
    };
    assert!(
        lane_count.is_power_of_two(),
        "GRAVITY_LANES: not a power of two"
    );
    assert!(lane_count <= 64, "GRAVITY_LANES: at most 64");
    Some(lane_count)
}

pub(super) const fn plain_below(setting: Option<&str>) -> Option<usize> {
    let Some(text) = setting else {
        return None;
    };
    let Some(threshold) = number(text) else {
        panic_at_build("GRAVITY_PLAIN_BELOW: not a number")
    };
    Some(threshold)
}

/// Decimal digits as a number, at most a million.
const fn number(text: &str) -> Option<usize> {
    let mut remaining = text.as_bytes();
    if remaining.is_empty() {
        return None;
    }
    let mut value: usize = 0;
    while let [digit, rest @ ..] = remaining {
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
        remaining = rest;
    }
    if value > 1_000_000 { None } else { Some(value) }
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
pub(super) const fn pair_loop(setting: Option<&str>) -> Option<PairLoop> {
    match setting {
        None => None,
        Some(text) if same(text.as_bytes(), b"two-pass") => Some(PairLoop::TwoPass),
        Some(text) if same(text.as_bytes(), b"blocked") => Some(PairLoop::Blocked),
        Some(_) => panic_at_build("GRAVITY_LOOP: `two-pass` or `blocked`"),
    }
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
