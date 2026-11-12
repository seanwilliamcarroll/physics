//! Random call sequences through the synth's C ABI, as the worklet could
//! make them (`docs/04-testing.md`, "Property tests"): every export,
//! hostile values (NaN, ±∞, ±0, `f64::MAX`, negatives, keys off the
//! keyboard, unknown codes, `u32::MAX`).
//!
//! After every call: no panic (wasm builds abort on one, and the worklet
//! goes silent), statuses are 0 or 1, and every rendered sample is finite
//! and within the ±1 clamp. A **shadow** synth receives only the calls
//! the main one accepted, and the two must render bit-identical audio:
//! a refused call changes nothing, not even the noise generator.
//!
//! Sizes are drawn past the ABI's caps (sample rates above
//! `MAX_SAMPLE_RATE`, frames past `MAX_FRAMES`), which it must refuse.

use proptest::prelude::*;
use proptest::test_runner::TestCaseError;

use super::super::{
    piano_inharmonicity, piano_strings, synth_clipped, synth_free, synth_latest_cents, synth_new,
    synth_note_off, synth_note_on, synth_note_on_velocity, synth_render, synth_set_excitation,
    synth_set_gain, synth_set_model, synth_set_pickup, synth_set_stiffness, synth_set_t60,
    synth_set_tuned, synth_snapshot, synth_snapshot_ptr, synth_spectrum, synth_spectrum_ptr,
    synth_strike_trace, synth_strike_trace_ptr,
};
use crate::synth::{MAX_FRAMES, MAX_SAMPLE_RATE, Synth};

/// Calls per generated sequence.
const MAX_CALLS: usize = 20;
/// Codes drawn from 0 up to here: every valid code and some unknown ones.
const MAX_CODE: u32 = 5;
/// The piano's keys, as MIDI numbers.
const KEYS: core::ops::RangeInclusive<u32> = 21..=108;
/// The most strings a piano key has.
const MAX_STRINGS: u32 = 3;

/// What a page could pass (`test_support::hostile_f64`), around this
/// module's usual values.
fn hostile_f64() -> impl Strategy<Value = f64> {
    test_support::hostile_f64(-2.0..2.0)
}

fn code() -> impl Strategy<Value = u32> {
    prop_oneof![4 => 0..=MAX_CODE, 1 => Just(u32::MAX), 1 => any::<u32>()]
}

/// Mostly keys on the keyboard (so notes sound), sometimes off it.
fn key() -> impl Strategy<Value = u32> {
    prop_oneof![4 => KEYS, 1 => 0..=127u32, 1 => any::<u32>()]
}

/// A sample rate: the real ones, up to the cap, and invalid ones (past the
/// cap too: refused before anything is allocated).
fn sample_rate() -> impl Strategy<Value = f64> {
    prop_oneof![
        4 => prop_oneof![Just(44_100.0), Just(48_000.0)],
        1 => 3_000.0..=MAX_SAMPLE_RATE,
        1 => prop_oneof![
            Just(f64::NAN),
            Just(f64::INFINITY),
            Just(f64::NEG_INFINITY),
            Just(0.0),
            Just(-48_000.0),
            Just(f64::MIN_POSITIVE),
            Just(1.0),
            Just(MAX_SAMPLE_RATE * 1.01),
            Just(768_000.0),
            Just(1e9),
            Just(f64::MAX),
        ],
    ]
}

#[derive(Clone, Debug)]
enum Call {
    /// Free both synths and make new ones.
    Replace(f64, u32),
    Render(u32),
    NoteOn(u32),
    NoteOnVelocity(u32, f64),
    NoteOff(u32),
    Stiffness(u32),
    Tuned(u32),
    T60(f64),
    Excitation(u32, f64),
    Gain(f64),
    Model(u32),
    Pickup(f64),
    /// Read the snapshot, spectrum, strike trace and readouts.
    Read,
    /// The per-key facts (no synth).
    Key(u32),
}

fn call() -> impl Strategy<Value = Call> {
    let f = hostile_f64;
    let cap = u32::try_from(MAX_FRAMES).unwrap();
    let frames = prop_oneof![
        4 => Just(128u32),
        1 => 0..=1024u32,
        1 => prop_oneof![Just(0), Just(cap), Just(cap + 1), Just(u32::MAX)],
    ];
    prop_oneof![
        1 => (sample_rate(), any::<u32>()).prop_map(|(fs, seed)| Call::Replace(fs, seed)),
        6 => frames.prop_map(Call::Render),
        3 => key().prop_map(Call::NoteOn),
        2 => (key(), prop_oneof![0.1..6.0, f()]).prop_map(|(k, v)| Call::NoteOnVelocity(k, v)),
        2 => key().prop_map(Call::NoteOff),
        1 => code().prop_map(Call::Stiffness),
        1 => code().prop_map(Call::Tuned),
        1 => prop_oneof![0.1..10.0, f()].prop_map(Call::T60),
        1 => (code(), prop_oneof![0.0..1.0, f()]).prop_map(|(c, p)| Call::Excitation(c, p)),
        1 => prop_oneof![0.0..1.0, f()].prop_map(Call::Gain),
        1 => code().prop_map(Call::Model),
        1 => prop_oneof![0.0..1.0, f()].prop_map(Call::Pickup),
        2 => Just(Call::Read),
        1 => key().prop_map(Call::Key),
    ]
}

/// `len` floats at `ptr` (null allowed when `len` is 0), all finite.
///
/// # Safety
/// `ptr` must point at `len` readable floats when `len > 0`.
unsafe fn finite_buffer(what: &str, ptr: *const f32, len: u32) -> Result<(), TestCaseError> {
    if len == 0 {
        return Ok(());
    }
    prop_assert!(!ptr.is_null(), "{what}: {len} floats at null");
    // SAFETY: per this function's contract.
    let values = unsafe { core::slice::from_raw_parts(ptr, len as usize) };
    prop_assert!(
        values.iter().all(|v| v.is_finite()),
        "{what} has a non-finite value"
    );
    Ok(())
}

