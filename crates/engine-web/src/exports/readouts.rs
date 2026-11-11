//! Readouts: energy and constraint error, NaN where undefined.

use crate::demo::Demo;

/// Largest constraint error |C| (m), or NaN for a world without
/// constraints or a null handle.
///
/// # Safety
/// `d` must be null or a live handle from [`demo_new`].
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_constraint_error(d: *const Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }
        .and_then(Demo::constraint_error)
        .unwrap_or(f64::NAN)
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

/// Kinetic energy in joules (NaN for a null handle): the M5 page's
/// explosion indicator.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_kinetic_energy(d: *const Demo) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    unsafe { d.as_ref() }.map_or(f64::NAN, Demo::kinetic_energy)
}

/// Particle `i`'s x in meters, exact (the engine's scalar as `f64`), or
/// NaN past the last particle or for a null handle. The render buffer is
/// `f32` and can't resolve differences like 1e-9 m at 2 m.
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_particle_x(d: *const Demo, i: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    position(unsafe { d.as_ref() }, i).map_or(f64::NAN, |(x, _)| x)
}

/// Particle `i`'s y; see [`demo_particle_x`].
///
/// # Safety
/// `d` must be null or a live handle from a `demo_new*` export.
#[unsafe(no_mangle)]
pub(crate) unsafe extern "C" fn demo_particle_y(d: *const Demo, i: u32) -> f64 {
    // SAFETY: per the contract, null (-> None) or a live Demo.
    position(unsafe { d.as_ref() }, i).map_or(f64::NAN, |(_, y)| y)
}

fn position(d: Option<&Demo>, i: u32) -> Option<(f64, f64)> {
    d?.particle_position(usize::try_from(i).ok()?)
}
