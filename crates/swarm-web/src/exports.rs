//! The C-ABI surface of the boids page, over [`SwarmDemo`]: every argument
//! parsed here; null handles refused.

use core::ptr;

use swarm::Neighbours;
use web_common::boundary::capped;

use crate::abi;
use crate::demo::SwarmDemo;

/// `boid_count` boids in a `width × height` world, drawn at one pixel per `scale`.
/// Null for zero or capped values (`abi::MAX_*`) or a world smaller than
/// one drawn pixel. Free with [`swarm_free`].
#[unsafe(no_mangle)]
pub(crate) extern "C" fn swarm_new(
    boid_count: u32,
    width: u32,
    height: u32,
    scale: u32,
    seed: u32,
) -> *mut SwarmDemo {
    web_common::install_panic_hook();
    let parsed = (
        capped(boid_count, abi::MAX_BOIDS),
        capped(width, abi::MAX_SIDE),
        capped(height, abi::MAX_SIDE),
        capped(scale, abi::MAX_SCALE),
    );
    let (Some(boid_count), Some(width), Some(height), Some(scale)) = parsed else {
        return ptr::null_mut();
    };
    SwarmDemo::new(boid_count, width, height, scale, u64::from(seed))
        .map_or(ptr::null_mut(), |demo| Box::into_raw(Box::new(demo)))
}

/// Frees a demo. Null is a no-op.
///
/// # Safety
/// `demo` must be null or a handle from [`swarm_new`] not yet freed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_free(demo: *mut SwarmDemo) {
    if !demo.is_null() {
        // SAFETY: non-null, so per the contract from `Box::into_raw` in
        // `swarm_new` and not yet freed.
        drop(unsafe { Box::from_raw(demo) });
    }
}

/// Adds `elapsed_seconds` seconds of real time; returns steps taken (0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_advance(demo: *mut SwarmDemo, elapsed_seconds: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| demo.advance(elapsed_seconds))
}

/// Steps per simulated second. 1, or 0 for 0, above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ), or null.
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_set_rate(demo: *mut SwarmDemo, rate_hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.clock().set_rate_hz(rate_hz, abi::MAX_RATE_HZ))
    })
}

/// At most `max_steps` steps per [`swarm_advance`] (0: no cap): the step budget.
/// 1, or 0 above [`MAX_RATE_HZ`](abi::MAX_RATE_HZ) or for null.
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_set_step_cap(demo: *mut SwarmDemo, max_steps: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.clock().set_cap_steps(max_steps, abi::MAX_RATE_HZ))
    })
}

/// How neighbours are found (`abi::NEIGHBOURS_*`). 1, or 0 for an unknown
/// code, brute force past [`MAX_BRUTE`](abi::MAX_BRUTE) boids, or null.
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_set_neighbours(demo: *mut SwarmDemo, code: u32) -> u32 {
    let how = match code {
        abi::NEIGHBOURS_BRUTE => Neighbours::Brute,
        abi::NEIGHBOURS_GRID => Neighbours::Grid,
        abi::NEIGHBOURS_SORTED => Neighbours::Sorted,
        _ => return 0,
    };
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| u32::from(demo.set_neighbours(how)))
}

/// Sets a rule constant (`abi::PARAM_*`). 1, or 0 for an unknown code, a
/// value that makes the rules unusable (nothing changed), or null.
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_set_param(
    demo: *mut SwarmDemo,
    code: u32,
    value: f64,
) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| u32::from(demo.set_param(code, value)))
}

/// A rule constant (`abi::PARAM_*`), or NaN for an unknown code or null.
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_param(demo: *const SwarmDemo, code: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }
        .and_then(|demo| demo.param(code))
        .unwrap_or(f64::NAN)
}

/// The predator at world `(x, y)` if `on`, else none. 1, or 0 for a
/// non-finite point (nothing changed) or null.
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_set_predator(
    demo: *mut SwarmDemo,
    x: f64,
    y: f64,
    on: u32,
) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.set_predator((on != 0).then_some((x, y))))
    })
}

/// Draws the flock into the RGBA buffer; returns a pointer to it (one
/// `u32` per drawn pixel, `ImageData` byte order), or null for null.
/// Re-read the view after any call that could grow memory.
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_render(demo: *mut SwarmDemo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(ptr::null(), |demo| demo.render().as_ptr())
}

/// The drawn width, pixels (0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_view_width(demo: *const SwarmDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::try_from(demo.view().0).unwrap_or(0))
}

/// The drawn height, pixels (0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_view_height(demo: *const SwarmDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::try_from(demo.view().1).unwrap_or(0))
}

/// The number of boids (0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_len(demo: *const SwarmDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::try_from(demo.flock().len()).unwrap_or(0))
}

/// The flock's polarization, 0 to 1 (NaN for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`swarm_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn swarm_polarization(demo: *const SwarmDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(f64::NAN, |demo| demo.flock().polarization())
}

#[cfg(test)]
mod tests;
