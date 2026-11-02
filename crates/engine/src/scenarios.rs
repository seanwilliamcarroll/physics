//! Ready-made worlds, shared by tests and demos: the scene you test is the
//! scene you demo. All in SI units.

use crate::rng::SplitMix64;
use crate::{ConfigError, Integrator, PairwiseGravity, Scalar, UniformGravity, Vec2, World};

/// Standard gravity g₀, m/s²: a magnitude, applied downward (y is up) as
/// `(0, -g₀)`. Exact by definition (3rd CGPM, 1901), not a measurement.
pub const STANDARD_GRAVITY: f64 = 9.80665;

/// Newtonian constant of gravitation G, m³ kg⁻¹ s⁻²: CODATA 2018
/// recommended value (relative standard uncertainty 2.2 × 10⁻⁵). Unlike
/// [`STANDARD_GRAVITY`] this is a measurement, not a definition.
pub const GRAVITATIONAL_CONSTANT: f64 = 6.674_30e-11;

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

/// Radius of the disk [`cluster`] fills, m.
pub const CLUSTER_RADIUS: f64 = 2.0;

/// Body mass range for [`cluster`], kg: `(min, max)`. With G ≈ 6.7 × 10⁻¹¹,
/// `G m` is 0.3–1.3 m³/s², so bodies a meter apart accelerate at about
/// 1 m/s²: visible motion within seconds at demo scale, in SI units.
pub const CLUSTER_MASS: (f64, f64) = (0.5e10, 2.0e10);

/// Largest initial speed per axis for [`cluster`], m/s. Random drift gives
/// the cluster a nonzero net momentum, so conservation tests have a value
/// to conserve (zero could hide a sign error).
pub const CLUSTER_SPEED: f64 = 0.2;

/// Softening ε for [`cluster`], m: 1/20 of the radius, so close passes
/// give a bounded kick instead of flinging bodies apart.
pub const CLUSTER_SOFTENING: f64 = 0.1;

/// Substeps for [`cluster`]: one; tests probe conservation, not accuracy.
pub const CLUSTER_SUBSTEPS: u32 = 1;

/// `n` bodies under mutual softened gravity: positions uniform in a disk
/// of [`CLUSTER_RADIUS`], masses in [`CLUSTER_MASS`], small random
/// velocities. Deterministic per seed.
///
/// Positions use rejection sampling (draw in the square, keep points
/// inside the disk) rather than `r = R√u, θ = 2πv`: no `sin`/`cos`, whose
/// last bits depend on the platform's libm, so the scene is bit-identical
/// on every platform, which cross-platform golden hashes rely on.
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't:
/// [`CLUSTER_SUBSTEPS`] is nonzero); the `Result` comes from [`World::new`].
pub fn cluster<S: Scalar>(n: usize, seed: u64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS)?;
    w.add_force(PairwiseGravity::new(
        S::from_f64(GRAVITATIONAL_CONSTANT),
        S::from_f64(CLUSTER_SOFTENING),
    ));
    let mut rng = SplitMix64::new(seed);
    let r = CLUSTER_RADIUS;
    for _ in 0..n {
        // Accepts with probability π/4 per try, so ~1.3 tries on average.
        let (x, y) = loop {
            let (x, y) = (rng.range(-r, r), rng.range(-r, r));
            if x * x + y * y <= r * r {
                break (x, y);
            }
        };
        let vx = rng.range(-CLUSTER_SPEED, CLUSTER_SPEED);
        let vy = rng.range(-CLUSTER_SPEED, CLUSTER_SPEED);
        let mass = rng.range(CLUSTER_MASS.0, CLUSTER_MASS.1);
        w.particles.add(
            Vec2::new(S::from_f64(x), S::from_f64(y)),
            Vec2::new(S::from_f64(vx), S::from_f64(vy)),
            S::from_f64(mass),
        );
    }
    Ok(w)
}

/// Star–planet separation for [`orbit`], m.
pub const ORBIT_SEPARATION: f64 = 2.0;

/// Nominal period for [`orbit`], s: the unsoftened Kepler period that
/// fixes the total mass. About 3 s keeps a few orbits on screen per
/// demo-minute while each orbit still spans many 60 Hz steps.
pub const ORBIT_NOMINAL_PERIOD: f64 = 3.0;

/// Planet mass / star mass. Small, so the star barely wobbles and the
/// orbit reads as "planet around star", but not zero: both bodies move,
/// so momentum conservation is still exercised.
pub const ORBIT_MASS_RATIO: f64 = 1.0e-3;

