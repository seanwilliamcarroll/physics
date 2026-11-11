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
    Demo::new_pool(scalar).map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Strikes the cue ball along `(aim_x, aim_y)` (any length but 0) at
/// `speed` m/s (`0 ..= MAX_POOL_SPEED`), the tip `tip` radii above centre
/// (`|tip| ≤ MAX_TIP`; 0 a stun, 0.4 natural roll, negative draw). Returns
/// 1, or 0 for an argument out of range or NaN (parsed here), a cue ball
/// out of play, a demo that isn't the table, or a null handle.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_strike(
    d: *mut Demo,
    aim_x: f64,
    aim_y: f64,
    speed: f64,
    tip: f64,
) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let Some(d) = (unsafe { d.as_mut() }) else {
        return 0;
    };
    let ok = (0.0..=abi::MAX_POOL_SPEED).contains(&speed)
        && (-abi::MAX_TIP..=abi::MAX_TIP).contains(&tip)
        && aim_x.is_finite()
        && aim_y.is_finite();
    u32::from(ok && d.strike(aim_x, aim_y, speed, tip))
}

/// Speculative contacts on (`1`) or off (`0`), from the next step.
/// Returns 1, or 0 for another value, a world without collisions, or a
/// null handle.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_speculative(d: *mut Demo, on: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(on)) = (
        unsafe { d.as_mut() },
        match on {
            0 => Some(false),
            1 => Some(true),
            _ => None,
        },
    ) else {
        return 0;
    };
    u32::from(d.set_speculative(on))
}

/// Tunnels counted since the rack, or NaN (a demo that doesn't count
/// them, or a null handle).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_tunnels(d: *const Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    #[expect(clippy::cast_precision_loss, reason = "a count far below 2⁵³")]
    unsafe { d.as_ref() }
        .and_then(Demo::tunnels)
        .map_or(f64::NAN, |n| n as f64)
}

/// 1 if every ball has stopped, spin included; 0 otherwise or for null.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_at_rest(d: *const Demo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::from(d.at_rest()))
}

/// Re-spots a potted cue ball on the head spot (or just behind it) once
/// the table is at rest. Returns 1, or 0 if the cue ball is in play, the
/// table is moving, it isn't the table, or a null handle.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_respot_cue(d: *mut Demo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    unsafe { d.as_mut() }.map_or(0, |d| u32::from(d.respot_cue()))
}

/// Ball `i`'s number (0 the cue ball, 1–15), or −1 past the rack, for a
/// demo that isn't the table, or a null handle.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_ball_number(d: *const Demo, i: u32) -> i32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    let d = unsafe { d.as_ref() };
    d.zip(usize::try_from(i).ok())
        .and_then(|(d, i)| d.ball_number(i))
        .map_or(-1, i32::from)
}

/// Particle `i`'s spin about x, rad/s (NaN past the end or for null).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_spin_x(d: *const Demo, i: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    spin(unsafe { d.as_ref() }, i).map_or(f64::NAN, |(x, _)| x)
}

/// Particle `i`'s spin about y; see [`demo_spin_x`].
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_spin_y(d: *const Demo, i: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    spin(unsafe { d.as_ref() }, i).map_or(f64::NAN, |(_, y)| y)
}

fn spin(d: Option<&Demo>, i: u32) -> Option<(f64, f64)> {
    d?.spin(usize::try_from(i).ok()?)
}

/// Pointer to the potted list, `[ball, pocket, …]` as `u32`, everything
/// since the rack (null for null).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_potted_ptr(d: *const Demo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(ptr::null(), |d| d.potted().as_ptr())
}

/// Number of `u32`s at [`demo_potted_ptr`] (two per ball; 0 for null).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_potted_len(d: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(0, |d| d.potted().len())
}

/// Pointer to the segments, `[x0, y0, x1, y1, …]` as `f32` m (null for null).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_segments_ptr(d: *const Demo) -> *const f32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(ptr::null(), |d| d.segments().as_ptr())
}

/// Number of `f32`s at [`demo_segments_ptr`] (four per segment; 0 for null).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_segments_len(d: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(0, |d| d.segments().len())
}

/// Pointer to the pockets, `[x, y, r, …]` as `f32` m (null for null).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_pockets_ptr(d: *const Demo) -> *const f32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(ptr::null(), |d| d.pocket_circles().as_ptr())
}

/// Number of `f32`s at [`demo_pockets_ptr`] (three per pocket; 0 for null).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_pockets_len(d: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(0, |d| d.pocket_circles().len())
}
