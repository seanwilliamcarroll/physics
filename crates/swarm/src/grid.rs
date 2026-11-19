//! [`Grid`]: a cell list by counting sort (`docs/15-swarm.md`, "Finding
//! neighbours"). The cell side is at least the visual range, so every
//! neighbour of a boid is in the 3 × 3 block of cells around its own.

use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};

/// Caps the cell count when the visual range is tiny; larger cells are
/// still correct, only slower.
const MAX_CELLS_PER_SIDE: f32 = 1024.0;

/// Cells are this much wider than the range, so float rounding can't lose
/// a neighbour: boids exactly a range apart (8r and 9r) can pass `dy < r`
/// in f32 yet bin into cells 7 and 9. With at most 1024 cells a side both
/// errors are ~1e-4, which 1/1024 covers.
const CELL_SLACK: f32 = 1.0 + 1.0 / 1024.0;

/// Boid indices sorted by cell: `cell_start[c]..cell_start[c + 1]` are
/// cell `c`'s slots in `order`.
#[derive(Clone, Debug, Default)]
pub(crate) struct Grid {
    inverse_cell_side: f32,
    columns: usize,
    rows: usize,
    cell_start: Vec<u32>,
    next_slot: Vec<u32>,
    order: Vec<u32>,
}

impl Grid {
    /// Bins boids into cells of side `max(range, side / 1024)` times
    /// [`CELL_SLACK`]. Boids outside the arena go in the edge cells:
    /// clamping is monotone, so boids under a cell apart stay in the same
    /// or adjacent cells.
    pub(crate) fn rebuild(&mut self, width: f32, height: f32, range: f32, x: &[f32], y: &[f32]) {
        let cell_side = range
            .max(width / MAX_CELLS_PER_SIDE)
            .max(height / MAX_CELLS_PER_SIDE)
            * CELL_SLACK;
        self.inverse_cell_side = 1.0 / cell_side;
        self.columns = cells_across(width * self.inverse_cell_side);
        self.rows = cells_across(height * self.inverse_cell_side);
        self.fill(x, y);
    }

    /// For a periodic `side × side` box: the most whole cells per side
    /// at least `range` wide (with slack), at most 1024; `None` below 3,
    /// where a 3 × 3 block would wrap onto itself.
    pub(crate) fn rebuild_periodic(
        &mut self,
        side: f32,
        range: f32,
        x: &[f32],
        y: &[f32],
    ) -> Option<()> {
        let cells_per_side =
            f64_to_usize(f64::from((side / (range * CELL_SLACK)).floor()))?.min(1024);
        if cells_per_side < 3 {
            return None;
        }
        self.columns = cells_per_side;
        self.rows = cells_per_side;
        self.inverse_cell_side = f64_to_f32(usize_to_f64(cells_per_side)) / side;
        self.fill(x, y);
        Some(())
    }

    fn fill(&mut self, x: &[f32], y: &[f32]) {
        let cell_count = self.columns * self.rows;
        // Histogram, shifted by one so the prefix sum gives starts.
        self.cell_start.clear();
        self.cell_start.resize(cell_count + 1, 0);
        for (&boid_x, &boid_y) in x.iter().zip(y) {
            let cell = self.cell_of(boid_x, boid_y);
            if let Some(count) = self.cell_start.get_mut(cell + 1) {
                *count += 1;
            }
        }
        let mut total = 0;
        for start in &mut self.cell_start {
            total += *start;
            *start = total;
        }
        self.next_slot.clear();
        self.next_slot.extend_from_slice(&self.cell_start);
        self.order.clear();
        self.order.resize(x.len(), 0);
        for (boid_index, (&boid_x, &boid_y)) in (0_u32..).zip(x.iter().zip(y)) {
            let cell = self.cell_of(boid_x, boid_y);
            if let Some(slot) = self.next_slot.get_mut(cell) {
                if let Some(entry) = usize::try_from(*slot)
                    .ok()
                    .and_then(|position| self.order.get_mut(position))
                {
                    *entry = boid_index;
                }
                *slot += 1;
            }
        }
    }

