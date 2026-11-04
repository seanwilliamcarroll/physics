//! Wire codes shared with the page (`site/js/acoustic-abi.ts` mirrors
//! these).

/// [`Excitation::Noise`](acoustic::Excitation::Noise).
pub const EXCITATION_NOISE: u32 = 0;
/// [`Excitation::Triangle`](acoustic::Excitation::Triangle).
pub const EXCITATION_TRIANGLE: u32 = 1;

/// Status returned by setters: 1 = applied, 0 = refused (bad value or
/// handle). The same convention as the engine's exports.
pub const STATUS_OK: u32 = 1;
pub const STATUS_REFUSED: u32 = 0;
