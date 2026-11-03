//! The C-ABI surface JS calls. Each export is a thin adapter over [`Demo`];
//! all `unsafe` in the workspace lives in this file.
//!
//! Handles are opaque `*mut Demo` from `Box::into_raw`, so several demos can
//! coexist on one page. Wasm is single-threaded and JS never holds a Rust
//! reference, so a live handle is never aliased during a call.
//!
//! The exports are `pub(crate)`, not `pub`: what puts a function in the
//! `.wasm`'s export table is `#[no_mangle]` in a `cdylib`, not Rust
//! visibility, and `unreachable_pub` asks visibility to say only what
//! Rust code can reach.

use core::num::NonZeroU32;
use core::ptr;

use crate::demo::{Demo, DemoKind, ScalarKind, integrator_from_code};
use engine::Softening;

/// Creates a demo of `n` particles. `kind` and `scalar` are codes from
/// [`crate::abi`]. Returns null for an unknown code or invalid scene.
/// Free with [`demo_free`].
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new(kind: u32, scalar: u32, n: u32, seed: u32) -> *mut Demo {
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
pub(crate) unsafe extern "C" fn demo_free(d: *mut Demo) {
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
pub(crate) unsafe extern "C" fn demo_advance(d: *mut Demo, elapsed_s: f64) -> u32 {
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
pub(crate) unsafe extern "C" fn demo_positions_ptr(d: *const Demo) -> *const f32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(ptr::null(), |d| d.positions().as_ptr())
}

/// Number of `f32`s at [`demo_positions_ptr`]
/// ([`COORDS_PER_PARTICLE`](crate::abi::COORDS_PER_PARTICLE) per particle; 0 for null).
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_positions_len(d: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(0, |d| d.positions().len())
}

/// Switches integrator (`code` from [`crate::abi`]); takes effect next
/// step. Returns 1 on success, 0 for an unknown code or a null handle.
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_integrator(d: *mut Demo, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(integrator)) = (unsafe { d.as_mut() }, integrator_from_code(code)) else {
        return 0;
    };
    d.set_integrator(integrator);
    1
}

/// Sets the physics rate in steps per second (`dt = 1 / hz`), dropping any
/// owed time. Returns 1 on success, 0 for `hz = 0` or a null handle: the
/// `u32 → NonZeroU32` parse happens here, at the boundary.
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_rate(d: *mut Demo, hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(rate)) = (unsafe { d.as_mut() }, NonZeroU32::new(hz)) else {
        return 0;
    };
    d.set_rate(rate);
    1
}

/// Sets the softening length ε (meters) of a gravity scene, from the next
/// step. Returns 1 on success; 0 for a negative or NaN `eps` (parsed into
/// `Softening` here, at the boundary), a scene without gravity (the
/// fountain), or a null handle. ε = 0 is allowed.
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_softening(d: *mut Demo, eps: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(eps)) = (unsafe { d.as_mut() }, Softening::new(eps)) else {
        return 0;
    };
    u32::from(d.set_softening(eps))
}

/// Total energy in joules, or NaN where it isn't defined (the fountain) or
/// for a null handle: NaN is JS's natural "no number".
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_energy(d: *const Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }
        .and_then(Demo::energy)
        .unwrap_or(f64::NAN)
}

/// Test hook: panics on purpose with [`TEST_PANIC_MESSAGE`], so
/// `cargo xtask smoke` can check end to end that the panic hook reaches the
/// browser console. Shipped in every build so the smoke test checks the
/// real binary; pages call it only under `?smoke&panic`.
///
/// [`TEST_PANIC_MESSAGE`]: crate::abi::TEST_PANIC_MESSAGE
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_panic_for_test() {
    crate::imports::install_panic_hook();
    deliberate_panic();
}

/// The panic itself, in a Rust-ABI function so it's testable natively: a
/// panic may not unwind out of an `extern "C"` fn (Rust aborts the process
/// instead), which `#[should_panic]` can't observe.
#[expect(
    clippy::panic,
    reason = "test hook: a deliberate panic is the behavior under test"
)]
fn deliberate_panic() {
    panic!("{}", crate::abi::TEST_PANIC_MESSAGE);
}

#[cfg(test)]
mod tests;
