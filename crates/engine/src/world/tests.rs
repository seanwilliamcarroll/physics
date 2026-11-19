use crate::test_util::time_step;
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
        switched.step(time_step(1.0 / 60.0));
        built.step(time_step(1.0 / 60.0));
    }
    assert_eq!(switched.particles.pos(), built.particles.pos());
    assert_eq!(switched.particles.vel(), built.particles.vel());
}

#[test]
fn integrator_reports_what_new_was_given() {
    for integrator in Integrator::ALL {
        let world = World::<f32>::new(integrator, NonZeroU32::MIN);
        assert_eq!(world.integrator(), integrator);
    }
}

#[test]
fn clear_forces_leaves_particles_coasting() {
    // Orbit with its gravity cleared: no force, so each body moves in a
    // straight line at its launch velocity.
    let mut world = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    let (start_positions, start_velocities) = (
        world.particles.pos().to_vec(),
        world.particles.vel().to_vec(),
    );
    world.clear_forces();
    world.step(time_step(0.5));
    assert_eq!(world.particles.vel(), start_velocities.as_slice());
    for ((position, start_position), start_velocity) in world
        .particles
        .pos()
        .iter()
        .zip(&start_positions)
        .zip(&start_velocities)
    {
        assert_eq!(*position, *start_position + *start_velocity * 0.5);
    }
}

#[test]
fn forces_re_added_after_clear_apply_again() {
    // clear + re-add the same force is the same world as never clearing:
    // how the demo's softening slider rebuilds a scene's force.
    let mut kept = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    let mut rebuilt = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    rebuilt.clear_forces();
    rebuilt.add_force(crate::scenarios::orbit_gravity().unwrap());
    for _ in 0..10 {
        kept.step(time_step(0.01));
        rebuilt.step(time_step(0.01));
    }
    assert_eq!(kept.particles.pos(), rebuilt.particles.pos());
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
    let pin = big.particles.add_static(Vec2::ZERO);
    let _ = big.particles.add_static(Vec2::new(1.0, 0.0));
    let bob = big.particles.add(Vec2::new(2.0, 0.0), Vec2::ZERO, kg(1.0));
    let rod = DistanceConstraint::between(&big.particles, pin, bob).unwrap();

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
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    assert_eq!(world.iterations().get(), 1);
    world.set_substeps(NonZeroU32::new(20).unwrap());
    world.set_iterations(NonZeroU32::new(3).unwrap());
    assert_eq!((world.substeps().get(), world.iterations().get()), (20, 3));
}

#[test]
fn baumgarte_defaults_to_box2d_and_survives_solver_switches() {
    use crate::{Baumgarte, DEFAULT_BAUMGARTE, Solver};
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    assert_eq!(world.baumgarte().get(), DEFAULT_BAUMGARTE);
    world.set_baumgarte(Baumgarte::new(0.5).unwrap());
    world.set_solver(Solver::Impulse);
    world.set_solver(Solver::Xpbd);
    assert_eq!(world.baumgarte().get(), 0.5);
}

#[test]
fn stabilization_defaults_to_split_and_the_pendulum_scenes_choose_classic() {
    use crate::scenarios::{DoublePendulumStart, double_pendulum, pendulum};
    use crate::{Solver, Stabilization};
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    assert_eq!(world.stabilization(), Stabilization::Split);
    world.set_stabilization(Stabilization::Baumgarte);
    assert_eq!(world.stabilization(), Stabilization::Baumgarte);
    // 01's measurements and the double pendulum's energy need classic.
    let single = pendulum::<f64>(Solver::Impulse, NonZeroU32::MIN).unwrap();
    let double = double_pendulum::<f64>(
        Solver::Impulse,
        NonZeroU32::MIN,
        DoublePendulumStart::Raised,
        0.0,
    )
    .unwrap();
    assert_eq!(
        (single.stabilization(), double.stabilization()),
        (Stabilization::Baumgarte, Stabilization::Baumgarte)
    );
}

#[test]
fn a_world_collides_once_it_has_a_wall_or_a_circle() {
    use crate::params::kg;
    use crate::{Radius, Restitution, Vec2, Wall};
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    world.particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    assert!(!world.collides(), "points never collide");
    let mut walled = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    walled.add_wall(Wall::through(
        Vec2::ZERO,
        Vec2::new(0.0, 1.0).normalized().unwrap(),
    ));
    assert!(walled.collides());
    assert_eq!(walled.walls().len(), 1);
    world
        .particles
        .add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), Radius::new(0.1).unwrap());
    assert!(world.collides());
    assert_eq!(world.restitution(), Restitution::INELASTIC);
    world.set_restitution(Restitution::ELASTIC);
    assert_eq!(world.restitution().get(), 1.0);
}

#[test]
fn velocities_written_in_place_reach_the_particles() {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    let _ = world
        .particles
        .add(crate::Vec2::ZERO, crate::Vec2::ZERO, crate::params::kg(1.0));
    world.vel_mut()[0] = crate::Vec2::new(1.0, 2.0);
    assert_eq!(world.particles().vel()[0], crate::Vec2::new(1.0, 2.0));
    let on = world.speculative();
    world.set_speculative(!on);
    assert_eq!(world.speculative(), !on);
}
