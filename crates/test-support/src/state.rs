//! The particle state the repeatability tests compare, as bits.

use engine::{Particles, Scalar};

/// The full particle state: every position, velocity and inverse mass, as
/// the bits of `to_f64()` (exact for f32, so every distinct value,
/// including -0.0 against 0.0 and each NaN, compares as itself). Compared
/// whole, two runs agree exactly or not at all.
#[must_use]
pub fn state_bits<S: Scalar>(p: &Particles<S>) -> Vec<u64> {
    let mut out = Vec::with_capacity(p.pos().len() * 5);
    for ((x, v), &w) in p.pos().iter().zip(p.vel()).zip(p.inv_mass()) {
        for value in [x.x, x.y, v.x, v.y, w] {
            out.push(value.to_f64().to_bits());
        }
    }
    out
}
