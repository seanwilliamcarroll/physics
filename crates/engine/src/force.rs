//! Force generators: anything that contributes acceleration each substep.

mod pairwise;
mod spring;

pub use pairwise::PairwiseGravity;
pub use spring::{Spring, SpringForce};

use crate::{Particles, Scalar, Vec2};

/// A source of acceleration.
///
/// Called once per substep through `dyn Force<S>`. The indirect call is
/// negligible next to the O(n) or O(n²) loop inside each impl
/// (`docs/02-core-types.md`, "Decision: `dyn Force<S>`").
pub trait Force<S: Scalar> {
    /// Adds this force's acceleration into `acc` (one entry per particle,
    /// zeroed by the world before the first force runs). Must add, never
    /// overwrite, so multiple forces combine.
    ///
    /// Accelerations, not forces: static particles (`inv_mass = 0`) are
    /// skipped, since a static has no mass to divide by or to pull with.
    /// (Skipping them isn't what keeps them still: `kick` and `drift` never
    /// move a static, whatever a force writes for it.)
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]);
}

/// The same acceleration `g` for every dynamic particle, e.g.
/// `(0, -STANDARD_GRAVITY)` m/s² (see [`crate::scenarios::STANDARD_GRAVITY`]).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct UniformGravity<S> {
    g: Vec2<S>,
}

impl<S: Scalar> UniformGravity<S> {
    #[must_use]
    pub const fn new(g: Vec2<S>) -> Self {
        Self { g }
    }

    /// The acceleration, m/s².
    pub const fn g(&self) -> Vec2<S> {
        self.g
    }
}

impl<S: Scalar> Force<S> for UniformGravity<S> {
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]) {
        for (a, &w) in acc.iter_mut().zip(p.inv_mass()) {
            if w != S::ZERO {
                *a += self.g;
            }
        }
    }
}

#[cfg(test)]
mod tests;
