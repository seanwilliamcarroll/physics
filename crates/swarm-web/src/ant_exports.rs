//! The C-ABI surface of the ants page (S3), over [`AntDemo`]: every
//! argument parsed here; null handles refused.

use core::ptr;

use web_common::boundary::capped;

use crate::abi;
use crate::ant_demo::AntDemo;

/// A `width × height` world (cells, each at most
/// [`MAX_ANT_SIDE`](abi::MAX_ANT_SIDE)) with `n` ants, drawn `scale` px a
/// cell (1–8). Null if refused.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn ant_new(
    width: u32,
    height: u32,
    n: u32,
    scale: u32,
    seed: u32,
) -> *mut AntDemo {
    web_common::install_panic_hook();
    let parsed = (
        capped(width, abi::MAX_ANT_SIDE),
        capped(height, abi::MAX_ANT_SIDE),
        capped(n, abi::MAX_ANTS),
        capped(scale, 8),
    );
    let (Some(w), Some(h), Some(n), Some(s)) = parsed else {
        return ptr::null_mut();
    };
    AntDemo::new(w, h, n, s, u64::from(seed))
        .map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Frees a demo. Null is a no-op.
///
/// # Safety
/// `d` must be null or a handle from [`ant_new`] not yet freed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_free(d: *mut AntDemo) {
    if !d.is_null() {
        // SAFETY: non-null, so per the contract from `Box::into_raw` in
        // `ant_new` and not yet freed.
        drop(unsafe { Box::from_raw(d) });
    }
}

/// Adds `elapsed_s` seconds of real time; returns steps taken.
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_advance(d: *mut AntDemo, elapsed_s: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| d.advance(elapsed_s))
}

/// Steps per simulated second: 1, or 0 out of range or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_set_rate(d: *mut AntDemo, hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| {
        u32::from(d.clock().set_rate_hz(hz, abi::MAX_RATE_HZ))
    })
}

/// At most `n` steps per advance (0: no cap): 1, or 0 above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ) or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_set_step_cap(d: *mut AntDemo, n: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| {
        u32::from(d.clock().set_cap_steps(n, abi::MAX_RATE_HZ))
    })
}

/// Sensing on (1) or off (0, a random walk): 1, or 0 otherwise or null.
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_set_sensing(d: *mut AntDemo, on: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    match (unsafe { d.as_mut() }, on) {
        (Some(d), 0 | 1) => {
            d.set_sensing(on == 1);
            1
        }
        _ => 0,
    }
}

/// Paints with a tool (`abi::TOOL_*`) at cell `(x, y)`, radius in cells,
/// `amount` food a cell for the food tool; returns what changed, as `f64`
/// (−1 if refused or null).
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_paint(
    d: *mut AntDemo,
    tool: u32,
    x: f64,
    y: f64,
    radius: f64,
    amount: u32,
) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }
        .and_then(|d| d.paint(tool, x, y, radius, amount))
        .map_or(-1.0, math::convert::u64_to_f64)
}

/// Sets a constant (`abi::ANT_*`): 1, or 0 refused (nothing changed) or null.
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_set_param(d: *mut AntDemo, code: u32, value: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| u32::from(d.set_param(code, value)))
}

/// A constant, or NaN for an unknown code or null.
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_param(d: *const AntDemo, code: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }
        .and_then(|d| d.param(code))
        .unwrap_or(f64::NAN)
}

/// Draws the world; a pointer to the view's RGBA `u32`s, or null.
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_render(d: *mut AntDemo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(ptr::null(), |d| d.render().as_ptr())
}

/// The drawn width, pixels (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_view_width(d: *const AntDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.view().0).unwrap_or(0))
}

/// The drawn height, pixels (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_view_height(d: *const AntDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.view().1).unwrap_or(0))
}

/// The number of ants (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_len(d: *const AntDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.colony().len()).unwrap_or(0))
}

/// Food delivered so far (NaN for null).
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_delivered(d: *const AntDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(f64::NAN, |d| {
        math::convert::u64_to_f64(d.colony().delivered())
    })
}

/// Ants carrying food now (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_carrying(d: *const AntDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| {
        u32::try_from(d.colony().carrying()).unwrap_or(u32::MAX)
    })
}

/// Food lying in the world (NaN for null).
///
/// # Safety
/// `d` must be null or a live handle from [`ant_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_food(d: *const AntDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(f64::NAN, |d| {
        math::convert::u64_to_f64(d.colony().food_in_world())
    })
}

#[cfg(test)]
mod tests;
