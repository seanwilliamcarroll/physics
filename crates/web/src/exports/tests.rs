use super::drag::{demo_drag, demo_grab, demo_release};
use super::lifecycle::{
    demo_advance, demo_free, demo_links_len, demo_links_ptr, demo_new, demo_new_chain,
    demo_new_double_pendulum, demo_new_jelly, demo_positions_len, demo_positions_ptr,
};
use super::readouts::{
    demo_constraint_error, demo_energy, demo_kinetic_energy, demo_particle_x, demo_particle_y,
};
use super::settings::{
    demo_set_beta, demo_set_damping, demo_set_integrator, demo_set_iterations, demo_set_order,
    demo_set_rate, demo_set_softening, demo_set_solver, demo_set_stabilization, demo_set_stiffness,
    demo_set_substeps, demo_set_theta,
};
use crate::abi;
use core::ptr;

#[test]
fn round_trip_through_the_c_abi() {
    let d = demo_new(0, 1, 10, 42);
    assert!(!d.is_null());
    // SAFETY: `d` came from `demo_new` and is freed exactly once, last.
    unsafe {
        assert_eq!(demo_advance(d, 1.0 / 60.0), 1);
        assert_eq!(demo_positions_len(d), 20);
        let pos = core::slice::from_raw_parts(demo_positions_ptr(d), 20);
        assert!(pos.chunks(2).all(|p| p[1] > 0.0));
        demo_free(d);
    }
}

#[test]
#[should_panic(expected = "deliberate test panic")]
fn test_hook_panics_with_the_shared_message() {
    super::lifecycle::deliberate_panic();
}

#[test]
fn orbit_controls_through_the_c_abi() {
    let d = demo_new(abi::DEMO_ORBIT, abi::SCALAR_F64, 0, 0);
    assert!(!d.is_null());
    // SAFETY: `d` came from `demo_new` and is freed exactly once, last.
    unsafe {
        assert_eq!(demo_set_integrator(d, abi::INTEGRATOR_VELOCITY_VERLET), 1);
        assert_eq!(demo_set_integrator(d, 99), 0, "unknown integrator code");
        assert_eq!(demo_set_rate(d, 0), 0, "zero rate rejected at the boundary");
        assert_eq!(demo_set_rate(d, 30), 1);
        assert_eq!(demo_advance(d, 1.0 / 30.0), 1);
        let e = demo_energy(d);
        assert!(
            e.is_finite() && e < 0.0,
            "bound orbit has negative energy: {e}"
        );
        demo_free(d);
    }
}

#[test]
fn fountain_energy_and_null_handles_read_as_nan() {
    let d = demo_new(abi::DEMO_FOUNTAIN, abi::SCALAR_F32, 10, 1);
    // SAFETY: `d` from `demo_new`, freed once; null is allowed everywhere.
    unsafe {
        assert!(demo_energy(d).is_nan());
        demo_free(d);
        assert!(demo_energy(ptr::null()).is_nan());
        assert_eq!(demo_set_integrator(ptr::null_mut(), 0), 0);
        assert_eq!(demo_set_rate(ptr::null_mut(), 60), 0);
    }
}

#[test]
fn unknown_codes_return_null() {
    assert!(demo_new(99, 0, 10, 1).is_null());
    assert!(demo_new(0, 99, 10, 1).is_null());
}

#[test]
fn null_handles_are_harmless() {
    // SAFETY: null is explicitly allowed by every export's contract.
    unsafe {
        assert_eq!(demo_advance(ptr::null_mut(), 1.0), 0);
        assert!(demo_positions_ptr(ptr::null()).is_null());
        assert_eq!(demo_positions_len(ptr::null()), 0);
        demo_free(ptr::null_mut());
    }
}

