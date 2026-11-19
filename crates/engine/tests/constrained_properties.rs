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
/// after 0.1 s. Measured over 2,000 chains: XPBD 8.8 mm and 55 µm, impulse
/// 14.8 mm and 58 µm (a random chain found the impulse gap at 56 µm, kept
/// in `constrained_properties.proptest-regressions`). Split impulses order
/// like XPBD, so both get XPBD's ~10x bound.
fn bounds(solver: Solver) -> (f64, f64) {
    match solver {
        Solver::Xpbd => (0.04, 5.0e-4),
        Solver::Impulse => (0.1, 5.0e-4),
    }
}

/// Builds the chain with its rods added in `order`, steps it `steps`
/// times, and returns (positions, max rod error seen).
fn run(links: &[LinkSpec], order: &[usize], solver: Solver, steps: u32) -> (Vec<Vec2<f64>>, f64) {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    world.add_force(pendulum_gravity());
    world.set_solver(solver);
    world.set_iterations(nonzero(ITERATIONS));
    let mut ids = vec![world.add_static(Vec2::ZERO).id()];
    let mut position = Vec2::ZERO;
    for &(length, angle, mass) in links {
        position += Vec2::new(length * angle.cos(), length * angle.sin());
        ids.push(world.add_particle(position, Vec2::ZERO, kg(mass)));
    }
    let rods: Vec<_> = ids
        .windows(2)
        .map(|pair| DistanceConstraint::between(world.particles(), pair[0], pair[1]).unwrap())
        .collect();
    for &rod_index in order {
        world.add_constraint(rods[rod_index]).unwrap();
    }
    let mut worst = 0.0_f64;
    for _ in 0..steps {
        world.step(time_step(DT));
        worst = worst.max(
            constraint_error(world.particles(), world.constraints())
                .unwrap()
                .0,
        );
    }
    (world.particles().pos().to_vec(), worst)
}

proptest! {
    #![proptest_config(proptest_config())]

    #[test]
    fn constraint_order_changes_the_answer_only_boundedly(
        (links, order) in chain_spec().prop_flat_map(|links| {
            let link_count = links.len();
            (Just(links), Just((0..link_count).collect::<Vec<_>>()).prop_shuffle())
        }),
    ) {
        for solver in Solver::ALL {
            let identity: Vec<usize> = (0..links.len()).collect();
            let (max_error, max_gap) = bounds(solver);
            let (_, identity_error) = run(&links, &identity, solver, STEPS);
            let (_, shuffled_error) = run(&links, &order, solver, STEPS);
            prop_assert!(
                identity_error <= max_error && shuffled_error <= max_error,
                "{solver:?}: {identity_error} / {shuffled_error} m"
            );
            let (identity_positions, _) = run(&links, &identity, solver, COMPARE_STEPS);
            let (shuffled_positions, _) = run(&links, &order, solver, COMPARE_STEPS);
            let gap = identity_positions
                .iter()
                .zip(&shuffled_positions)
                .map(|(first, second)| (*first - *second).length())
                .fold(0.0, f64::max);
            prop_assert!(gap <= max_gap, "{solver:?}: orders {gap} m apart");
        }
    }
}
