//! The ground (`docs/06-constraints.md`,
//! "Ground"): a half-plane clamp, not contacts. After every substep, a
//! dynamic particle at or below the ground's height moves up to it and
//! loses its downward velocity: inelastic, no friction.

use super::World;
use crate::{Particles, Scalar};

impl<S: Scalar> World<S> {
    /// Test-only: the ground's height, m, or `None` (the default) for no
    /// ground.
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

/// Clamps every dynamic particle to `y >= ground`: one at or below it moves
/// up to it, and a downward velocity becomes zero (horizontal velocity is
/// kept: no friction). At the ground, not just below, so a resting particle
/// that a stepper left on the ground with a downward velocity (explicit
/// Euler moves before it accelerates) stops too. Static particles are left
/// where they are.
pub(super) fn clamp<S: Scalar>(p: &mut Particles<S>, ground: S) {
    let dynamic = p.inv_mass.iter().map(|&w| w != S::ZERO);
    for ((x, v), dynamic) in p.pos.iter_mut().zip(p.vel.iter_mut()).zip(dynamic) {
        if dynamic && x.y <= ground {
            x.y = ground;
            if v.y < S::ZERO {
                v.y = S::ZERO;
            }
        }
    }
}

#[cfg(test)]
mod tests;