/// Softening ε for [`orbit`], m: 1/200 of the separation, so the force is
/// nearly pure 1/r² (period changes by < 10⁻⁴) while ε = 0 stays an
/// explicit choice for M2.
pub const ORBIT_SOFTENING: f64 = 0.01;

/// Substeps for [`orbit`]: one, so `dt` is exactly what the integrators
/// are compared at.
pub const ORBIT_SUBSTEPS: u32 = 1;

/// Total mass, kg, from Kepler's third law for the nominal period:
/// `G M = 4π² d³ / T²` (about 5.3 × 10¹¹ kg). Evaluated at compile time.
pub const ORBIT_TOTAL_MASS: f64 = 4.0
    * core::f64::consts::PI
    * core::f64::consts::PI
    * ORBIT_SEPARATION
    * ORBIT_SEPARATION
    * ORBIT_SEPARATION
    / (GRAVITATIONAL_CONSTANT * ORBIT_NOMINAL_PERIOD * ORBIT_NOMINAL_PERIOD);

/// Relative speed for a circular orbit under the *softened* force, m/s:
/// `v² / d = G M d / (d² + ε²)^(3/2)`.
///
/// `(d² + ε²)^(3/2)` is computed as `q √q`, not `powf(1.5)`: `sqrt` is
/// correctly rounded everywhere (IEEE 754), `powf` comes from the
/// platform's libm and may differ in the last bits across targets.
#[must_use]
pub fn orbit_relative_speed() -> f64 {
    let (d, eps) = (ORBIT_SEPARATION, ORBIT_SOFTENING);
    let q = d * d + eps * eps;
    (GRAVITATIONAL_CONSTANT * ORBIT_TOTAL_MASS * d * d / (q * q.sqrt())).sqrt()
}

/// The actual (softened) period of the circular orbit, s: `2π d / v`.
#[must_use]
pub fn orbit_period() -> f64 {
    2.0 * core::f64::consts::PI * ORBIT_SEPARATION / orbit_relative_speed()
}

/// The force [`orbit`] adds: G and [`ORBIT_SOFTENING`]. Public so energy
/// readouts (`diagnostics::total_energy`) use exactly the scene's force.
#[must_use]
pub fn orbit_gravity<S: Scalar>() -> PairwiseGravity<S> {
    PairwiseGravity::new(
        S::from_f64(GRAVITATIONAL_CONSTANT),
        S::from_f64(ORBIT_SOFTENING),
    )
}

/// A star and a planet [`ORBIT_SEPARATION`] apart, center of mass at the
/// origin and at rest, advanced by `integrator`.
///
/// `speed_ratio` scales the circular launch speed: 1 is a circle, below 1
/// an ellipse with the planet starting at apoapsis (the precession
/// tests use one). Must be positive: 0 drops the planet straight onto
/// the star.
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't:
/// [`ORBIT_SUBSTEPS`] is nonzero); the `Result` comes from [`World::new`].
pub fn orbit<S: Scalar>(integrator: Integrator, speed_ratio: f64) -> Result<World<S>, ConfigError> {
    let mut w = World::new(integrator, ORBIT_SUBSTEPS)?;
    w.add_force(orbit_gravity());
    // Split the separation and the relative velocity by mass, so the
    // center of mass sits at the origin with zero momentum.
    let q = ORBIT_MASS_RATIO;
    let (star_mass, planet_mass) = (
        ORBIT_TOTAL_MASS / (1.0 + q),
        ORBIT_TOTAL_MASS * q / (1.0 + q),
    );
    let (star_share, planet_share) = (q / (1.0 + q), 1.0 / (1.0 + q));
    let v_rel = orbit_relative_speed() * speed_ratio;
    let d = ORBIT_SEPARATION;
    let vec = |x: f64, y: f64| Vec2::new(S::from_f64(x), S::from_f64(y));
    w.particles.add(
        vec(-d * star_share, 0.0),
        vec(0.0, -v_rel * star_share),
        S::from_f64(star_mass),
    );
    w.particles.add(
        vec(d * planet_share, 0.0),
        vec(0.0, v_rel * planet_share),
        S::from_f64(planet_mass),
    );
    Ok(w)
}

#[cfg(test)]
mod tests {
    use super::{
        CLUSTER_MASS, CLUSTER_RADIUS, CLUSTER_SPEED, FOUNTAIN_VX, FOUNTAIN_VY, Fountain, cluster,
    };
    use super::{
        ORBIT_NOMINAL_PERIOD, ORBIT_SEPARATION, orbit, orbit_gravity, orbit_period,
        orbit_relative_speed,
    };
    use crate::diagnostics::{center_of_mass, momentum};
    use crate::{Force, Integrator, PairwiseGravity, Vec2, World};

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

