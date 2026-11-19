use core::num::NonZeroU32;

use engine::{Order, Solver, Stabilization};

use super::super::{Demo, DemoKind, ScalarKind};
use super::PHYSICS_DT;

/// The chain (10 links, 1:100), `setup` applied, after one second: its
/// particles' positions.
fn chain_after(setup: impl FnOnce(&mut Demo)) -> Vec<f32> {
    let mut demo = Demo::new_chain(ScalarKind::F64, 10, 100.0).unwrap();
    setup(&mut demo);
    for _ in 0..60 {
        demo.advance(PHYSICS_DT);
    }
    demo.positions().to_vec()
}

#[test]
fn the_chain_page_controls_reach_the_world() {
    let base = chain_after(|_| {});
    let iterations = chain_after(|demo| demo.set_iterations(NonZeroU32::new(5).unwrap()));
    let order = chain_after(|demo| demo.set_order(Order::Reverse));
    assert_ne!(base, iterations, "iterations");
    assert_ne!(base, order, "order");
    // Stabilization is the impulse solver's.
    let impulse = |stabilization| {
        chain_after(|demo| {
            demo.set_solver(Solver::Impulse);
            demo.set_stabilization(stabilization);
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
