//! Creating, freeing, stepping, and reading a demo's buffers; the panic
//! test hook.

use core::ptr;

use crate::abi;
use crate::demo::{Demo, DemoKind, ScalarKind, jelly_body_from_code, start_from_code};

/// `n` as a size, if it's at most `max` (an [`abi`] cap).
fn capped(n: u32, max: u32) -> Option<usize> {
    if n > max {
        return None;
    }
    usize::try_from(n).ok()
}

/// Creates a demo of `n` particles. `kind` and `scalar` are codes from
/// [`crate::abi`]. Returns null for an unknown code, an invalid scene, or
/// `n` above [`MAX_PARTICLES`](abi::MAX_PARTICLES)
/// ([`MAX_GRAVITY_BODIES`](abi::MAX_GRAVITY_BODIES) for a gravity scene).
/// Free with [`demo_free`].
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new(kind: u32, scalar: u32, n: u32, seed: u32) -> *mut Demo {
    // Every page creates a demo before anything else, so this is the one
    // entry point that needs it. Idempotent.
    crate::imports::install_panic_hook();
    let (Some(kind), Some(scalar)) = (DemoKind::from_code(kind), ScalarKind::from_code(scalar))
    else {
        return ptr::null_mut();
    };
    // Every scene sizes its render buffer from `n`, so it's capped even
    // where the scene's size is fixed.
    let max = match kind {
        DemoKind::Gravity(_) => abi::MAX_GRAVITY_BODIES,
        _ => abi::MAX_PARTICLES,
    };
    let Some(n) = capped(n, max) else {
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

/// Creates the M4 chain (`scenarios::chain`): `links` links and a bob
/// `mass_ratio` times a link's mass (1:100 is the M4 case), XPBD with 20
/// substeps to start. Returns null for an unknown scalar code, more than
/// [`MAX_CHAIN_LINKS`](abi::MAX_CHAIN_LINKS) links, or a mass ratio that
/// makes no valid mass. Free with [`demo_free`].
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new_chain(scalar: u32, links: u32, mass_ratio: f64) -> *mut Demo {
    crate::imports::install_panic_hook();
    let (Some(scalar), Some(links)) = (
        ScalarKind::from_code(scalar),
        capped(links, abi::MAX_CHAIN_LINKS),
    ) else {
        return ptr::null_mut();
    };
    Demo::new_chain(scalar, links, mass_ratio)
        .map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Creates the M4 double pendulum from `start` (`START_*` in
/// [`crate::abi`]) with the tip nudged by `offset` m, impulse with 20
/// substeps to start. Returns null for an unknown code or a non-finite
/// offset (parsed here: a NaN offset would make a NaN world). Free with
/// [`demo_free`].
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new_double_pendulum(
    scalar: u32,
    start: u32,
    offset: f64,
) -> *mut Demo {
    crate::imports::install_panic_hook();
    let (Some(scalar), Some(start)) = (ScalarKind::from_code(scalar), start_from_code(start))
    else {
        return ptr::null_mut();
    };
    if !offset.is_finite() {
        return ptr::null_mut();
    }
    Demo::new_double_pendulum(scalar, start, offset)
        .map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Creates the M5 jelly: a `cols` × `rows` grid (`JELLY_*` body code from
/// [`crate::abi`]) with springs of stiffness `k` (N/m) and damping `c`
/// (N·s/m), dropped onto a ground; 10 substeps to start. Returns null for
/// an unknown code, an empty grid, a side above
/// [`MAX_JELLY_SIDE`](abi::MAX_JELLY_SIDE), or a stiffness or damping the body
/// can't take (force springs can't be rigid: `k = ∞` is null for them).
#[unsafe(no_mangle)]
pub(crate) extern "C" fn demo_new_jelly(
    scalar: u32,
    body: u32,
    cols: u32,
    rows: u32,
    k: f64,
    c: f64,
) -> *mut Demo {
    crate::imports::install_panic_hook();
    let (Some(scalar), Some(body), Some(cols), Some(rows)) = (
        ScalarKind::from_code(scalar),
        jelly_body_from_code(body),
        capped(cols, abi::MAX_JELLY_SIDE),
        capped(rows, abi::MAX_JELLY_SIDE),
    ) else {
        return ptr::null_mut();
    };
    Demo::new_jelly(scalar, body, cols, rows, k, c)
        .map_or(ptr::null_mut(), |d| Box::into_raw(Box::new(d)))
}

/// Pointer to the links buffer, `[a0, b0, a1, b1, ...]` as `u32`: the
/// particles each constraint joins, for drawing rods (null for a null
/// handle). Re-read after `demo_grab`/`demo_release`, which change it.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_links_ptr(d: *const Demo) -> *const u32 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(ptr::null(), |d| d.links().as_ptr())
}

/// Number of `u32`s at [`demo_links_ptr`] (two per constraint; 0 for null).
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_links_len(d: *const Demo) -> usize {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(0, |d| d.links().len())
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
pub(super) fn deliberate_panic() {
    panic!("{}", crate::abi::TEST_PANIC_MESSAGE);
}
