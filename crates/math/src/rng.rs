//! [`SplitMix64`]: a tiny seeded PRNG, shared by the engine (scenario
//! setup) and the acoustic track (excitation noise). In-house per the
//! dependency policy (`docs/00-scope.md`); not for cryptography or
//! statistics.

/// Added to the state on every call: the odd integer nearest 2⁶⁴/φ (φ, the
/// golden ratio), so successive states are spread evenly around the ring
/// of `u64` values. Steele, Lea & Flood, "Fast Splittable Pseudorandom
/// Number Generators", OOPSLA 2014 (`GOLDEN_GAMMA` in Java's
/// `SplittableRandom`). Checked against 2⁶⁴/φ in the tests.
const GOLDEN_GAMMA: u64 = 0x9e37_79b9_7f4a_7c15;

/// Output mixing function: David Stafford's "Mix13" variant of the
/// `MurmurHash3` 64-bit finalizer ("Better Bit Mixing", 2011), chosen by
/// Steele et al. for `SplitMix64`. Each round: `z = (z ^ (z >> s)) * m`,
/// with a final xor-shift.
const MIX13_SHIFTS: [u32; 3] = [30, 27, 31];
const MIX13_MULTIPLIERS: [u64; 2] = [0xbf58_476d_1ce4_e5b9, 0x94d0_49bb_1331_11eb];

/// Bit pattern of `1.0_f64`: sign 0, exponent `0x3ff` (bias), mantissa 0.
const ONE_BITS: u64 = 1.0_f64.to_bits();

/// Right shift that keeps exactly as many random bits as `f64` stores
/// explicitly in its mantissa (52 = 53 significant digits minus the
/// implicit leading 1): 64 - 52 = 12.
const MANTISSA_SHIFT: u32 = u64::BITS - (f64::MANTISSA_DIGITS - 1);

/// `SplitMix64` (Steele, Lea & Flood 2014): one `u64` of state, full period
/// 2⁶⁴, good enough output quality for scattering particles and for noise. Deterministic
/// for a given seed on every platform (integer ops only).
#[derive(Clone, Debug)]
pub struct SplitMix64(u64);

impl SplitMix64 {
    #[must_use]
    pub const fn new(seed: u64) -> Self {
        Self(seed)
    }

    #[must_use]
    pub const fn next_u64(&mut self) -> u64 {
        let [s1, s2, s3] = MIX13_SHIFTS;
        let [m1, m2] = MIX13_MULTIPLIERS;
        self.0 = self.0.wrapping_add(GOLDEN_GAMMA);
        let mut z = self.0;
        z = (z ^ (z >> s1)).wrapping_mul(m1);
        z = (z ^ (z >> s2)).wrapping_mul(m2);
        z ^ (z >> s3)
    }

    /// Uniform in `[0, 1)`.
    ///
    /// Bit trick instead of `(x >> 11) as f64 / 2⁵³`: fill the mantissa of
    /// `1.0` with random bits, giving a float uniform in `[1, 2)`, then
    /// subtract 1. Exact, branch-free, and no integer-to-float cast.
    #[must_use]
    pub fn next_unit_f64(&mut self) -> f64 {
        f64::from_bits(ONE_BITS | (self.next_u64() >> MANTISSA_SHIFT)) - 1.0
    }

    /// Uniform in `[lo, hi)`, up to rounding at the top end.
    #[must_use]
    pub fn range(&mut self, lo: f64, hi: f64) -> f64 {
        lo + (hi - lo) * self.next_unit_f64()
    }
}

#[cfg(test)]
mod tests;
