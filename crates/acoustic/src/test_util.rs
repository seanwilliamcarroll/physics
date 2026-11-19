//! Helpers shared by the acoustic crate's unit tests.

use math::convert::usize_to_f64;

/// A deterministic "noise" for tests: a fixed integer hash, zero-mean
/// enough for a pluck.
pub(crate) fn hash_noise(index: usize) -> f64 {
    let hash = (index.wrapping_mul(2_654_435_761) >> 7) & 0xffff;
    usize_to_f64(hash) / 32768.0 - 1.0
}
