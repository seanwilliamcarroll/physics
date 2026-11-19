//! The ground (`docs/06-constraints.md`, "Ground"): a half-plane clamp, not
//! contacts. After every substep, a dynamic particle at or below the
//! ground's height moves up to it and loses its downward velocity:
//! inelastic, no friction.

use super::World;
use crate::{Particles, Scalar};

impl<S: Scalar> World<S> {
    #[cfg(test)]
    #[must_use]
    pub(crate) const fn ground(&self) -> Option<S> {
        self.ground
    }

    /// Sets the ground's height `y` (m), or removes it with `None`; `NaN`
    /// clamps nothing.
    pub const fn set_ground(&mut self, y: Option<S>) {
        self.ground = y;
    }
}

/// Clamps dynamic particles to `y >= ground_y`, zeroing downward velocity.
/// "At or below", not just below: explicit Euler leaves a resting particle
/// on the ground with a downward velocity.
pub(super) fn clamp<S: Scalar>(particles: &mut Particles<S>, ground_y: S) {
    let dynamic = particles
        .inverse_mass
        .iter()
        .map(|&inverse_mass| inverse_mass != S::ZERO);
    for ((position, velocity), dynamic) in particles
        .positions
        .iter_mut()
        .zip(particles.velocities.iter_mut())
        .zip(dynamic)
    {
        if dynamic && position.y <= ground_y {
            position.y = ground_y;
            if velocity.y < S::ZERO {
                velocity.y = S::ZERO;
            }
        }
    }
}

#[cfg(test)]
mod tests;
