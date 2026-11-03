use core::num::NonZeroU32;

use engine::diagnostics::total_energy;
use engine::scenarios::{orbit, orbit_gravity};
use engine::{Integrator, Softening};

use super::{Demo, DemoKind, GravityScene, ScalarKind, integrator_from_code, solver_from_code};

/// One physics step at the 60 Hz `PHYSICS_RATE`.
const PHYSICS_DT: f64 = 1.0 / 60.0;

fn demo(scalar: ScalarKind) -> Demo {
    Demo::new(DemoKind::Fountain, scalar, 50, 1).unwrap()
}

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

fn orbit_demo(scalar: ScalarKind) -> Demo {
    // n and seed don't apply to the orbit: it's always one star, one planet.
    Demo::new(DemoKind::Orbit, scalar, 999, 7).unwrap()
}

#[test]
fn orbit_demo_is_a_star_and_a_planet() {
    let d = orbit_demo(ScalarKind::F64);
    assert_eq!(d.positions().len(), 4);
    assert_eq!(d.integrator(), Integrator::SymplecticEuler);
}

#[test]
fn set_integrator_round_trips() {
    let mut d = orbit_demo(ScalarKind::F32);
    for integrator in Integrator::ALL {
        d.set_integrator(integrator);
        assert_eq!(d.integrator(), integrator);
    }
}

#[test]
fn set_rate_changes_how_many_steps_a_frame_buys() {
    let mut d = orbit_demo(ScalarKind::F64);
    assert_eq!(d.advance(1.0 / 30.0), 2); // 60 Hz: two steps per 30 Hz frame
    d.set_rate(NonZeroU32::new(30).unwrap());
    assert_eq!(d.advance(1.0 / 30.0), 1);
}

#[test]
fn orbit_energy_matches_diagnostics_on_the_same_world() {
    let mut d = orbit_demo(ScalarKind::F64);
    d.set_integrator(Integrator::VelocityVerlet);
    let mut w = orbit::<f64>(Integrator::VelocityVerlet, 1.0).unwrap();
    for _ in 0..90 {
        d.advance(PHYSICS_DT);
        w.step(PHYSICS_DT);
    }
    let expect = total_energy(&w.particles, &orbit_gravity().unwrap());
    assert_eq!(d.energy().map(f64::to_bits), Some(expect.to_bits()));
}

#[test]
fn fountain_has_no_energy_readout() {
    // No uniform-gravity potential in diagnostics, so "total energy"
    // isn't defined for the fountain: None, not a misleading number.
    assert_eq!(demo(ScalarKind::F64).energy(), None);
}

#[test]
fn render_buffer_holds_interleaved_positions_from_the_start() {
    for scalar in [ScalarKind::F32, ScalarKind::F64] {
        let d = demo(scalar);
        assert_eq!(d.positions().len(), 2 * 50);
        assert!(d.positions().iter().all(|&c| c == 0.0)); // all at the origin
    }
}

#[test]
fn advance_steps_the_world_and_refreshes_the_buffer() {
    let mut d = demo(ScalarKind::F64);
    assert_eq!(d.advance(PHYSICS_DT), 1);
    assert!(d.positions().chunks(2).all(|p| p[1] > 0.0)); // all rising
    let before = d.positions().to_vec();
    assert_eq!(d.advance(0.0), 0);
    assert_eq!(d.positions(), before);
}

#[test]
fn f32_and_f64_demos_agree_before_rounding_compounds() {
    // Same seed, same scene: after 0.5 s (before any particle lands and
    // respawns) the two scalars differ only by f32 rounding.
    let (mut a, mut b) = (demo(ScalarKind::F32), demo(ScalarKind::F64));
    for _ in 0..30 {
        a.advance(PHYSICS_DT);
        b.advance(PHYSICS_DT);
    }
    for (x, y) in a.positions().iter().zip(b.positions()) {
        assert!((x - y).abs() < 1e-4, "{x} vs {y}");
    }
}

#[test]
fn fountain_keeps_running() {
    let mut d = demo(ScalarKind::F32);
    for _ in 0..600 {
        d.advance(PHYSICS_DT);
    }
    assert_eq!(d.positions().len(), 2 * 50);
    assert!(d.positions().chunks(2).all(|p| p[1] >= 0.0));
}

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
        w.step(PHYSICS_DT);
    }
    let expect = total_energy(&w.particles, &cluster_gravity().unwrap());
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
    use engine::scenarios::{collapse, gravity};
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
    // world with gravity(0.5).
    let w = collapse::<f64>(40, 3).unwrap();
    assert_eq!(d.energy(), Some(total_energy(&w.particles, &gravity(eps))));

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

fn pendulum_demo(scalar: ScalarKind) -> Demo {
    // n and seed don't apply: one pin, one bob.
    Demo::new(DemoKind::Pendulum, scalar, 99, 7).unwrap()
}

#[test]
fn pendulum_is_a_pin_and_a_bob_with_energy_and_rod_error() {
    let d = pendulum_demo(ScalarKind::F64);
    assert_eq!(d.positions(), [0.0, 0.0, 1.0, 0.0]);
    // Released level with the pin: no kinetic, no potential energy.
    assert_eq!(d.energy(), Some(0.0));
    assert_eq!(d.constraint_error(), Some(0.0));
    assert_eq!(
        demo(ScalarKind::F64).constraint_error(),
        None,
        "fountain: no constraints"
    );
}

#[test]
fn solver_controls_reach_the_world() {
    use core::num::NonZeroU32;
    use engine::{Baumgarte, Solver};
    // Impulse without Baumgarte stretches; with XPBD the rod holds.
    let run = |solver, beta: f64, substeps: u32| {
        let mut d = pendulum_demo(ScalarKind::F64);
        d.set_solver(solver);
        d.set_baumgarte(Baumgarte::new(beta).unwrap());
        d.set_substeps(NonZeroU32::new(substeps).unwrap());
        d.set_iterations(NonZeroU32::new(2).unwrap());
        for _ in 0..120 {
            d.advance(PHYSICS_DT);
        }
        d.constraint_error().unwrap()
    };
    let stretched = run(Solver::Impulse, 0.0, 1);
    let held = run(Solver::Xpbd, 0.0, 1);
    let tamed = run(Solver::Impulse, 0.2, 20);
    assert!(stretched > 0.05, "{stretched}");
    assert!(held < 1e-12, "{held}");
    assert!(tamed < stretched / 100.0, "{tamed}");
}

#[test]
fn pendulum_energy_falls_under_xpbd_in_f32_too() {
    let mut d = pendulum_demo(ScalarKind::F32);
    for _ in 0..600 {
        d.advance(PHYSICS_DT);
    }
    // XPBD at one substep loses most of the 9.8 J swing (01's table).
    assert!(d.energy().unwrap() < -8.0);
}
