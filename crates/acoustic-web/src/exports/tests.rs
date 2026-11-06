use core::ptr;

use super::{
    piano_inharmonicity, piano_strings, synth_clipped, synth_free, synth_new, synth_note_off,
    synth_note_on, synth_note_on_velocity, synth_render, synth_set_excitation, synth_set_gain,
    synth_set_model, synth_set_pickup, synth_set_t60, synth_set_tuned, synth_snapshot,
    synth_snapshot_ptr, synth_spectrum, synth_spectrum_ptr, synth_strike_trace,
    synth_strike_trace_ptr,
};
use crate::abi::{EXCITATION_TRIANGLE, MODEL_PIANO, MODEL_WAVEGUIDE, STATUS_OK, STATUS_REFUSED};

#[test]
fn round_trip_through_the_c_abi() {
    let s = synth_new(48_000.0, 1);
    assert!(!s.is_null());
    unsafe {
        assert_eq!(synth_set_tuned(s, 0), STATUS_OK);
        assert_eq!(synth_set_tuned(s, 2), STATUS_REFUSED);
        assert_eq!(synth_set_t60(s, 1.5), STATUS_OK);
        assert_eq!(synth_set_excitation(s, EXCITATION_TRIANGLE, 0.1), STATUS_OK);
        assert_eq!(synth_set_gain(s, 0.3), STATUS_OK);
        assert_eq!(synth_note_on(s, 60), STATUS_OK);
        assert_eq!(synth_note_on(s, 5), STATUS_REFUSED);
        let p = synth_render(s, 128);
        assert!(!p.is_null());
        let block = core::slice::from_raw_parts(p, 128);
        assert!(block.iter().any(|&x| x != 0.0));
        let n = synth_snapshot(s);
        assert!(n > 0);
        assert!(!synth_snapshot_ptr(s).is_null());
        synth_note_off(s, 60);
        assert_eq!(synth_clipped(s), 0.0);
        assert!(synth_render(s, 1 << 20).is_null(), "over MAX_FRAMES");
        assert_eq!(synth_set_model(s, MODEL_WAVEGUIDE), STATUS_OK);
        assert_eq!(synth_set_pickup(s, 0.3), STATUS_OK);
        assert_eq!(synth_set_pickup(s, 2.0), STATUS_REFUSED);
        assert_eq!(synth_spectrum(s), 2048);
        assert!(!synth_spectrum_ptr(s).is_null());
        synth_free(s);
    }
}

#[test]
fn null_handles_are_harmless() {
    let null = ptr::null_mut();
    assert!(synth_new(-1.0, 0).is_null());
    unsafe {
        assert!(synth_render(null, 128).is_null());
        assert_eq!(synth_note_on(null, 60), STATUS_REFUSED);
        synth_note_off(null, 60);
        assert_eq!(synth_set_t60(null, 1.0), STATUS_REFUSED);
        assert_eq!(synth_snapshot(null), 0);
        assert!(synth_snapshot_ptr(null).is_null());
        assert_eq!(synth_clipped(null), 0.0);
        assert_eq!(synth_spectrum(null), 0);
        assert!(synth_spectrum_ptr(null).is_null());
        assert_eq!(synth_set_model(null, MODEL_WAVEGUIDE), STATUS_REFUSED);
        synth_free(null);
    }
}

#[test]
fn the_piano_through_the_c_abi() {
    let s = synth_new(48_000.0, 1);
    unsafe {
        assert_eq!(synth_strike_trace(s), 0, "no strike yet");
        assert_eq!(synth_set_model(s, MODEL_PIANO), STATUS_OK);
        assert_eq!(synth_note_on_velocity(s, 60, 1.58), STATUS_OK);
        for _ in 0..8 {
            assert!(!synth_render(s, 128).is_null());
        }
        let n = synth_strike_trace(s) as usize;
        assert!(n > 0);
        let trace = core::slice::from_raw_parts(synth_strike_trace_ptr(s), n);
        assert!(trace.iter().any(|&f| f > 0.0), "the hammer pushed");
        synth_free(s);
        assert_eq!(synth_strike_trace(ptr::null_mut()), 0);
        assert!(synth_strike_trace_ptr(ptr::null()).is_null());
    }
    assert!((piano_inharmonicity(60) - acoustic::inharmonicity(60)).abs() < 1e-15);
    assert_eq!(piano_inharmonicity(20), 0.0);
    assert_eq!(
        (
            piano_strings(21),
            piano_strings(40),
            piano_strings(60),
            piano_strings(109)
        ),
        (1, 2, 3, 0)
    );
}

mod sequences;
