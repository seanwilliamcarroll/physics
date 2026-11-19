//! The collision scenes: constructors, restitution, and the collision pages'
//! readouts.

use core::ptr;

use engine::Restitution;

use crate::abi;
use crate::demo::{Demo, ScalarKind};
use web_common::boundary::capped;

/// Creates the box (`scenarios::ball_box`): `ball_count` balls (at most
/// [`MAX_BOX_BALLS`](abi::MAX_BOX_BALLS)) with velocities from `seed`,
/// elastic, impulse with 10 substeps to start. Returns null for an
/// unknown scalar code or too many balls. Free with `demo_free`.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new_ball_box(scalar: u32, ball_count: u32, seed: u32) -> *mut Demo {
    web_common::install_panic_hook();
    let (Some(scalar), Some(ball_count)) = (
        ScalarKind::from_code(scalar),
        capped(ball_count, abi::MAX_BOX_BALLS),
    ) else {
        return ptr::null_mut();
    };
    Demo::new_ball_box(scalar, ball_count, u64::from(seed))
        .map_or(ptr::null_mut(), |demo| Box::into_raw(Box::new(demo)))
}

/// Creates the break (`scenarios::break_shot`): the rack `gap` m apart (0:
/// touching), elastic, free space, impulse with 10 substeps to start. Returns
/// null for an unknown scalar code or a gap outside `[0, MAX_BREAK_GAP]`
/// (NaN included). Free with `demo_free`.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new_break_shot(scalar: u32, gap: f64) -> *mut Demo {
    web_common::install_panic_hook();
    let Some(scalar) = ScalarKind::from_code(scalar) else {
        return ptr::null_mut();
    };
    if !(0.0..=abi::MAX_BREAK_GAP).contains(&gap) {
        return ptr::null_mut();
    }
    Demo::new_break_shot(scalar, gap).map_or(ptr::null_mut(), |demo| Box::into_raw(Box::new(demo)))
}

/// Creates the cradle (`scenarios::cradle`): `balls` (at most
/// [`MAX_CRADLE_BALLS`](abi::MAX_CRADLE_BALLS)) on rods, the first `pulled`
/// swung out (clamped to `balls`), elastic, impulse with 10 substeps to
/// start. Returns null for an unknown scalar code or too many balls. Free
/// with `demo_free`.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new_cradle(scalar: u32, balls: u32, pulled: u32) -> *mut Demo {
    web_common::install_panic_hook();
    let (Some(scalar), Some(balls)) = (
        ScalarKind::from_code(scalar),
        capped(balls, abi::MAX_CRADLE_BALLS),
    ) else {
        return ptr::null_mut();
    };
    let pulled = usize::try_from(pulled).map_or(balls, |p| p.min(balls));
    Demo::new_cradle(scalar, balls, pulled)
        .map_or(ptr::null_mut(), |demo| Box::into_raw(Box::new(demo)))
}

/// Restitution for every collision. Returns 1, or 0 for a value outside
/// `[0, 1]`, NaN, a world without collisions, or a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_restitution(demo: *mut Demo, restitution: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(restitution)) = (unsafe { demo.as_mut() }, Restitution::new(restitution))
    else {
        return 0;
    };
    u32::from(demo.set_restitution(restitution))
}

/// Particle `index`'s radius, m (0 for a point or a pin), or NaN past the
/// last particle or for a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_particle_radius(demo: *const Demo, index: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    let demo = unsafe { demo.as_ref() };
    demo.zip(usize::try_from(index).ok())
        .and_then(|(demo, index)| demo.particle_radius(index))
        .unwrap_or(f64::NAN)
}

/// Total momentum's x, kg·m/s (NaN for a null handle).
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_momentum_x(demo: *const Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(f64::NAN, |demo| demo.momentum().0)
}

/// Total momentum's y; see [`demo_momentum_x`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_momentum_y(demo: *const Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(f64::NAN, |demo| demo.momentum().1)
}

/// Recomputes the broadphase's candidate pairs for the current state (as
/// the next substep will see them) into the pairs buffer; returns the
/// grid's cell size, m. NaN, with the buffer emptied, for a world without
/// collisions or a null handle. Re-read [`demo_pairs_ptr`] after.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_update_pairs(demo: *mut Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    unsafe { demo.as_mut() }
        .and_then(Demo::update_pairs)
        .unwrap_or(f64::NAN)
}

/// Pointer to the pairs buffer, `[a0, b0, a1, b1, ...]` as `u32` (null
/// for a null handle).
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_pairs_ptr(demo: *const Demo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(ptr::null(), |demo| demo.pairs().as_ptr())
}

/// Number of `u32`s at [`demo_pairs_ptr`] (two per pair; 0 for null).
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_pairs_len(demo: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { demo.as_ref() }.map_or(0, |demo| demo.pairs().len())
}
