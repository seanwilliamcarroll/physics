use engine::Integrator;

use super::{
    DemoKind, GravityScene, ScalarKind, integrator_from_code, order_from_code, solver_from_code,
    stabilization_from_code,
};
use crate::abi;
use engine::{Order, Stabilization};

#[test]
fn codes_map_to_kinds() {
    assert_eq!(ScalarKind::from_code(0), Some(ScalarKind::F32));
    assert_eq!(ScalarKind::from_code(1), Some(ScalarKind::F64));
    assert_eq!(ScalarKind::from_code(2), None);
    assert_eq!(DemoKind::from_code(0), Some(DemoKind::Fountain));
    assert_eq!(DemoKind::from_code(1), Some(DemoKind::Orbit));
    assert_eq!(
        DemoKind::from_code(2),
        Some(DemoKind::Gravity(GravityScene::Cluster))
    );
    assert_eq!(
        DemoKind::from_code(3),
        Some(DemoKind::Gravity(GravityScene::Disk))
    );
    assert_eq!(
        DemoKind::from_code(4),
        Some(DemoKind::Gravity(GravityScene::Collapse))
    );
    assert_eq!(DemoKind::from_code(5), Some(DemoKind::Pendulum));
    assert_eq!(DemoKind::from_code(6), None);
    assert_eq!(solver_from_code(0), Some(engine::Solver::Xpbd));
    assert_eq!(solver_from_code(1), Some(engine::Solver::Impulse));
    assert_eq!(solver_from_code(2), None);
    assert_eq!(integrator_from_code(0), Some(Integrator::SymplecticEuler));
    assert_eq!(integrator_from_code(1), Some(Integrator::ExplicitEuler));
    assert_eq!(integrator_from_code(2), Some(Integrator::VelocityVerlet));
    assert_eq!(integrator_from_code(3), None);
}

#[test]
fn order_and_stabilization_codes_map_to_their_variants() {
    // From the full cargo-mutants run: deleting the Forward, Reverse or
    // Split arm went unnoticed.
    assert_eq!(order_from_code(abi::ORDER_FORWARD), Some(Order::Forward));
    assert_eq!(order_from_code(abi::ORDER_REVERSE), Some(Order::Reverse));
    assert_eq!(
        order_from_code(abi::ORDER_ALTERNATING),
        Some(Order::Alternating)
    );
    assert_eq!(order_from_code(3), None);
    assert_eq!(
        stabilization_from_code(abi::STABILIZATION_BAUMGARTE),
        Some(Stabilization::Baumgarte)
    );
    assert_eq!(
        stabilization_from_code(abi::STABILIZATION_SPLIT),
        Some(Stabilization::Split)
    );
    assert_eq!(stabilization_from_code(2), None);
}
