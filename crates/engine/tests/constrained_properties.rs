//! Properties of constrained worlds (`docs/06-constraints.md`, "Iteration
//! order"). Gauss–Seidel visits constraints in order, so reordering them is
//! a different (valid) solve: the exact permutation invariance of
//! `properties.rs` doesn't hold here. What does hold, and is checked: both
//! orders keep every rod within the solver's error bound, and they stay
//! close to each other.
#![cfg(test)]

use engine::diagnostics::constraint_error;
use engine::scenarios::pendulum_gravity;
use engine::{DistanceConstraint, Integrator, Solver, Vec2, World};
use proptest::prelude::*;
use test_support::{kg, nonzero, proptest_config, time_step};

/// One link: length (m), direction (rad), mass of the particle at its end (kg).
type LinkSpec = (f64, f64, f64);

fn chain_spec() -> impl Strategy<Value = Vec<LinkSpec>> {
    prop::collection::vec(
        (
            0.2..0.6_f64,
            -std::f64::consts::PI..std::f64::consts::PI,
            0.5..2.0_f64,
        ),
        2..=6,
    )
}

const DT: f64 = 1.0 / 60.0;
const STEPS: u32 = 60;
const SUBSTEPS: u32 = 8;
const ITERATIONS: u32 = 4;
/// Short horizon for comparing the two orders: 0.1 s. Over a full second
/// a multi-link chain amplifies tiny differences (measured gaps up to
/// 18 cm), which would bound chaos rather than ordering.
const COMPARE_STEPS: u32 = 6;

/// Bounds: max rod error over 1 s, and the gap between the two orders
/// after 0.1 s. Re-measured before M6 over 2,000 chains: XPBD 8.8 mm and
/// 55 µm, impulse 14.8 mm and 58 µm. The impulse gap bound was 50 µm, set
/// in M4.3 (worst 4.9 µm) under classic Baumgarte, and never re-measured
/// after split impulses became the default (M4.9): a random chain found
/// 56 µm (kept in `constrained_properties.proptest-regressions`). Split
/// impulses order like XPBD now, so both get XPBD's ~10x bound.
fn bounds(solver: Solver) -> (f64, f64) {
    match solver {
        Solver::Xpbd => (0.04, 5.0e-4),
        Solver::Impulse => (0.1, 5.0e-4),
    }
}

/// Builds the chain with its rods added in `order`, steps it `steps`
/// times, and returns (positions, max rod error seen).
fn run(links: &[LinkSpec], order: &[usize], solver: Solver, steps: u32) -> (Vec<Vec2<f64>>, f64) {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    w.add_force(pendulum_gravity());
    w.set_solver(solver);
    w.set_iterations(nonzero(ITERATIONS));
    let mut ids = vec![w.add_static(Vec2::ZERO).id()];
    let mut x = Vec2::ZERO;
    for &(len, angle, m) in links {
        x += Vec2::new(len * angle.cos(), len * angle.sin());
        ids.push(w.add_particle(x, Vec2::ZERO, kg(m)));
    }
    let rods: Vec<_> = ids
        .windows(2)
        .map(|p| DistanceConstraint::between(w.particles(), p[0], p[1]).unwrap())
        .collect();
    for &i in order {
        w.add_constraint(rods[i]).unwrap();
    }
    let mut worst = 0.0_f64;
    for _ in 0..steps {
        w.step(time_step(DT));
        worst = worst.max(constraint_error(w.particles(), w.constraints()).unwrap().0);
    }
    (w.particles().pos().to_vec(), worst)
}

proptest! {
    #![proptest_config(proptest_config())]

    #[test]
    fn constraint_order_changes_the_answer_only_boundedly(
        (links, order) in chain_spec().prop_flat_map(|l| {
            let n = l.len();
            (Just(l), Just((0..n).collect::<Vec<_>>()).prop_shuffle())
        }),
    ) {
        for solver in Solver::ALL {
            let identity: Vec<usize> = (0..links.len()).collect();
            let (max_err, max_gap) = bounds(solver);
            let (_, err_a) = run(&links, &identity, solver, STEPS);
            let (_, err_b) = run(&links, &order, solver, STEPS);
            prop_assert!(err_a <= max_err && err_b <= max_err, "{solver:?}: {err_a} / {err_b} m");
            let (a, _) = run(&links, &identity, solver, COMPARE_STEPS);
            let (b, _) = run(&links, &order, solver, COMPARE_STEPS);
            let gap = a.iter().zip(&b).map(|(p, q)| (*p - *q).length()).fold(0.0, f64::max);
            prop_assert!(gap <= max_gap, "{solver:?}: orders {gap} m apart");
        }
    }
}
