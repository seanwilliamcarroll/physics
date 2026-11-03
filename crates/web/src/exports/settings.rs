//! Settings: integrator, rate, softening, θ, solver, β, substeps,
//! iterations, order. Each parses its argument here, at the boundary.

use core::num::NonZeroU32;

use engine::{Baumgarte, OpeningAngle, Softening};

use crate::demo::{
    Demo, integrator_from_code, order_from_code, solver_from_code, stabilization_from_code,
};

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

/// Runs a gravity scene's force as Barnes–Hut with opening angle `theta`
/// (from the next step; it stays on through softening changes). Returns 1
/// on success; 0 for a negative or NaN `theta` (parsed into
/// `OpeningAngle` here), the fountain, or a null handle. θ = 0 is exact.
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_theta(d: *mut Demo, theta: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(theta)) = (unsafe { d.as_mut() }, OpeningAngle::new(theta)) else {
        return 0;
    };
    u32::from(d.set_theta(theta))
}

/// Which solver steps a world with constraints (`code` from
/// [`crate::abi`]: `SOLVER_*`). Returns 1, or 0 for an unknown code or a
/// null handle.
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_solver(d: *mut Demo, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(solver)) = (unsafe { d.as_mut() }, solver_from_code(code)) else {
        return 0;
    };
    d.set_solver(solver);
    1
}

/// The impulse solver's Baumgarte factor β. Returns 1, or 0 for β outside
/// `[0, 1]`, NaN (parsed into `Baumgarte` here), or a null handle.
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_beta(d: *mut Demo, beta: f64) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(beta)) = (unsafe { d.as_mut() }, Baumgarte::new(beta)) else {
        return 0;
    };
    d.set_baumgarte(beta);
    1
}

/// Substeps per physics step. Returns 1, or 0 for 0 (parsed into
/// `NonZeroU32` here) or a null handle.
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_substeps(d: *mut Demo, n: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(n)) = (unsafe { d.as_mut() }, NonZeroU32::new(n)) else {
        return 0;
    };
    d.set_substeps(n);
    1
}

/// Constraint-solver iterations per substep. Returns 1, or 0 for 0 or a
/// null handle.
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_iterations(d: *mut Demo, n: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(n)) = (unsafe { d.as_mut() }, NonZeroU32::new(n)) else {
        return 0;
    };
    d.set_iterations(n);
    1
}

/// Sets the order each solver pass visits the constraints in (`ORDER_*`
/// in [`crate::abi`]). Returns 1, or 0 for an unknown code or a null handle.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_order(d: *mut Demo, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(order)) = (unsafe { d.as_mut() }, order_from_code(code)) else {
        return 0;
    };
    d.set_order(order);
    1
}

/// Sets how the impulse solver corrects rigid rods' position error
/// (`STABILIZATION_*` in [`crate::abi`]). Returns 1, or 0 for an unknown
/// code or a null handle.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_set_stabilization(d: *mut Demo, code: u32) -> u32 {
    // SAFETY: per the contract, null (-> None) or a live, unaliased Demo.
    let (Some(d), Some(stabilization)) = (unsafe { d.as_mut() }, stabilization_from_code(code))
    else {
        return 0;
    };
    d.set_stabilization(stabilization);
    1
}
