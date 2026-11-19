use super::{
    ORBIT_NOMINAL_PERIOD, ORBIT_SEPARATION, orbit, orbit_gravity, orbit_period,
    orbit_relative_speed,
};
use crate::diagnostics::{center_of_mass, momentum};
use crate::test_util::{assert_same_up_to_rounding, time_step};
use crate::{Force, Integrator, Vec2};

#[test]
fn orbit_starts_centered_at_rest_and_at_the_separation() {
    let world = orbit::<f64>(Integrator::VelocityVerlet, 1.0).unwrap();
    let (positions, velocities) = (world.particles.pos(), world.particles.vel());
    assert_eq!(positions.len(), 2);
    assert!((positions[1] - positions[0]).length() - ORBIT_SEPARATION < 1e-12);
    assert!(center_of_mass(&world.particles).unwrap().length() < 1e-12);
    // Zero net momentum, relative to the planet's own momentum.
    let planet_momentum = velocities[1].length() / world.particles.inv_mass()[1];
    assert!(momentum(&world.particles).length() <= 1e-12 * planet_momentum);
}

#[test]
fn circular_speed_balances_the_softened_pull() {
    // Centripetal check without integrating: the relative acceleration
    // from the actual force must equal v_rel² / d.
    let world = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    let mut accelerations = vec![Vec2::ZERO; 2];
    orbit_gravity::<f64>()
        .unwrap()
        .accumulate(&world.particles, &mut accelerations);
    let relative_acceleration = (accelerations[0] - accelerations[1]).length();
    let relative_speed = (world.particles.vel()[1] - world.particles.vel()[0]).length();
    let centripetal = relative_speed * relative_speed / ORBIT_SEPARATION;
    assert!(
        (relative_acceleration - centripetal).abs() <= 1e-12 * centripetal,
        "{relative_acceleration} vs {centripetal}"
    );
    assert!((relative_speed - orbit_relative_speed()).abs() <= 1e-12 * relative_speed);
}

#[test]
fn softened_period_is_close_to_the_nominal_one() {
    // Softening of 1 cm on a 2 m orbit lengthens the period by
    // ~(1 + ε²/d²)^(3/4).
    let ratio = orbit_period() / ORBIT_NOMINAL_PERIOD;
    assert!(ratio > 1.0 && ratio < 1.0001, "{ratio}");
}

#[test]
fn speed_ratio_scales_the_launch_speed() {
    let circular = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    let slow = orbit::<f64>(Integrator::SymplecticEuler, 0.8).unwrap();
    let ratio = slow.particles.vel()[1].length() / circular.particles.vel()[1].length();
    assert!((ratio - 0.8).abs() < 1e-12);
}

#[test]
fn orbit_gravity_is_the_force_the_scenario_uses() {
    // Same accelerations from orbit_gravity() as from the world's own
    // step: one source for the force, so energy readouts match it.
    let world = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    let mut accelerations = vec![Vec2::ZERO; 2];
    orbit_gravity::<f64>()
        .unwrap()
        .accumulate(&world.particles, &mut accelerations);
    let mut stepped = orbit::<f64>(Integrator::ExplicitEuler, 1.0).unwrap();
    let start_velocities = stepped.particles.vel().to_vec();
    stepped.step(time_step(1.0)); // explicit Euler: v1 = v0 + a(x0) * 1
    for ((end, start), acceleration) in stepped
        .particles
        .vel()
        .iter()
        .zip(&start_velocities)
        .zip(&accelerations)
    {
        assert_same_up_to_rounding(*end - *start, *acceleration, *start);
    }
}
