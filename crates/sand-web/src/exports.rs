//! The C-ABI surface the sand page calls. Each export is a thin adapter
//! over [`SandDemo`]: every argument parsed here, at the boundary; null
//! handles refused. All `unsafe` in this crate lives in this file.

use core::ptr;

use sand::Material;
use web_common::boundary::capped;

use crate::abi;
use crate::demo::SandDemo;

fn material(code: u32) -> Option<Material> {
    u8::try_from(code).ok().and_then(Material::from_code)
}

/// Creates an empty `width × height` grid. Null for a zero side or a side
/// above [`MAX_SIDE`](abi::MAX_SIDE). Free with [`sand_free`].
#[unsafe(no_mangle)]
pub(crate) extern "C" fn sand_new(width: u32, height: u32, seed: u32) -> *mut SandDemo {
    web_common::install_panic_hook();
    let (Some(capped_width), Some(capped_height)) =
        (capped(width, abi::MAX_SIDE), capped(height, abi::MAX_SIDE))
    else {
        return ptr::null_mut();
    };
    SandDemo::new(capped_width, capped_height, u64::from(seed))
        .map_or(ptr::null_mut(), |demo| Box::into_raw(Box::new(demo)))
}

/// Null is a no-op.
///
/// # Safety
/// `demo` must be null or a handle from [`sand_new`] not yet freed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_free(demo: *mut SandDemo) {
    if !demo.is_null() {
        // SAFETY: non-null, so per the contract from `Box::into_raw` in
        // `sand_new` and not yet freed.
        drop(unsafe { Box::from_raw(demo) });
    }
}

/// Adds `elapsed_s` seconds of real time; returns steps taken (0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_advance(demo: *mut SandDemo, elapsed_s: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| demo.advance(elapsed_s))
}

/// Steps per simulated second. 1, or 0 for 0, above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ), or null.
///
/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_set_rate(demo: *mut SandDemo, rate_hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.clock().set_rate_hz(rate_hz, abi::MAX_RATE_HZ))
    })
}

/// At most `max_steps` steps per [`sand_advance`] (`0`: no cap): the step
/// budget. 1, or 0 above [`MAX_RATE_HZ`](abi::MAX_RATE_HZ) or for null.
///
/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_set_step_cap(demo: *mut SandDemo, max_steps: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.clock().set_cap_steps(max_steps, abi::MAX_RATE_HZ))
    })
}

/// Chunked updates on (`1`) or off (`0`). 1, or 0 for another value or null.
///
/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_set_chunked(demo: *mut SandDemo, on: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    let (Some(demo), true) = (unsafe { demo.as_mut() }, on <= 1) else {
        return 0;
    };
    demo.set_chunked(on == 1);
    1
}

/// Paints a disc of `radius` (at most [`MAX_BRUSH`](abi::MAX_BRUSH)) around
/// `(x, y)` with material `code` (`MATERIAL_*`; empty erases), clipped to
/// the grid. Returns the cells painted: 0 for an unknown code, a radius
/// past the cap, or null.
///
/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_paint(
    demo: *mut SandDemo,
    x: i32,
    y: i32,
    radius: u32,
    code: u32,
) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    let (Some(demo), Some(material), true) = (
        unsafe { demo.as_mut() },
        material(code),
        radius <= abi::MAX_BRUSH,
    ) else {
        return 0;
    };
    let painted = demo.paint(i64::from(x), i64::from(y), i64::from(radius), material);
    u32::try_from(painted).unwrap_or(u32::MAX)
}

/// Renders the grid into the RGBA buffer; returns a pointer to it (one
/// `u32` per cell, `ImageData` byte order), or null for null. Re-read the
/// pointer every frame: memory growth detaches old views.
///
/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_render(demo: *mut SandDemo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(ptr::null(), |demo| demo.render().as_ptr())
}

/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_width(demo: *const SandDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::try_from(demo.grid().width()).unwrap_or(0))
}

/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_height(demo: *const SandDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::try_from(demo.grid().height()).unwrap_or(0))
}

/// Cells holding material `code` (0 for an unknown code or null).
///
/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_count(demo: *const SandDemo, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    let (Some(demo), Some(material)) = (unsafe { demo.as_ref() }, material(code)) else {
        return 0;
    };
    u32::try_from(demo.grid().count(material)).unwrap_or(u32::MAX)
}

/// Moves made by the last step (0 for null): 0 means settled.
///
/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_last_moves(demo: *const SandDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| {
        u32::try_from(demo.last_moves()).unwrap_or(u32::MAX)
    })
}

/// Chunks the next step will update (0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_awake_chunks(demo: *const SandDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| {
        u32::try_from(demo.grid().awake_chunks().0).unwrap_or(0)
    })
}

/// All the grid's chunks (0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_chunks(demo: *const SandDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| {
        u32::try_from(demo.grid().awake_chunks().1).unwrap_or(0)
    })
}

#[cfg(test)]
mod tests;
