//! The contract with JS: integer codes for `demo_new` (only numbers cross
//! the wasm boundary) and the positions buffer layout.
//!
//! Mirrored in `site/js/abi.ts`. The test below reads that file and fails
//! if any value disagrees, so the two copies can't silently drift.

/// `demo_new` kind codes: the M0 fountain, the M1 star–planet orbit, and
/// the M2 gravity scenes (cluster, disk, collapse).
pub(crate) const DEMO_FOUNTAIN: u32 = 0;
pub(crate) const DEMO_ORBIT: u32 = 1;
pub(crate) const DEMO_CLUSTER: u32 = 2;
pub(crate) const DEMO_DISK: u32 = 3;
pub(crate) const DEMO_COLLAPSE: u32 = 4;
/// M3: the `01-solvers.md` pendulum.
pub(crate) const DEMO_PENDULUM: u32 = 5;

/// `demo_set_solver` codes.
pub(crate) const SOLVER_XPBD: u32 = 0;
pub(crate) const SOLVER_IMPULSE: u32 = 1;

/// `demo_set_order` codes (M4).
pub(crate) const ORDER_FORWARD: u32 = 0;
pub(crate) const ORDER_REVERSE: u32 = 1;
pub(crate) const ORDER_ALTERNATING: u32 = 2;

/// `demo_set_stabilization` codes (M4): how the impulse solver corrects
/// rigid rods' position error.
pub(crate) const STABILIZATION_BAUMGARTE: u32 = 0;
pub(crate) const STABILIZATION_SPLIT: u32 = 1;

/// `demo_new_jelly` body codes (M5): force springs, or compliant
/// constraints under XPBD or the impulse solver.
pub(crate) const JELLY_SPRINGS: u32 = 0;
pub(crate) const JELLY_XPBD: u32 = 1;
pub(crate) const JELLY_IMPULSE: u32 = 2;

/// `demo_new_double_pendulum` start codes (M4).
pub(crate) const START_HORIZONTAL: u32 = 0;
pub(crate) const START_RAISED: u32 = 1;

/// `demo_set_integrator` codes.
pub(crate) const INTEGRATOR_SYMPLECTIC_EULER: u32 = 0;
pub(crate) const INTEGRATOR_EXPLICIT_EULER: u32 = 1;
pub(crate) const INTEGRATOR_VELOCITY_VERLET: u32 = 2;

/// `demo_new` scalar codes.
pub(crate) const SCALAR_F32: u32 = 0;
pub(crate) const SCALAR_F64: u32 = 1;

/// Physics steps per second a new demo starts with, and the page's
/// default for its rate control: 60 Hz, one step per frame on the most
/// common display rate.
pub(crate) const DEFAULT_RATE_HZ: u32 = 60;

/// The most work one call may ask for: the exports refuse anything larger
/// (null, or status 0), so the ABI can't be asked to allocate gigabytes
/// or hang the tab (`demo_new(…, n = 4e9)` once tried to reserve a 32 GB
/// render buffer, whatever the scene). Each is the page's own limit, and
/// the pages read their slider ranges from here (`site/js/abi.ts`).
///
/// Particles in a `demo_new` scene: the M0 fountain's largest.
pub(crate) const MAX_PARTICLES: u32 = 2_000_000;
/// Bodies in a gravity scene (M2): pairwise gravity is O(n²), ~17 ms per
/// step at this many natively (M2.3).
pub(crate) const MAX_GRAVITY_BODIES: u32 = 4096;
/// Links in the M4 chain.
pub(crate) const MAX_CHAIN_LINKS: u32 = 40;
/// Particles along a side of the M5 jelly.
pub(crate) const MAX_JELLY_SIDE: u32 = 16;
/// Balls in the M6 box: the scene's slots (`scenarios::BOX_MAX_BALLS`,
/// checked equal in `abi/tests.rs`).
pub(crate) const MAX_BOX_BALLS: u32 = 60;
/// Balls in the M6 cradle: 8 spans 0.8 m, still a cradle on the page.
pub(crate) const MAX_CRADLE_BALLS: u32 = 8;
/// The M6 break's rack gap, m: past a ball's diameter (0.1 m) the rack
/// stops looking like one.
pub(crate) const MAX_BREAK_GAP: f64 = 0.1;
/// Substeps per physics step.
pub(crate) const MAX_SUBSTEPS: u32 = 100;
/// Constraint iterations per substep.
pub(crate) const MAX_ITERATIONS: u32 = 20;
/// Physics steps per simulated second.
pub(crate) const MAX_RATE_HZ: u32 = 240;

/// Floats per particle in the positions buffer: `[x, y]`.
pub(crate) const COORDS_PER_PARTICLE: usize = 2;

/// What [`demo_panic_for_test`](crate::exports::demo_panic_for_test)
/// panics with. The smoke test checks that this text reached JS through the
/// panic hook.
pub(crate) const TEST_PANIC_MESSAGE: &str = "deliberate test panic";

#[cfg(test)]
mod tests;
