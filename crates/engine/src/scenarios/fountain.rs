//! [`Fountain`]: particles launched and relaunched under standard gravity.

use core::num::NonZeroU32;

use super::shared::STANDARD_GRAVITY;
use crate::rng::SplitMix64;
use crate::{Integrator, Mass, Scalar, UniformGravity, Vec2, World};

/// Substeps per fixed step for [`Fountain`]. One is enough: symplectic
/// Euler's error under constant gravity is ½ g h t (`tests/invariants.rs`),
/// about 8 cm after 1 s of flight at 60 Hz, invisible at demo scale.
pub const FOUNTAIN_SUBSTEPS: NonZeroU32 = NonZeroU32::MIN;

/// Launch velocity ranges for [`Fountain`], m/s: `(min, max)`.
pub const FOUNTAIN_VX: (f64, f64) = (-2.0, 2.0);
pub const FOUNTAIN_VY: (f64, f64) = (8.0, 12.0);

/// Unit-mass particles launched from the origin with random upward
/// velocities under standard gravity, relaunched once they fall below the
/// launch height.
///
/// Owns the PRNG, so the whole run (initial launch and every respawn) is
/// deterministic for a given seed. Randomness is drawn in `f64` and
/// converted once, so every scalar type sees the same values (up to its own
/// rounding).
pub struct Fountain {
    rng: SplitMix64,
}

impl Fountain {
    #[must_use]
    pub const fn new(seed: u64) -> Self {
        Self {
            rng: SplitMix64::new(seed),
        }
    }

    /// Builds a world with `particle_count` freshly launched particles.
    #[must_use]
    pub fn world<S: Scalar>(&mut self, particle_count: usize) -> World<S> {
        let mut world = World::new(Integrator::SymplecticEuler, FOUNTAIN_SUBSTEPS);
        world.add_force(UniformGravity::new(Vec2::from_f64(0.0, -STANDARD_GRAVITY)));
        for _ in 0..particle_count {
            let velocity = self.launch_velocity();
            world.particles.add(Vec2::ZERO, velocity, Mass::ONE);
        }
        world
    }

    /// Relaunches every dynamic particle below the launch height (y < 0)
    /// from the origin with a new random velocity. Returns how many.
    ///
    /// A teleport, not physics: it breaks momentum and energy conservation
    /// on purpose. Call it between steps, never inside invariant tests.
    pub fn respawn_fallen<S: Scalar>(&mut self, world: &mut World<S>) -> usize {
        let particles = &mut world.particles;
        let mut respawned = 0;
        for ((position, velocity), &inverse_mass) in particles
            .pos
            .iter_mut()
            .zip(&mut particles.vel)
            .zip(&particles.inv_mass)
        {
            if inverse_mass != S::ZERO && position.y < S::ZERO {
                *position = Vec2::ZERO;
                *velocity = self.launch_velocity();
                respawned += 1;
            }
        }
        respawned
    }

    fn launch_velocity<S: Scalar>(&mut self) -> Vec2<S> {
        let vx = self.rng.range(FOUNTAIN_VX.0, FOUNTAIN_VX.1);
        let vy = self.rng.range(FOUNTAIN_VY.0, FOUNTAIN_VY.1);
        Vec2::from_f64(vx, vy)
    }
}

#[cfg(test)]
mod tests;
