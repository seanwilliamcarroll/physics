//! The particle state the repeatability tests compare, as bits.

use engine::{Particles, Scalar};

/// The full particle state: every position, velocity and inverse mass, as
/// the bits of `to_f64()` (exact for f32, so every distinct value,
/// including -0.0 against 0.0 and each NaN, compares as itself). Compared
/// whole, two runs agree exactly or not at all.
#[must_use]
pub fn state_bits<S: Scalar>(particles: &Particles<S>) -> Vec<u64> {
    let mut bits = Vec::with_capacity(particles.pos().len() * 5);
    for ((pos, vel), &inv_mass) in particles
        .pos()
        .iter()
        .zip(particles.vel())
        .zip(particles.inv_mass())
    {
        for value in [pos.x, pos.y, vel.x, vel.y, inv_mass] {
            bits.push(value.to_f64().to_bits());
        }
    }
    bits
}
