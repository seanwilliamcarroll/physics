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
