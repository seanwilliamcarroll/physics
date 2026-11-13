//! Helpers shared by the acoustic crate's unit tests. (`tests/tuning.rs`
//! keeps its own `hash_noise`: integration tests can't see `cfg(test)`
//! code, and one function doesn't warrant a test-support crate.)

use math::convert::usize_to_f64;
/// A deterministic "noise" for tests: a fixed integer hash, zero-mean
/// enough for a pluck (the real excitations are in `excitation.rs`).
pub(crate) fn hash_noise(i: usize) -> f64 {
    let h = (i.wrapping_mul(2_654_435_761) >> 7) & 0xffff;
    usize_to_f64(h) / 32768.0 - 1.0
}
