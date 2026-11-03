//! Pointer dragging (`docs/06-constraints.md`, "Dragging").

use crate::demo::Demo;

/// Grabs the dynamic particle nearest to world point `(x, y)` (m) within
/// `radius` (m), releasing any earlier grab. Returns its index, or −1 if
/// nothing dynamic is that close, the radius is negative or NaN, or `d` is
/// null. The grab adds an anchor particle and a rod, so re-read positions
/// and links afterwards.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_grab(d: *mut Demo, x: f64, y: f64, radius: f64) -> i32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let Some(d) = (unsafe { d.as_mut() }) else {
        return -1;
    };
    if !(radius >= 0.0 && x.is_finite() && y.is_finite()) {
        return -1;
    }
    d.grab(x, y, radius)
        .and_then(|i| i32::try_from(i).ok())
        .unwrap_or(-1)
}

/// Moves the held grab to world point `(x, y)`. Returns 1, or 0 if
/// nothing is held, the point isn't finite, or `d` is null.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_drag(d: *mut Demo, x: f64, y: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let Some(d) = (unsafe { d.as_mut() }) else {
        return 0;
    };
    u32::from(x.is_finite() && y.is_finite() && d.drag(x, y))
}

/// Releases the held grab (removing its anchor and rod). Returns 1, or 0
/// if nothing was held or `d` is null.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_release(d: *mut Demo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    unsafe { d.as_mut() }.map_or(0, |d| u32::from(d.release()))
}
