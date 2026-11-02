//! The C-ABI surface JS calls. Each export is a thin adapter over [`Demo`];
//! all `unsafe` in the workspace lives in this file.
//!
//! Handles are opaque `*mut Demo` from `Box::into_raw`, so several demos can
//! coexist on one page. Wasm is single-threaded and JS never holds a Rust
//! reference, so a live handle is never aliased during a call.

use core::ptr;

use crate::demo::{Demo, DemoKind, ScalarKind};

/// Creates a demo of `n` particles. `kind` and `scalar` are codes from
/// [`crate::abi`]. Returns null for an unknown code or invalid scene.
/// Free with [`demo_free`].
#[unsafe(no_mangle)]
pub extern "C" fn demo_new(kind: u32, scalar: u32, n: u32, seed: u32) -> *mut Demo {
    // Every page creates a demo before anything else, so this is the one
    // entry point that needs it. Idempotent.
    crate::imports::install_panic_hook();
    let (Some(kind), Some(scalar), Ok(n)) = (
        DemoKind::from_code(kind),
        ScalarKind::from_code(scalar),
        usize::try_from(n),
    ) else {
        return ptr::null_mut();
    };
    Demo::new(kind, scalar, n, u64::from(seed))
        .map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Frees a demo. Null is a no-op.
///
/// # Safety
/// `d` must be null or a handle from [`demo_new`] not yet freed. It is
/// dangling afterwards.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn demo_free(d: *mut Demo) {
    if !d.is_null() {
        // SAFETY: non-null, so per the contract it came from `Box::into_raw`
        // in `demo_new` and hasn't been freed; ownership returns to a Box.
        drop(unsafe { Box::from_raw(d) });
    }
}

/// Advances by `elapsed_s` seconds of real time; returns steps taken
/// (0 for a null handle).
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub unsafe extern "C" fn demo_advance(d: *mut Demo, elapsed_s: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    unsafe { d.as_mut() }.map_or(0, |d| d.advance(elapsed_s))
}

/// Pointer to the interleaved `f32` positions in wasm memory (null for a
/// null handle). JS must re-read it after every `demo_advance`: the buffer
/// may move, and memory growth detaches old `ArrayBuffer` views.
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub unsafe extern "C" fn demo_positions_ptr(d: *const Demo) -> *const f32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(ptr::null(), |d| d.positions().as_ptr())
}

/// Number of `f32`s at [`demo_positions_ptr`]
/// ([`COORDS_PER_PARTICLE`](crate::abi::COORDS_PER_PARTICLE) per particle; 0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub unsafe extern "C" fn demo_positions_len(d: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(0, |d| d.positions().len())
}

#[cfg(test)]
mod tests {
    use super::{demo_advance, demo_free, demo_new, demo_positions_len, demo_positions_ptr};
    use core::ptr;

    #[test]
    fn round_trip_through_the_c_abi() {
        let d = demo_new(0, 1, 10, 42);
        assert!(!d.is_null());
        // SAFETY: `d` came from `demo_new` and is freed exactly once, last.
        unsafe {
            assert_eq!(demo_advance(d, 1.0 / 60.0), 1);
            assert_eq!(demo_positions_len(d), 20);
            let pos = core::slice::from_raw_parts(demo_positions_ptr(d), 20);
            assert!(pos.chunks(2).all(|p| p[1] > 0.0));
            demo_free(d);
        }
    }

    #[test]
    fn unknown_codes_return_null() {
        assert!(demo_new(99, 0, 10, 1).is_null());
        assert!(demo_new(0, 99, 10, 1).is_null());
    }

    #[test]
    fn null_handles_are_harmless() {
        // SAFETY: null is explicitly allowed by every export's contract.
        unsafe {
            assert_eq!(demo_advance(ptr::null_mut(), 1.0), 0);
            assert!(demo_positions_ptr(ptr::null()).is_null());
            assert_eq!(demo_positions_len(ptr::null()), 0);
            demo_free(ptr::null_mut());
        }
    }
}