    #[test]
    fn cluster_places_n_bodies_in_the_disk_with_bounded_mass_and_speed() {
        let w = cluster::<f64>(200, 4).unwrap();
        assert_eq!(w.particles.len(), 200);
        assert!(
            w.particles
                .pos()
                .iter()
                .all(|x| x.length() <= CLUSTER_RADIUS)
        );
        assert!(
            w.particles
                .vel()
                .iter()
                .all(|v| v.x.abs() <= CLUSTER_SPEED && v.y.abs() <= CLUSTER_SPEED)
        );
        let (lo, hi) = CLUSTER_MASS;
        assert!(
            w.particles
                .inv_mass()
                .iter()
                .all(|&iw| (lo..=hi).contains(&(1.0 / iw)))
        );
    }

    #[test]
    fn cluster_is_deterministic_per_seed() {
        let a = cluster::<f32>(16, 1).unwrap();
        let b = cluster::<f32>(16, 1).unwrap();
        let c = cluster::<f32>(16, 2).unwrap();
        assert_eq!(a.particles.pos(), b.particles.pos());
        assert_eq!(a.particles.vel(), b.particles.vel());
        assert_ne!(a.particles.pos(), c.particles.pos());
    }

    #[test]
    fn orbit_starts_centered_at_rest_and_at_the_separation() {
        let w = orbit::<f64>(Integrator::VelocityVerlet, 1.0).unwrap();
        let (pos, vel) = (w.particles.pos(), w.particles.vel());
        assert_eq!(pos.len(), 2);
        assert!((pos[1] - pos[0]).length() - ORBIT_SEPARATION < 1e-12);
        assert!(center_of_mass(&w.particles).unwrap().length() < 1e-12);
        // Zero net momentum, relative to the planet's own momentum.
        let planet_p = vel[1].length() / w.particles.inv_mass()[1];
        assert!(momentum(&w.particles).length() <= 1e-12 * planet_p);
    }

    #[test]
    fn circular_speed_balances_the_softened_pull() {
        // Centripetal check without integrating: the relative acceleration
        // from the actual force must equal v_rel² / d.
        let w = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
        let mut acc = vec![Vec2::ZERO; 2];
        PairwiseGravity::new(super::GRAVITATIONAL_CONSTANT, super::ORBIT_SOFTENING)
            .accumulate(&w.particles, &mut acc);
        let a_rel = (acc[0] - acc[1]).length();
        let v_rel = (w.particles.vel()[1] - w.particles.vel()[0]).length();
        let centripetal = v_rel * v_rel / ORBIT_SEPARATION;
        assert!(
            (a_rel - centripetal).abs() <= 1e-12 * centripetal,
            "{a_rel} vs {centripetal}"
        );
        assert!((v_rel - orbit_relative_speed()).abs() <= 1e-12 * v_rel);
    }

    #[test]
    fn softened_period_is_close_to_the_nominal_one() {
        // ε = 1 cm on a 2 m orbit lengthens the period by ~(1 + ε²/d²)^(3/4).
        let ratio = orbit_period() / ORBIT_NOMINAL_PERIOD;
        assert!(ratio > 1.0 && ratio < 1.0001, "{ratio}");
    }

    #[test]
    fn speed_ratio_scales_the_launch_speed() {
        let circ = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
        let slow = orbit::<f64>(Integrator::SymplecticEuler, 0.8).unwrap();
        let ratio = slow.particles.vel()[1].length() / circ.particles.vel()[1].length();
        assert!((ratio - 0.8).abs() < 1e-12);
    }

    #[test]
    fn orbit_gravity_is_the_force_the_scene_uses() {
        // Same accelerations from orbit_gravity() as from the world's own
        // step: one source for the force, so energy readouts match it.
        let w = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
        let mut acc = vec![Vec2::ZERO; 2];
        orbit_gravity::<f64>().accumulate(&w.particles, &mut acc);
        let mut stepped = orbit::<f64>(Integrator::ExplicitEuler, 1.0).unwrap();
        let v0 = stepped.particles.vel().to_vec();
        stepped.step(1.0); // explicit Euler: v1 = v0 + a(x0) * 1
        for ((v1, v0), a) in stepped.particles.vel().iter().zip(&v0).zip(&acc) {
            assert_eq!(*v1 - *v0, *a);
        }
    }
}
