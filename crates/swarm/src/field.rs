//! [`Field`]: a scalar field on a grid of cells, deposited into, diffused
//! and decayed (`docs/15-swarm.md`, "Deposit, diffuse, decay"). The ants'
//! pheromone and Physarum's trail.

/// The most cells a field holds: 2²² (4M; 400 × 225 is 90k).
pub const MAX_CELLS: usize = 1 << 22;

/// The most one deposit may add (an agent's, an ant's, a node's): a
/// million. Values are `f32` and nothing else bounds what is laid down
/// each step: a deposit near `f32::MAX` (finite, so it passes) sums to
/// infinity in a few steps and every reading after is NaN. At a million a
/// step, a cell is 10²⁰ times further from overflow than any run is long.
pub const MAX_DEPOSIT: f32 = 1.0e6;

/// A `width × height` grid of non-negative `f32` values, row-major.
#[derive(Clone, Debug)]
pub struct Field {
    width: usize,
    height: usize,
    values: Vec<f32>,
    /// The next step's values, built here and swapped in.
    scratch: Vec<f32>,
}

impl Field {
    /// A zero field; `None` for a zero side or more than [`MAX_CELLS`].
    #[must_use]
    pub fn new(width: usize, height: usize) -> Option<Self> {
        let cell_count = width.checked_mul(height)?;
        if width == 0 || height == 0 || cell_count > MAX_CELLS {
            return None;
        }
        Some(Self {
            width,
            height,
            values: vec![0.0; cell_count],
            scratch: vec![0.0; cell_count],
        })
    }

    /// Cells across.
    #[must_use]
    pub const fn width(&self) -> usize {
        self.width
    }

    /// Cells down.
    #[must_use]
    pub const fn height(&self) -> usize {
        self.height
    }

    /// The row-major index of cell `(x, y)`, or `None` outside.
    fn index(&self, x: usize, y: usize) -> Option<usize> {
        (x < self.width && y < self.height).then(|| y * self.width + x)
    }

    /// The value at `(x, y)`, or `None` outside.
    #[must_use]
    pub fn get(&self, x: usize, y: usize) -> Option<f32> {
        self.values.get(self.index(x, y)?).copied()
    }

    /// Adds `amount` at `(x, y)`; `false` (nothing added) outside or for a
    /// negative or non-finite amount.
    pub fn deposit(&mut self, x: usize, y: usize, amount: f32) -> bool {
        if !(amount.is_finite() && amount >= 0.0) {
            return false;
        }
        let Some(value) = self
            .index(x, y)
            .and_then(|index| self.values.get_mut(index))
        else {
            return false;
        };
        *value += amount;
        true
    }

    /// Every value, row-major (rendering).
    #[must_use]
    pub fn values(&self) -> &[f32] {
        &self.values
    }

    /// The sum of every value, in `f64` (accounting).
    #[must_use]
    pub fn total(&self) -> f64 {
        self.values.iter().map(|&value| f64::from(value)).sum()
    }

    /// Each cell's count of open neighbours (of eight), for
    /// [`Self::diffuse_counted`]. It changes only when walls do, so a
    /// caller that diffuses every step computes it once: recounted each
    /// step it was 95% of the ants' step (`docs/profiling.md`).
    #[must_use]
    pub fn open_neighbours(&self, open: &[bool]) -> Vec<u8> {
        let (width, height) = (self.width, self.height);
        let is_open = |x: usize, y: usize| open.get(y * width + x).copied().unwrap_or(false);
        let mut counts = Vec::with_capacity(width * height);
        for y in 0..height {
            for x in 0..width {
                let (first_x, last_x, first_y, last_y) = (
                    x.saturating_sub(1),
                    (x + 1).min(width - 1),
                    y.saturating_sub(1),
                    (y + 1).min(height - 1),
                );
                let mut open_count = 0_u8;
                for neighbour_y in first_y..=last_y {
                    for neighbour_x in first_x..=last_x {
                        open_count += u8::from(
                            (neighbour_x, neighbour_y) != (x, y)
                                && is_open(neighbour_x, neighbour_y),
                        );
                    }
                }
                counts.push(open_count);
            }
        }
        counts
    }

    /// Diffusion that conserves mass: every open cell keeps `1 − rate` of
    /// its value and gives `rate`, split equally among its open neighbours
    /// (of eight; `open[i]` false is a wall, and walls give and take
    /// nothing). A cell with no open neighbour keeps everything. `open`
    /// must be one flag per cell; `rate` is clamped to `[0, 1]`. Counts the
    /// neighbours each call: a caller diffusing every step should use
    /// [`Self::diffuse_counted`].
    pub fn diffuse(&mut self, open: &[bool], rate: f32) {
        let counts = self.open_neighbours(open);
        self.diffuse_counted(open, &counts, rate);
    }

