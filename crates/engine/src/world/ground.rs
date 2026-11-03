//! The ground (`TASKS.md` M5 decision 6; `docs/06-constraints.md`,
//! "Ground"): a half-plane clamp, not contacts. After every substep, a
//! dynamic particle at or below the ground's height moves up to it and
//! loses its downward velocity: inelastic, no friction.

use super::World;
use crate::Scalar;

impl<S: Scalar> World<S> {
    /// The ground's height, m, or `None` (the default) for no ground.
    #[must_use]
    pub const fn ground(&self) -> Option<S> {
        self.ground
    }

    /// Sets the ground's height `y` (m), or removes it with `None`; from
    /// the next step, for every stepper (integrator and both solvers).
    /// A non-finite height is the caller's to avoid: `NaN` clamps nothing.
    pub const fn set_ground(&mut self, y: Option<S>) {
        self.ground = y;
    }
}
