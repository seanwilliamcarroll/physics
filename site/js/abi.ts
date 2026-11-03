// The contract with engine.wasm: integer codes for demo_new and the layout
// of the positions buffer. Mirrors `crates/web/src/abi.rs`; a Rust test
// (abi::tests) reads this file and fails if any value disagrees.

/** demo_new `kind` codes. */
export const DEMO_FOUNTAIN = 0;
export const DEMO_ORBIT = 1;
export const DEMO_CLUSTER = 2;

/** demo_set_integrator codes. */
export const INTEGRATOR_SYMPLECTIC_EULER = 0;
export const INTEGRATOR_EXPLICIT_EULER = 1;
export const INTEGRATOR_VELOCITY_VERLET = 2;

/** demo_new `scalar` codes. */
export const SCALAR_F32 = 0;
export const SCALAR_F64 = 1;

/** Physics steps per second a new demo starts with (and pages' default). */
export const DEFAULT_RATE_HZ = 60;

/** Floats per particle in the positions buffer: [x, y]. */
export const COORDS_PER_PARTICLE = 2;

/** What demo_panic_for_test panics with (the smoke test looks for it). */
export const TEST_PANIC_MESSAGE = "deliberate test panic";
