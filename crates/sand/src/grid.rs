//! [`Grid`]: the cells, painting, and reading them back.

use crate::material::{self, Material, cell};
use crate::random::{Purpose, draw};

/// The most cells a grid may have: 4096 × 4096 (16M, 16 MB of cells),
/// far past the page's 1920 × 1080 stress case.
pub const MAX_CELLS: usize = 1 << 24;

/// A `width × height` grid of one-byte cells, row 0 at the top; outside it
/// is solid (a closed box). Updated in place by [`step`](Self::step).
#[derive(Clone, Debug)]
pub struct Grid {
    width: usize,
    height: usize,
    pub(crate) cells: Vec<u8>,
    /// One bit per cell: something moved here this step
    /// (`docs/11-falling-sand.md`, "Order").
    pub(crate) moved: Vec<u64>,
    pub(crate) seed: u64,
    /// Steps taken: part of every random draw's key.
    pub(crate) step: u64,
}

impl Grid {
    /// An empty grid. `None` for a zero side or more than [`MAX_CELLS`].
    #[must_use]
    pub fn new(width: usize, height: usize, seed: u64) -> Option<Self> {
        let n = width
            .checked_mul(height)
            .filter(|&n| n > 0 && n <= MAX_CELLS)?;
        Some(Self {
            width,
            height,
            cells: vec![0; n],
            moved: vec![0; n.div_ceil(64)],
            seed,
            step: 0,
        })
    }

    #[must_use]
    pub const fn width(&self) -> usize {
        self.width
    }

    #[must_use]
    pub const fn height(&self) -> usize {
        self.height
    }

    /// Steps taken so far.
    #[must_use]
    pub const fn steps(&self) -> u64 {
        self.step
    }

    /// The cell bytes, row-major (`docs/11-falling-sand.md`, "The grid").
    #[must_use]
    pub fn cells(&self) -> &[u8] {
        &self.cells
    }

    /// The index of `(x, y)`, or `None` outside the grid.
    pub(crate) fn index(&self, x: usize, y: usize) -> Option<usize> {
        (x < self.width && y < self.height).then(|| y * self.width + x)
    }

    /// The material at `(x, y)`, or `None` outside the grid.
    #[must_use]
    pub fn get(&self, x: usize, y: usize) -> Option<Material> {
        let i = self.index(x, y)?;
        self.cells.get(i).map(|&c| material::material(c))
    }

    /// Paints `(x, y)` with `material`, a fresh shade for it; `false`
    /// outside the grid.
    pub fn set(&mut self, x: usize, y: usize, material: Material) -> bool {
        let shade =
            u8::try_from(draw(self.seed, self.step, x, y, Purpose::Shade) & 0xf).unwrap_or(0);
        let Some(c) = self.index(x, y).and_then(|i| self.cells.get_mut(i)) else {
            return false;
        };
        *c = cell(material, shade);
        true
    }

    /// The shade of `(x, y)`, `0..16` (rendering: a per-grain variation that
    /// moves with the grain), or `None` outside the grid.
    #[must_use]
    pub fn shade_at(&self, x: usize, y: usize) -> Option<u8> {
        let i = self.index(x, y)?;
        self.cells.get(i).map(|&c| material::shade(c))
    }

    /// How many cells hold `material`.
    #[must_use]
    pub fn count(&self, material: Material) -> usize {
        self.cells
            .iter()
            .filter(|&&c| material::material(c) == material)
            .count()
    }
}

#[cfg(test)]
mod tests;
