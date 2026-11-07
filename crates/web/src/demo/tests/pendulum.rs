use engine::diagnostics::{kinetic_energy, uniform_gravity_potential};
use engine::scenarios::pendulum_gravity;

use super::super::any_world::AnyWorld;
use super::super::{Demo, DemoKind, ScalarKind};
use super::{PHYSICS_DT, demo};

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

#[test]
fn pendulum_energy_is_kinetic_plus_potential() {
    // cargo-mutants (full run): `kinetic * potential` passed the tests
    // above (0 at release, negative once swinging). Mid-swing both terms
    // are nonzero, and the readout is exactly their sum.
    let mut d = pendulum_demo(ScalarKind::F64);
    for _ in 0..20 {
        d.advance(PHYSICS_DT);
    }
    let AnyWorld::F64(s) = &d.world else {
        panic!("an f64 demo")
    };
    let p = s.world.particles();
    let (k, u) = (
        kinetic_energy(p),
        uniform_gravity_potential(p, &pendulum_gravity()),
    );
    assert!(k > 0.0 && u < 0.0, "kinetic {k}, potential {u}");
    assert_eq!(d.energy().map(f64::to_bits), Some((k + u).to_bits()));
}
