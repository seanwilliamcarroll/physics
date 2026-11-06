use super::{
    ORBIT_NOMINAL_PERIOD, ORBIT_SEPARATION, orbit, orbit_gravity, orbit_period,
    orbit_relative_speed,
};
use crate::diagnostics::{center_of_mass, momentum};
use crate::test_util::{assert_same_up_to_rounding, time_step};
use crate::{Force, Integrator, Vec2};

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
    orbit_gravity::<f64>()
        .unwrap()
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
    orbit_gravity::<f64>()
        .unwrap()
        .accumulate(&w.particles, &mut acc);
    let mut stepped = orbit::<f64>(Integrator::ExplicitEuler, 1.0).unwrap();
    let v0 = stepped.particles.vel().to_vec();
    stepped.step(time_step(1.0)); // explicit Euler: v1 = v0 + a(x0) * 1
    for ((v1, v0), a) in stepped.particles.vel().iter().zip(&v0).zip(&acc) {
        assert_same_up_to_rounding(*v1 - *v0, *a, *v0);
    }
}
