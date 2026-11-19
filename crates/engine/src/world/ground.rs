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

    /// Sets the ground's height `y` (m), or removes it with `None`; from
    /// the next step, for every stepper (integrator and both solvers).
    /// A non-finite height is the caller's to avoid: `NaN` clamps nothing.
    pub const fn set_ground(&mut self, y: Option<S>) {
        self.ground = y;
    }
}

/// Clamps every dynamic particle to `y >= ground_y`: one at or below it
/// moves up to it, and a downward velocity becomes zero (horizontal
/// velocity is kept: no friction). At the ground, not just below, so a
/// resting particle that a stepper left on the ground with a downward
/// velocity (explicit Euler moves before it accelerates) stops too. Static
/// particles are left where they are.
pub(super) fn clamp<S: Scalar>(particles: &mut Particles<S>, ground_y: S) {
    let dynamic = particles
        .inv_mass
        .iter()
        .map(|&inv_mass| inv_mass != S::ZERO);
    for ((position, velocity), dynamic) in particles
        .pos
        .iter_mut()
        .zip(particles.vel.iter_mut())
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
