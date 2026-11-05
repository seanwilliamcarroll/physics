//! [`Fnv1a`]: the fixed, published hash behind every golden-hash test
//! (the engine's particle states, the acoustic track's audio).

/// FNV-1a, 64-bit: a tiny hash with published constants and fixed output,
/// unlike `std`'s `DefaultHasher`, which may change between Rust versions.
/// Golden hashes need output that never changes. Not for adversarial
/// input (it isn't collision-resistant); fine for change detection.
pub struct Fnv1a(u64);

impl Fnv1a {
    /// The FNV-1a 64-bit offset basis (Fowler, Noll, Vo; IETF draft
    /// "The FNV Non-Cryptographic Hash Algorithm").
    const OFFSET_BASIS: u64 = 0xcbf2_9ce4_8422_2325;
    /// The FNV 64-bit prime, 2⁴⁰ + 2⁸ + 0xb3.
    const PRIME: u64 = 0x0000_0100_0000_01b3;

    #[must_use]
    pub const fn new() -> Self {
        Self(Self::OFFSET_BASIS)
    }

    pub fn write(&mut self, bytes: &[u8]) {
        for &b in bytes {
            self.0 = (self.0 ^ u64::from(b)).wrapping_mul(Self::PRIME);
        }
    }

    #[must_use]
    pub const fn finish(&self) -> u64 {
        self.0
    }
}

impl Default for Fnv1a {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests;
