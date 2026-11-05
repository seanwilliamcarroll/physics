//! The particle-state hash behind the golden-hash tests (FNV-1a, from
//! `math`).

use engine::{Particles, Scalar};
use math::Fnv1a;

/// Hash of the full particle state: every position, velocity, and inverse
/// mass, as the little-endian bits of `to_f64()`. That conversion is exact
/// for f32, so every distinct f32 value (including -0.0 vs 0.0) hashes
/// differently.
#[must_use]
pub fn state_hash<S: Scalar>(p: &Particles<S>) -> u64 {
    let mut h = Fnv1a::new();
    let mut put = |x: S| h.write(&x.to_f64().to_bits().to_le_bytes());
    for ((x, v), &w) in p.pos().iter().zip(p.vel()).zip(p.inv_mass()) {
        put(x.x);
        put(x.y);
        put(v.x);
        put(v.y);
        put(w);
    }
    h.finish()
}
