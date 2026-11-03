use engine::Integrator;

use super::{DemoKind, GravityScene, ScalarKind, integrator_from_code, solver_from_code};

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
