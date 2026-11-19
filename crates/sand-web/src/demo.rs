//! [`SandDemo`]: a grid, its clock, its RGBA buffer, and the brush. All
//! safe Rust, tested natively; `exports.rs` only adapts it to the C ABI.

use core::num::NonZeroU32;

use sand::{Grid, Material};
use web_common::FixedStep;

use crate::abi;

pub struct SandDemo {
    grid: Grid,
    clock: FixedStep,
    /// One `u32` per cell, in `ImageData` byte order.
    pixels: Vec<u32>,
    /// Every cell byte's colour: rendering is a lookup per cell.
    palette: [u32; 256],
    last_moves: usize,
}

const START_RATE: NonZeroU32 = match NonZeroU32::new(abi::DEFAULT_RATE_HZ) {
    Some(rate) => rate,
    None => NonZeroU32::MIN,
};

impl SandDemo {
    #[must_use]
    pub fn new(width: usize, height: usize, seed: u64) -> Option<Self> {
        let grid = Grid::new(width, height, seed)?;
        let cell_count = width * height;
        Some(Self {
            grid,
            clock: FixedStep::new(START_RATE),
            pixels: vec![0; cell_count],
            palette: core::array::from_fn(|cell_byte| {
                let (material, shade) = sand::unpack(u8::try_from(cell_byte).unwrap_or(0));
                colour(material, shade)
            }),
            last_moves: 0,
        })
    }

    #[must_use]
    pub const fn grid(&self) -> &Grid {
        &self.grid
    }

    /// Runs the fixed steps `elapsed` seconds pays for; returns how many.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        self.clock
            .run(elapsed, || self.last_moves = self.grid.step())
    }

    pub const fn clock(&mut self) -> &mut FixedStep {
        &mut self.clock
    }

    pub fn set_chunked(&mut self, on: bool) {
        self.grid.set_chunked(on);
    }

    /// Moves made by the last step (0: settled).
    #[must_use]
    pub const fn last_moves(&self) -> usize {
        self.last_moves
    }

    /// Paints a disc of `radius` cells, clipped to the grid; returns the
    /// cells painted.
    pub fn paint(&mut self, x: i64, y: i64, radius: i64, material: Material) -> usize {
        let mut painted = 0;
        for dy in -radius..=radius {
            for dx in -radius..=radius {
                if dx * dx + dy * dy > radius * radius {
                    continue;
                }
                let (Ok(cell_x), Ok(cell_y)) = (usize::try_from(x + dx), usize::try_from(y + dy))
                else {
                    continue;
                };
                if self.grid.set(cell_x, cell_y, material) {
                    painted += 1;
                }
            }
        }
        painted
    }

    /// A palette lookup per cell: in wasm at 1920 × 1080, 0.47 ms, against
    /// 8.6 ms decoding each cell through `Grid::get` and a shade lookup.
    pub fn render(&mut self) -> &[u32] {
        for (pixel, &cell_byte) in self.pixels.iter_mut().zip(self.grid.cells()) {
            *pixel = self
                .palette
                .get(usize::from(cell_byte))
                .copied()
                .unwrap_or(0);
        }
        &self.pixels
    }
}

const fn base(material: Material) -> [u8; 3] {
    match material {
        Material::Empty => [0x16, 0x1a, 0x22],
        Material::Sand => [0xd8, 0xb8, 0x6a],
        Material::Water => [0x3a, 0x7b, 0xd5],
        Material::Stone => [0x6b, 0x6e, 0x76],
        Material::Lava => [0xf0, 0x5a, 0x1e],
        Material::Steam => [0xc8, 0xd0, 0xd8],
    }
}

/// Per step of shade from the middle (8): ±32 at the extremes.
const SHADE_STEP: i16 = 4;

/// `material`'s colour varied by `shade` (empty isn't varied), as an
/// `ImageData` pixel: bytes R, G, B, A in memory, so `A << 24 | B << 16 |
/// G << 8 | R` on a little-endian machine (wasm is).
fn colour(material: Material, shade: u8) -> u32 {
    let shade_offset = if material == Material::Empty {
        0
    } else {
        (i16::from(shade) - 8) * SHADE_STEP
    };
    let [red, green, blue] = base(material).map(|channel| {
        u32::from(u8::try_from((i16::from(channel) + shade_offset).clamp(0, 255)).unwrap_or(0))
    });
    0xff00_0000 | (blue << 16) | (green << 8) | red
}

#[cfg(test)]
mod tests;
