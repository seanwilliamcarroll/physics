//! The C-ABI surface of the Physarum page (S4), over [`SlimeDemo`]: every
//! argument parsed here; null handles refused.

use core::ptr;

use web_common::boundary::capped;

use crate::abi;
use crate::slime_demo::SlimeDemo;

/// `n` agents on a `side × side` periodic field (cells, at most
/// [`MAX_SLIME_SIDE`](abi::MAX_SLIME_SIDE)), drawn `scale` px a cell (1–4).
/// Null if refused.
#[unsafe(no_mangle)]
pub(crate) extern "C" fn slime_new(side: u32, n: u32, scale: u32, seed: u32) -> *mut SlimeDemo {
    web_common::install_panic_hook();
    let (Some(side), Some(n), Some(scale)) = (
        capped(side, abi::MAX_SLIME_SIDE),
        capped(n, abi::MAX_AGENTS),
        capped(scale, 4),
    ) else {
        return ptr::null_mut();
    };
    SlimeDemo::new(side, n, scale, u64::from(seed))
        .map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Frees a demo. Null is a no-op.
///
/// # Safety
/// `d` must be null or a handle from [`slime_new`] not yet freed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_free(d: *mut SlimeDemo) {
    if !d.is_null() {
        // SAFETY: non-null, so per the contract from `Box::into_raw` in
        // `slime_new` and not yet freed.
        drop(unsafe { Box::from_raw(d) });
    }
}

/// Adds `elapsed_s` seconds of real time; returns steps taken.
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_advance(d: *mut SlimeDemo, elapsed_s: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| d.advance(elapsed_s))
}

/// Steps per simulated second: 1, or 0 out of range or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_set_rate(d: *mut SlimeDemo, hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| {
        u32::from(d.clock().set_rate_hz(hz, abi::MAX_RATE_HZ))
    })
}

/// At most `n` steps per advance (0: no cap): 1, or 0 above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ) or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_set_step_cap(d: *mut SlimeDemo, n: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| {
        u32::from(d.clock().set_cap_steps(n, abi::MAX_RATE_HZ))
    })
}

/// Sensing on (1) or off (0): 1, or 0 otherwise or for null.
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_set_sensing(d: *mut SlimeDemo, on: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    match (unsafe { d.as_mut() }, on) {
        (Some(d), 0 | 1) => {
            d.set_sensing(on == 1);
            1
        }
        _ => 0,
    }
}

/// A node at cell `(x, y)` depositing `amount` a step: 1, or 0 refused or
/// null.
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_add_node(
    d: *mut SlimeDemo,
    x: f64,
    y: f64,
    amount: f64,
) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| u32::from(d.add_node(x, y, amount)))
}

/// Removes every node (a no-op for null).
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_clear_nodes(d: *mut SlimeDemo) {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    if let Some(d) = unsafe { d.as_mut() } {
        d.clear_nodes();
    }
}

/// Sets a constant (`abi::SLIME_*`): 1, or 0 refused or null.
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_set_param(d: *mut SlimeDemo, code: u32, value: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(0, |d| u32::from(d.set_param(code, value)))
}

/// A constant, or NaN for an unknown code or null.
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_param(d: *const SlimeDemo, code: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }
        .and_then(|d| d.param(code))
        .unwrap_or(f64::NAN)
}

/// Draws the field; a pointer to `view × view` RGBA `u32`s, or null.
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_render(d: *mut SlimeDemo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { d.as_mut() }.map_or(ptr::null(), |d| d.render().as_ptr())
}

/// The drawn side, pixels (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_view(d: *const SlimeDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.view()).unwrap_or(0))
}

/// The number of agents (0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_len(d: *const SlimeDemo) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(0, |d| u32::try_from(d.slime().len()).unwrap_or(0))
}

/// The share of the field in its top 10% of cells (NaN for null).
/// Linear time in the field: call it now and then, not every frame.
///
/// # Safety
/// `d` must be null or a live handle from [`slime_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn slime_concentration(d: *const SlimeDemo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live demo.
    unsafe { d.as_ref() }.map_or(f64::NAN, |d| d.slime().field().top_share(0.1))
}

#[cfg(test)]
mod tests;
