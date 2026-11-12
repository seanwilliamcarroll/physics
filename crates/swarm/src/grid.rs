//! [`Grid`]: a cell list by counting sort (`docs/15-swarm.md`, "Finding
//! neighbours"). The cell side is at least the visual range, so every
//! neighbour of a boid is in the 3 × 3 block of cells around its own.

use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};

/// The most cells along a side: a tiny visual range on a big arena would
/// otherwise mean millions of cells. Larger cells are still correct
/// (more candidates, each checked), only slower.
const MAX_CELLS_PER_SIDE: f32 = 1024.0;

/// Cells are this much wider than the range. Found by the property test:
/// two boids exactly a range apart (8r and 9r) round to *just inside* it
/// (`dy < r` in f32), while binning `y × (1/r)` rounds 8 down to 7.9999
/// and 9 up: cells 7 and 9, not adjacent, and the neighbour is lost. With
/// at most 1024 cells a side, binning is off by at most ~1e-4 of a cell
/// and `dy` by ~1e-4 px; 1/1024 wider covers both.
const CELL_SLACK: f32 = 1.0 + 1.0 / 1024.0;

/// Boid indices sorted by cell, rebuilt every step: `start[c]..start[c +
/// 1]` are cell `c`'s slots in `order`.
#[derive(Clone, Debug, Default)]
pub(crate) struct Grid {
    inv_cell: f32,
    cols: usize,
    rows: usize,
    start: Vec<u32>,
    cursor: Vec<u32>,
    order: Vec<u32>,
}

impl Grid {
    /// Bins `x[i], y[i]` into cells of side `max(range, side / 1024)` (a
    /// hair wider: [`CELL_SLACK`]) over a
    /// `width × height` arena. Boids outside it go in the edge cells:
    /// clamping is monotone and only moves inward, so two boids under a
    /// cell apart still land in the same or adjacent cells.
    pub(crate) fn rebuild(&mut self, width: f32, height: f32, range: f32, x: &[f32], y: &[f32]) {
        let cell = range
            .max(width / MAX_CELLS_PER_SIDE)
            .max(height / MAX_CELLS_PER_SIDE)
            * CELL_SLACK;
        self.inv_cell = 1.0 / cell;
        self.cols = count(width * self.inv_cell);
        self.rows = count(height * self.inv_cell);
        self.fill(x, y);
    }

    /// For a periodic `side × side` box: the most whole cells per side
    /// that are each at least `range` (a hair wider, as [`Self::rebuild`]),
    /// at most 1024; `None` (nothing built) below 3, where a 3 × 3 block
    /// would wrap onto itself and see a particle twice.
    pub(crate) fn rebuild_periodic(
        &mut self,
        side: f32,
        range: f32,
        x: &[f32],
        y: &[f32],
    ) -> Option<()> {
        let k = f64_to_usize(f64::from((side / (range * CELL_SLACK)).floor()))?.min(1024);
        if k < 3 {
            return None;
        }
        self.cols = k;
        self.rows = k;
        self.inv_cell = f64_to_f32(usize_to_f64(k)) / side;
        self.fill(x, y);
        Some(())
    }

    /// The counting sort itself, into the current cells.
    fn fill(&mut self, x: &[f32], y: &[f32]) {
        let cells = self.cols * self.rows;
        // 1. Histogram, shifted by one so the prefix sum gives starts.
        self.start.clear();
        self.start.resize(cells + 1, 0);
        for (&px, &py) in x.iter().zip(y) {
            let c = self.cell_of(px, py);
            if let Some(s) = self.start.get_mut(c + 1) {
                *s += 1;
            }
        }
        // 2. Prefix sum: start[c] = the counts of every cell before c,
        // which is cell c's first slot (the shift did the rest).
        let mut total = 0;
        for s in &mut self.start {
            total += *s;
            *s = total;
        }
        // 3. Scatter each boid's index into its cell's next slot.
        self.cursor.clear();
        self.cursor.extend_from_slice(&self.start);
        self.order.clear();
        self.order.resize(x.len(), 0);
        for (i, (&px, &py)) in (0_u32..).zip(x.iter().zip(y)) {
            let c = self.cell_of(px, py);
            if let Some(slot) = self.cursor.get_mut(c) {
                if let Some(o) = usize::try_from(*slot)
                    .ok()
                    .and_then(|s| self.order.get_mut(s))
                {
                    *o = i;
                }
                *slot += 1;
            }
        }
    }

