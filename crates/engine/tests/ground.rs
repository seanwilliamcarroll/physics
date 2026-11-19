//! The ground (`docs/06-constraints.md`, "Ground"): a half-plane clamp
//! after every substep, under every stepper. Dropped bodies land and rest
//! on it, it only ever removes energy, static particles ignore it, and with
//! no ground (the default) nothing changes.
#![cfg(test)]

use engine::scenarios::{pendulum, pendulum_gravity};
use engine::{DistanceConstraint, Integrator, Scalar, Solver, Vec2, World};
use test_support::{for_each_scalar, kg, nonzero, pendulum_energy, s, state_bits, time_step, v};

const DT: f64 = 1.0 / 60.0;
const SUBSTEPS: u32 = 20;
/// 3 s: a 1 m drop lands in ~0.45 s; the rod has settled long before the end.
const STEPS: u32 = 180;
/// Below the origin, so "on the ground" isn't "at zero" by accident.
const GROUND: f64 = -0.5;
const DROP_HEIGHT: f64 = 1.0;

fn dropped_particle<S: Scalar>(integrator: Integrator) -> World<S> {
    let mut world = World::new(integrator, nonzero(SUBSTEPS));
    world.add_force(pendulum_gravity());
    let _ = world.add_particle(v(0.0, GROUND + DROP_HEIGHT), Vec2::ZERO, kg(1.0));
    world.set_ground(Some(s(GROUND)));
    world
}

fn dropped_rod<S: Scalar>(solver: Solver) -> World<S> {
    let mut world = World::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    world.add_force(pendulum_gravity());
    let low = GROUND + DROP_HEIGHT;
    let lower_end = world.add_particle(v(0.0, low), Vec2::ZERO, kg(1.0));
    let upper_end = world.add_particle(v(0.75_f64.sqrt(), low + 0.5), Vec2::ZERO, kg(1.0));
    let rod = DistanceConstraint::between(world.particles(), lower_end, upper_end).unwrap();
    world.add_constraint(rod).unwrap();
    world.set_solver(solver);
    world.set_ground(Some(s(GROUND)));
    world
}

fn max_energy_gain<S: Scalar>(world: &mut World<S>) -> f64 {
    let mut energy = pendulum_energy(world);
    let mut gain = f64::NEG_INFINITY;
    for _ in 0..STEPS {
        world.step(time_step(DT));
        let next_energy = pendulum_energy(world);
        gain = gain.max(next_energy - energy);
        energy = next_energy;
    }
    gain
}

fn rest_error<S: Scalar>(world: &World<S>) -> (f64, f64) {
    let particles = world.particles();
    let gap = particles
        .pos()
        .iter()
        .map(|position| (position.y.to_f64() - GROUND).abs());
    let speed = particles
        .vel()
        .iter()
        .map(|velocity| velocity.length().to_f64());
    (gap.fold(0.0, f64::max), speed.fold(0.0, f64::max))
}

/// Integrator path, every integrator: the particle ends exactly on the
/// ground, exactly at rest (measured: 0 and 0 in f32 and f64). Exact
/// because a resting particle sinks a little each substep and the clamp
/// puts it back to the same bits with zero velocity; explicit Euler,
/// which moves before it accelerates, stays *on* the ground with a
/// downward velocity, which the clamp also zeroes (it acts at, not only
/// below, the ground).
fn a_dropped_particle_lands_and_rests<S: Scalar>() {
    for integrator in Integrator::ALL {
        let mut world = dropped_particle::<S>(integrator);
        for _ in 0..STEPS {
            world.step(time_step(DT));
        }
        assert_eq!(world.particles().pos(), &[v(0.0, GROUND)], "{integrator:?}");
        assert_eq!(world.particles().vel(), &[Vec2::ZERO], "{integrator:?}");
    }
}
for_each_scalar!(a_dropped_particle_lands_and_rests);

/// Both solvers: the tilted rod lands end first, falls flat, and rests.
/// Measured (f64): impulse ends exactly on the ground and at rest; XPBD
/// exactly on the ground, sliding at 2.4e-12 m/s (its derived velocity's
/// rounding; with no friction nothing stops it, and horizontal momentum
/// starts at 0 and only rounding changes it). Bound ~10x the larger.
/// (f32, not asserted: XPBD slides at 1.9 mm/s, the derived-velocity noise
/// `docs/06-constraints.md` measured; impulse is exact.)
#[test]
fn a_dropped_rod_lands_and_rests_under_both_solvers() {
    const SPEED_TOL: f64 = 3e-11;
    for solver in Solver::ALL {
        let mut world = dropped_rod::<f64>(solver);
        for _ in 0..STEPS {
            world.step(time_step(DT));
        }
        let (gap, speed) = rest_error(&world);
        println!("{solver:?}: |y - ground| {gap:e} m, speed {speed:e} m/s");
        assert!(gap == 0.0, "{solver:?}: {gap} m off the ground");
        assert!(
            speed <= SPEED_TOL,
            "{solver:?}: still moving at {speed} m/s"
        );
    }
}

