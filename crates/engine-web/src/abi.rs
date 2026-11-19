//! Integer codes and limits shared with JS (only numbers cross the wasm
//! boundary). Mirrored in `site/js/abi.ts`; a test fails if they disagree.

/// `demo_new` kind codes.
pub(crate) const DEMO_FOUNTAIN: u32 = 0;
pub(crate) const DEMO_ORBIT: u32 = 1;
pub(crate) const DEMO_CLUSTER: u32 = 2;
pub(crate) const DEMO_DISK: u32 = 3;
pub(crate) const DEMO_COLLAPSE: u32 = 4;
pub(crate) const DEMO_PENDULUM: u32 = 5;

/// `demo_set_solver` codes.
pub(crate) const SOLVER_XPBD: u32 = 0;
pub(crate) const SOLVER_IMPULSE: u32 = 1;

/// `demo_set_order` codes.
pub(crate) const ORDER_FORWARD: u32 = 0;
pub(crate) const ORDER_REVERSE: u32 = 1;
pub(crate) const ORDER_ALTERNATING: u32 = 2;

/// `demo_set_stabilization` codes: how the impulse solver corrects rigid rods'
/// position error.
pub(crate) const STABILIZATION_BAUMGARTE: u32 = 0;
pub(crate) const STABILIZATION_SPLIT: u32 = 1;

/// `demo_new_jelly` body codes: force springs, or compliant
/// constraints under XPBD or the impulse solver.
pub(crate) const JELLY_SPRINGS: u32 = 0;
pub(crate) const JELLY_XPBD: u32 = 1;
pub(crate) const JELLY_IMPULSE: u32 = 2;

/// `demo_new_double_pendulum` start codes.
pub(crate) const START_HORIZONTAL: u32 = 0;
pub(crate) const START_RAISED: u32 = 1;

/// `demo_set_integrator` codes.
pub(crate) const INTEGRATOR_SYMPLECTIC_EULER: u32 = 0;
pub(crate) const INTEGRATOR_EXPLICIT_EULER: u32 = 1;
pub(crate) const INTEGRATOR_VELOCITY_VERLET: u32 = 2;

/// `demo_new` scalar codes.
pub(crate) const SCALAR_F32: u32 = 0;
pub(crate) const SCALAR_F64: u32 = 1;

/// Physics steps per second a new demo starts with, and the page's default
/// rate: one step per frame at the most common display rate.
pub(crate) const DEFAULT_RATE_HZ: u32 = 60;

/// Limits on how much work one call may ask for: the exports refuse anything
/// larger (null, or status 0). The pages read their slider ranges from
/// `site/js/abi.ts`.
///
/// Particles in a `demo_new` scene.
pub(crate) const MAX_PARTICLES: u32 = 2_000_000;
/// Bodies in a gravity scene. Pairwise gravity is O(n²): 4,096 bodies take
/// 4.3 ms in `f32`, 8.6 ms in `f64` (V8 on an M4, `cargo xtask bench-wasm`).
pub(crate) const MAX_GRAVITY_BODIES: u32 = 8192;
/// Links in the chain.
pub(crate) const MAX_CHAIN_LINKS: u32 = 40;
/// Particles along a side of the jelly.
pub(crate) const MAX_JELLY_SIDE: u32 = 16;
/// Balls in the box: the scene's slots (`scenarios::BOX_MAX_BALLS`, checked in
/// `abi/tests.rs`).
pub(crate) const MAX_BOX_BALLS: u32 = 60;
/// Balls in the cradle.
pub(crate) const MAX_CRADLE_BALLS: u32 = 8;
/// The break's rack gap, m: past a ball's diameter (0.1 m) it stops looking
/// like a rack.
pub(crate) const MAX_BREAK_GAP: f64 = 0.1;
/// The fastest cue strike, m/s (`scenarios::POOL_MAX_SPEED`, checked in
/// `abi/tests.rs`), and the tip's furthest offset in radii (past it, a miscue).
pub(crate) const MAX_POOL_SPEED: f64 = 12.0;
pub(crate) const MAX_TIP: f64 = 0.5;
/// Substeps per physics step.
pub(crate) const MAX_SUBSTEPS: u32 = 100;
/// Constraint iterations per substep.
pub(crate) const MAX_ITERATIONS: u32 = 20;
/// Physics steps per simulated second.
pub(crate) const MAX_RATE_HZ: u32 = 240;

/// Floats per particle in the positions buffer: `[x, y]`.
pub(crate) const COORDS_PER_PARTICLE: usize = 2;

/// What `demo_panic_for_test` panics with; the smoke test checks it reaches JS.
pub(crate) const TEST_PANIC_MESSAGE: &str = "deliberate test panic";

#[cfg(test)]
mod tests;
