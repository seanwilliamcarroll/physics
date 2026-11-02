// The contract with engine.wasm: integer codes for demo_new and the layout
// of the positions buffer. Mirrors `crates/web/src/abi.rs`; a Rust test
// (abi::tests) reads this file and fails if any value disagrees.

/** demo_new `kind` codes. */
export const DEMO_FOUNTAIN = 0;

/** demo_new `scalar` codes. */
export const SCALAR_F32 = 0;
export const SCALAR_F64 = 1;

/** Floats per particle in the positions buffer: [x, y]. */
export const COORDS_PER_PARTICLE = 2;
