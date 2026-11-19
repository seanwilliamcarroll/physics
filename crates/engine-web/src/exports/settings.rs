//! Settings: integrator, rate, softening, θ, solver, β, substeps,
//! iterations, order. Each parses its argument here, at the boundary.

use core::num::NonZeroU32;

use engine::{Baumgarte, OpeningAngle, Softening};

use crate::abi;
use crate::demo::{
    Demo, integrator_from_code, order_from_code, solver_from_code, stabilization_from_code,
};

/// `count` if it's in `1..=max` (an [`abi`] cap): for settings that set how
/// much work a step does.
fn at_most(count: u32, max: u32) -> Option<NonZeroU32> {
    NonZeroU32::new(count).filter(|count| count.get() <= max)
}

/// Switches integrator (`code` from [`crate::abi`]); takes effect next
/// step. Returns 1 on success, 0 for an unknown code or a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_integrator(demo: *mut Demo, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(integrator)) = (unsafe { demo.as_mut() }, integrator_from_code(code))
    else {
        return 0;
    };
    demo.set_integrator(integrator);
    1
}

/// Sets the physics rate in steps per second, dropping any owed time.
/// Returns 1 on success, 0 for zero, above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ), or a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_rate(demo: *mut Demo, rate_hz: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.clock().set_rate_hz(rate_hz, abi::MAX_RATE_HZ))
    })
}

/// Sets the softening length ε (meters) of a gravity scene. Returns 1 on
/// success; 0 for a negative or NaN `softening`, a scene without gravity (the
/// fountain), or a null handle. Zero is allowed.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_softening(demo: *mut Demo, softening: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(softening)) = (unsafe { demo.as_mut() }, Softening::new(softening))
    else {
        return 0;
    };
    u32::from(demo.set_softening(softening))
}

/// Runs a gravity scene's force as Barnes–Hut with opening angle `theta`
/// (from the next step; it stays on through softening changes). Returns 1
/// on success; 0 for a negative or NaN `theta` (parsed into
/// `OpeningAngle` here), the fountain, or a null handle. θ = 0 is exact.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_theta(demo: *mut Demo, theta: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(theta)) = (unsafe { demo.as_mut() }, OpeningAngle::new(theta)) else {
        return 0;
    };
    u32::from(demo.set_theta(theta))
}

/// Which solver steps a world with constraints (`code` from
/// [`crate::abi`]: `SOLVER_*`). Returns 1, or 0 for an unknown code or a
/// null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_solver(demo: *mut Demo, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(solver)) = (unsafe { demo.as_mut() }, solver_from_code(code)) else {
        return 0;
    };
    demo.set_solver(solver);
    1
}

/// The impulse solver's Baumgarte factor β. Returns 1, or 0 for β outside
/// `[0, 1]`, NaN (parsed into `Baumgarte` here), or a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_beta(demo: *mut Demo, beta: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(beta)) = (unsafe { demo.as_mut() }, Baumgarte::new(beta)) else {
        return 0;
    };
    u32::from(demo.set_baumgarte(beta))
}

/// Substeps per physics step. Returns 1, or 0 for 0, above
/// [`MAX_SUBSTEPS`](abi::MAX_SUBSTEPS), or a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_substeps(demo: *mut Demo, substeps: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(substeps)) = (
        unsafe { demo.as_mut() },
        at_most(substeps, abi::MAX_SUBSTEPS),
    ) else {
        return 0;
    };
    demo.set_substeps(substeps);
    1
}

/// Constraint-solver iterations per substep. Returns 1, or 0 for 0, above
/// [`MAX_ITERATIONS`](abi::MAX_ITERATIONS), or a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_iterations(demo: *mut Demo, iterations: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(iterations)) = (
        unsafe { demo.as_mut() },
        at_most(iterations, abi::MAX_ITERATIONS),
    ) else {
        return 0;
    };
    demo.set_iterations(iterations);
    1
}

/// Sets the order each solver pass visits the constraints in (`ORDER_*`
/// in [`crate::abi`]). Returns 1, or 0 for an unknown code or a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_order(demo: *mut Demo, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(order)) = (unsafe { demo.as_mut() }, order_from_code(code)) else {
        return 0;
    };
    demo.set_order(order);
    1
}

/// Sets how the impulse solver corrects rigid rods' position error
/// (`STABILIZATION_*` in [`crate::abi`]). Returns 1, or 0 for an unknown
/// code or a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_stabilization(demo: *mut Demo, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(demo), Some(stabilization)) =
        (unsafe { demo.as_mut() }, stabilization_from_code(code))
    else {
        return 0;
    };
    demo.set_stabilization(stabilization);
    1
}

/// Sets a jelly's spring stiffness (N/m), live. Returns 1, or 0 for a value
/// the jelly's body can't take (≤ 0, NaN; ∞ for force springs, which can't be
/// rigid), a scene that isn't a jelly, or a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_stiffness(demo: *mut Demo, stiffness: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| u32::from(demo.set_stiffness(stiffness)))
}

/// Sets a jelly's damping (N·s/m), live. Returns 1, or 0 for a negative, NaN
/// or infinite value, a scene that isn't a jelly, or a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_damping(demo: *mut Demo, damping: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| u32::from(demo.set_damping(damping)))
}

/// Caps the physics steps one `demo_advance` may run at `max_steps` (`0`: no
/// cap), dropping owed time past it: a page too slow for real time runs in
/// slow motion instead of freezing (`docs/workers.md`). Returns 1, or 0 above
/// [`MAX_RATE_HZ`](abi::MAX_RATE_HZ) or for a null handle.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_step_cap(demo: *mut Demo, max_steps: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased demo.
    unsafe { demo.as_mut() }.map_or(0, |demo| {
        u32::from(demo.clock().set_cap_steps(max_steps, abi::MAX_RATE_HZ))
    })
}