#[test]
fn softening_is_parsed_at_the_boundary() {
    let d = demo_new(abi::DEMO_DISK, abi::SCALAR_F32, 32, 1);
    assert!(!d.is_null());
    // SAFETY: `d` from `demo_new`, freed once, last; null is allowed.
    unsafe {
        let e0 = demo_energy(d);
        assert_eq!(demo_set_softening(d, -0.1), 0, "negative rejected");
        assert_eq!(demo_set_softening(d, f64::NAN), 0, "NaN rejected");
        assert_eq!(demo_energy(d).to_bits(), e0.to_bits(), "unchanged");
        assert_eq!(demo_set_softening(d, 0.0), 1, "zero allowed");
        assert_eq!(demo_set_softening(d, 0.5), 1);
        assert!(demo_energy(d) > e0, "softer: shallower potential");
        demo_free(d);
        assert_eq!(demo_set_softening(ptr::null_mut(), 0.1), 0);
    }
    let f = demo_new(abi::DEMO_FOUNTAIN, abi::SCALAR_F64, 4, 1);
    // SAFETY: as above.
    unsafe {
        assert_eq!(demo_set_softening(f, 0.1), 0, "fountain has no gravity");
        demo_free(f);
    }
}

#[test]
fn theta_is_parsed_at_the_boundary() {
    let d = demo_new(abi::DEMO_CLUSTER, abi::SCALAR_F64, 32, 1);
    // SAFETY: `d` from `demo_new`, freed once, last; null is allowed.
    unsafe {
        assert_eq!(demo_set_theta(d, -0.5), 0, "negative rejected");
        assert_eq!(demo_set_theta(d, f64::NAN), 0, "NaN rejected");
        assert_eq!(demo_set_theta(d, 0.5), 1);
        assert_eq!(demo_advance(d, 1.0 / 60.0), 1);
        assert!(demo_energy(d).is_finite());
        demo_free(d);
        assert_eq!(demo_set_theta(ptr::null_mut(), 0.5), 0);
    }
}

#[test]
fn pendulum_controls_are_parsed_at_the_boundary() {
    let d = demo_new(abi::DEMO_PENDULUM, abi::SCALAR_F32, 0, 0);
    assert!(!d.is_null());
    // SAFETY: `d` from `demo_new`, freed once, last; null is allowed.
    unsafe {
        assert_eq!(demo_set_solver(d, abi::SOLVER_IMPULSE), 1);
        assert_eq!(demo_set_solver(d, 9), 0, "unknown solver code");
        assert_eq!(demo_set_beta(d, 1.5), 0, "beta above 1");
        assert_eq!(demo_set_beta(d, f64::NAN), 0);
        assert_eq!(demo_set_beta(d, 0.0), 1);
        assert_eq!(demo_set_substeps(d, 0), 0, "zero substeps");
        assert_eq!(demo_set_substeps(d, 4), 1);
        assert_eq!(demo_set_iterations(d, 0), 0, "zero iterations");
        assert_eq!(demo_set_iterations(d, 2), 1);
        assert_eq!(demo_advance(d, 0.25), 15, "one clamped frame");
        let err = demo_constraint_error(d);
        assert!(err.is_finite() && err > 0.0, "beta 0 stretches: {err}");
        demo_free(d);
        assert!(demo_constraint_error(ptr::null()).is_nan());
        assert_eq!(demo_set_solver(ptr::null_mut(), 0), 0);
    }
    let f = demo_new(abi::DEMO_FOUNTAIN, abi::SCALAR_F64, 4, 1);
    // SAFETY: as above.
    unsafe {
        assert!(demo_constraint_error(f).is_nan(), "no constraints");
        demo_free(f);
    }
}

#[test]
fn chain_and_double_pendulum_constructors_check_their_input() {
    let c = demo_new_chain(abi::SCALAR_F64, 10, 100.0);
    assert!(!c.is_null());
    assert!(
        demo_new_chain(abi::SCALAR_F64, 10, -1.0).is_null(),
        "no negative mass"
    );
    assert!(demo_new_chain(9, 10, 100.0).is_null(), "unknown scalar");
    let p = demo_new_double_pendulum(abi::SCALAR_F32, abi::START_RAISED, 1e-9);
    assert!(!p.is_null());
    assert!(
        demo_new_double_pendulum(abi::SCALAR_F32, 7, 0.0).is_null(),
        "unknown start"
    );
    assert!(demo_new_double_pendulum(abi::SCALAR_F32, abi::START_RAISED, f64::NAN).is_null());
    // SAFETY: both from constructors above, freed once, last.
    unsafe {
        // 10 rods: 20 link indices, the first rod from the pin (0) to 1.
        assert_eq!(demo_links_len(c), 20);
        let links = core::slice::from_raw_parts(demo_links_ptr(c), 20);
        assert_eq!(&links[..2], &[0, 1]);
        assert_eq!(demo_set_order(c, abi::ORDER_ALTERNATING), 1);
        assert_eq!(demo_set_order(c, 9), 0);
        assert_eq!(demo_set_stabilization(c, abi::STABILIZATION_BAUMGARTE), 1);
        assert_eq!(demo_set_stabilization(c, 9), 0);
        demo_free(c);
        demo_free(p);
    }
}

