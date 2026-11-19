//! Force generators: anything that contributes acceleration each substep.

mod pairwise;
mod spring;

pub use pairwise::PairwiseGravity;
pub use spring::{Spring, SpringForce};

use crate::{Particles, Scalar, Vec2};

/// A source of acceleration, called once per substep through `dyn Force<S>`
/// (`docs/02-core-types.md`, "Decision: `dyn Force<S>`").
pub trait Force<S: Scalar> {
    /// Adds this force's acceleration into `accelerations` (one entry per
    /// particle, zeroed before the first force runs): add, never overwrite.
    /// Static particles (`inv_mass = 0`) are skipped.
    fn accumulate(&self, particles: &Particles<S>, accelerations: &mut [Vec2<S>]);
}

/// The same acceleration `g` for every dynamic particle, e.g.
/// `(0, -STANDARD_GRAVITY)` m/s² (see [`crate::scenarios::STANDARD_GRAVITY`]).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct UniformGravity<S> {
    acceleration: Vec2<S>,
}

impl<S: Scalar> UniformGravity<S> {
    #[must_use]
    pub const fn new(acceleration: Vec2<S>) -> Self {
        Self { acceleration }
    }

    /// The acceleration, m/s².
    pub const fn g(&self) -> Vec2<S> {
        self.acceleration
    }
}

impl<S: Scalar> Force<S> for UniformGravity<S> {
    fn accumulate(&self, particles: &Particles<S>, accelerations: &mut [Vec2<S>]) {
        for (acceleration, &inv_mass) in accelerations.iter_mut().zip(particles.inv_mass()) {
            if inv_mass != S::ZERO {
                *acceleration += self.acceleration;
            }
        }
    }
}

#[cfg(test)]
mod tests;