    /// The cell holding `(x, y)`, clamped onto the grid.
    fn cell_of(&self, x: f32, y: f32) -> usize {
        let (cx, cy) = self.coords(x, y);
        cy * self.cols + cx
    }

    fn coords(&self, x: f32, y: f32) -> (usize, usize) {
        let along = |v: f32, n: usize| {
            let k = f64_to_usize(f64::from((v * self.inv_cell).floor().max(0.0))).unwrap_or(0);
            k.min(n.saturating_sub(1))
        };
        (along(x, self.cols), along(y, self.rows))
    }

    /// Every boid in the 3 × 3 block of cells around `(x, y)`'s (itself
    /// included, if it's one of them): the candidates within one cell.
    pub(crate) fn around(&self, x: f32, y: f32) -> impl Iterator<Item = usize> + '_ {
        self.spans_around(x, y).flat_map(move |span| {
            self.order
                .get(span)
                .unwrap_or_default()
                .iter()
                .filter_map(|&j| usize::try_from(j).ok())
        })
    }

    /// The slots in `order` of the 3 × 3 block around `(x, y)`'s cell, as
    /// up to three ranges: a row's three cells are adjacent in cell order,
    /// so their slots are one run. Boids stored in cell order
    /// ([`Self::order`] applied) are those same ranges of the arrays.
    pub(crate) fn spans_around(
        &self,
        x: f32,
        y: f32,
    ) -> impl Iterator<Item = core::ops::Range<usize>> + '_ {
        let (cx, cy) = self.coords(x, y);
        let (x0, x1) = (
            cx.saturating_sub(1),
            (cx + 1).min(self.cols.saturating_sub(1)),
        );
        let (y0, y1) = (
            cy.saturating_sub(1),
            (cy + 1).min(self.rows.saturating_sub(1)),
        );
        (y0..=y1).map(move |ny| {
            let (a, b) = (ny * self.cols + x0, ny * self.cols + x1 + 1);
            match (self.start.get(a), self.start.get(b)) {
                (Some(&s), Some(&e)) => {
                    usize::try_from(s).unwrap_or(0)..usize::try_from(e).unwrap_or(0)
                }
                _ => 0..0,
            }
        })
    }

    /// The particles in the 3 × 3 block around `(x, y)`'s cell, taken
    /// modulo the grid (after [`Self::rebuild_periodic`]: at least 3 a
    /// side, so the nine cells are distinct): each cell's indices as a
    /// slice, rows first. Slices, not one chained iterator: the caller's
    /// loop over a slice compiles to a plain loop, where nine cells
    /// flattened into one iterator cost five times the distance tests
    /// they fed (`docs/profiling.md`).
    pub(crate) fn cells_wrapped(&self, x: f32, y: f32) -> [&[u32]; 9] {
        let (cx, cy) = self.coords(x, y);
        let (k, l) = (self.cols, self.rows);
        let wrap = |c: usize, d: usize, n: usize| (c + n + d - 1) % n;
        core::array::from_fn(|i| {
            let c = wrap(cy, i / 3, l) * k + wrap(cx, i % 3, k);
            let span = match (self.start.get(c), self.start.get(c + 1)) {
                (Some(&s), Some(&e)) => {
                    usize::try_from(s).unwrap_or(0)..usize::try_from(e).unwrap_or(0)
                }
                _ => 0..0,
            };
            self.order.get(span).unwrap_or_default()
        })
    }

    /// Boid indices in cell order (after [`Self::rebuild`]).
    pub(crate) fn order(&self) -> &[u32] {
        &self.order
    }
}

/// Cells along a side: `ceil(cells)`, at least 1.
fn count(cells: f32) -> usize {
    f64_to_usize(f64::from(cells.ceil())).unwrap_or(1).max(1)
}

#[cfg(test)]
mod tests;
