//! The C-ABI surface of the Vicsek page (S2), over [`VicsekDemo`]: every
//! argument parsed here; null handles refused. This file and
//! `exports.rs` hold all of this crate's `unsafe`.

use core::ptr;

use web_common::boundary::capped;

use crate::abi;
use crate::vicsek_demo::VicsekDemo;

/// `n` particles in an `L × L` box (interaction radii, finite, positive,
/// at most [`MAX_VICSEK_SIDE`](abi::MAX_VICSEK_SIDE)) at noise η, drawn
/// `view` pixels a side. Null if any value is out of range.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn vicsek_new(
    n: u32,
    side: f64,
    noise: f64,
    view: u32,
    seed: u32,
) -> *mut VicsekDemo {
    web_common::install_panic_hook();
    let side_ok = side.is_finite() && side > 0.0 && side <= f64::from(abi::MAX_VICSEK_SIDE);
    let (Some(n), Some(view), true) = (
        capped(n, abi::MAX_PARTICLES),
        capped(view, abi::MAX_VIEW),
        side_ok,
    ) else {
        return ptr::null_mut();
    };
    VicsekDemo::new(n, side, noise, view, u64::from(seed))
        .map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Frees a demo. Null is a no-op.
///
/// # Safety
/// `d` must be null or a handle from [`vicsek_new`] not yet freed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_free(d: *mut VicsekDemo) {
    if !d.is_null() {
        // SAFETY: non-null, so per the contract from `Box::into_raw` in
        // `vicsek_new` and not yet freed.
        drop(unsafe { Box::from_raw(d) });
    }
}

/// Adds `elapsed_s` seconds of real time; returns steps taken (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_advance(d: *mut VicsekDemo, elapsed_s: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| d.advance(elapsed_s))
}

/// Steps per simulated second: 1, or 0 for 0, above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ), or null.
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_set_rate(d: *mut VicsekDemo, hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| {
        u32::from(d.clock().set_rate_hz(hz, abi::MAX_RATE_HZ))
    })
}

/// At most `n` steps per [`vicsek_advance`] (0: no cap). 1, or 0 above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ) or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_set_step_cap(d: *mut VicsekDemo, n: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| {
        u32::from(d.clock().set_cap_steps(n, abi::MAX_RATE_HZ))
    })
}

/// The noise η: 1, or 0 outside `[0, 2π]` or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_set_noise(d: *mut VicsekDemo, eta: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| u32::from(d.set_noise(eta)))
}

/// The speed v: 1, or 0 unless finite and positive, or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_set_speed(d: *mut VicsekDemo, v: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| u32::from(d.set_speed(v)))
}

/// Runs `transient` steps, then returns `v_a`'s mean over `window` more
/// (the paper's measurement); NaN past [`MAX_RUN`](abi::MAX_RUN) steps,
/// for an empty window, or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_mean_order(
    d: *mut VicsekDemo,
    transient: u32,
    window: u32,
) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }
        .and_then(|d| d.mean_order(transient, window))
        .unwrap_or(f64::NAN)
}

/// `v_a` now (NaN for null).
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_order(d: *const VicsekDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(f64::NAN, |d| d.system().order())
}

/// How often a neighbourhood's headings cancelled exactly (as `f64`:
/// exact to 2⁵³; NaN for null).
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_annihilations(d: *const VicsekDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(f64::NAN, |d| {
        math::convert::u64_to_f64(d.system().annihilations())
    })
}

/// Draws the system; returns a pointer to `view × view` RGBA `u32`s
/// (`ImageData` order), or null for null.
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_render(d: *mut VicsekDemo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(ptr::null(), |d| d.render().as_ptr())
}

/// The drawn side, pixels (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_view(d: *const VicsekDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.view()).unwrap_or(0))
}

/// The number of particles (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_len(d: *const VicsekDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.system().len()).unwrap_or(0))
}

#[cfg(test)]
mod tests;
