//! The C ABI: what the audio worklet calls. Handles are `*mut Synth`
//! from [`synth_new`]; every function takes null (and returns null, 0, or
//! [`STATUS_REFUSED`]) rather than trapping. Buffers returned as pointers
//! are re-read by JS after each call: memory growth detaches old views.

use core::ptr;

use crate::abi::{STATUS_OK, STATUS_REFUSED};
use crate::synth::Synth;

const fn status(ok: bool) -> u32 {
    if ok { STATUS_OK } else { STATUS_REFUSED }
}

/// A synth at `sample_rate` Hz (the `AudioContext`'s), noise seeded by
/// `seed`; null for a bad rate. Free with [`synth_free`].
#[unsafe(no_mangle)]
pub(crate) extern "C" fn synth_new(sample_rate: f64, seed: u32) -> *mut Synth {
    crate::imports::install_panic_hook();
    Synth::new(sample_rate, u64::from(seed)).map_or(ptr::null_mut(), |s| Box::into_raw(Box::new(s)))
}

/// Frees a synth. Null is a no-op.
///
/// # Safety
/// `s` must be null or a handle from [`synth_new`] not yet freed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_free(s: *mut Synth) {
    if !s.is_null() {
        // SAFETY: non-null, so per the contract it came from `Box::into_raw`
        // in `synth_new` and hasn't been freed.
        drop(unsafe { Box::from_raw(s) });
    }
}

/// Renders `frames` samples; returns a pointer to them (`f32`, mono), or
/// null for a null handle or more than `MAX_FRAMES`.
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_render(s: *mut Synth, frames: u32) -> *const f32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    let Some(s) = (unsafe { s.as_mut() }) else {
        return ptr::null();
    };
    usize::try_from(frames)
        .ok()
        .and_then(|n| s.render(n))
        .map_or(ptr::null(), <[f32]>::as_ptr)
}

/// Plays MIDI `key`; [`STATUS_REFUSED`] if it can't (below A0, not a key).
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_note_on(s: *mut Synth, key: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    status(unsafe { s.as_mut() }.is_some_and(|s| s.note_on(key)))
}

/// Releases MIDI `key`.
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_note_off(s: *mut Synth, key: u32) {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    if let Some(s) = unsafe { s.as_mut() } {
        s.note_off(key);
    }
}

/// 1: tuned (the allpass); 0: the integer loop. From the next note.
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_set_tuned(s: *mut Synth, tuned: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    let Some(s) = (unsafe { s.as_mut() }) else {
        return STATUS_REFUSED;
    };
    match tuned {
        0 | 1 => {
            s.set_tuned(tuned == 1);
            STATUS_OK
        }
        _ => STATUS_REFUSED,
    }
}

/// The fundamental's decay time, s, from the next note.
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_set_t60(s: *mut Synth, t60: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    status(unsafe { s.as_mut() }.is_some_and(|s| s.set_t60(t60)))
}

/// Excitation code (`abi::EXCITATION_*`) and triangle peak, from the next
/// note.
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_set_excitation(s: *mut Synth, code: u32, peak: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    status(unsafe { s.as_mut() }.is_some_and(|s| s.set_excitation(code, peak)))
}

/// Output gain in `[0, 1]`.
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_set_gain(s: *mut Synth, gain: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    status(unsafe { s.as_mut() }.is_some_and(|s| s.set_gain(gain)))
}

/// Copies the latest string's delay line into the snapshot buffer;
/// returns its length (0 before any note, or for null). Read it at
/// [`synth_snapshot_ptr`].
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_snapshot(s: *mut Synth) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    unsafe { s.as_mut() }.map_or(0, |s| u32::try_from(s.snapshot().len()).unwrap_or(0))
}

/// Pointer to the snapshot [`synth_snapshot`] last filled (null for null).
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_snapshot_ptr(s: *const Synth) -> *const f32 {
    // SAFETY: per the contract, null (-> None) or a live Synth.
    unsafe { s.as_ref() }.map_or(ptr::null(), Synth::snapshot_ptr)
}

/// The model new notes play (`abi::MODEL_*`).
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_set_model(s: *mut Synth, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    status(unsafe { s.as_mut() }.is_some_and(|s| s.set_model(code)))
}

/// Every waveguide's pickup, from the bridge (0 to 1), live.
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_set_pickup(s: *mut Synth, pickup: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    status(unsafe { s.as_mut() }.is_some_and(|s| s.set_pickup(pickup)))
}

/// Computes the spectrum of the last 4096 output samples; returns its
/// length in bins (dB, `f32`; 0 for null). Read it at the pointer from
/// [`synth_spectrum_ptr`].
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_spectrum(s: *mut Synth) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Synth.
    unsafe { s.as_mut() }.map_or(0, |s| u32::try_from(s.spectrum().len()).unwrap_or(0))
}

/// Pointer to the spectrum [`synth_spectrum`] last computed (null for null).
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`]; call it right
/// after [`synth_spectrum`] (the buffer is the analyzer's).
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_spectrum_ptr(s: *const Synth) -> *const f32 {
    // SAFETY: per the contract, null (-> None) or a live Synth.
    unsafe { s.as_ref() }.map_or(ptr::null(), Synth::spectrum_ptr)
}

/// How far the latest note's loop is from its pitch, cents: 0 tuned, the
/// integer loop's error untuned (the page's readout). 0 for null.
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_latest_cents(s: *const Synth) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Synth.
    unsafe { s.as_ref() }.map_or(0.0, Synth::latest_cents)
}

/// Samples clamped to ±1 so far (as `f64`: JS has no `u64`), 0 for null.
///
/// # Safety
/// `s` must be null or a live handle from [`synth_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn synth_clipped(s: *const Synth) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Synth.
    #[expect(
        clippy::cast_precision_loss,
        reason = "a count far below 2^53 in any session"
    )]
    unsafe { s.as_ref() }.map_or(0.0, |s| s.clipped() as f64)
}

#[cfg(test)]
mod tests;
