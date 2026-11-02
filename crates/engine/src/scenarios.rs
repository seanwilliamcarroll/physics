//! Ready-made worlds, shared by tests and demos: the scene you test is the
//! scene you demo. All in SI units.

use crate::rng::SplitMix64;
use crate::{ConfigError, Integrator, Scalar, UniformGravity, Vec2, World};

/// Standard gravity g₀, m/s²: a magnitude, applied downward (y is up) as
/// `(0, -g₀)`. Exact by definition (3rd CGPM, 1901), not a measurement.
pub const STANDARD_GRAVITY: f64 = 9.80665;

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
            w.particles.add(Vec2::ZERO, vel, S::ONE);
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
mod tests {
    use super::{FOUNTAIN_VX, FOUNTAIN_VY, Fountain};
    use crate::{Vec2, World};

    fn in_launch_range(v: Vec2<f64>) -> bool {
        (FOUNTAIN_VX.0..FOUNTAIN_VX.1).contains(&v.x)
            && (FOUNTAIN_VY.0..FOUNTAIN_VY.1).contains(&v.y)
    }

    fn run(w: &mut World<f64>, steps: u32) {
        for _ in 0..steps {
            w.step(1.0 / 60.0);
        }
    }

    #[test]
    fn launches_n_particles_upward_from_the_origin() {
        let w = Fountain::new(1).world::<f64>(100).unwrap();
        assert_eq!(w.particles.len(), 100);
        assert!(w.particles.pos().iter().all(|&p| p == Vec2::ZERO));
        assert!(w.particles.vel().iter().all(|&v| in_launch_range(v)));
    }

    #[test]
    fn is_deterministic_per_seed() {
        let a = Fountain::new(7).world::<f32>(50).unwrap();
        let b = Fountain::new(7).world::<f32>(50).unwrap();
        let c = Fountain::new(8).world::<f32>(50).unwrap();
        assert_eq!(a.particles.vel(), b.particles.vel());
        assert_ne!(a.particles.vel(), c.particles.vel());
    }

    #[test]
    fn particles_fall_below_launch_height_without_respawn() {
        // vy < 12 m/s under standard gravity lands within ~2.5 s.
        let mut w = Fountain::new(3).world::<f64>(20).unwrap();
        run(&mut w, 180);
        assert!(w.particles.pos().iter().all(|p| p.y < 0.0));
    }

    #[test]
    fn respawn_relaunches_only_fallen_particles() {
        let mut scene = Fountain::new(3);
        let mut w = scene.world::<f64>(20).unwrap();
        run(&mut w, 30); // 0.5 s: everything still rising or airborne
        let airborne = (w.particles.pos().to_vec(), w.particles.vel().to_vec());
        assert_eq!(scene.respawn_fallen(&mut w), 0);
        assert_eq!(w.particles.pos(), airborne.0);
        assert_eq!(w.particles.vel(), airborne.1);

        run(&mut w, 150); // 3 s total: everything has fallen
        assert_eq!(scene.respawn_fallen(&mut w), 20);
        assert!(w.particles.pos().iter().all(|&p| p == Vec2::ZERO));
        assert!(w.particles.vel().iter().all(|&v| in_launch_range(v)));
    }

    #[test]
    fn respawn_skips_static_particles() {
        let mut scene = Fountain::new(3);
        let mut w = scene.world::<f64>(0).unwrap();
        let below = Vec2::new(1.0, -5.0);
        w.particles.add_static(below);
        assert_eq!(scene.respawn_fallen(&mut w), 0);
        assert_eq!(w.particles.pos(), [below]);
    }

    #[test]
    fn steady_state_keeps_every_particle_in_play() {
        let mut scene = Fountain::new(9);
        let mut w = scene.world::<f64>(50).unwrap();
        for _ in 0..600 {
            w.step(1.0 / 60.0);
            scene.respawn_fallen(&mut w);
            assert!(w.particles.pos().iter().all(|p| p.y >= 0.0));
        }
    }
}
