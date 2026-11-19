//! Checked numeric conversions between counts (`usize`) and measures
//! (`f64`): each written and justified once, here, instead of an `as` with
//! a lint exemption at every call site.
//!
//! `as` never fails: float → integer saturates (NaN → 0, negative → 0,
//! too large → `MAX`), integer → float rounds. Both are silent. These
//! functions are exact where they claim to be, and say `None` (or clamp, by
//! name) where `as` would quietly pick a value.

/// Integers below this convert exactly: `2^53`, or `2^usize::BITS` on wasm32.
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

#[must_use]
pub const fn usize_to_f64(count: usize) -> f64 {
    #[expect(
        clippy::cast_precision_loss,
        reason = "exact below 2^53, the nearest f64 above; documented"
    )]
    let as_float = count as f64;
    as_float
}

#[must_use]
pub const fn u64_to_f64(value: u64) -> f64 {
    #[expect(
        clippy::cast_precision_loss,
        reason = "exact below 2^53, the nearest f64 above; documented"
    )]
    let as_float = value as f64;
    as_float
}

/// `x` truncated toward zero. `None` for NaN, a negative `x`, or one at or
/// past the exact limit, where `as` would saturate silently.
#[must_use]
pub fn f64_to_usize(x: f64) -> Option<usize> {
    // `contains` is false for NaN too.
    let in_range = (0.0..EXACT_LIMIT).contains(&x);
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "checked non-negative and below the exact limit: truncation toward zero is the rule"
    )]
    let count = in_range.then_some(x as usize);
    count
}

/// `seconds * rate` truncated to whole samples; `None` if that isn't a count.
#[must_use]
pub fn samples(seconds: f64, rate: f64) -> Option<usize> {
    f64_to_usize(seconds * rate)
}

/// `x` truncated toward zero into `0..=max`: below 0 (or NaN) is 0. For an
/// index whose clamp is intended, not a hidden failure.
#[must_use]
pub fn clamped_index(x: f64, max: usize) -> usize {
    // `x > 0` is false for NaN too.
    let positive = x > 0.0;
    if !positive {
        return 0;
    }
    f64_to_usize(x).map_or(max, |index| index.min(max))
}

/// `x` as the nearest `f32` (infinite past `f32::MAX`), for audio and render buffers.
#[must_use]
pub const fn f64_to_f32(x: f64) -> f32 {
    #[expect(
        clippy::cast_possible_truncation,
        reason = "narrowing to the nearest f32 is the point; documented"
    )]
    let narrowed = x as f32;
    narrowed
}

#[cfg(test)]
mod tests;