#[test]
fn grab_drag_release_through_the_c_abi() {
    let d = demo_new_chain(abi::SCALAR_F64, 10, 100.0);
    // SAFETY: from `demo_new_chain`, freed once, last; null is allowed.
    unsafe {
        // The bob is at (1, 0); the pin (0, 0) is static and can't be grabbed.
        assert_eq!(demo_grab(d, 0.0, 0.0, 0.05), -1, "static pin");
        assert_eq!(demo_grab(d, 1.0, 0.02, -1.0), -1, "negative radius");
        assert_eq!(demo_grab(d, 1.0, 0.02, 0.1), 10);
        // Anchor added: 12 particles, 11 rods.
        assert_eq!((demo_positions_len(d), demo_links_len(d)), (24, 22));
        assert_eq!(demo_drag(d, 1.0, 1.0), 1);
        // Dragging far off stretches the drag rod, not the chain: the
        // readout leaves the drag rod out (a fresh grab: the chain is intact).
        assert_eq!(demo_drag(d, 50.0, 50.0), 1);
        assert!(
            demo_constraint_error(d) < 1e-9,
            "chain untouched before stepping"
        );
        assert_eq!(demo_drag(d, 1.0, 1.0), 1);
        assert_eq!(demo_drag(d, f64::NAN, 1.0), 0);
        assert_eq!(demo_advance(d, 1.0 / 60.0), 1);
        assert_eq!(demo_release(d), 1);
        assert_eq!(demo_release(d), 0, "nothing held");
        assert_eq!(demo_drag(d, 1.0, 1.0), 0, "nothing held");
        assert_eq!((demo_positions_len(d), demo_links_len(d)), (22, 20));
        demo_free(d);
        assert_eq!(demo_grab(core::ptr::null_mut(), 0.0, 0.0, 1.0), -1);
    }
}

#[test]
fn exact_positions_resolve_what_the_f32_buffer_cannot() {
    let a = demo_new_double_pendulum(abi::SCALAR_F64, abi::START_HORIZONTAL, 0.0);
    let b = demo_new_double_pendulum(abi::SCALAR_F64, abi::START_HORIZONTAL, 1e-9);
    // SAFETY: both from the constructor, freed once, last; null allowed.
    unsafe {
        // Tip (particle 2) at (2, 0) and (2, 1e-9): exact in f64...
        assert_eq!(demo_particle_x(a, 2), 2.0);
        assert_eq!(demo_particle_y(b, 2), 1e-9);
        // ...while the f32 render buffer can't tell them apart from 0.
        let pos = core::slice::from_raw_parts(demo_positions_ptr(b), 6);
        assert!(pos[5].abs() < 1e-8);
        assert!(demo_particle_x(a, 3).is_nan(), "past the last particle");
        assert!(demo_particle_y(ptr::null(), 0).is_nan());
        demo_free(a);
        demo_free(b);
    }
}