    /// [`Self::diffuse`] with the open-neighbour counts given (from
    /// [`Self::open_neighbours`] for the same `open`). The same arithmetic in
    /// the same order: bit-identical results.
    pub fn diffuse_counted(&mut self, open: &[bool], counts: &[u8], rate: f32) {
        let rate = if rate.is_finite() {
            rate.clamp(0.0, 1.0)
        } else {
            0.0
        };
        let (width, height) = (self.width, self.height);
        self.scratch.fill(0.0);
        for y in 0..height {
            let (first_y, last_y) = (y.saturating_sub(1), (y + 1).min(height - 1));
            for x in 0..width {
                let index = y * width + x;
                let value = self.values.get(index).copied().unwrap_or(0.0);
                if value == 0.0 || !open.get(index).copied().unwrap_or(false) {
                    continue;
                }
                let open_count = counts.get(index).copied().unwrap_or(0);
                if open_count == 0 {
                    if let Some(slot) = self.scratch.get_mut(index) {
                        *slot += value;
                    }
                    continue;
                }
                let given = value * rate;
                let share = given / f32::from(open_count);
                if let Some(slot) = self.scratch.get_mut(index) {
                    *slot += value - given;
                }
                if open_count == 8 && x > 0 && x + 1 < width && y > 0 && y + 1 < height {
                    // All eight open, which only an interior cell can be
                    // (checked all the same: the counts are the caller's):
                    // the three rows of three, nothing to test per
                    // neighbour. Each target gets one add from this cell
                    // either way, so the sums are the same bits.
                    let rows = [index - width - 1, index - 1, index + width - 1]
                        .map(|first| first..first + 3);
                    let [above, beside, below] = rows;
                    if let Some([left, middle, right]) = self.scratch.get_mut(above) {
                        (*left, *middle, *right) = (*left + share, *middle + share, *right + share);
                    }
                    if let Some([left, _, right]) = self.scratch.get_mut(beside) {
                        (*left, *right) = (*left + share, *right + share);
                    }
                    if let Some([left, middle, right]) = self.scratch.get_mut(below) {
                        (*left, *middle, *right) = (*left + share, *middle + share, *right + share);
                    }
                    continue;
                }
                let (first_x, last_x) = (x.saturating_sub(1), (x + 1).min(width - 1));
                for neighbour_y in first_y..=last_y {
                    let row_start = neighbour_y * width;
                    for neighbour_x in first_x..=last_x {
                        let neighbour = row_start + neighbour_x;
                        if neighbour != index
                            && open.get(neighbour).copied().unwrap_or(false)
                            && let Some(slot) = self.scratch.get_mut(neighbour)
                        {
                            *slot += share;
                        }
                    }
                }
            }
        }
        core::mem::swap(&mut self.values, &mut self.scratch);
    }

    /// Diffusion on a periodic grid (no walls, the edges wrapped): every
    /// cell keeps `1 − rate` and takes `rate / 8` of each of its eight
    /// neighbours' values, so the total is conserved (in reals; to
    /// rounding in f32). `rate = 8/9` is the 3 × 3 mean filter. Written as
    /// a gather (each cell reads its neighbours), which reads in order.
    pub(crate) fn diffuse_periodic(&mut self, rate: f32) {
        let rate = if rate.is_finite() {
            rate.clamp(0.0, 1.0)
        } else {
            0.0
        };
        let (width, height) = (self.width, self.height);
        let (keep, share) = (1.0 - rate, rate / 8.0);
        for y in 0..height {
            let (up, down) = ((y + height - 1) % height, (y + 1) % height);
            for x in 0..width {
                let (left, right) = ((x + width - 1) % width, (x + 1) % width);
                let at = |cell_x: usize, cell_y: usize| {
                    self.values
                        .get(cell_y * width + cell_x)
                        .copied()
                        .unwrap_or(0.0)
                };
                let around = at(left, up)
                    + at(x, up)
                    + at(right, up)
                    + at(left, y)
                    + at(right, y)
                    + at(left, down)
                    + at(x, down)
                    + at(right, down);
                if let Some(slot) = self.scratch.get_mut(y * width + x) {
                    *slot = keep * at(x, y) + share * around;
                }
            }
        }
        core::mem::swap(&mut self.values, &mut self.scratch);
    }

    /// The share of the total in the `fraction` of cells holding most
    /// (0.1 of a uniform field's mass is in its top 10%; a network's is
    /// far more). 0 for an empty field.
    #[must_use]
    pub fn top_share(&self, fraction: f64) -> f64 {
        let total = self.total();
        if total.is_nan() || total <= 0.0 {
            return 0.0;
        }
        let cell_count = self.values.len();
        let top_count = math::convert::f64_to_usize(
            (fraction.clamp(0.0, 1.0) * math::convert::usize_to_f64(cell_count)).round(),
        )
        .unwrap_or(0)
        .min(cell_count);
        if top_count == 0 {
            return 0.0;
        }
        let mut sorted = self.values.clone();
        // The largest `top_count` to the front (descending), in linear time.
        sorted.select_nth_unstable_by(top_count - 1, |a, b| b.total_cmp(a));
        sorted
            .iter()
            .take(top_count)
            .map(|&value| f64::from(value))
            .sum::<f64>()
            / total
    }

    /// Every value times `1 − rate` (`rate` clamped to `[0, 1]`).
    pub fn decay(&mut self, rate: f32) {
        let keep = 1.0
            - if rate.is_finite() {
                rate.clamp(0.0, 1.0)
            } else {
                0.0
            };
        for value in &mut self.values {
            *value *= keep;
        }
    }

    /// Sets cell `index` (row-major) to zero.
    pub fn zero(&mut self, index: usize) {
        if let Some(value) = self.values.get_mut(index) {
            *value = 0.0;
        }
    }

    /// Sets every value to zero.
    pub fn clear(&mut self) {
        self.values.fill(0.0);
    }
}

#[cfg(test)]
mod tests;