    fn cell_of(&self, x: f32, y: f32) -> usize {
        let (cell_x, cell_y) = self.coords(x, y);
        cell_y * self.columns + cell_x
    }

    /// Column and row of the cell holding `(x, y)`, clamped onto the grid.
    fn coords(&self, x: f32, y: f32) -> (usize, usize) {
        let along = |position: f32, cell_count: usize| {
            // Non-negative after `max`, so truncating is the floor.
            let scaled = (position * self.inverse_cell_side).max(0.0);
            let whole = if crate::rules::TRUNCATE_CELL {
                scaled
            } else {
                scaled.floor()
            };
            let cell = f64_to_usize(f64::from(whole)).unwrap_or(0);
            cell.min(cell_count.saturating_sub(1))
        };
        (along(x, self.columns), along(y, self.rows))
    }

    /// Every boid in the 3 × 3 block of cells around `(x, y)`'s, itself
    /// included.
    pub(crate) fn around(&self, x: f32, y: f32) -> impl Iterator<Item = usize> + '_ {
        self.spans_around(x, y).flat_map(move |span| {
            self.order
                .get(span)
                .unwrap_or_default()
                .iter()
                .filter_map(|&boid_index| usize::try_from(boid_index).ok())
        })
    }

    /// The slots in `order` of the 3 × 3 block, as up to three ranges (a
    /// row's three cells are adjacent in cell order). Boids stored in
    /// cell order are those same ranges of the arrays.
    pub(crate) fn spans_around(
        &self,
        x: f32,
        y: f32,
    ) -> impl Iterator<Item = core::ops::Range<usize>> + '_ {
        let (cell_x, cell_y) = self.coords(x, y);
        let (first_x, last_x) = (
            cell_x.saturating_sub(1),
            (cell_x + 1).min(self.columns.saturating_sub(1)),
        );
        let (first_y, last_y) = (
            cell_y.saturating_sub(1),
            (cell_y + 1).min(self.rows.saturating_sub(1)),
        );
        (first_y..=last_y).map(move |row| {
            let (first_cell, end_cell) = (
                row * self.columns + first_x,
                row * self.columns + last_x + 1,
            );
            match (
                self.cell_start.get(first_cell),
                self.cell_start.get(end_cell),
            ) {
                (Some(&first_slot), Some(&end_slot)) => {
                    usize::try_from(first_slot).unwrap_or(0)..usize::try_from(end_slot).unwrap_or(0)
                }
                _ => 0..0,
            }
        })
    }

    /// The 3 × 3 block around `(x, y)`'s cell, modulo the grid (after
    /// [`Self::rebuild_periodic`]), each cell's indices as a slice. Slices,
    /// not one chained iterator: nine cells flattened into one iterator
    /// cost five times the distance tests (`docs/profiling.md`).
    pub(crate) fn cells_wrapped(&self, x: f32, y: f32) -> [&[u32]; 9] {
        let (cell_x, cell_y) = self.coords(x, y);
        let (columns, rows) = (self.columns, self.rows);
        let wrap = |cell: usize, offset: usize, count: usize| (cell + count + offset - 1) % count;
        core::array::from_fn(|neighbour| {
            let cell =
                wrap(cell_y, neighbour / 3, rows) * columns + wrap(cell_x, neighbour % 3, columns);
            let span = match (self.cell_start.get(cell), self.cell_start.get(cell + 1)) {
                (Some(&first_slot), Some(&end_slot)) => {
                    usize::try_from(first_slot).unwrap_or(0)..usize::try_from(end_slot).unwrap_or(0)
                }
                _ => 0..0,
            };
            self.order.get(span).unwrap_or_default()
        })
    }

    pub(crate) fn order(&self) -> &[u32] {
        &self.order
    }
}

fn cells_across(cells: f32) -> usize {
    f64_to_usize(f64::from(cells.ceil())).unwrap_or(1).max(1)
}

#[cfg(test)]
mod tests;
