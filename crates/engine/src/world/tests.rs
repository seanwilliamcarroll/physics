use core::num::NonZeroU32;

use super::World;
use crate::Integrator;
use crate::scenarios::orbit;

#[test]
fn set_integrator_switches_how_later_steps_integrate() {
    // Switching before the first step must equal building with that
    // integrator, bit for bit.
    let mut switched = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    switched.set_integrator(Integrator::VelocityVerlet);
    assert_eq!(switched.integrator(), Integrator::VelocityVerlet);
    let mut built = orbit::<f64>(Integrator::VelocityVerlet, 1.0).unwrap();
    for _ in 0..100 {
        switched.step(1.0 / 60.0);
        built.step(1.0 / 60.0);
    }
    assert_eq!(switched.particles.pos(), built.particles.pos());
    assert_eq!(switched.particles.vel(), built.particles.vel());
}

#[test]
fn integrator_reports_what_new_was_given() {
    for integrator in Integrator::ALL {
        let w = World::<f32>::new(integrator, NonZeroU32::MIN);
        assert_eq!(w.integrator(), integrator);
    }
}

#[test]
fn clear_forces_leaves_particles_coasting() {
    // Orbit with its gravity cleared: no force, so each body moves in a
    // straight line at its launch velocity.
    let mut w = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    let (x0, v0) = (w.particles.pos().to_vec(), w.particles.vel().to_vec());
    w.clear_forces();
    w.step(0.5);
    assert_eq!(w.particles.vel(), v0.as_slice());
    for ((x, x0), v0) in w.particles.pos().iter().zip(&x0).zip(&v0) {
        assert_eq!(*x, *x0 + *v0 * 0.5);
    }
}

#[test]
fn forces_re_added_after_clear_apply_again() {
    // clear + re-add the same force is the same world as never clearing:
    // how the demo's softening slider rebuilds a scene's force.
    let mut a = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    let mut b = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    b.clear_forces();
    b.add_force(crate::scenarios::orbit_gravity().unwrap());
    for _ in 0..10 {
        a.step(0.01);
        b.step(0.01);
    }
    assert_eq!(a.particles.pos(), b.particles.pos());
}

#[test]
fn config_errors_explain_themselves() {
    use super::ConfigError;
    assert!(ConfigError::InvalidMass.to_string().contains("mass"));
    assert_eq!(
        World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::new(3).unwrap())
            .substeps()
            .get(),
        3
    );
}

#[test]
fn add_constraint_rejects_bodies_from_another_world() {
    use super::ConfigError;
    use crate::params::kg;
    use crate::{DistanceConstraint, Vec2};
    let mut big = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    let a = big.particles.add_static(Vec2::ZERO);
    let _ = big.particles.add_static(Vec2::new(1.0, 0.0));
    let c = big.particles.add(Vec2::new(2.0, 0.0), Vec2::ZERO, kg(1.0));
    let rod = DistanceConstraint::between(&big.particles, a, c).unwrap();

    let mut small = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    let _ = small.particles.add_static(Vec2::ZERO);
    assert_eq!(small.add_constraint(rod), Err(ConfigError::UnknownParticle));
    assert_eq!(small.constraints(), []);
    assert_eq!(big.add_constraint(rod), Ok(()));
    assert_eq!(big.constraints(), [rod]);
    assert!(
        ConfigError::UnknownParticle
            .to_string()
            .contains("particle")
    );
}

#[test]
fn substeps_and_iterations_are_settable() {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    assert_eq!(w.iterations().get(), 1);
    w.set_substeps(NonZeroU32::new(20).unwrap());
    w.set_iterations(NonZeroU32::new(3).unwrap());
    assert_eq!((w.substeps().get(), w.iterations().get()), (20, 3));
}

#[test]
fn baumgarte_defaults_to_box2d_and_survives_solver_switches() {
    use crate::{Baumgarte, DEFAULT_BAUMGARTE, Solver};
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    assert_eq!(w.baumgarte().get(), DEFAULT_BAUMGARTE);
    w.set_baumgarte(Baumgarte::new(0.5).unwrap());
    w.set_solver(Solver::Impulse);
    w.set_solver(Solver::Xpbd);
    assert_eq!(w.baumgarte().get(), 0.5);
}

#[test]
fn stabilization_defaults_to_split_and_the_pendulum_scenes_choose_classic() {
    use crate::scenarios::{DoublePendulumStart, double_pendulum, pendulum};
    use crate::{Solver, Stabilization};
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    assert_eq!(w.stabilization(), Stabilization::Split);
    w.set_stabilization(Stabilization::Baumgarte);
    assert_eq!(w.stabilization(), Stabilization::Baumgarte);
    // 01's measurements and the double pendulum's energy need classic.
    let p = pendulum::<f64>(Solver::Impulse, NonZeroU32::MIN).unwrap();
    let d = double_pendulum::<f64>(
        Solver::Impulse,
        NonZeroU32::MIN,
        DoublePendulumStart::Raised,
        0.0,
    )
    .unwrap();
    assert_eq!(
        (p.stabilization(), d.stabilization()),
        (Stabilization::Baumgarte, Stabilization::Baumgarte)
    );
}

#[test]
fn a_world_collides_once_it_has_a_wall_or_a_circle() {
    use crate::params::kg;
    use crate::{Radius, Restitution, Vec2, Wall};
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    w.particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    assert!(!w.collides(), "points never collide");
    let mut walled = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    walled.add_wall(Wall::through(
        Vec2::ZERO,
        Vec2::new(0.0, 1.0).normalized().unwrap(),
    ));
    assert!(walled.collides());
    assert_eq!(walled.walls().len(), 1);
    w.particles
        .add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), Radius::new(0.1).unwrap());
    assert!(w.collides());
    assert_eq!(w.restitution(), Restitution::INELASTIC);
    w.set_restitution(Restitution::ELASTIC);
    assert_eq!(w.restitution().get(), 1.0);
}
