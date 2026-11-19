//! One sort for the engine's keys (`docs/03-wasm-shell.md`, "Where M6's
//! +65 KB went"). Each generic sort instantiation compiles its own
//! quicksort, heapsort and small-sort into the `.wasm` (6–9 KB each), so
//! the broadphase, the impulse solver's warm start, Barnes–Hut's Morton
//! keys and the disk's radii all sort this one non-generic type.

/// Two ordered integers and an index: sorted lexicographically.
pub(crate) type SortKey = (i64, i64, usize);

/// Sorts `keys` (unstable: keys are distinct wherever order matters).
pub(crate) fn sort(keys: &mut [SortKey]) {
    keys.sort_unstable();
}

/// An index as a key field, order-preserving: every index fits (wasm32's
/// `usize` is 32 bits; a 64-bit one indexes at most `isize::MAX`
/// elements). Saturates otherwise, rather than wrapping.
pub(crate) fn index_key(index: usize) -> i64 {
    i64::try_from(index).unwrap_or(i64::MAX)
}

/// A `u64` as two key fields, order-preserving: its high and low 32
/// bits, each non-negative. [`u64_from_key`] inverts it.
pub(crate) fn u64_key(value: u64) -> (i64, i64) {
    let to_field = |half: u64| i64::try_from(half).unwrap_or(i64::MAX);
    (to_field(value >> 32), to_field(value & u64::from(u32::MAX)))
}

/// The `u64` that [`u64_key`] split.
pub(crate) fn u64_from_key(high: i64, low: i64) -> u64 {
    let from_field = |field: i64| u64::try_from(field).unwrap_or(0);
    (from_field(high) << 32) | from_field(low)
}

/// An `f64` as one key field, in IEEE 754 total order (as
/// [`f64::total_cmp`]): the bit pattern, with the magnitude bits flipped
/// for negatives so they sort below.
pub(crate) const fn f64_key(value: f64) -> i64 {
    let bits = value.to_bits().cast_signed();
    bits ^ ((bits >> 63).cast_unsigned() >> 1).cast_signed()
}

#[cfg(test)]
mod tests;
