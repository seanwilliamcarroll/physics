// The contract with engine.wasm: integer codes for demo_new and the layout
// of the positions buffer. Mirrors `crates/web/src/abi.rs`; a Rust test
// (abi::tests) reads this file and fails if any value disagrees.

/** demo_new `kind` codes. */
export const DEMO_FOUNTAIN = 0;
export const DEMO_ORBIT = 1;
export const DEMO_CLUSTER = 2;
export const DEMO_DISK = 3;
export const DEMO_COLLAPSE = 4;
export const DEMO_PENDULUM = 5;

/** demo_set_solver codes. */
export const SOLVER_XPBD = 0;
export const SOLVER_IMPULSE = 1;

/** demo_set_order codes (M4). */
export const ORDER_FORWARD = 0;
export const ORDER_REVERSE = 1;
export const ORDER_ALTERNATING = 2;

/** demo_set_stabilization codes (M4): classic Baumgarte or split impulses. */
export const STABILIZATION_BAUMGARTE = 0;
export const STABILIZATION_SPLIT = 1;

/** demo_new_jelly body codes (M5). */
export const JELLY_SPRINGS = 0;
export const JELLY_XPBD = 1;
export const JELLY_IMPULSE = 2;

/** demo_new_double_pendulum start codes (M4). */
export const START_HORIZONTAL = 0;
export const START_RAISED = 1;

/** demo_set_integrator codes. */
export const INTEGRATOR_SYMPLECTIC_EULER = 0;
export const INTEGRATOR_EXPLICIT_EULER = 1;
export const INTEGRATOR_VELOCITY_VERLET = 2;

/** demo_new `scalar` codes. */
export const SCALAR_F32 = 0;
export const SCALAR_F64 = 1;

/** Physics steps per second a new demo starts with (and pages' default). */
export const DEFAULT_RATE_HZ = 60;

/** The most work one call may ask for: larger is refused (null, or
 *  status 0). Pages read their slider ranges from these. */
export const MAX_PARTICLES = 2000000;
export const MAX_GRAVITY_BODIES = 4096;
export const MAX_CHAIN_LINKS = 40;
export const MAX_JELLY_SIDE = 16;
export const MAX_BOX_BALLS = 60;
export const MAX_CRADLE_BALLS = 8;
export const MAX_BREAK_GAP = 0.1;
export const MAX_POOL_SPEED = 12.0;
export const MAX_TIP = 0.5;
export const MAX_SUBSTEPS = 100;
export const MAX_ITERATIONS = 20;
export const MAX_RATE_HZ = 240;

/** Floats per particle in the positions buffer: [x, y]. */
export const COORDS_PER_PARTICLE = 2;

/** What demo_panic_for_test panics with (the smoke test looks for it). */
export const TEST_PANIC_MESSAGE = "deliberate test panic";
