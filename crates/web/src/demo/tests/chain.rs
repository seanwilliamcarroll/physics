use core::num::NonZeroU32;

use engine::{Order, Solver, Stabilization};

use super::super::{Demo, DemoKind, ScalarKind};
use super::PHYSICS_DT;

/// The M4 chain (10 links, 1:100), `setup` applied, after one second: its
/// particles' positions.
fn chain_after(setup: impl FnOnce(&mut Demo)) -> Vec<f32> {
    let mut d = Demo::new_chain(ScalarKind::F64, 10, 100.0).unwrap();
    setup(&mut d);
    for _ in 0..60 {
        d.advance(PHYSICS_DT);
    }
    d.positions().to_vec()
}

#[test]
fn the_m4_controls_reach_the_world() {
    // From the full cargo-mutants run: set_iterations, set_order and
    // set_stabilization could each do nothing (the M4 page's iterations,
    // order and "impulse uses" controls).
    let base = chain_after(|_| {});
    let iterations = chain_after(|d| d.set_iterations(NonZeroU32::new(5).unwrap()));
    let order = chain_after(|d| d.set_order(Order::Reverse));
    assert_ne!(base, iterations, "iterations");
    assert_ne!(base, order, "order");
    // Stabilization is the impulse solver's.
    let impulse = |stabilization| {
        chain_after(|d| {
            d.set_solver(Solver::Impulse);
            d.set_stabilization(stabilization);
        })
    };
    assert_ne!(
        impulse(Stabilization::Split),
        impulse(Stabilization::Baumgarte),
        "stabilization"
    );
}

#[test]
fn only_solver_stepped_worlds_can_be_grabbed() {
    // From the full cargo-mutants run: `grabbable` could answer always yes
    // or always no.
    assert!(
        Demo::new_chain(ScalarKind::F64, 10, 100.0)
            .unwrap()
            .grabbable()
    );
    assert!(
        !Demo::new(DemoKind::Orbit, ScalarKind::F64, 0, 0)
            .unwrap()
            .grabbable()
    );
    assert!(
        !Demo::new(DemoKind::Fountain, ScalarKind::F64, 8, 1)
            .unwrap()
            .grabbable()
    );
}
