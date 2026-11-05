use engine::Softening;
use engine::diagnostics::total_energy;

use super::super::{Demo, DemoKind, GravityScene, ScalarKind};
use super::{PHYSICS_DT, demo};

#[test]
fn cluster_demo_has_n_bodies_and_a_matching_energy() {
    use engine::scenarios::{cluster, cluster_gravity};
    let mut d = Demo::new(
        DemoKind::Gravity(GravityScene::Cluster),
        ScalarKind::F64,
        40,
        5,
    )
    .unwrap();
    assert_eq!(d.positions().len(), 2 * 40);
    let mut w = cluster::<f64>(40, 5).unwrap();
    for _ in 0..30 {
        d.advance(PHYSICS_DT);
        w.step(engine::TimeStep::new(PHYSICS_DT).unwrap());
    }
    let expect = total_energy(w.particles(), &cluster_gravity().unwrap());
    assert_eq!(d.energy().map(f64::to_bits), Some(expect.to_bits()));
}

#[test]
fn gravity_scenes_have_n_bodies_and_an_energy() {
    for kind in [
        GravityScene::Cluster,
        GravityScene::Disk,
        GravityScene::Collapse,
    ] {
        for scalar in [ScalarKind::F32, ScalarKind::F64] {
            let d = Demo::new(DemoKind::Gravity(kind), scalar, 40, 3).unwrap();
            assert_eq!(d.positions().len(), 80, "{kind:?} {scalar:?}");
            let e = d.energy().unwrap();
            assert!(e.is_finite() && e < 0.0, "{kind:?} {scalar:?}: {e}");
        }
    }
}

#[test]
fn set_softening_rebuilds_the_force_and_the_energy_readout() {
    use engine::scenarios::{collapse, newtonian};
    let mut d = Demo::new(
        DemoKind::Gravity(GravityScene::Collapse),
        ScalarKind::F64,
        40,
        3,
    )
    .unwrap();
    let eps = Softening::new(0.5).unwrap();
    assert!(d.set_softening(eps));
    // Readout under the new force: same as diagnostics on an identical
    // world with newtonian(0.5).
    let w = collapse::<f64>(40, 3).unwrap();
    assert_eq!(
        d.energy(),
        Some(total_energy(w.particles(), &newtonian(eps)))
    );

    // And the world steps under it: a softer force pulls less, so after
    // one step the cloud has fallen less than with the default.
    let mut soft = d;
    let mut stiff = Demo::new(
        DemoKind::Gravity(GravityScene::Collapse),
        ScalarKind::F64,
        40,
        3,
    )
    .unwrap();
    soft.advance(PHYSICS_DT);
    stiff.advance(PHYSICS_DT);
    let spread = |d: &Demo| d.positions().iter().map(|x| x.abs()).sum::<f32>();
    assert!(spread(&soft) > spread(&stiff));
}

#[test]
fn set_softening_zero_is_allowed_and_f32_takes_the_cast() {
    let mut d = Demo::new(
        DemoKind::Gravity(GravityScene::Cluster),
        ScalarKind::F32,
        16,
        1,
    )
    .unwrap();
    assert!(d.set_softening(Softening::ZERO));
    assert!(d.energy().is_some());
}

#[test]
fn set_softening_has_no_effect_on_the_fountain() {
    let mut d = demo(ScalarKind::F64);
    let before = d.positions().to_vec();
    assert!(!d.set_softening(Softening::new(0.5).unwrap()));
    // Its uniform gravity survives: particles still rise then fall.
    d.advance(PHYSICS_DT);
    assert_ne!(d.positions(), before.as_slice());
    assert_eq!(d.energy(), None);
}

#[test]
fn set_theta_switches_to_barnes_hut_and_keeps_the_exact_energy() {
    use engine::OpeningAngle;
    let make = || {
        Demo::new(
            DemoKind::Gravity(GravityScene::Cluster),
            ScalarKind::F64,
            64,
            2,
        )
        .unwrap()
    };
    let (mut direct, mut tree, mut exact_tree) = (make(), make(), make());
    // Energy is a readout of the state, not of the force: unchanged by θ.
    assert!(tree.set_theta(OpeningAngle::new(1.0).unwrap()));
    assert_eq!(tree.energy(), direct.energy());
    // θ = 0 is direct summation through the tree: the same motion up to
    // summation order, so close to (but not bit-identical with) direct.
    assert!(exact_tree.set_theta(OpeningAngle::new(0.0).unwrap()));
    for d in [&mut direct, &mut tree, &mut exact_tree] {
        d.advance(PHYSICS_DT * 10.0);
    }
    let gap = |a: &Demo, b: &Demo| {
        a.positions()
            .iter()
            .zip(b.positions())
            .map(|(x, y)| (x - y).abs())
            .fold(0.0_f32, f32::max)
    };
    assert!(gap(&direct, &exact_tree) < 1e-5, "θ = 0 tracks direct");
    assert!(
        gap(&direct, &tree) > gap(&direct, &exact_tree),
        "θ = 1 approximates"
    );
}

#[test]
fn set_theta_survives_a_softening_change_and_is_refused_by_the_fountain() {
    use engine::OpeningAngle;
    let theta = OpeningAngle::new(0.5).unwrap();
    let mut d = Demo::new(
        DemoKind::Gravity(GravityScene::Disk),
        ScalarKind::F32,
        32,
        1,
    )
    .unwrap();
    assert!(d.set_theta(theta));
    assert!(d.set_softening(Softening::new(0.2).unwrap()));
    assert_eq!(d.theta(), Some(0.5));
    assert!(!demo(ScalarKind::F64).set_theta(theta));
}
