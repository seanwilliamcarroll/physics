//! The C-ABI surface the boids page calls. Each export is a thin adapter
//! over [`SwarmDemo`]: every argument parsed here, at the boundary; null
//! handles refused. This crate's `unsafe` is in its four exports files.

use core::ptr;

use swarm::Neighbours;
use web_common::boundary::capped;

use crate::abi;
use crate::demo::SwarmDemo;

/// `n` boids in a `width × height` world, drawn at one pixel per `scale`.
/// Null for zero or capped values (`abi::MAX_*`) or a world smaller than
/// one drawn pixel. Free with [`swarm_free`].
#[unsafe(no_mangle)]
pub(crate) extern "C" fn swarm_new(
    n: u32,
    width: u32,
    height: u32,
    scale: u32,
    seed: u32,
) -> *mut SwarmDemo {
    web_common::install_panic_hook();
    let parsed = (
        capped(n, abi::MAX_BOIDS),
        capped(width, abi::MAX_SIDE),
        capped(height, abi::MAX_SIDE),
        capped(scale, abi::MAX_SCALE),
    );
    let (Some(n), Some(w), Some(h), Some(s)) = parsed else {
        return ptr::null_mut();
    };
    SwarmDemo::new(n, w, h, s, u64::from(seed))
        .map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Frees a demo. Null is a no-op.
///
/// # Safety
/// `d` must be null or a handle from [`swarm_new`] not yet freed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_free(d: *mut SwarmDemo) {
    if !d.is_null() {
        // SAFETY: non-null, so per the contract from `Box::into_raw` in
        // `swarm_new` and not yet freed.
        drop(unsafe { Box::from_raw(d) });
    }
}

/// Adds `elapsed_s` seconds of real time; returns steps taken (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_advance(d: *mut SwarmDemo, elapsed_s: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| d.advance(elapsed_s))
}

/// Steps per simulated second. 1, or 0 for 0, above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ), or null.
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_set_rate(d: *mut SwarmDemo, hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| {
        u32::from(d.clock().set_rate_hz(hz, abi::MAX_RATE_HZ))
    })
}

/// At most `n` steps per [`swarm_advance`] (0: no cap): the step budget.
/// 1, or 0 above [`MAX_RATE_HZ`](abi::MAX_RATE_HZ) or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_set_step_cap(d: *mut SwarmDemo, n: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| {
        u32::from(d.clock().set_cap_steps(n, abi::MAX_RATE_HZ))
    })
}

/// How neighbours are found (`abi::NEIGHBOURS_*`). 1, or 0 for an unknown
/// code, brute force past [`MAX_BRUTE`](abi::MAX_BRUTE) boids, or null.
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_set_neighbours(d: *mut SwarmDemo, code: u32) -> u32 {
    let how = match code {
        abi::NEIGHBOURS_BRUTE => Neighbours::Brute,
        abi::NEIGHBOURS_GRID => Neighbours::Grid,
        abi::NEIGHBOURS_SORTED => Neighbours::Sorted,
        _ => return 0,
    };
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| u32::from(d.set_neighbours(how)))
}

/// Sets a rule constant (`abi::PARAM_*`). 1, or 0 for an unknown code, a
/// value that makes the rules unusable (nothing changed), or null.
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_set_param(d: *mut SwarmDemo, code: u32, value: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| u32::from(d.set_param(code, value)))
}

/// A rule constant (`abi::PARAM_*`), or NaN for an unknown code or null.
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_param(d: *const SwarmDemo, code: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }
        .and_then(|d| d.param(code))
        .unwrap_or(f64::NAN)
}

/// The predator at world `(x, y)` if `on`, else none. 1, or 0 for a
/// non-finite point (nothing changed) or null.
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_set_predator(
    d: *mut SwarmDemo,
    x: f64,
    y: f64,
    on: u32,
) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| {
        u32::from(d.set_predator((on != 0).then_some((x, y))))
    })
}

/// Draws the flock into the RGBA buffer; returns a pointer to it (one
/// `u32` per drawn pixel, `ImageData` byte order), or null for null.
/// Re-read the view after any call that could grow memory.
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_render(d: *mut SwarmDemo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(ptr::null(), |d| d.render().as_ptr())
}

/// The drawn width, pixels (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_view_width(d: *const SwarmDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.view().0).unwrap_or(0))
}

/// The drawn height, pixels (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_view_height(d: *const SwarmDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.view().1).unwrap_or(0))
}

/// The number of boids (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_len(d: *const SwarmDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.flock().len()).unwrap_or(0))
}

/// The flock's polarization, 0 to 1 (NaN for null).
///
/// # Safety
/// `d` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_polarization(d: *const SwarmDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(f64::NAN, |d| d.flock().polarization())
}

#[cfg(test)]
mod tests;
