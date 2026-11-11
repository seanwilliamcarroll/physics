// The contract with sand.wasm: material codes and caps. Mirrors
// `crates/sand-web/src/abi.rs`; a Rust test (abi::tests) reads this file
// and fails if any value disagrees.

/** Material codes for sand_paint and sand_count. */
export const MATERIAL_EMPTY = 0;
export const MATERIAL_SAND = 1;
export const MATERIAL_WATER = 2;
export const MATERIAL_STONE = 3;
export const MATERIAL_LAVA = 4;
export const MATERIAL_STEAM = 5;

/** The largest grid side, the widest brush (radius, cells). */
export const MAX_SIDE = 2048;
export const MAX_BRUSH = 64;

/** Physics steps per simulated second: the default, and the most. */
export const DEFAULT_RATE_HZ = 60;
export const MAX_RATE_HZ = 240;
