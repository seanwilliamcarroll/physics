//! The M7 pool table: the constructor, the cue, speculation, and the
//! billiards page's readouts.

use core::ptr;

use crate::abi;
use crate::demo::{Demo, ScalarKind};

/// Creates the pool table (`scenarios::pool_rack`): the cue ball on the
/// head spot, 15 balls racked, impulse with 10 substeps, tunnels counted.
/// Null for an unknown scalar code. Free with `demo_free`.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new_pool(scalar: u32) -> *mut Demo {
    web_common::install_panic_hook();
    let Some(scalar) = ScalarKind::from_code(scalar) else {
        return ptr::null_mut();
    };
    Demo::new_pool(scalar).map_or(ptr::null_mut(), |demo| Box::into_raw(Box::new(demo)))
}

/// Strikes the cue ball along `(aim_x, aim_y)` (any length but 0) at
/// `speed` m/s (`0 ..= MAX_POOL_SPEED`), the tip `tip` radii above centre
/// (`|tip| ≤ MAX_TIP`; 0 a stun, 0.4 natural roll, negative draw). Returns
/// 1, or 0 for an argument out of range or NaN (parsed here), a cue ball
/// out of play, a demo that isn't the table, or a null handle.
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_strike(
    demo: *mut Demo,
    aim_x: f64,
    aim_y: f64,
    speed: f64,
    tip: f64,
) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let Some(demo) = (unsafe { demo.as_mut() }) else {
        return 0;
    };
    let ok = (0.0..=abi::MAX_POOL_SPEED).contains(&speed)
        && (-abi::MAX_TIP..=abi::MAX_TIP).contains(&tip)
        && aim_x.is_finite()
        && aim_y.is_finite();
    u32::from(ok && demo.strike(aim_x, aim_y, speed, tip))
}

/// Speculative contacts on (`1`) or off (`0`), from the next step.
/// Returns 1, or 0 for another value, a world without collisions, or a
/// null handle.
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_speculative(demo: *mut Demo, on: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(on)) = (
        unsafe { demo.as_mut() },
        match on {
            0 => Some(false),
            1 => Some(true),
            _ => None,
        },
    ) else {
        return 0;
    };
    u32::from(demo.set_speculative(on))
}

/// Tunnels counted since the rack, or NaN (a demo that doesn't count
/// them, or a null handle).
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_tunnels(demo: *const Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    #[expect(clippy::cast_precision_loss, reason = "a count far below 2⁵³")]
    unsafe { demo.as_ref() }
        .and_then(Demo::tunnels)
        .map_or(f64::NAN, |n| n as f64)
}

/// 1 if every ball has stopped, spin included; 0 otherwise or for null.
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_at_rest(demo: *const Demo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| u32::from(demo.at_rest()))
}

/// Re-spots a potted cue ball on the head spot (or just behind it) once
/// the table is at rest. Returns 1, or 0 if the cue ball is in play, the
/// table is moving, it isn't the table, or a null handle.
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_respot_cue(demo: *mut Demo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| u32::from(demo.respot_cue()))
}

/// Ball `i`'s number (0 the cue ball, 1–15), or −1 past the rack, for a
/// demo that isn't the table, or a null handle.
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_ball_number(demo: *const Demo, i: u32) -> i32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    let demo = unsafe { demo.as_ref() };
    demo.zip(usize::try_from(i).ok())
        .and_then(|(demo, i)| demo.ball_number(i))
        .map_or(-1, i32::from)
}

/// Particle `i`'s spin about x, rad/s (NaN past the end or for null).
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_spin_x(demo: *const Demo, i: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    spin(unsafe { demo.as_ref() }, i).map_or(f64::NAN, |(x, _)| x)
}

/// Particle `i`'s spin about y; see [`demo_spin_x`].
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_spin_y(demo: *const Demo, i: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    spin(unsafe { demo.as_ref() }, i).map_or(f64::NAN, |(_, y)| y)
}

fn spin(demo: Option<&Demo>, i: u32) -> Option<(f64, f64)> {
    demo?.spin(usize::try_from(i).ok()?)
}

/// Pointer to the potted list, `[ball, pocket, …]` as `u32`, everything
/// since the rack (null for null).
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_potted_ptr(demo: *const Demo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(ptr::null(), |demo| demo.potted().as_ptr())
}

/// Number of `u32`s at [`demo_potted_ptr`] (two per ball; 0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_potted_len(demo: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| demo.potted().len())
}

/// Pointer to the segments, `[x0, y0, x1, y1, …]` as `f32` m (null for null).
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_segments_ptr(demo: *const Demo) -> *const f32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(ptr::null(), |demo| demo.segments().as_ptr())
}

/// Number of `f32`s at [`demo_segments_ptr`] (four per segment; 0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_segments_len(demo: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| demo.segments().len())
}

/// Pointer to the pockets, `[x, y, r, …]` as `f32` m (null for null).
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_pockets_ptr(demo: *const Demo) -> *const f32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(ptr::null(), |demo| demo.pocket_circles().as_ptr())
}

/// Number of `f32`s at [`demo_pockets_ptr`] (three per pocket; 0 for null).
///
/// # Safety
/// `demo` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_pockets_len(demo: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| demo.pocket_circles().len())
}
