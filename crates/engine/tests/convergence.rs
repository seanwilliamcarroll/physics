//! Convergence order, per integrator (`docs/numerical-testing-checklist.md`
//! §2.3, CONV): halving the step must shrink the error by 2^p, for
//! position and for velocity. A harmonic oscillator has an exact
//! solution to measure against. Plus the trivial exact cases: no force
//! is constant velocity, and rest stays rest.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::{Damping, Integrator, Spring, SpringForce, Stiffness, Vec2, World};
use math::convert::usize_to_f64;
use test_support::{kg, nonzero, time_step};

/// A 1 kg bob on a k = 100 N/m spring to a static anchor: ω = 10 rad/s.
const K: f64 = 100.0;
const OMEGA: f64 = 10.0;
/// Released at rest, stretched this far, m.
const AMPLITUDE: f64 = 0.1;
/// Simulated time, s: under a period (0.63 s), so the error hasn't come
/// back round.
const T: f64 = 0.5;
/// Steps over `T`: each level halves the step (ωh from 0.05 to 0.006).
const LEVELS: [usize; 4] = [100, 200, 400, 800];

/// The bob's position and velocity errors at `T`, `n` steps of `T / n`.
fn errors(integrator: Integrator, n: usize) -> (f64, f64) {
    let mut w = World::new(integrator, nonzero(1));
    let anchor = w.add_static(Vec2::ZERO);
    let bob = w.add_particle(Vec2::new(1.0 + AMPLITUDE, 0.0), Vec2::ZERO, kg(1.0));
    let spring = Spring::with_rest(
        w.particles(),
        anchor,
        bob,
        1.0,
        Stiffness::new(K).unwrap(),
        Damping::NONE,
    )
    .unwrap();
    w.add_force(SpringForce::new(vec![spring]));
    let h = T / usize_to_f64(n);
    for _ in 0..n {
        w.step(time_step(h));
    }
    let (x, v) = (w.particles().pos()[1].x, w.particles().vel()[1].x);
    let x_exact = 1.0 + AMPLITUDE * (OMEGA * T).cos();
    let v_exact = -AMPLITUDE * OMEGA * (OMEGA * T).sin();
    ((x - x_exact).abs(), (v - v_exact).abs())
}

/// The observed orders between successive levels: log2(e(h) / e(h/2)).
fn orders(integrator: Integrator) -> (Vec<f64>, Vec<f64>) {
    orders_at(integrator, &LEVELS)
}

fn orders_at(integrator: Integrator, levels: &[usize]) -> (Vec<f64>, Vec<f64>) {
    let e: Vec<(f64, f64)> = levels.iter().map(|&n| errors(integrator, n)).collect();
    let order = |a: f64, b: f64| (a / b).log2();
    (
        e.windows(2).map(|w| order(w[0].0, w[1].0)).collect(),
        e.windows(2).map(|w| order(w[0].1, w[1].1)).collect(),
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
        let (x, v) = orders(integrator);
        let (px, pv) = expected(integrator);
        assert!(
            x.iter().all(|o| (o - px).abs() < ORDER_TOL),
            "{integrator:?} position: {x:?}, want {px}"
        );
        assert!(
            v.iter().all(|o| (o - pv).abs() < ORDER_TOL),
            "{integrator:?} velocity: {v:?}, want {pv}"
        );
    }
}

#[test]
fn without_forces_every_integrator_moves_at_constant_velocity() {
    for integrator in Integrator::ALL {
        let mut w = World::<f64>::new(integrator, nonzero(3));
        let (x0, v) = (Vec2::new(0.25, -1.5), Vec2::new(3.0, 0.5));
        w.add_particle(x0, v, kg(2.0));
        for _ in 0..600 {
            w.step(time_step(1.0 / 60.0));
        }
        let (x, vel) = (w.particles().pos()[0], w.particles().vel()[0]);
        assert_eq!(vel, v, "{integrator:?}: velocity untouched");
        // 10 s: x0 + v t, up to the rounding of 1800 additions.
        assert!(
            (x - (x0 + v * 10.0)).length() < 1e-11,
            "{integrator:?}: {x:?}"
        );
    }
}

#[test]
fn a_world_at_rest_with_no_force_stays_bit_identical() {
    for integrator in Integrator::ALL {
        let mut w = World::<f64>::new(integrator, nonzero(4));
        for (x, y) in [(0.0, 0.0), (1.0, -2.0), (-3.5, 0.125)] {
            w.add_particle(Vec2::new(x, y), Vec2::ZERO, kg(1.0));
        }
        let before = w.particles().pos().to_vec();
        for _ in 0..100 {
            w.step(time_step(1.0 / 60.0));
        }
        assert_eq!(w.particles().pos(), &before[..], "{integrator:?}");
        assert!(w.particles().vel().iter().all(|v| *v == Vec2::ZERO));
    }
}

/// The slow tier (`cargo xtask slow`): 8 halvings, down to ωh = 0.0004.
const FINE_LEVELS: [usize; 8] = [100, 200, 400, 800, 1600, 3200, 6400, 12_800];

#[test]
#[ignore = "slow: cargo xtask slow"]
fn slow_every_integrator_converges_at_its_order_down_to_fine_steps() {
    for integrator in Integrator::ALL {
        let (x, v) = orders_at(integrator, &FINE_LEVELS);
        eprintln!("{integrator:?}: position {x:.4?}, velocity {v:.4?}");
        let (px, pv) = expected(integrator);
        assert!(
            x.iter().all(|o| (o - px).abs() < ORDER_TOL),
            "{integrator:?} position: {x:?}"
        );
        assert!(
            v.iter().all(|o| (o - pv).abs() < ORDER_TOL),
            "{integrator:?} velocity: {v:?}"
        );
    }
}
