//! Ready-made worlds, shared by tests and demos: the scene you test is the
//! scene you demo. All in SI units.

use crate::rng::SplitMix64;
use crate::{ConfigError, Integrator, Scalar, UniformGravity, Vec2, World};

/// Standard gravity, m/s² (pointing down: y is up).
pub const STANDARD_GRAVITY: f64 = -9.81;

/// Launch velocity ranges for [`fountain`], m/s: `(min, max)`.
pub const FOUNTAIN_VX: (f64, f64) = (-2.0, 2.0);
pub const FOUNTAIN_VY: (f64, f64) = (8.0, 12.0);

/// `n` unit-mass particles launched from the origin with random upward
/// velocities under standard gravity: the M0 demo.
///
/// Randomness is drawn in `f64` and converted once, so every scalar type
/// starts from the same values (up to its own rounding).
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't: 1 substep); the
/// `Result` comes from [`World::new`].
pub fn fountain<S: Scalar>(n: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(Integrator::SymplecticEuler, 1)?;
    w.add_force(UniformGravity::new(Vec2::new(
        S::ZERO,
        S::from_f64(STANDARD_GRAVITY),
    )));
    let mut rng = SplitMix64::new(seed);
    for _ in 0..n {
        let vx = rng.range(FOUNTAIN_VX.0, FOUNTAIN_VX.1);
        let vy = rng.range(FOUNTAIN_VY.0, FOUNTAIN_VY.1);
        let vel = Vec2::new(S::from_f64(vx), S::from_f64(vy));
        w.particles.add(Vec2::ZERO, vel, S::ONE);
    }
    Ok(w)
}

#[cfg(test)]
mod tests {
    use super::{FOUNTAIN_VX, FOUNTAIN_VY, fountain};
    use crate::Vec2;

    #[test]
    fn fountain_launches_n_particles_upward_from_the_origin() {
        let w = fountain::<f64>(100, 1).unwrap();
        assert_eq!(w.particles.len(), 100);
        assert!(w.particles.pos().iter().all(|&p| p == Vec2::ZERO));
        for v in w.particles.vel() {
            assert!((FOUNTAIN_VX.0..FOUNTAIN_VX.1).contains(&v.x), "{v:?}");
            assert!((FOUNTAIN_VY.0..FOUNTAIN_VY.1).contains(&v.y), "{v:?}");
        }
    }

    #[test]
    fn fountain_is_deterministic_per_seed() {
        let a = fountain::<f32>(50, 7).unwrap();
        let b = fountain::<f32>(50, 7).unwrap();
        let c = fountain::<f32>(50, 8).unwrap();
        assert_eq!(a.particles.vel(), b.particles.vel());
        assert_ne!(a.particles.vel(), c.particles.vel());
    }

    #[test]
    fn fountain_particles_fall_back_down() {
        // vy < 12 m/s under 9.81 m/s² lands within ~2.5 s.
        let mut w = fountain::<f64>(20, 3).unwrap();
        for _ in 0..180 {
            w.step(1.0 / 60.0);
        }
        assert!(w.particles.pos().iter().all(|p| p.y < 0.0));
    }
}
