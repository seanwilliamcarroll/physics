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
    /// The chunks (`docs/11-falling-sand.md`, "Chunks").
    pub(crate) chunks: Chunks,
    /// Test-only: cells the scan reached (awake chunks' spans), all steps
    /// so far. Chunks are exact, so skipping is otherwise invisible.
    #[cfg(test)]
    pub(crate) visited: usize,
}

/// Chunk side, cells: 32 × 32 (TASKS decision 6).
pub const CHUNK: usize = 32;

/// Which chunks a step updates: `now` (this step; a move wakes its
/// neighbours here too, since the bottom-up scan still has rows of them to
/// do) and `next` (the next step: whatever moved, and its neighbours).
#[derive(Clone, Debug)]
pub(crate) struct Chunks {
    /// Chunks across and down.
    pub(crate) across: usize,
    pub(crate) down: usize,
    pub(crate) now: Vec<bool>,
    pub(crate) next: Vec<bool>,
    /// Off: every cell every step (the reference the chunked update is
    /// tested against).
    pub(crate) enabled: bool,
}

impl Chunks {
    fn new(width: usize, height: usize) -> Self {
        let (across, down) = (width.div_ceil(CHUNK), height.div_ceil(CHUNK));
        Self {
            across,
            down,
            // Everything starts awake: nothing is known to be still.
            now: vec![true; across * down],
            next: vec![false; across * down],
            enabled: true,
        }
    }

    /// Whether the chunk holding `(x, y)` is updated this step.
    pub(crate) fn awake(&self, x: usize, y: usize) -> bool {
        !self.enabled
            || self
                .now
                .get((y / CHUNK) * self.across + x / CHUNK)
                .copied()
                .unwrap_or(false)
    }

    /// Wakes the chunk holding `(x, y)` and its eight neighbours, this step
    /// and the next.
    pub(crate) fn wake(&mut self, x: usize, y: usize) {
        let (cx, cy) = (x / CHUNK, y / CHUNK);
        for ny in cy.saturating_sub(1)..=(cy + 1).min(self.down - 1) {
            for nx in cx.saturating_sub(1)..=(cx + 1).min(self.across - 1) {
                let i = ny * self.across + nx;
                if let (Some(a), Some(b)) = (self.now.get_mut(i), self.next.get_mut(i)) {
                    (*a, *b) = (true, true);
                }
            }
        }
    }

    /// Keeps the chunk holding `(x, y)` awake next step, without waking its
    /// neighbours: a cell that could still change by chance (slow lava,
    /// blocked steam) though nothing moved, so its chunk mustn't sleep.
    pub(crate) fn keep(&mut self, x: usize, y: usize) {
        if let Some(a) = self.next.get_mut((y / CHUNK) * self.across + x / CHUNK) {
            *a = true;
        }
    }

    /// Ends a step: what woke for the next becomes now.
    pub(crate) fn advance(&mut self) {
        core::mem::swap(&mut self.now, &mut self.next);
        self.next.fill(false);
    }
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
            chunks: Chunks::new(width, height),
            #[cfg(test)]
            visited: 0,
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
        self.chunks.wake(x, y);
        true
    }

    /// Chunked updates on (the default) or off: off, every cell every step.
    /// Results are identical either way (tested); off is the reference.
    pub fn set_chunked(&mut self, on: bool) {
        self.chunks.enabled = on;
        // Turning on with nothing known: start with everything awake.
        self.chunks.now.fill(true);
    }

    /// How many chunks the next step will update, of how many: a still grid
    /// sleeps; the page shows this.
    #[must_use]
    pub fn awake_chunks(&self) -> (usize, usize) {
        let awake = if self.chunks.enabled {
            self.chunks.now.iter().filter(|&&a| a).count()
        } else {
            self.chunks.now.len()
        };
        (awake, self.chunks.now.len())
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
