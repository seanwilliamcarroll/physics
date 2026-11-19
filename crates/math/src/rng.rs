//! [`SplitMix64`]: a tiny seeded PRNG shared by every track. In-house per
//! the dependency policy (`docs/00-scope.md`); not for cryptography or
//! statistics.

/// Added to the state on every call: the odd integer nearest 2⁶⁴/φ (Steele,
/// Lea & Flood, OOPSLA 2014). Checked against 2⁶⁴/φ in the tests.
const GOLDEN_GAMMA: u64 = 0x9e37_79b9_7f4a_7c15;

/// Output mixing: Stafford's "Mix13" variant of the `MurmurHash3` finalizer.
const MIX13_SHIFTS: [u32; 3] = [30, 27, 31];
const MIX13_MULTIPLIERS: [u64; 2] = [0xbf58_476d_1ce4_e5b9, 0x94d0_49bb_1331_11eb];

/// Bit pattern of `1.0_f64`: sign 0, exponent `0x3ff` (bias), mantissa 0.
const ONE_BITS: u64 = 1.0_f64.to_bits();

/// Keeps the 52 explicit mantissa bits of an `f64`: 64 - 52 = 12.
const MANTISSA_SHIFT: u32 = u64::BITS - (f64::MANTISSA_DIGITS - 1);

/// One `u64` of state, full period 2⁶⁴. Deterministic for a given seed on
/// every platform (integer ops only).
#[derive(Clone, Debug)]
pub struct SplitMix64(u64);

impl SplitMix64 {
    #[must_use]
    pub const fn new(seed: u64) -> Self {
        Self(seed)
    }

    #[must_use]
    pub const fn next_u64(&mut self) -> u64 {
        let [first_shift, second_shift, final_shift] = MIX13_SHIFTS;
        let [first_multiplier, second_multiplier] = MIX13_MULTIPLIERS;
        self.0 = self.0.wrapping_add(GOLDEN_GAMMA);
        let mut mixed = self.0;
        mixed = (mixed ^ (mixed >> first_shift)).wrapping_mul(first_multiplier);
        mixed = (mixed ^ (mixed >> second_shift)).wrapping_mul(second_multiplier);
        mixed ^ (mixed >> final_shift)
    }

    /// Uniform in `[0, 1)`: random mantissa bits under `1.0` give `[1, 2)`,
    /// minus 1. Exact, branch-free, no integer-to-float cast.
    #[must_use]
    pub fn next_unit_f64(&mut self) -> f64 {
        f64::from_bits(ONE_BITS | (self.next_u64() >> MANTISSA_SHIFT)) - 1.0
    }

    /// Uniform in `[start, end)`, up to rounding at the top end.
    #[must_use]
    pub fn range(&mut self, start: f64, end: f64) -> f64 {
        start + (end - start) * self.next_unit_f64()
    }
}

#[cfg(test)]
mod tests;
