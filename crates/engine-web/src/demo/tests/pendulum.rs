use engine::diagnostics::{kinetic_energy, uniform_gravity_potential};
use engine::scenarios::pendulum_gravity;

use super::super::any_world::AnyWorld;
use super::super::{Demo, DemoKind, ScalarKind};
use super::{PHYSICS_DT, fountain_demo};

fn pendulum_demo(scalar: ScalarKind) -> Demo {
    // n and seed don't apply: one pin, one bob.
    Demo::new(DemoKind::Pendulum, scalar, 99, 7).unwrap()
}

#[test]
fn pendulum_is_a_pin_and_a_bob_with_energy_and_rod_error() {
    let demo = pendulum_demo(ScalarKind::F64);
    assert_eq!(demo.positions(), [0.0, 0.0, 1.0, 0.0]);
    // Released level with the pin: no kinetic, no potential energy.
    assert_eq!(demo.energy(), Some(0.0));
    assert_eq!(demo.constraint_error(), Some(0.0));
    assert_eq!(
        fountain_demo(ScalarKind::F64).constraint_error(),
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
        let mut demo = pendulum_demo(ScalarKind::F64);
        demo.set_solver(solver);
        demo.set_baumgarte(Baumgarte::new(beta).unwrap());
        demo.set_substeps(NonZeroU32::new(substeps).unwrap());
        demo.set_iterations(NonZeroU32::new(2).unwrap());
        for _ in 0..120 {
            demo.advance(PHYSICS_DT);
        }
        demo.constraint_error().unwrap()
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
    let mut demo = pendulum_demo(ScalarKind::F32);
    for _ in 0..600 {
        demo.advance(PHYSICS_DT);
    }
    // XPBD at one substep loses most of the 9.8 J swing (01's table).
    assert!(demo.energy().unwrap() < -8.0);
}

#[test]
fn pendulum_energy_is_kinetic_plus_potential() {
    // Mid-swing both terms are nonzero (at release the product is 0), and the
    // readout is exactly their sum.
    let mut demo = pendulum_demo(ScalarKind::F64);
    for _ in 0..20 {
        demo.advance(PHYSICS_DT);
    }
    let AnyWorld::F64(sim) = &demo.world else {
        panic!("an f64 demo")
    };
    let particles = sim.world.particles();
    let (kinetic, potential) = (
        kinetic_energy(particles),
        uniform_gravity_potential(particles, &pendulum_gravity()),
    );
    assert!(
        kinetic > 0.0 && potential < 0.0,
        "kinetic {kinetic}, potential {potential}"
    );
    assert_eq!(
        demo.energy().map(f64::to_bits),
        Some((kinetic + potential).to_bits())
    );
}
