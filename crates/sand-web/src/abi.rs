//! Wire codes and caps shared with the page (`site/js/sand-abi.ts`
//! mirrors these; a test compares them).

/// Material codes for `sand_paint` and `sand_count`: [`sand::Material`]'s
/// own codes.
pub const MATERIAL_EMPTY: u32 = 0;
pub const MATERIAL_SAND: u32 = 1;
pub const MATERIAL_WATER: u32 = 2;
pub const MATERIAL_STONE: u32 = 3;
pub const MATERIAL_LAVA: u32 = 4;
pub const MATERIAL_STEAM: u32 = 5;

/// The largest grid side `sand_new` makes: 2048 covers the 1920 × 1080
/// stress case; a 2048² grid is 4M cells, 16 MB of pixels in wasm memory.
pub const MAX_SIDE: u32 = 2048;
/// The widest brush, cells of radius.
pub const MAX_BRUSH: u32 = 64;
/// Physics steps per simulated second: the page's default and most.
pub const DEFAULT_RATE_HZ: u32 = 60;
pub const MAX_RATE_HZ: u32 = 240;

#[cfg(test)]
mod tests;
