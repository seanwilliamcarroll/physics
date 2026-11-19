//! The C-ABI surface of the Vicsek page, over [`VicsekDemo`]: every
//! argument parsed here; null handles refused.

use core::ptr;

use web_common::boundary::capped;

use crate::abi;
use crate::vicsek_demo::VicsekDemo;

/// `particle_count` particles in an `L × L` box (interaction radii, finite, positive,
/// at most [`MAX_VICSEK_SIDE`](abi::MAX_VICSEK_SIDE)) at noise η, drawn
/// `view` pixels a side. Null if any value is out of range.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn vicsek_new(
    particle_count: u32,
    side: f64,
    noise: f64,
    view: u32,
    seed: u32,
) -> *mut VicsekDemo {
    web_common::install_panic_hook();
    let side_ok = side.is_finite() && side > 0.0 && side <= f64::from(abi::MAX_VICSEK_SIDE);
    let (Some(particle_count), Some(view), true) = (
        capped(particle_count, abi::MAX_PARTICLES),
        capped(view, abi::MAX_VIEW),
        side_ok,
    ) else {
        return ptr::null_mut();
    };
    VicsekDemo::new(particle_count, side, noise, view, u64::from(seed))
        .map_or(ptr::null_mut(), |demo| Box::into_raw(Box::new(demo)))
}

/// Frees a demo. Null is a no-op.
///
/// # Safety
/// `demo` must be null or a handle from [`vicsek_new`] not yet freed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_free(demo: *mut VicsekDemo) {
    if !demo.is_null() {
        // SAFETY: non-null, so per the contract from `Box::into_raw` in
        // `vicsek_new` and not yet freed.
        drop(unsafe { Box::from_raw(demo) });
    }
}

/// Adds `elapsed_seconds` seconds of real time; returns steps taken (0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_advance(demo: *mut VicsekDemo, elapsed_seconds: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| demo.advance(elapsed_seconds))
}

/// Steps per simulated second: 1, or 0 for 0, above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ), or null.
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_set_rate(demo: *mut VicsekDemo, rate_hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.clock().set_rate_hz(rate_hz, abi::MAX_RATE_HZ))
    })
}

/// At most `max_steps` steps per [`vicsek_advance`] (0: no cap). 1, or 0 above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ) or for null.
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_set_step_cap(demo: *mut VicsekDemo, max_steps: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.clock().set_cap_steps(max_steps, abi::MAX_RATE_HZ))
    })
}

/// The noise η: 1, or 0 outside `[0, 2π]` or for null.
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_set_noise(demo: *mut VicsekDemo, noise: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| u32::from(demo.set_noise(noise)))
}

/// The speed v: 1, or 0 unless finite and positive, or for null.
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_set_speed(demo: *mut VicsekDemo, speed: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| u32::from(demo.set_speed(speed)))
}

/// Runs `transient` steps, then returns `v_a`'s mean over `window` more
/// (the paper's measurement); NaN past [`MAX_RUN`](abi::MAX_RUN) steps,
/// for an empty window, or for null.
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_mean_order(
    demo: *mut VicsekDemo,
    transient: u32,
    window: u32,
) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }
        .and_then(|demo| demo.mean_order(transient, window))
        .unwrap_or(f64::NAN)
}

/// `v_a` now (NaN for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_order(demo: *const VicsekDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(f64::NAN, |demo| demo.system().order())
}

/// How often a neighbourhood's headings cancelled exactly (as `f64`:
/// exact to 2⁵³; NaN for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_annihilations(demo: *const VicsekDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(f64::NAN, |demo| {
        math::convert::u64_to_f64(demo.system().annihilations())
    })
}

/// Draws the system; returns a pointer to `view × view` RGBA `u32`s
/// (`ImageData` order), or null for null.
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_render(demo: *mut VicsekDemo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(ptr::null(), |demo| demo.render().as_ptr())
}

/// The drawn side, pixels (0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_view(demo: *const VicsekDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::try_from(demo.view()).unwrap_or(0))
}

/// The number of particles (0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`vicsek_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn vicsek_len(demo: *const VicsekDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::try_from(demo.system().len()).unwrap_or(0))
}

#[cfg(test)]
mod tests;
