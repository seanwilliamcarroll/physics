//! The particle state the repeatability tests compare, as bits.

use engine::{Particles, Scalar};

/// Every position, velocity and inverse mass as `to_f64()` bits (exact for
/// f32): runs agree exactly or not at all, `-0.0` and NaNs included.
#[must_use]
pub fn state_bits<S: Scalar>(particles: &Particles<S>) -> Vec<u64> {
    let mut bits = Vec::with_capacity(particles.positions().len() * 5);
    for ((pos, vel), &inverse_mass) in particles
        .positions()
        .iter()
        .zip(particles.velocities())
        .zip(particles.inverse_mass())
    {
        for value in [pos.x, pos.y, vel.x, vel.y, inverse_mass] {
            bits.push(value.to_f64().to_bits());
        }
    }
    bits
}
