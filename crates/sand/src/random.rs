//! Randomness keyed by position (`docs/11-falling-sand.md`, "Randomness,
//! by position"): each cell's draw is a hash of `(seed, step, x, y,
//! purpose)`, not the next value of a stream, so it doesn't depend on
//! which other cells were updated (sleeping chunks are skipped).

use math::SplitMix64;

/// Odd multipliers that spread each coordinate over the key's bits before
/// the mix (from `SplitMix64` and xxHash's primes).
const STEP_MUL: u64 = 0x9e37_79b9_7f4a_7c15;
const Y_MUL: u64 = 0xc2b2_ae3d_27d4_eb4f;
const X_MUL: u64 = 0x1656_67b1_9e37_79f9;

/// What a draw is for, so two draws at one cell in one step differ.
#[derive(Copy, Clone)]
#[repr(u64)]
pub(crate) enum Purpose {
    /// Which side a falling grain tries first.
    Side = 1,
    /// A painted cell's shade.
    Shade = 2,
}

/// 64 random bits for `(seed, step, x, y, purpose)`.
pub(crate) fn draw(seed: u64, step: u64, x: usize, y: usize, purpose: Purpose) -> u64 {
    let key = seed
        ^ step.wrapping_mul(STEP_MUL)
        ^ (y as u64).wrapping_mul(Y_MUL)
        ^ (x as u64).wrapping_mul(X_MUL)
        ^ (purpose as u64);
    SplitMix64::new(key).next_u64()
}

#[cfg(test)]
mod tests;
