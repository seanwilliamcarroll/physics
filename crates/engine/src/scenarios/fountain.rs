//! [`Fountain`]: the M0 demo, particles launched and relaunched under
//! standard gravity.

use super::shared::STANDARD_GRAVITY;
use crate::rng::SplitMix64;
use crate::{ConfigError, Integrator, Mass, Scalar, UniformGravity, Vec2, World};

/// Substeps per fixed step for [`Fountain`]. One is enough: symplectic
/// Euler's error under constant gravity is ½ g h t (`tests/invariants.rs`),
/// about 8 cm after 1 s of flight at 60 Hz, invisible at demo scale.
pub const FOUNTAIN_SUBSTEPS: u32 = 1;

/// Launch velocity ranges for [`Fountain`], m/s: `(min, max)`.
pub const FOUNTAIN_VX: (f64, f64) = (-2.0, 2.0);
pub const FOUNTAIN_VY: (f64, f64) = (8.0, 12.0);

/// The M0 demo: unit-mass particles launched from the origin with random
/// upward velocities under standard gravity, relaunched once they fall
/// below the launch height.
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

    /// Builds a world with `n` freshly launched particles.
    ///
    /// # Errors
    /// Only if the fixed configuration were invalid (it isn't:
    /// [`FOUNTAIN_SUBSTEPS`] is nonzero); the `Result` comes from [`World::new`].
    pub fn world<S: Scalar>(&mut self, n: usize) -> Result<World<S>, ConfigError> {
        let mut w = World::new(Integrator::SymplecticEuler, FOUNTAIN_SUBSTEPS)?;
        w.add_force(UniformGravity::new(Vec2::new(
            S::ZERO,
            -S::from_f64(STANDARD_GRAVITY),
        )));
        for _ in 0..n {
            let vel = self.launch_velocity();
            w.particles.add(Vec2::ZERO, vel, Mass::ONE);
        }
        Ok(w)
    }

    /// Relaunches every dynamic particle below the launch height (y < 0)
    /// from the origin with a new random velocity. Returns how many.
    ///
    /// A teleport, not physics: it breaks momentum and energy conservation
    /// on purpose. Call it between steps, never inside invariant tests.
    pub fn respawn_fallen<S: Scalar>(&mut self, w: &mut World<S>) -> usize {
        let p = &mut w.particles;
        let mut count = 0;
        for ((x, v), &inv_mass) in p.pos.iter_mut().zip(&mut p.vel).zip(&p.inv_mass) {
            if inv_mass != S::ZERO && x.y < S::ZERO {
                *x = Vec2::ZERO;
                *v = self.launch_velocity();
                count += 1;
            }
        }
        count
    }

    fn launch_velocity<S: Scalar>(&mut self) -> Vec2<S> {
        let vx = self.rng.range(FOUNTAIN_VX.0, FOUNTAIN_VX.1);
        let vy = self.rng.range(FOUNTAIN_VY.0, FOUNTAIN_VY.1);
        Vec2::new(S::from_f64(vx), S::from_f64(vy))
    }
}

#[cfg(test)]
mod tests;
