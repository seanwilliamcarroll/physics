//! Checked numeric conversions between counts (`usize`) and measures
//! (`f64`): each written and justified once, here, instead of an `as` with
//! a lint exemption at every call site.
//!
//! `as` never fails: float → integer saturates (NaN → 0, negative → 0,
//! too large → `MAX`), integer → float rounds. Both are silent. These
//! functions are exact where they claim to be, and say `None` (or clamp, by
//! name) where `as` would quietly pick a value.

/// The integers below this convert `usize` ↔ `f64` exactly: `2^53` (every
/// integer an `f64` holds exactly), or `2^usize::BITS` where `usize` is
/// narrower (32 bits on wasm32).
const EXACT_LIMIT: f64 = {
    let bits = if usize::BITS < f64::MANTISSA_DIGITS {
        usize::BITS
    } else {
        f64::MANTISSA_DIGITS
    };
    #[expect(
        clippy::cast_precision_loss,
        reason = "a power of two at most 2^53: exact"
    )]
    let limit = (1_u64 << bits) as f64;
    limit
};

/// A count as an `f64`: exact below `2^53` (every in-memory length here is
/// far below), the nearest `f64` above.
#[must_use]
pub const fn usize_to_f64(n: usize) -> f64 {
    #[expect(
        clippy::cast_precision_loss,
        reason = "exact below 2^53, the nearest f64 above; documented"
    )]
    let x = n as f64;
    x
}

/// A `u64` (a running count, a seed) as the nearest `f64`: exact below
/// `2^53`.
#[must_use]
pub const fn u64_to_f64(n: u64) -> f64 {
    #[expect(
        clippy::cast_precision_loss,
        reason = "exact below 2^53, the nearest f64 above; documented"
    )]
    let x = n as f64;
    x
}

/// `x` as a count, truncated toward zero (as `as` does: round, floor or
/// ceil first for another rule). `None` for NaN, a negative `x`, or one at
/// or past the exact limit (`2^53`, or `usize::MAX + 1` where narrower),
/// where `as` would saturate silently.
#[must_use]
pub fn f64_to_usize(x: f64) -> Option<usize> {
    // `contains` is false for NaN too.
    let in_range = (0.0..EXACT_LIMIT).contains(&x);
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "checked non-negative and below the exact limit: truncation toward zero is the rule"
    )]
    let n = in_range.then_some(x as usize);
    n
}

/// `seconds` at `rate` per second, as a whole number of samples (truncated,
/// as `(seconds * rate) as usize` would): `None` for a product that isn't
/// a count (NaN, negative, too large).
#[must_use]
pub fn samples(seconds: f64, rate: f64) -> Option<usize> {
    f64_to_usize(seconds * rate)
}

/// `x` truncated toward zero into `0..=max`: below 0 (or NaN) is 0, past
/// `max` is `max`. For an index whose clamp is the intended behavior (a
/// position read between cells), not a hidden failure.
#[must_use]
pub fn clamped_index(x: f64, max: usize) -> usize {
    // `x > 0` is false for NaN too.
    let positive = x > 0.0;
    if !positive {
        return 0;
    }
    f64_to_usize(x).map_or(max, |n| n.min(max))
}

/// `x` as the nearest `f32` (infinite past `f32::MAX`): a deliberate
/// narrowing, for audio output and render buffers.
#[must_use]
pub const fn f64_to_f32(x: f64) -> f32 {
    #[expect(
        clippy::cast_possible_truncation,
        reason = "narrowing to the nearest f32 is the point; documented"
    )]
    let y = x as f32;
    y
}

#[cfg(test)]
mod tests;
