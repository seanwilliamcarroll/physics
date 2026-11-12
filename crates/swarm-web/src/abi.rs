//! Wire codes and caps shared with the page (`site/js/swarm-abi.ts`
//! mirrors these; a test compares them).

/// How neighbours are found (`swarm::Neighbours`), for
/// `swarm_set_neighbours`.
pub const NEIGHBOURS_BRUTE: u32 = 0;
pub const NEIGHBOURS_GRID: u32 = 1;
pub const NEIGHBOURS_SORTED: u32 = 2;

/// The rules' constants (`swarm::Params`), for `swarm_set_param` and
/// `swarm_param`.
pub const PARAM_VISUAL_RANGE: u32 = 0;
pub const PARAM_PROTECTED_RANGE: u32 = 1;
pub const PARAM_CENTERING: u32 = 2;
pub const PARAM_AVOID: u32 = 3;
pub const PARAM_MATCHING: u32 = 4;
pub const PARAM_TURN: u32 = 5;
pub const PARAM_MARGIN: u32 = 6;
pub const PARAM_MIN_SPEED: u32 = 7;
pub const PARAM_MAX_SPEED: u32 = 8;
pub const PARAM_COUNT: u32 = 9;

/// The most boids `swarm_new` makes (`swarm::MAX_BOIDS`).
pub const MAX_BOIDS: u32 = 262_144;
/// The most boids brute force runs for: 16k is 2.7 × 10⁸ pair checks a
/// step, measured ~0.14 s natively and ~0.45 s in V8 (1.65 ns a pair);
/// at 100k one step would take a minute, and the step budget can't split
/// a step (TASKS S1 decision 10).
pub const MAX_BRUTE: u32 = 16_384;
/// The largest world side, pixels.
pub const MAX_SIDE: u32 = 8192;
/// The most world pixels per drawn pixel.
pub const MAX_SCALE: u32 = 8;
/// S2: the largest Vicsek box side (interaction radii; Fig. 2a's largest
/// is 50), the largest drawn side (pixels), the most particles, and the
/// most steps one `vicsek_mean_order` call may run.
pub const MAX_VICSEK_SIDE: u32 = 1024;
pub const MAX_VIEW: u32 = 2048;
pub const MAX_PARTICLES: u32 = 262_144;
pub const MAX_RUN: u32 = 20_000;

/// S3: paint tools for `ant_paint`.
pub const TOOL_FOOD: u32 = 0;
pub const TOOL_WALL: u32 = 1;
pub const TOOL_ERASE: u32 = 2;
pub const TOOL_NEST: u32 = 3;

/// S3: the ants' constants (`swarm::AntParams`), for `ant_set_param` and
/// `ant_param`.
pub const ANT_SENSOR_ANGLE: u32 = 0;
pub const ANT_SENSOR_DISTANCE: u32 = 1;
pub const ANT_TURN: u32 = 2;
pub const ANT_WIGGLE: u32 = 3;
pub const ANT_SPEED: u32 = 4;
pub const ANT_DEPOSIT: u32 = 5;
pub const ANT_FALLOFF: u32 = 6;
pub const ANT_DIFFUSION: u32 = 7;
pub const ANT_DECAY: u32 = 8;
pub const ANT_PARAM_COUNT: u32 = 9;

/// S3: the largest world side (cells), the most ants, the widest brush
/// (cells), the most food a dab adds per cell.
pub const MAX_ANT_SIDE: u32 = 1024;
pub const MAX_ANTS: u32 = 262_144;
pub const MAX_ANT_BRUSH: u32 = 64;
pub const MAX_FOOD: u32 = 1000;

/// S4: Physarum's constants (`swarm::SlimeParams`), for
/// `slime_set_param` and `slime_param`.
pub const SLIME_SENSOR_ANGLE: u32 = 0;
pub const SLIME_SENSOR_OFFSET: u32 = 1;
pub const SLIME_TURN: u32 = 2;
pub const SLIME_STEP: u32 = 3;
pub const SLIME_DEPOSIT: u32 = 4;
pub const SLIME_DIFFUSION: u32 = 5;
pub const SLIME_DECAY: u32 = 6;
pub const SLIME_PARAM_COUNT: u32 = 7;

/// S4: the largest field side (cells), the most agents, the most nodes.
pub const MAX_SLIME_SIDE: u32 = 1024;
pub const MAX_AGENTS: u32 = 2_097_152;
pub const MAX_NODES: u32 = 64;

/// Steps per simulated second: the page's default and most.
pub const DEFAULT_RATE_HZ: u32 = 60;
pub const MAX_RATE_HZ: u32 = 240;

#[cfg(test)]
mod tests;
