//! The contract with JS: integer codes for `demo_new` (only numbers cross
//! the wasm boundary) and the positions buffer layout.
//!
//! Mirrored in `site/js/abi.ts`. The test below reads that file and fails
//! if any value disagrees, so the two copies can't silently drift.

/// `demo_new` kind codes: the M0 fountain, the M1 star–planet orbit, the
/// M2 cluster.
pub const DEMO_FOUNTAIN: u32 = 0;
pub const DEMO_ORBIT: u32 = 1;
pub const DEMO_CLUSTER: u32 = 2;

/// `demo_set_integrator` codes.
pub const INTEGRATOR_SYMPLECTIC_EULER: u32 = 0;
pub const INTEGRATOR_EXPLICIT_EULER: u32 = 1;
pub const INTEGRATOR_VELOCITY_VERLET: u32 = 2;

/// `demo_new` scalar codes.
pub const SCALAR_F32: u32 = 0;
pub const SCALAR_F64: u32 = 1;

/// Physics steps per second a new demo starts with, and the page's
/// default for its rate control: 60 Hz, one step per frame on the most
/// common display rate.
pub const DEFAULT_RATE_HZ: u32 = 60;

/// Floats per particle in the positions buffer: `[x, y]`.
pub const COORDS_PER_PARTICLE: usize = 2;

/// What [`demo_panic_for_test`](crate::exports::demo_panic_for_test)
/// panics with. The smoke test checks that this text reached JS through the
/// panic hook.
pub const TEST_PANIC_MESSAGE: &str = "deliberate test panic";

#[cfg(test)]
mod tests;
