//! A tiny seeded PRNG for scenario setup. In-house per the dependency
//! policy (`docs/00-scope.md`); not for cryptography or statistics.

/// `SplitMix64` (Steele, Lea & Flood 2014): one `u64` of state, full period
/// 2⁶⁴, good enough output quality for scattering particles. Deterministic
/// for a given seed on every platform (integer ops only).
pub(crate) struct SplitMix64(u64);

impl SplitMix64 {
    pub(crate) const fn new(seed: u64) -> Self {
        Self(seed)
    }

    pub(crate) const fn next_u64(&mut self) -> u64 {
        self.0 = self.0.wrapping_add(0x9e37_79b9_7f4a_7c15);
        let mut z = self.0;
        z = (z ^ (z >> 30)).wrapping_mul(0xbf58_476d_1ce4_e5b9);
        z = (z ^ (z >> 27)).wrapping_mul(0x94d0_49bb_1331_11eb);
        z ^ (z >> 31)
    }

    /// Uniform in `[0, 1)`.
    ///
    /// Bit trick instead of `(x >> 11) as f64 / 2⁵³`: put 52 random bits in
    /// the mantissa of a float in `[1, 2)` (exponent bits `0x3ff`), then
    /// subtract 1. Exact, branch-free, and no integer-to-float cast.
    pub(crate) fn next_unit_f64(&mut self) -> f64 {
        f64::from_bits(0x3ff0_0000_0000_0000 | (self.next_u64() >> 12)) - 1.0
    }

    /// Uniform in `[lo, hi)`, up to rounding at the top end.
    pub(crate) fn range(&mut self, lo: f64, hi: f64) -> f64 {
        lo + (hi - lo) * self.next_unit_f64()
    }
}

#[cfg(test)]
mod tests {
    use super::SplitMix64;

    #[test]
    fn matches_reference_sequence() {
        // Reference values from an independent Python implementation of
        // the published algorithm; seed 0's first output is the commonly
        // cited 0xe220a8397b1dcdaf.
        let mut r = SplitMix64::new(0);
        assert_eq!(r.next_u64(), 0xe220_a839_7b1d_cdaf);
        assert_eq!(r.next_u64(), 0x6e78_9e6a_a1b9_65f4);
        assert_eq!(r.next_u64(), 0x06c4_5d18_8009_454f);
        let mut r = SplitMix64::new(42);
        assert_eq!(r.next_u64(), 0xbdd7_3226_2feb_6e95);
    }

    #[test]
    fn unit_f64_is_in_half_open_unit_interval() {
        let mut r = SplitMix64::new(7);
        for _ in 0..10_000 {
            let u = r.next_unit_f64();
            assert!((0.0..1.0).contains(&u), "{u}");
        }
    }

    #[test]
    fn range_maps_unit_interval_onto_bounds() {
        let mut r = SplitMix64::new(7);
        for _ in 0..10_000 {
            let x = r.range(-2.0, 3.0);
            assert!((-2.0..3.0).contains(&x), "{x}");
        }
    }
}
