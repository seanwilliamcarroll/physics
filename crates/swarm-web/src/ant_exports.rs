//! The C-ABI surface of the ants page, over [`AntDemo`]: every
//! argument parsed here.
//!
//! Contract for every handle argument: null or a live handle from the `*_new`
//! export, not yet freed, and unaliased for the `&mut` ones. Null is refused:
//! exports return 0, NaN, -1 or a null pointer; `*_free` does nothing.

use core::ptr;

use web_common::boundary::capped;

use crate::abi;
use crate::ant_demo::AntDemo;

/// A `width × height` world (cells, each at most
/// [`MAX_ANT_SIDE`](abi::MAX_ANT_SIDE)) with `ant_count` ants, drawn `scale` px a
/// cell (1–8). Null if refused.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn ant_new(
    width: u32,
    height: u32,
    ant_count: u32,
    scale: u32,
    seed: u32,
) -> *mut AntDemo {
    web_common::install_panic_hook();
    let parsed = (
        capped(width, abi::MAX_ANT_SIDE),
        capped(height, abi::MAX_ANT_SIDE),
        capped(ant_count, abi::MAX_ANTS),
        capped(scale, 8),
    );
    let (Some(width), Some(height), Some(ant_count), Some(scale)) = parsed else {
        return ptr::null_mut();
    };
    AntDemo::new(width, height, ant_count, scale, u64::from(seed))
        .map_or(ptr::null_mut(), |demo| Box::into_raw(Box::new(demo)))
}

/// Frees a demo. Null is a no-op.
///
/// # Safety
/// `demo` must be null or a handle from [`ant_new`] not yet freed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_free(demo: *mut AntDemo) {
    if !demo.is_null() {
        // SAFETY: non-null, so per the contract from `Box::into_raw` in
        // `ant_new` and not yet freed.
        drop(unsafe { Box::from_raw(demo) });
    }
}

/// Adds `elapsed_seconds` seconds of real time; returns steps taken.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_advance(demo: *mut AntDemo, elapsed_seconds: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| demo.advance(elapsed_seconds))
}

/// Steps per simulated second: 1, or 0 out of range.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_set_rate(demo: *mut AntDemo, rate_hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.clock().set_rate_hz(rate_hz, abi::MAX_RATE_HZ))
    })
}

/// At most `max_steps` steps per advance (0: no cap): 1, or 0 above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ).
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_set_step_cap(demo: *mut AntDemo, max_steps: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.clock().set_cap_steps(max_steps, abi::MAX_RATE_HZ))
    })
}

/// Sensing on (1) or off (0, a random walk): 1, or 0 otherwise.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_set_sensing(demo: *mut AntDemo, on: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    match (unsafe { demo.as_mut() }, on) {
        (Some(demo), 0 | 1) => {
            demo.set_sensing(on == 1);
            1
        }
        _ => 0,
    }
}

/// Paints with a tool (`abi::TOOL_*`) at cell `(x, y)`, radius in cells,
/// `amount` food a cell for the food tool; returns what changed, as `f64`
/// (−1 if refused).
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_paint(
    demo: *mut AntDemo,
    tool: u32,
    x: f64,
    y: f64,
    radius: f64,
    amount: u32,
) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }
        .and_then(|demo| demo.paint(tool, x, y, radius, amount))
        .map_or(-1.0, math::convert::u64_to_f64)
}

/// Sets a constant (`abi::ANT_*`): 1, or 0 refused (nothing changed).
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_set_param(demo: *mut AntDemo, code: u32, value: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| u32::from(demo.set_param(code, value)))
}

/// A constant, or NaN for an unknown code.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_param(demo: *const AntDemo, code: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }
        .and_then(|demo| demo.param(code))
        .unwrap_or(f64::NAN)
}

/// Draws the world; a pointer to the view's RGBA `u32`s.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_render(demo: *mut AntDemo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(ptr::null(), |demo| demo.render().as_ptr())
}

/// The drawn width, pixels.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_view_width(demo: *const AntDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::try_from(demo.view().0).unwrap_or(0))
}

/// The drawn height, pixels.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_view_height(demo: *const AntDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::try_from(demo.view().1).unwrap_or(0))
}

/// The number of ants.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_len(demo: *const AntDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::try_from(demo.colony().len()).unwrap_or(0))
}

/// Food delivered so far.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_delivered(demo: *const AntDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(f64::NAN, |demo| {
        math::convert::u64_to_f64(demo.colony().delivered())
    })
}

/// Ants carrying food now.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_carrying(demo: *const AntDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| {
        u32::try_from(demo.colony().carrying()).unwrap_or(u32::MAX)
    })
}

/// Food lying in the world.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn ant_food(demo: *const AntDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(f64::NAN, |demo| {
        math::convert::u64_to_f64(demo.colony().food_in_world())
    })
}

#[cfg(test)]
mod tests;
