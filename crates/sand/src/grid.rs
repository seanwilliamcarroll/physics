//! [`Grid`]: the cells, painting, and reading them back.

use crate::material::{self, Material, cell};
use crate::random::{Purpose, draw};

/// The most cells a grid may have: 4096 × 4096 (16 MB of cells).
pub const MAX_CELLS: usize = 1 << 24;

/// A `width × height` grid of one-byte cells, row 0 at the top; outside it
/// is solid (a closed box). Updated in place by [`step`](Self::step).
#[derive(Clone, Debug)]
pub struct Grid {
    width: usize,
    height: usize,
    pub(crate) cells: Vec<u8>,
    /// One bit per cell: something moved here this step, so the scan
    /// doesn't move it again (`docs/11-falling-sand.md`, "Order").
    pub(crate) moved: Vec<u64>,
    pub(crate) seed: u64,
    pub(crate) steps_taken: u64,
    pub(crate) chunks: Chunks,
    /// Cells the scan reached: the tests' view of which chunks were skipped.
    #[cfg(test)]
    pub(crate) visited: usize,
}

pub const CHUNK_SIDE: usize = 32;

/// Which chunks a step updates (`docs/11-falling-sand.md`, "Chunks"):
/// `now` (a move wakes its neighbours here too: the scan still has rows of
/// them to do) and `next`.
#[derive(Clone, Debug)]
pub(crate) struct Chunks {
    pub(crate) columns: usize,
    pub(crate) rows: usize,
    pub(crate) now: Vec<bool>,
    pub(crate) next: Vec<bool>,
    /// Chunks that already woke their neighbourhood this step.
    woke: Vec<bool>,
    /// Off: every cell every step, the reference for tests.
    pub(crate) enabled: bool,
}

impl Chunks {
    fn new(width: usize, height: usize) -> Self {
        let columns = width.div_ceil(CHUNK_SIDE);
        let rows = height.div_ceil(CHUNK_SIDE);
        let chunk_count = columns * rows;
        Self {
            columns,
            rows,
            now: vec![true; chunk_count],
            next: vec![false; chunk_count],
            woke: vec![false; chunk_count],
            enabled: true,
        }
    }

    fn chunk_index(&self, x: usize, y: usize) -> usize {
        (y / CHUNK_SIDE) * self.columns + x / CHUNK_SIDE
    }

    pub(crate) fn awake(&self, x: usize, y: usize) -> bool {
        !self.enabled
            || self
                .now
                .get(self.chunk_index(x, y))
                .copied()
                .unwrap_or(false)
    }

    /// Once per chunk per step: rewriting eighteen flags per move was a third
    /// of a busy step.
    pub(crate) fn wake(&mut self, x: usize, y: usize) {
        let index = self.chunk_index(x, y);
        match self.woke.get_mut(index) {
            Some(already_woke) if !*already_woke => *already_woke = true,
            _ => return,
        }
        self.wake_around(x / CHUNK_SIDE, y / CHUNK_SIDE);
    }

    /// Out of line: rare, and it keeps the scan's loop small.
    #[cold]
    #[inline(never)]
    fn wake_around(&mut self, chunk_x: usize, chunk_y: usize) {
        let neighbour_rows = chunk_y.saturating_sub(1)..=(chunk_y + 1).min(self.rows - 1);
        for neighbour_y in neighbour_rows {
            let neighbour_columns = chunk_x.saturating_sub(1)..=(chunk_x + 1).min(self.columns - 1);
            for neighbour_x in neighbour_columns {
                let index = neighbour_y * self.columns + neighbour_x;
                if let (Some(now), Some(next)) = (self.now.get_mut(index), self.next.get_mut(index))
                {
                    (*now, *next) = (true, true);
                }
            }
        }
    }

    /// Keeps the chunk awake next step for a cell that could still change by
    /// chance (slow lava, blocked steam), without waking its neighbours.
    pub(crate) fn keep(&mut self, x: usize, y: usize) {
        let index = self.chunk_index(x, y);
        if let Some(next) = self.next.get_mut(index) {
            *next = true;
        }
    }

    pub(crate) fn advance(&mut self) {
        core::mem::swap(&mut self.now, &mut self.next);
        self.next.fill(false);
        self.woke.fill(false);
    }
}

impl Grid {
    /// An empty grid. `None` for a zero side or more than [`MAX_CELLS`].
    #[must_use]
    pub fn new(width: usize, height: usize, seed: u64) -> Option<Self> {
        let cell_count = width
            .checked_mul(height)
            .filter(|&count| count > 0 && count <= MAX_CELLS)?;
        Some(Self {
            width,
            height,
            cells: vec![0; cell_count],
            moved: vec![0; cell_count.div_ceil(64)],
            seed,
            steps_taken: 0,
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

    #[must_use]
    pub const fn steps(&self) -> u64 {
        self.steps_taken
    }

    /// The cell bytes, row-major.
    #[must_use]
    pub fn cells(&self) -> &[u8] {
        &self.cells
    }

    pub(crate) fn index(&self, x: usize, y: usize) -> Option<usize> {
        (x < self.width && y < self.height).then(|| y * self.width + x)
    }

    /// The material at `(x, y)`, or `None` outside the grid.
    #[must_use]
    pub fn get(&self, x: usize, y: usize) -> Option<Material> {
        let index = self.index(x, y)?;
        self.cells
            .get(index)
            .map(|&cell_byte| material::material(cell_byte))
    }

    /// Paints `(x, y)` with a fresh shade; `false` outside the grid.
    pub fn set(&mut self, x: usize, y: usize, material: Material) -> bool {
        let shade_bits = draw(self.seed, self.steps_taken, x, y, Purpose::Shade) & 0xf;
        let shade = u8::try_from(shade_bits).unwrap_or(0);
        let Some(cell_byte) = self.index(x, y).and_then(|index| self.cells.get_mut(index)) else {
            return false;
        };
        *cell_byte = cell(material, shade);
        self.chunks.wake(x, y);
        true
    }

    /// Off: every cell every step. Results are identical either way (tested).
    pub fn set_chunked(&mut self, on: bool) {
        self.chunks.enabled = on;
        self.chunks.now.fill(true);
    }

    /// Chunks the next step will update, and the total.
    #[must_use]
    pub fn awake_chunks(&self) -> (usize, usize) {
        let total = self.chunks.now.len();
        let awake = if self.chunks.enabled {
            self.chunks.now.iter().filter(|&&is_awake| is_awake).count()
        } else {
            total
        };
        (awake, total)
    }

    #[must_use]
    pub fn count(&self, material: Material) -> usize {
        self.cells
            .iter()
            .filter(|&&cell_byte| material::material(cell_byte) == material)
            .count()
    }
}

#[cfg(test)]
mod tests;
