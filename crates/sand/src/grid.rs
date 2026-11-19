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
    /// Part of every random draw's key.
    pub(crate) steps_taken: u64,
    pub(crate) chunks: Chunks,
    /// Cells the scan reached, all steps so far: the tests' only view of
    /// which chunks were skipped.
    #[cfg(test)]
    pub(crate) visited: usize,
}

/// A chunk's side, in cells.
pub const CHUNK_SIDE: usize = 32;

/// Which chunks a step updates (`docs/11-falling-sand.md`, "Chunks"):
/// `now` (this step; a move wakes its neighbours here too, since the
/// bottom-up scan still has rows of them to do) and `next` (the next step:
/// whatever moved, and its neighbours).
#[derive(Clone, Debug)]
pub(crate) struct Chunks {
    pub(crate) columns: usize,
    pub(crate) rows: usize,
    pub(crate) now: Vec<bool>,
    pub(crate) next: Vec<bool>,
    /// Chunks that already woke their neighbourhood this step. Flags only
    /// go up until [`advance`](Self::advance), so a second wake from the
    /// same chunk would change nothing.
    woke: Vec<bool>,
    /// Off: every cell every step, the reference the chunked update is
    /// tested against.
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
            // Everything starts awake: nothing is known to be still.
            now: vec![true; chunk_count],
            next: vec![false; chunk_count],
            woke: vec![false; chunk_count],
            enabled: true,
        }
    }

    fn chunk_index(&self, x: usize, y: usize) -> usize {
        (y / CHUNK_SIDE) * self.columns + x / CHUNK_SIDE
    }

    /// Whether the chunk holding `(x, y)` is updated this step.
    pub(crate) fn awake(&self, x: usize, y: usize) -> bool {
        !self.enabled
            || self
                .now
                .get(self.chunk_index(x, y))
                .copied()
                .unwrap_or(false)
    }

    /// Wakes the chunk holding `(x, y)` and its eight neighbours, this step
    /// and the next. Once per chunk per step: a busy chunk makes hundreds of
    /// moves a step, and rewriting eighteen flags for each was a third of
    /// a busy step.
    pub(crate) fn wake(&mut self, x: usize, y: usize) {
        let index = self.chunk_index(x, y);
        match self.woke.get_mut(index) {
            Some(already_woke) if !*already_woke => *already_woke = true,
            _ => return,
        }
        self.wake_around(x / CHUNK_SIDE, y / CHUNK_SIDE);
    }

    /// The 3 × 3 chunks around chunk `(chunk_x, chunk_y)`, this step and the
    /// next. Rare (once per chunk per step), so out of line: the scan's
    /// loop stays small.
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

    /// Keeps the chunk holding `(x, y)` awake next step, without waking its
    /// neighbours: for a cell that could still change by chance (slow lava,
    /// blocked steam) though nothing moved.
    pub(crate) fn keep(&mut self, x: usize, y: usize) {
        let index = self.chunk_index(x, y);
        if let Some(next) = self.next.get_mut(index) {
            *next = true;
        }
    }

    /// Ends a step: what woke for the next becomes now.
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

    /// Steps taken so far.
    #[must_use]
    pub const fn steps(&self) -> u64 {
        self.steps_taken
    }

    /// The cell bytes, row-major.
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
        let index = self.index(x, y)?;
        self.cells
            .get(index)
            .map(|&cell_byte| material::material(cell_byte))
    }

    /// Paints `(x, y)` with `material` and a fresh shade; `false` outside the
    /// grid.
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

    /// Chunked updates on (the default) or off: off, every cell every step.
    /// Results are identical either way (tested).
    pub fn set_chunked(&mut self, on: bool) {
        self.chunks.enabled = on;
        // Turning on with nothing known: start with everything awake.
        self.chunks.now.fill(true);
    }

    /// How many chunks the next step will update, of how many.
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

    /// How many cells hold `material`.
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
