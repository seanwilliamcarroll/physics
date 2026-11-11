//! [`SandDemo`]: a grid, its clock, its RGBA buffer, and the brush. All
//! safe Rust, tested natively; `exports.rs` only adapts it to the C ABI.

use core::num::NonZeroU32;

use sand::{Grid, Material};
use web_common::FixedStep;

use crate::abi;

/// One running automaton on a page.
pub struct SandDemo {
    grid: Grid,
    clock: FixedStep,
    /// One `u32` per cell, RGBA in memory order (`ImageData`'s): written
    /// by [`render`](Self::render).
    pixels: Vec<u32>,
    /// Every cell byte's colour: rendering is a lookup per cell.
    palette: [u32; 256],
    /// Moves made by the last step (0: settled).
    last_moves: usize,
}

/// Steps a demo starts at (the page's default rate).
const START_RATE: NonZeroU32 = match NonZeroU32::new(abi::DEFAULT_RATE_HZ) {
    Some(r) => r,
    None => NonZeroU32::MIN,
};

impl SandDemo {
    /// An empty `width × height` grid; `None` for a zero or too-large side.
    #[must_use]
    pub fn new(width: usize, height: usize, seed: u64) -> Option<Self> {
        let grid = Grid::new(width, height, seed)?;
        let cells = width * height;
        Some(Self {
            grid,
            clock: FixedStep::new(START_RATE),
            pixels: vec![0; cells],
            palette: core::array::from_fn(|b| {
                let (m, shade) = sand::unpack(u8::try_from(b).unwrap_or(0));
                colour(m, shade)
            }),
            last_moves: 0,
        })
    }

    #[must_use]
    pub const fn grid(&self) -> &Grid {
        &self.grid
    }

    /// Adds `elapsed` seconds of real time and runs the fixed steps it pays
    /// for; returns how many.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        let steps = self.clock.advance(elapsed);
        for _ in 0..steps {
            self.last_moves = self.grid.step();
        }
        steps
    }

    pub fn set_rate(&mut self, rate: NonZeroU32) {
        self.clock.set_rate(rate);
    }

    /// The step budget's cap (`None`: none), as in `engine-web`.
    pub const fn set_step_cap(&mut self, cap: Option<NonZeroU32>) {
        self.clock.set_cap(cap);
    }

    pub fn set_chunked(&mut self, on: bool) {
        self.grid.set_chunked(on);
    }

    /// Moves made by the last step.
    #[must_use]
    pub const fn last_moves(&self) -> usize {
        self.last_moves
    }

    /// Paints a disc of `radius` cells around `(x, y)` (cells may be
    /// outside the grid: they're clipped) with `material`; returns how many
    /// cells were painted.
    pub fn paint(&mut self, x: i64, y: i64, radius: i64, material: Material) -> usize {
        let mut painted = 0;
        for dy in -radius..=radius {
            for dx in -radius..=radius {
                if dx * dx + dy * dy > radius * radius {
                    continue;
                }
                let (Ok(cx), Ok(cy)) = (usize::try_from(x + dx), usize::try_from(y + dy)) else {
                    continue;
                };
                if self.grid.set(cx, cy, material) {
                    painted += 1;
                }
            }
        }
        painted
    }

    /// Fills the RGBA buffer from the grid and returns it.
    /// A lookup per cell: in wasm at 1920 × 1080, 0.47 ms, against 8.6 ms
    /// decoding each cell through `Grid::get` and `shade_at`.
    pub fn render(&mut self) -> &[u32] {
        for (p, &c) in self.pixels.iter_mut().zip(self.grid.cells()) {
            *p = self.palette.get(usize::from(c)).copied().unwrap_or(0);
        }
        &self.pixels
    }
}

/// A material's base colour, RGB.
const fn base(m: Material) -> [u8; 3] {
    match m {
        Material::Empty => [0x16, 0x1a, 0x22],
        Material::Sand => [0xd8, 0xb8, 0x6a],
        Material::Water => [0x3a, 0x7b, 0xd5],
        Material::Stone => [0x6b, 0x6e, 0x76],
        Material::Lava => [0xf0, 0x5a, 0x1e],
        Material::Steam => [0xc8, 0xd0, 0xd8],
    }
}

/// How far a shade moves a channel, per step of shade from the middle
/// (8): ±32 at the extremes, so grains read without changing material.
const SHADE_STEP: i16 = 4;

/// `m`'s colour varied by `shade` (empty isn't varied), as an
/// `ImageData` pixel: bytes R, G, B, A in memory, so `A << 24 | B << 16 |
/// G << 8 | R` on a little-endian machine (wasm is).
fn colour(m: Material, shade: u8) -> u32 {
    let delta = if m == Material::Empty {
        0
    } else {
        (i16::from(shade) - 8) * SHADE_STEP
    };
    let [r, g, b] =
        base(m).map(|c| u32::from(u8::try_from((i16::from(c) + delta).clamp(0, 255)).unwrap_or(0)));
    0xff00_0000 | (b << 16) | (g << 8) | r
}

#[cfg(test)]
mod tests;
