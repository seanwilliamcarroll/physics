//! Pointer dragging (`docs/06-constraints.md`, "Dragging").

use crate::demo::Demo;

/// 1 if the demo's world can be grabbed, 0 if not (or `demo` is null): a
/// world its integrator steps (no constraints, nothing colliding) refuses,
/// since a grab's rod would hand it to a solver while held
/// (`docs/06-constraints.md`, "Dragging"). For the page to say so.
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_grabbable(demo: *const Demo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    u32::from(unsafe { demo.as_ref() }.is_some_and(Demo::grabbable))
}

/// Grabs the dynamic particle nearest to world point `(x, y)` (m) within
/// `radius` (m), releasing any earlier grab: after this call, at most the
/// new grab is held. Returns its index, or −1 if nothing is held now:
/// nothing dynamic is that close, the world can't be grabbed
/// ([`demo_grabbable`]), the point isn't finite, the radius is negative
/// or NaN, or `demo` is null. A grab adds an anchor particle and a rod (a
/// release removes them), so re-read positions and links afterwards.
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_grab(demo: *mut Demo, x: f64, y: f64, radius: f64) -> i32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let Some(demo) = (unsafe { demo.as_mut() }) else {
        return -1;
    };
    if !(radius >= 0.0 && x.is_finite() && y.is_finite()) {
        // Like a miss: the earlier grab is released either way, so −1
        // always means "nothing held".
        demo.release();
        return -1;
    }
    demo.grab(x, y, radius)
        .and_then(|i| i32::try_from(i).ok())
        .unwrap_or(-1)
}

/// Moves the held grab to world point `(x, y)`. Returns 1, or 0 if
/// nothing is held, the point isn't finite, or `demo` is null.
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_drag(demo: *mut Demo, x: f64, y: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let Some(demo) = (unsafe { demo.as_mut() }) else {
        return 0;
    };
    u32::from(x.is_finite() && y.is_finite() && demo.drag(x, y))
}

/// Releases the held grab (removing its anchor and rod). Returns 1, or 0
/// if nothing was held or `demo` is null.
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_release(demo: *mut Demo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| u32::from(demo.release()))
}
