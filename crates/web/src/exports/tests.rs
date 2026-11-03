use super::{
    demo_advance, demo_energy, demo_free, demo_new, demo_positions_len, demo_positions_ptr,
    demo_set_integrator, demo_set_rate, demo_set_softening,
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
    super::deliberate_panic();
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
        assert_eq!(super::demo_set_theta(d, -0.5), 0, "negative rejected");
        assert_eq!(super::demo_set_theta(d, f64::NAN), 0, "NaN rejected");
        assert_eq!(super::demo_set_theta(d, 0.5), 1);
        assert_eq!(demo_advance(d, 1.0 / 60.0), 1);
        assert!(demo_energy(d).is_finite());
        demo_free(d);
        assert_eq!(super::demo_set_theta(ptr::null_mut(), 0.5), 0);
    }
}