/// Renders `frames` on `s` (null allowed); checks the block and returns it.
///
/// # Safety
/// `s` must be null or a live handle.
unsafe fn render(s: *mut Synth, frames: u32) -> Result<Option<Vec<u32>>, TestCaseError> {
    // SAFETY: per this function's contract; a non-null block is `frames`
    // long (`synth_render`'s contract).
    unsafe {
        let p = synth_render(s, frames);
        if s.is_null() || frames as usize > MAX_FRAMES {
            prop_assert!(p.is_null(), "{frames} frames rendered");
            return Ok(None);
        }
        prop_assert!(!p.is_null());
        let block = core::slice::from_raw_parts(p, frames as usize);
        prop_assert!(
            block.iter().all(|v| v.is_finite() && v.abs() <= 1.0),
            "a sample outside ±1 or not finite"
        );
        Ok(Some(block.iter().map(|v| v.to_bits()).collect()))
    }
}

/// Makes `call` on `s`; returns its status (1 for calls without one).
///
/// # Safety
/// `s` must be null or a live handle; `Replace`, `Render` and `Read` are
/// handled by the caller.
unsafe fn apply(s: *mut Synth, call: &Call) -> Result<u32, TestCaseError> {
    // SAFETY: per this function's contract.
    let status = unsafe {
        match *call {
            Call::Replace(..) | Call::Render(_) | Call::Read => {
                return Err(TestCaseError::fail("handled by the caller"));
            }
            Call::NoteOn(k) => synth_note_on(s, k),
            Call::NoteOnVelocity(k, v) => synth_note_on_velocity(s, k, v),
            Call::NoteOff(k) => {
                synth_note_off(s, k);
                1
            }
            Call::Stiffness(c) => synth_set_stiffness(s, c),
            Call::Tuned(c) => synth_set_tuned(s, c),
            Call::T60(t) => synth_set_t60(s, t),
            Call::Excitation(c, p) => synth_set_excitation(s, c, p),
            Call::Gain(g) => synth_set_gain(s, g),
            Call::Model(c) => synth_set_model(s, c),
            Call::Pickup(p) => synth_set_pickup(s, p),
            Call::Key(k) => {
                let b = piano_inharmonicity(k);
                prop_assert!(b.is_finite() && b >= 0.0, "B = {b} for key {k}");
                let strings = piano_strings(k);
                prop_assert!(strings <= MAX_STRINGS);
                prop_assert_eq!(
                    strings == 0,
                    !KEYS.contains(&k),
                    "strings only on the keyboard"
                );
                1
            }
        }
    };
    prop_assert!(status <= 1, "status {status} from {call:?}");
    Ok(status)
}

/// Reads every buffer and readout of `s` (null allowed) and checks them.
///
/// # Safety
/// `s` must be null or a live handle.
unsafe fn read(s: *mut Synth) -> Result<(), TestCaseError> {
    // SAFETY: per this function's contract; each pointer is read for the
    // length its export just returned.
    unsafe {
        finite_buffer("snapshot", synth_snapshot_ptr(s), synth_snapshot(s))?;
        finite_buffer("spectrum", synth_spectrum_ptr(s), synth_spectrum(s))?;
        finite_buffer(
            "strike trace",
            synth_strike_trace_ptr(s),
            synth_strike_trace(s),
        )?;
        prop_assert!(synth_latest_cents(s).is_finite());
        let clipped = synth_clipped(s);
        prop_assert!(
            clipped >= 0.0 && clipped.fract() == 0.0,
            "clipped {clipped}"
        );
    }
    Ok(())
}

fn run(first: (f64, u32), calls: &[Call]) -> Result<(), TestCaseError> {
    let (mut main, mut shadow) = (synth_new(first.0, first.1), synth_new(first.0, first.1));
    // SAFETY: `main` and `shadow` are each null or a live handle from
    // `synth_new`, freed exactly once, when replaced or at the end.
    unsafe {
        for call in calls {
            match *call {
                Call::Replace(fs, seed) => {
                    synth_free(main);
                    synth_free(shadow);
                    (main, shadow) = (synth_new(fs, seed), synth_new(fs, seed));
                }
                Call::Render(frames) => {
                    let heard = render(main, frames)?;
                    prop_assert_eq!(
                        heard,
                        render(shadow, frames)?,
                        "a refused call changed the sound"
                    );
                }
                Call::Read => {
                    read(main)?;
                    read(shadow)?;
                }
                _ => {
                    if apply(main, call)? == 1 {
                        prop_assert_eq!(apply(shadow, call)?, 1, "the shadow refused {:?}", call);
                    }
                }
            }
        }
        // A last block, so a refusal at the end is heard too.
        let heard = render(main, 128)?;
        prop_assert_eq!(
            heard,
            render(shadow, 128)?,
            "a refused call changed the sound"
        );
        synth_free(main);
        synth_free(shadow);
    }
    Ok(())
}

proptest! {
    // 16 cases on a push, not the usual 64: a case renders audio after
    // every call, and 64 took 22 s, the longest test in the workspace.
    // The slow tier runs 10 000 (which is what found this test's one
    // bug; `docs/04-testing.md`).
    #![proptest_config(test_support::proptest_config_with(16))]

    #[test]
    fn any_call_sequence_is_safe(first in (sample_rate(), any::<u32>()), calls in prop::collection::vec(call(), 0..MAX_CALLS)) {
        run(first, &calls)?;
    }
}
