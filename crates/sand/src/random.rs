//! Randomness keyed by position: each cell's draw is a hash of `(seed,
//! step, x, y, purpose)`, not the next value of a stream, so it doesn't
//! depend on which other cells were updated (sleeping chunks are skipped).

use math::SplitMix64;

const STEP_MULTIPLIER: u64 = 0x9e37_79b9_7f4a_7c15;
const Y_MULTIPLIER: u64 = 0xc2b2_ae3d_27d4_eb4f;
const X_MULTIPLIER: u64 = 0x1656_67b1_9e37_79f9;

/// Makes two draws at one cell in one step differ.
#[derive(Copy, Clone)]
#[repr(u64)]
pub(crate) enum Purpose {
    Side = 1,
    Shade = 2,
    Flow = 3,
    Condense = 4,
}

pub(crate) fn draw(seed: u64, step: u64, x: usize, y: usize, purpose: Purpose) -> u64 {
    let key = seed
        ^ step.wrapping_mul(STEP_MULTIPLIER)
        ^ (y as u64).wrapping_mul(Y_MULTIPLIER)
        ^ (x as u64).wrapping_mul(X_MULTIPLIER)
        ^ (purpose as u64);
    SplitMix64::new(key).next_u64()
}

#[cfg(test)]
mod tests;
