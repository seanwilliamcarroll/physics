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
        let w = World::<f32>::new(integrator, 1).unwrap();
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
    assert!(ConfigError::ZeroSubsteps.to_string().contains("substeps"));
    assert!(ConfigError::InvalidMass.to_string().contains("mass"));
    assert_eq!(
        World::<f64>::new(Integrator::SymplecticEuler, 0).err(),
        Some(ConfigError::ZeroSubsteps)
    );
    assert_eq!(
        World::<f64>::new(Integrator::SymplecticEuler, 3)
            .unwrap()
            .substeps(),
        3
    );
}

#[test]
fn add_constraint_rejects_bodies_from_another_world() {
    use super::ConfigError;
    use crate::mass::kg;
    use crate::{DistanceConstraint, Vec2};
    let mut big = World::<f64>::new(Integrator::SymplecticEuler, 1).unwrap();
    let a = big.particles.add_static(Vec2::ZERO);
    let _ = big.particles.add_static(Vec2::new(1.0, 0.0));
    let c = big.particles.add(Vec2::new(2.0, 0.0), Vec2::ZERO, kg(1.0));
    let rod = DistanceConstraint::between(&big.particles, a, c).unwrap();

    let mut small = World::<f64>::new(Integrator::SymplecticEuler, 1).unwrap();
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
    use core::num::NonZeroU32;
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, 1).unwrap();
    assert_eq!(w.iterations().get(), 1);
    w.set_substeps(NonZeroU32::new(20).unwrap());
    w.set_iterations(NonZeroU32::new(3).unwrap());
    assert_eq!((w.substeps(), w.iterations().get()), (20, 3));
}

#[test]
fn baumgarte_defaults_to_box2d_and_survives_solver_switches() {
    use crate::{Baumgarte, DEFAULT_BAUMGARTE, Solver};
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, 1).unwrap();
    assert_eq!(w.baumgarte().get(), DEFAULT_BAUMGARTE);
    w.set_baumgarte(Baumgarte::new(0.5).unwrap());
    w.set_solver(Solver::Impulse);
    w.set_solver(Solver::Xpbd);
    assert_eq!(w.baumgarte().get(), 0.5);
    assert!(
        super::ConfigError::InvalidBaumgarte
            .to_string()
            .contains("Baumgarte")
    );
}
