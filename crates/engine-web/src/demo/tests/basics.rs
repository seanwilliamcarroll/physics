use core::num::NonZeroU32;

use engine::Integrator;
use engine::diagnostics::total_energy;
use engine::scenarios::{orbit, orbit_gravity};

use super::super::{Demo, DemoKind, ScalarKind};
use super::{PHYSICS_DT, fountain_demo};

fn orbit_demo(scalar: ScalarKind) -> Demo {
    // n and seed don't apply to the orbit: it's always one star, one planet.
    Demo::new(DemoKind::Orbit, scalar, 999, 7).unwrap()
}

#[test]
fn orbit_demo_is_a_star_and_a_planet() {
    let demo = orbit_demo(ScalarKind::F64);
    assert_eq!(demo.positions().len(), 4);
    assert_eq!(demo.integrator(), Integrator::SymplecticEuler);
}

#[test]
fn set_integrator_round_trips() {
    let mut demo = orbit_demo(ScalarKind::F32);
    for integrator in Integrator::ALL {
        demo.set_integrator(integrator);
        assert_eq!(demo.integrator(), integrator);
    }
}

#[test]
fn set_rate_changes_how_many_steps_a_frame_buys() {
    let mut demo = orbit_demo(ScalarKind::F64);
    assert_eq!(demo.advance(1.0 / 30.0), 2); // 60 Hz: two steps per 30 Hz frame
    demo.clock().set_rate(NonZeroU32::new(30).unwrap());
    assert_eq!(demo.advance(1.0 / 30.0), 1);
}

#[test]
fn orbit_energy_matches_diagnostics_on_the_same_world() {
    let mut demo = orbit_demo(ScalarKind::F64);
    demo.set_integrator(Integrator::VelocityVerlet);
    let mut w = orbit::<f64>(Integrator::VelocityVerlet, 1.0).unwrap();
    for _ in 0..90 {
        demo.advance(PHYSICS_DT);
        w.step(engine::TimeStep::new(PHYSICS_DT).unwrap());
    }
    let expect = total_energy(w.particles(), &orbit_gravity().unwrap());
    assert_eq!(demo.energy().map(f64::to_bits), Some(expect.to_bits()));
}

#[test]
fn fountain_has_no_energy_readout() {
    // No uniform-gravity potential in diagnostics, so "total energy"
    // isn't defined for the fountain: None, not a misleading number.
    assert_eq!(fountain_demo(ScalarKind::F64).energy(), None);
}

#[test]
fn render_buffer_holds_interleaved_positions_from_the_start() {
    for scalar in [ScalarKind::F32, ScalarKind::F64] {
        let demo = fountain_demo(scalar);
        assert_eq!(demo.positions().len(), 2 * 50);
        assert!(demo.positions().iter().all(|&c| c == 0.0)); // all at the origin
    }
}

#[test]
fn advance_steps_the_world_and_refreshes_the_buffer() {
    let mut demo = fountain_demo(ScalarKind::F64);
    assert_eq!(demo.advance(PHYSICS_DT), 1);
    assert!(demo.positions().chunks(2).all(|p| p[1] > 0.0)); // all rising
    let before = demo.positions().to_vec();
    assert_eq!(demo.advance(0.0), 0);
    assert_eq!(demo.positions(), before);
}

#[test]
fn f32_and_f64_demos_agree_before_rounding_compounds() {
    // Same seed, same scene: after 0.5 s (before any particle lands and
    // respawns) the two scalars differ only by f32 rounding.
    let (mut a, mut b) = (
        fountain_demo(ScalarKind::F32),
        fountain_demo(ScalarKind::F64),
    );
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
    let mut demo = fountain_demo(ScalarKind::F32);
    for _ in 0..600 {
        demo.advance(PHYSICS_DT);
    }
    assert_eq!(demo.positions().len(), 2 * 50);
    assert!(demo.positions().chunks(2).all(|p| p[1] >= 0.0));
}
