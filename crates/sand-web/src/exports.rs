//! The C-ABI surface the sand page calls. Each export is a thin adapter
//! over [`SandDemo`]: every argument parsed here, at the boundary; null
//! handles refused. All `unsafe` in this crate lives in this file.

use core::num::NonZeroU32;
use core::ptr;

use sand::Material;
use web_common::boundary::capped;

use crate::abi;
use crate::demo::SandDemo;

/// The material for a wire code, if any.
fn material(code: u32) -> Option<Material> {
    u8::try_from(code).ok().and_then(Material::from_code)
}

/// Creates an empty `width × height` grid. Null for a zero side or a side
/// above [`MAX_SIDE`](abi::MAX_SIDE). Free with [`sand_free`].
#[unsafe(no_mangle)]
pub(crate) extern "C" fn sand_new(width: u32, height: u32, seed: u32) -> *mut SandDemo {
    web_common::install_panic_hook();
    let (Some(w), Some(h)) = (capped(width, abi::MAX_SIDE), capped(height, abi::MAX_SIDE)) else {
        return ptr::null_mut();
    };
    SandDemo::new(w, h, u64::from(seed)).map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Frees a demo. Null is a no-op.
///
/// # Safety
/// `d` must be null or a handle from [`sand_new`] not yet freed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_free(d: *mut SandDemo) {
    if !d.is_null() {
        // SAFETY: non-null, so per the contract from `Box::into_raw` in
        // `sand_new` and not yet freed.
        drop(unsafe { Box::from_raw(d) });
    }
}

/// Adds `elapsed_s` seconds of real time; returns steps taken (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_advance(d: *mut SandDemo, elapsed_s: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| d.advance(elapsed_s))
}

/// Steps per simulated second. 1, or 0 for 0, above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ), or null.
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_set_rate(d: *mut SandDemo, hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    let (Some(d), Some(rate)) = (
        unsafe { d.as_mut() },
        NonZeroU32::new(hz).filter(|r| r.get() <= abi::MAX_RATE_HZ),
    ) else {
        return 0;
    };
    d.set_rate(rate);
    1
}

/// At most `n` steps per [`sand_advance`] (`0`: no cap): the step budget.
/// 1, or 0 above [`MAX_RATE_HZ`](abi::MAX_RATE_HZ) or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_set_step_cap(d: *mut SandDemo, n: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    let Some(d) = (unsafe { d.as_mut() }) else {
        return 0;
    };
    if n > abi::MAX_RATE_HZ {
        return 0;
    }
    d.set_step_cap(NonZeroU32::new(n));
    1
}

/// Chunked updates on (`1`) or off (`0`). 1, or 0 for another value or null.
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_set_chunked(d: *mut SandDemo, on: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    let (Some(d), true) = (unsafe { d.as_mut() }, on <= 1) else {
        return 0;
    };
    d.set_chunked(on == 1);
    1
}

/// Paints a disc of `radius` (at most [`MAX_BRUSH`](abi::MAX_BRUSH)) around
/// `(x, y)` with material `code` (`MATERIAL_*`; empty erases), clipped to
/// the grid. Returns the cells painted: 0 for an unknown code, a radius
/// past the cap, or null.
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_paint(
    d: *mut SandDemo,
    x: i32,
    y: i32,
    radius: u32,
    code: u32,
) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    let (Some(d), Some(m), true) = (
        unsafe { d.as_mut() },
        material(code),
        radius <= abi::MAX_BRUSH,
    ) else {
        return 0;
    };
    let painted = d.paint(i64::from(x), i64::from(y), i64::from(radius), m);
    u32::try_from(painted).unwrap_or(u32::MAX)
}

/// Renders the grid into the RGBA buffer; returns a pointer to it (one
/// `u32` per cell, `ImageData` byte order), or null for null. Re-read the
/// pointer every frame: memory growth detaches old views.
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_render(d: *mut SandDemo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(ptr::null(), |d| d.render().as_ptr())
}

/// The grid's width (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_width(d: *const SandDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.grid().width()).unwrap_or(0))
}

/// The grid's height (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_height(d: *const SandDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.grid().height()).unwrap_or(0))
}

/// Cells holding material `code` (0 for an unknown code or null).
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_count(d: *const SandDemo, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    let (Some(d), Some(m)) = (unsafe { d.as_ref() }, material(code)) else {
        return 0;
    };
    u32::try_from(d.grid().count(m)).unwrap_or(u32::MAX)
}

/// Moves made by the last step (0 for null): 0 means settled.
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_last_moves(d: *const SandDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.last_moves()).unwrap_or(u32::MAX))
}

/// Chunks the next step will update (0 for null); see [`sand_chunks`].
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_awake_chunks(d: *const SandDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.grid().awake_chunks().0).unwrap_or(0))
}

/// All the grid's chunks (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`sand_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn sand_chunks(d: *const SandDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.grid().awake_chunks().1).unwrap_or(0))
}

#[cfg(test)]
mod tests;
