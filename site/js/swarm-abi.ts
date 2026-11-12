// The contract with swarm.wasm: codes and caps. Mirrors
// `crates/swarm-web/src/abi.rs`; a Rust test (abi::tests) reads this file
// and fails if any value disagrees.

/** How neighbours are found, for swarm_set_neighbours. */
export const NEIGHBOURS_BRUTE = 0;
export const NEIGHBOURS_GRID = 1;
export const NEIGHBOURS_SORTED = 2;

/** The rules' constants, for swarm_set_param and swarm_param. */
export const PARAM_VISUAL_RANGE = 0;
export const PARAM_PROTECTED_RANGE = 1;
export const PARAM_CENTERING = 2;
export const PARAM_AVOID = 3;
export const PARAM_MATCHING = 4;
export const PARAM_TURN = 5;
export const PARAM_MARGIN = 6;
export const PARAM_MIN_SPEED = 7;
export const PARAM_MAX_SPEED = 8;
export const PARAM_COUNT = 9;

/** Caps: boids, boids for brute force, the world's side (px), world
 *  pixels per drawn pixel. */
export const MAX_BOIDS = 262144;
export const MAX_BRUTE = 16384;
export const MAX_SIDE = 8192;
export const MAX_SCALE = 8;

/** S2: the largest Vicsek box side (radii), drawn side (px), particle
 *  count, and steps one vicsek_mean_order call may run. */
export const MAX_VICSEK_SIDE = 1024;
export const MAX_VIEW = 2048;
export const MAX_PARTICLES = 262144;
export const MAX_RUN = 20000;

/** S3: paint tools for ant_paint. */
export const TOOL_FOOD = 0;
export const TOOL_WALL = 1;
export const TOOL_ERASE = 2;
export const TOOL_NEST = 3;

/** S3: the ants' constants, for ant_set_param and ant_param. */
export const ANT_SENSOR_ANGLE = 0;
export const ANT_SENSOR_DISTANCE = 1;
export const ANT_TURN = 2;
export const ANT_WIGGLE = 3;
export const ANT_SPEED = 4;
export const ANT_DEPOSIT = 5;
export const ANT_FALLOFF = 6;
export const ANT_DIFFUSION = 7;
export const ANT_DECAY = 8;
export const ANT_PARAM_COUNT = 9;

/** S3: caps: world side (cells), ants, brush radius (cells), food per
 *  cell per dab. */
export const MAX_ANT_SIDE = 1024;
export const MAX_ANTS = 262144;
export const MAX_ANT_BRUSH = 64;
export const MAX_FOOD = 1000;

/** Steps per simulated second: the default, and the most. */
export const DEFAULT_RATE_HZ = 60;
export const MAX_RATE_HZ = 240;
