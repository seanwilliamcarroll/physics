//! Convergence order, per integrator (`docs/numerical-testing-checklist.md`
//! §2.3): halving the step must shrink the error by 2^p, for position and
//! for velocity. A harmonic oscillator has an exact solution to measure
//! against. Plus the trivial exact cases: no force is constant velocity,
//! and rest stays rest.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::{Damping, Integrator, Spring, SpringForce, Stiffness, Vec2, World};
use math::convert::usize_to_f64;
use test_support::{kg, nonzero, time_step};

/// A 1 kg bob on a k = 100 N/m spring to a static anchor: ω = 10 rad/s.
const STIFFNESS: f64 = 100.0;
const OMEGA: f64 = 10.0;
const AMPLITUDE: f64 = 0.1;
/// Simulated time, s: under a period (0.63 s), so the error hasn't come
/// back round.
const DURATION: f64 = 0.5;
/// Steps over `DURATION`: each level halves the step (ωh from 0.05 to 0.006).
const LEVELS: [usize; 4] = [100, 200, 400, 800];

fn errors(integrator: Integrator, step_count: usize) -> (f64, f64) {
    let mut world = World::new(integrator, nonzero(1));
    let anchor = world.add_static(Vec2::ZERO);
    let bob = world.add_particle(Vec2::new(1.0 + AMPLITUDE, 0.0), Vec2::ZERO, kg(1.0));
    let spring = Spring::with_rest(
        world.particles(),
        anchor,
        bob,
        1.0,
        Stiffness::new(STIFFNESS).unwrap(),
        Damping::NONE,
    )
    .unwrap();
    world.add_force(SpringForce::new(vec![spring]));
    let step_size = DURATION / usize_to_f64(step_count);
    for _ in 0..step_count {
        world.step(time_step(step_size));
    }
    let (x, vx) = (world.particles().pos()[1].x, world.particles().vel()[1].x);
    let exact_x = 1.0 + AMPLITUDE * (OMEGA * DURATION).cos();
    let exact_vx = -AMPLITUDE * OMEGA * (OMEGA * DURATION).sin();
    ((x - exact_x).abs(), (vx - exact_vx).abs())
}

fn orders(integrator: Integrator) -> (Vec<f64>, Vec<f64>) {
    orders_at(integrator, &LEVELS)
}

fn orders_at(integrator: Integrator, levels: &[usize]) -> (Vec<f64>, Vec<f64>) {
    let errors_per_level: Vec<(f64, f64)> = levels
        .iter()
        .map(|&step_count| errors(integrator, step_count))
        .collect();
    let order = |coarse: f64, fine: f64| (coarse / fine).log2();
    (
        errors_per_level
            .windows(2)
            .map(|pair| order(pair[0].0, pair[1].0))
            .collect(),
        errors_per_level
            .windows(2)
            .map(|pair| order(pair[0].1, pair[1].1))
            .collect(),
    )
}

/// The expected `(position, velocity)` orders. Symplectic Euler (kick,
/// then drift) is leapfrog with the position half a step behind: its
/// velocity is second-order accurate, its position first (measured at
/// T = 0.5 and 0.37 alike, so it's the scheme, not the moment).
const fn expected(integrator: Integrator) -> (f64, f64) {
    match integrator {
        Integrator::SymplecticEuler => (1.0, 2.0),
        Integrator::ExplicitEuler => (1.0, 1.0),
        Integrator::VelocityVerlet => (2.0, 2.0),
    }
}

/// The checklist's band; measured within 0.054 of p at every level.
const ORDER_TOL: f64 = 0.3;

#[test]
fn every_integrator_converges_at_its_order_in_position_and_velocity() {
    for integrator in Integrator::ALL {
        let (position_orders, velocity_orders) = orders(integrator);
        let (expected_position_order, expected_velocity_order) = expected(integrator);
        assert!(
            position_orders
                .iter()
                .all(|order| (order - expected_position_order).abs() < ORDER_TOL),
            "{integrator:?} position: {position_orders:?}, want {expected_position_order}"
        );
        assert!(
            velocity_orders
                .iter()
                .all(|order| (order - expected_velocity_order).abs() < ORDER_TOL),
            "{integrator:?} velocity: {velocity_orders:?}, want {expected_velocity_order}"
        );
    }
}

#[test]
fn without_forces_every_integrator_moves_at_constant_velocity() {
    for integrator in Integrator::ALL {
        let mut world = World::<f64>::new(integrator, nonzero(3));
        let (start_position, velocity) = (Vec2::new(0.25, -1.5), Vec2::new(3.0, 0.5));
        world.add_particle(start_position, velocity, kg(2.0));
        for _ in 0..600 {
            world.step(time_step(1.0 / 60.0));
        }
        let (position, final_velocity) = (world.particles().pos()[0], world.particles().vel()[0]);
        assert_eq!(
            final_velocity, velocity,
            "{integrator:?}: velocity untouched"
        );
        // 10 s: x0 + v t, up to the rounding of 1800 additions.
        assert!(
            (position - (start_position + velocity * 10.0)).length() < 1e-11,
            "{integrator:?}: {position:?}"
        );
    }
}

#[test]
fn a_world_at_rest_with_no_force_stays_bit_identical() {
    for integrator in Integrator::ALL {
        let mut world = World::<f64>::new(integrator, nonzero(4));
        for (x, y) in [(0.0, 0.0), (1.0, -2.0), (-3.5, 0.125)] {
            world.add_particle(Vec2::new(x, y), Vec2::ZERO, kg(1.0));
        }
        let before = world.particles().pos().to_vec();
        for _ in 0..100 {
            world.step(time_step(1.0 / 60.0));
        }
        assert_eq!(world.particles().pos(), &before[..], "{integrator:?}");
        assert!(
            world
                .particles()
                .vel()
                .iter()
                .all(|velocity| *velocity == Vec2::ZERO)
        );
    }
}

const FINE_LEVELS: [usize; 8] = [100, 200, 400, 800, 1600, 3200, 6400, 12_800];

#[test]
#[ignore = "slow: cargo xtask slow"]
fn slow_every_integrator_converges_at_its_order_down_to_fine_steps() {
    for integrator in Integrator::ALL {
        let (position_orders, velocity_orders) = orders_at(integrator, &FINE_LEVELS);
        eprintln!("{integrator:?}: position {position_orders:.4?}, velocity {velocity_orders:.4?}");
        let (expected_position_order, expected_velocity_order) = expected(integrator);
        assert!(
            position_orders
                .iter()
                .all(|order| (order - expected_position_order).abs() < ORDER_TOL),
            "{integrator:?} position: {position_orders:?}"
        );
        assert!(
            velocity_orders
                .iter()
                .all(|order| (order - expected_velocity_order).abs() < ORDER_TOL),
            "{integrator:?} velocity: {velocity_orders:?}"
        );
    }
}