#[test]
fn jelly_constructor_and_live_stiffness_check_their_input() {
    // Force springs can't be rigid; constraints can.
    assert!(
        demo_new_jelly(
            abi::SCALAR_F64,
            abi::JELLY_SPRINGS,
            4,
            4,
            f64::INFINITY,
            0.0
        )
        .is_null()
    );
    let rods = demo_new_jelly(
        abi::SCALAR_F64,
        abi::JELLY_IMPULSE,
        4,
        4,
        f64::INFINITY,
        0.0,
    );
    assert!(!rods.is_null());
    assert!(
        demo_new_jelly(abi::SCALAR_F64, 9, 4, 4, 100.0, 0.0).is_null(),
        "unknown body"
    );
    assert!(
        demo_new_jelly(abi::SCALAR_F64, abi::JELLY_XPBD, 0, 4, 100.0, 0.0).is_null(),
        "empty grid"
    );
    let springs = demo_new_jelly(abi::SCALAR_F32, abi::JELLY_SPRINGS, 4, 4, 500.0, 0.5);
    assert!(!springs.is_null());
    // SAFETY: both from the constructor, freed once, last; null allowed.
    unsafe {
        // 4x4 grid: 24 structural (3×4 + 4×3) + 18 shear + 16 bend = 58
        // springs drawn, as force springs or as rods.
        assert_eq!(demo_links_len(springs), 2 * 58);
        assert_eq!(demo_links_len(rods), 2 * 58);
        assert_eq!(demo_set_stiffness(springs, 1000.0), 1);
        assert_eq!(
            demo_set_stiffness(springs, f64::INFINITY),
            0,
            "springs can't be rigid"
        );
        assert_eq!(demo_set_stiffness(springs, -1.0), 0);
        assert_eq!(demo_set_damping(springs, 0.2), 1);
        assert_eq!(demo_set_damping(springs, f64::NAN), 0);
        assert_eq!(demo_set_stiffness(rods, 1e5), 1);
        assert_eq!(demo_set_stiffness(rods, f64::INFINITY), 1, "rigid rods");
        assert_eq!(demo_set_damping(rods, 0.5), 1);
        // It falls: kinetic energy rises from 0.
        assert_eq!(demo_kinetic_energy(springs), 0.0);
        assert_eq!(demo_advance(springs, 0.25), 15);
        assert!(demo_kinetic_energy(springs) > 0.0);
        assert!(demo_energy(springs).is_finite());
        demo_free(springs);
        demo_free(rods);
        assert!(demo_kinetic_energy(ptr::null()).is_nan());
        assert_eq!(demo_set_stiffness(ptr::null_mut(), 1.0), 0);
    }
    // Not a jelly: stiffness and damping are refused.
    let chain = demo_new_chain(abi::SCALAR_F64, 4, 10.0);
    // SAFETY: as above.
    unsafe {
        assert_eq!(demo_set_stiffness(chain, 100.0), 0);
        assert_eq!(demo_set_damping(chain, 0.1), 0);
        demo_free(chain);
    }
}

mod sequences;

#[test]
fn every_cap_accepts_its_limit_and_refuses_one_more() {
    // Found by the pre-push mutation report: no test asked for exactly a
    // cap, or for a gravity scene between its cap and the fountain's.
    use abi::{
        MAX_CHAIN_LINKS, MAX_GRAVITY_BODIES, MAX_ITERATIONS, MAX_JELLY_SIDE, MAX_RATE_HZ,
        MAX_SUBSTEPS,
    };
    let (f64_, xpbd) = (abi::SCALAR_F64, abi::JELLY_XPBD);
    // SAFETY: every handle is from a `demo_new*` export (or null), and
    // freed once; null is allowed everywhere.
    unsafe {
        let disk = demo_new(abi::DEMO_DISK, f64_, MAX_GRAVITY_BODIES, 1);
        assert!(!disk.is_null());
        demo_free(disk);
        assert!(demo_new(abi::DEMO_DISK, f64_, MAX_GRAVITY_BODIES + 1, 1).is_null());
        // The fountain's cap is higher: the gravity scenes have their own.
        let fountain = demo_new(abi::DEMO_FOUNTAIN, f64_, MAX_GRAVITY_BODIES + 1, 1);
        assert!(!fountain.is_null());
        demo_free(fountain);

        let chain = demo_new_chain(f64_, MAX_CHAIN_LINKS, 100.0);
        assert!(!chain.is_null());
        assert!(demo_new_chain(f64_, MAX_CHAIN_LINKS + 1, 100.0).is_null());
        for (set, cap) in [
            (
                demo_set_substeps as unsafe extern "C" fn(_, _) -> _,
                MAX_SUBSTEPS,
            ),
            (demo_set_iterations, MAX_ITERATIONS),
            (demo_set_rate, MAX_RATE_HZ),
        ] {
            assert_eq!(set(chain, cap), 1, "at the cap");
            assert_eq!(set(chain, cap + 1), 0, "past the cap");
        }
        demo_free(chain);

        let side = MAX_JELLY_SIDE;
        let jelly = demo_new_jelly(f64_, xpbd, side, side, 1000.0, 0.5);
        assert!(!jelly.is_null());
        demo_free(jelly);
        assert!(demo_new_jelly(f64_, xpbd, side + 1, side, 1000.0, 0.5).is_null());
        assert!(demo_new_jelly(f64_, xpbd, side, side + 1, 1000.0, 0.5).is_null());
    }
}
