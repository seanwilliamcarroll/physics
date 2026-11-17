//! Build settings for pairwise gravity, read at compile time from the
//! environment (cargo rebuilds when they change). Unset, each target's own
//! choice holds (`tuning.rs`); set, they override it for both scalars, for
//! experiments (`experiments/gravity-vectorize/`):
//!
//! - `GRAVITY_LANES`: how many partial sums body i's sum is split into (a
//!   power of two, 1 to 64). It sets the order of additions, so the
//!   results' last bits.
//! - `GRAVITY_PLAIN_BELOW`: below this many bodies the plain loop runs
//!   instead.
//! - `GRAVITY_LOOP`: `two-pass` or `blocked`. At the same lane count the
//!   two give identical bits (tested); only speed differs.

use super::tuning::PairLoop;

/// `GRAVITY_LANES`, if set.
pub(super) const LANES: Option<usize> = lanes(option_env!("GRAVITY_LANES"));

/// `GRAVITY_LOOP`, if set.
pub(super) const LOOP: Option<PairLoop> = pair_loop(option_env!("GRAVITY_LOOP"));

/// `GRAVITY_PLAIN_BELOW`, if set.
pub(super) const PLAIN_BELOW: Option<usize> = plain_below(option_env!("GRAVITY_PLAIN_BELOW"));

/// `GRAVITY_LANES` as a number; a bad value fails the build.
pub(super) const fn lanes(setting: Option<&str>) -> Option<usize> {
    let Some(text) = setting else {
        return None;
    };
    let Some(n) = number(text) else {
        panic_at_build("GRAVITY_LANES: not a number")
    };
    assert!(n.is_power_of_two(), "GRAVITY_LANES: not a power of two");
    assert!(n <= 64, "GRAVITY_LANES: at most 64");
    Some(n)
}

/// `GRAVITY_PLAIN_BELOW` as a number; a bad value fails the build.
pub(super) const fn plain_below(setting: Option<&str>) -> Option<usize> {
    let Some(text) = setting else {
        return None;
    };
    let Some(n) = number(text) else {
        panic_at_build("GRAVITY_PLAIN_BELOW: not a number")
    };
    Some(n)
}

/// Decimal digits as a number, if that's all `text` is and it's at most a
/// million (no setting here needs more).
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
pub(super) const fn pair_loop(setting: Option<&str>) -> Option<PairLoop> {
    match setting {
        None => None,
        Some(text) if same(text.as_bytes(), b"two-pass") => Some(PairLoop::TwoPass),
        Some(text) if same(text.as_bytes(), b"blocked") => Some(PairLoop::Blocked),
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
