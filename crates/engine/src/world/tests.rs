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
