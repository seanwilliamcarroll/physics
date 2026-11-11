//! The table (M7, `docs/09-billiards.md`): a break, both solvers.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::diagnostics::{kinetic_energy, rotational_energy};
use engine::scenarios::{POOL_LENGTH, POOL_WIDTH, pool_break};
use engine::{Solver, World};
use test_support::{nonzero, time_step};

const DT: f64 = 1.0 / 60.0;

fn energy(w: &World<f64>) -> f64 {
    kinetic_energy(w.particles()) + rotational_energy(w.particles(), w.spin())
}

/// A break settles: measured at rest (energy exactly 0) by 6.0–6.5 s at
/// 6–12 m/s (rolling resistance stops each ball in finite time); bound
/// 8 s. Energy (kinetic and spin) never rises, nothing tunnels (10
/// substeps), and no ball leaves the table except into a pocket.
#[test]
fn a_break_settles_on_the_table() {
    for solver in Solver::ALL {
        for (speed, tip) in [(12.0, 0.4), (6.0, -0.3)] {
            let mut w = pool_break::<f64>(solver, nonzero(10), speed, tip).unwrap();
            w.count_tunnels(true);
            let mut prev = energy(&w);
            for _ in 0..480 {
                w.step(time_step(DT));
                let e = energy(&w);
                assert!(e <= prev, "{solver:?} {speed} m/s: energy rose");
                prev = e;
            }
            assert_eq!(prev, 0.0, "{solver:?} {speed} m/s: still moving after 8 s");
            assert_eq!(w.tunnels(), Some(0), "{solver:?} {speed} m/s");
            let p = w.particles();
            for (x, r) in p.pos().iter().zip(p.radius()) {
                let on = x.x.abs() < POOL_LENGTH / 2.0 && x.y.abs() < POOL_WIDTH / 2.0;
                assert!(
                    *r == 0.0 || on,
                    "{solver:?} {speed} m/s: a ball off the table at {x:?}"
                );
            }
        }
    }
}