/// Energy (kinetic + gravity, potential zero at y = 0) never rises over a
/// step, for the symplectic integrators and both solvers. Measured (f64,
/// largest gain over any step): symplectic Euler 0, velocity Verlet
/// 3.6e-14 J (rounding in a ~5 J sum), XPBD 0, impulse 0. Explicit Euler
/// is left out: it gains 6.7e-4 J a step in free fall, ground or not
/// (`docs/01-solvers.md`).
///
/// Why it can't rise for a lone particle: a clamped particle ends the
/// substep at the ground with no vertical velocity, the least energy it
/// can have with its horizontal speed, so whatever it had at the start of
/// the substep was at least that. Moving it up does add `m g d`, but only
/// back up to where it started the substep or lower.
#[test]
fn energy_only_drops_at_impacts() {
    const GAIN_TOL: f64 = 4e-13;
    for integrator in [Integrator::SymplecticEuler, Integrator::VelocityVerlet] {
        let mut world = dropped_particle::<f64>(integrator);
        let gain = max_energy_gain(&mut world);
        println!("{integrator:?}: max gain {gain:e} J");
        assert!(gain <= GAIN_TOL, "{integrator:?} gained {gain} J");
    }
    for solver in Solver::ALL {
        let mut world = dropped_rod::<f64>(solver);
        let start_energy = pendulum_energy(&world);
        let gain = max_energy_gain(&mut world);
        println!("{solver:?}: max gain {gain:e} J");
        assert!(gain <= GAIN_TOL, "{solver:?} gained {gain} J");
        assert!(pendulum_energy(&world) < start_energy, "{solver:?}");
    }
}

/// A static particle below the ground stays put, bit for bit: alone under
/// every integrator, and as a pendulum's pin under both solvers (only the
/// bob is clamped, and the rod fights the clamp; not checked here).
#[test]
fn static_particles_below_the_ground_are_not_moved() {
    const ABOVE: f64 = 0.5;
    for integrator in Integrator::ALL {
        let mut world = World::<f64>::new(integrator, nonzero(SUBSTEPS));
        world.add_force(pendulum_gravity());
        let pin = world.add_static(v(0.0, GROUND));
        world.set_ground(Some(GROUND + ABOVE));
        for _ in 0..STEPS {
            world.step(time_step(DT));
        }
        assert_eq!(
            world.particles().pos()[pin.index()],
            v(0.0, GROUND),
            "{integrator:?}"
        );
        assert_eq!(
            world.particles().vel()[pin.index()],
            Vec2::ZERO,
            "{integrator:?}"
        );
    }
    for solver in Solver::ALL {
        let mut world = pendulum::<f64>(solver, nonzero(SUBSTEPS)).unwrap();
        let pin = world.particles().pos()[0];
        world.set_ground(Some(pin.y + ABOVE));
        for _ in 0..STEPS {
            world.step(time_step(DT));
        }
        assert_eq!(world.particles().pos()[0], pin, "{solver:?}");
        assert_eq!(world.particles().vel()[0], Vec2::ZERO, "{solver:?}");
    }
}

/// No ground changes nothing: setting one and removing it, or setting one
/// nothing reaches (the bob swings no lower than 1 m below the pin), steps
/// bit-identically to never having one.
#[test]
fn no_ground_or_an_unreached_one_changes_nothing() {
    const FAR_BELOW: f64 = -2.0;
    for solver in Solver::ALL {
        let run = |ground: Option<Option<f64>>| {
            let mut world = pendulum::<f64>(solver, nonzero(SUBSTEPS)).unwrap();
            if let Some(final_ground) = ground {
                world.set_ground(Some(0.0));
                world.set_ground(final_ground);
            }
            for _ in 0..STEPS {
                world.step(time_step(DT));
            }
            state_bits(world.particles())
        };
        let never = run(None);
        assert!(run(Some(None)) == never, "{solver:?}: set then removed");
        assert!(run(Some(Some(FAR_BELOW))) == never, "{solver:?}: unreached");
    }
}
