//! The M6 scenes: constructors, restitution, and the collision pages'
//! readouts (radii, momentum, the broadphase's pairs).

use core::ptr;

use engine::Restitution;

use crate::abi;
use crate::demo::{Demo, ScalarKind};
use web_shell::boundary::capped;

/// Creates the M6 box (`scenarios::ball_box`): `n` balls (at most
/// [`MAX_BOX_BALLS`](abi::MAX_BOX_BALLS)) with velocities from `seed`,
/// elastic, impulse with 10 substeps to start. Returns null for an
/// unknown scalar code or too many balls. Free with `demo_free`.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new_ball_box(scalar: u32, n: u32, seed: u32) -> *mut Demo {
    web_shell::install_panic_hook();
    let (Some(scalar), Some(n)) = (ScalarKind::from_code(scalar), capped(n, abi::MAX_BOX_BALLS))
    else {
        return ptr::null_mut();
    };
    Demo::new_ball_box(scalar, n, u64::from(seed))
        .map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Creates the M6 break (`scenarios::break_shot`): the rack `gap` m
/// apart (0: touching), elastic, free space, impulse with 10 substeps to
/// start. Returns null for an unknown scalar code or a gap outside `[0,
/// MAX_BREAK_GAP]` (NaN included: parsed here). Free with `demo_free`.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new_break_shot(scalar: u32, gap: f64) -> *mut Demo {
    web_shell::install_panic_hook();
    let Some(scalar) = ScalarKind::from_code(scalar) else {
        return ptr::null_mut();
    };
    if !(0.0..=abi::MAX_BREAK_GAP).contains(&gap) {
        return ptr::null_mut();
    }
    Demo::new_break_shot(scalar, gap).map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Creates the M6 cradle (`scenarios::cradle`): `balls` (at most
/// [`MAX_CRADLE_BALLS`](abi::MAX_CRADLE_BALLS)) on rods, the first
/// `pulled` swung out (clamped to `balls`), elastic, impulse with 10
/// substeps to start. Returns null for an unknown scalar code or too many
/// balls. Free with `demo_free`.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new_cradle(scalar: u32, balls: u32, pulled: u32) -> *mut Demo {
    web_shell::install_panic_hook();
    let (Some(scalar), Some(balls)) = (
        ScalarKind::from_code(scalar),
        capped(balls, abi::MAX_CRADLE_BALLS),
    ) else {
        return ptr::null_mut();
    };
    let pulled = usize::try_from(pulled).map_or(balls, |p| p.min(balls));
    Demo::new_cradle(scalar, balls, pulled).map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Restitution `e` for every collision, from the next step. Returns 1, or
/// 0 for `e` outside `[0, 1]`, NaN (parsed into `Restitution` here), a
/// world without collisions, or a null handle.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_restitution(d: *mut Demo, e: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(e)) = (unsafe { d.as_mut() }, Restitution::new(e)) else {
        return 0;
    };
    u32::from(d.set_restitution(e))
}

/// Particle `i`'s radius, m (0 for a point or a pin), or NaN past the last
/// particle or for a null handle.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_particle_radius(d: *const Demo, i: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    let d = unsafe { d.as_ref() };
    d.zip(usize::try_from(i).ok())
        .and_then(|(d, i)| d.particle_radius(i))
        .unwrap_or(f64::NAN)
}

/// Total momentum's x, kg·m/s (NaN for a null handle).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_momentum_x(d: *const Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(f64::NAN, |d| d.momentum().0)
}

/// Total momentum's y; see [`demo_momentum_x`].
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_momentum_y(d: *const Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(f64::NAN, |d| d.momentum().1)
}

/// Recomputes the broadphase's candidate pairs for the current state (as
/// the next substep will see them) into the pairs buffer; returns the
/// grid's cell size, m. NaN, with the buffer emptied, for a world without
/// collisions or a null handle. Re-read [`demo_pairs_ptr`] after.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_update_pairs(d: *mut Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    unsafe { d.as_mut() }
        .and_then(Demo::update_pairs)
        .unwrap_or(f64::NAN)
}

/// Pointer to the pairs buffer, `[a0, b0, a1, b1, ...]` as `u32` (null
/// for a null handle).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_pairs_ptr(d: *const Demo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(ptr::null(), |d| d.pairs().as_ptr())
}

/// Number of `u32`s at [`demo_pairs_ptr`] (two per pair; 0 for null).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_pairs_len(d: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(0, |d| d.pairs().len())
}
