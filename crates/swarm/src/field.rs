//! [`Field`]: a scalar field on a grid of cells, deposited into, diffused
//! and decayed (`docs/15-swarm.md`, S3: "Deposit, diffuse, decay"). Ant
//! pheromone in S3; Physarum's trail in S4.

/// The most cells a field holds: 2²² (4M; 400 × 225 is 90k).
pub const MAX_CELLS: usize = 1 << 22;

/// A `width × height` grid of non-negative `f32` values, row-major.
#[derive(Clone, Debug)]
pub struct Field {
    width: usize,
    height: usize,
    value: Vec<f32>,
    scratch: Vec<f32>,
}

impl Field {
    /// A zero field; `None` for a zero side or more than [`MAX_CELLS`].
    #[must_use]
    pub fn new(width: usize, height: usize) -> Option<Self> {
        let cells = width.checked_mul(height)?;
        if width == 0 || height == 0 || cells > MAX_CELLS {
            return None;
        }
        Some(Self {
            width,
            height,
            value: vec![0.0; cells],
            scratch: vec![0.0; cells],
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

    fn index(&self, x: usize, y: usize) -> Option<usize> {
        (x < self.width && y < self.height).then(|| y * self.width + x)
    }

    /// The value at `(x, y)`, or `None` outside.
    #[must_use]
    pub fn get(&self, x: usize, y: usize) -> Option<f32> {
        self.value.get(self.index(x, y)?).copied()
    }

    /// Adds `amount` at `(x, y)`; `false` (nothing added) outside or for a
    /// negative or non-finite amount.
    pub fn deposit(&mut self, x: usize, y: usize, amount: f32) -> bool {
        if !(amount.is_finite() && amount >= 0.0) {
            return false;
        }
        let Some(v) = self.index(x, y).and_then(|i| self.value.get_mut(i)) else {
            return false;
        };
        *v += amount;
        true
    }

    /// Every value, row-major (rendering).
    #[must_use]
    pub fn values(&self) -> &[f32] {
        &self.value
    }

    /// The sum of every value, in `f64` (accounting).
    #[must_use]
    pub fn total(&self) -> f64 {
        self.value.iter().map(|&v| f64::from(v)).sum()
    }

    /// Diffusion that conserves mass: every open cell keeps `1 − d` of its
    /// value and gives `d`, split equally among its open neighbours (of
    /// eight; `open[i]` false is a wall, and walls give and take
    /// nothing). A cell with no open neighbour keeps everything. `open`
    /// must be one flag per cell; `d` is clamped to `[0, 1]`.
    pub fn diffuse(&mut self, open: &[bool], d: f32) {
        let d = if d.is_finite() {
            d.clamp(0.0, 1.0)
        } else {
            0.0
        };
        let (w, h) = (self.width, self.height);
        let is_open = |x: usize, y: usize| open.get(y * w + x).copied().unwrap_or(false);
        self.scratch.fill(0.0);
        for y in 0..h {
            for x in 0..w {
                let i = y * w + x;
                let v = self.value.get(i).copied().unwrap_or(0.0);
                if v == 0.0 || !is_open(x, y) {
                    continue;
                }
                let (x0, x1, y0, y1) = (
                    x.saturating_sub(1),
                    (x + 1).min(w - 1),
                    y.saturating_sub(1),
                    (y + 1).min(h - 1),
                );
                let k = (y0..=y1)
                    .flat_map(|ny| (x0..=x1).map(move |nx| (nx, ny)))
                    .filter(|&(nx, ny)| (nx, ny) != (x, y) && is_open(nx, ny))
                    .count();
                if k == 0 {
                    if let Some(s) = self.scratch.get_mut(i) {
                        *s += v;
                    }
                    continue;
                }
                let give = v * d;
                #[expect(clippy::cast_precision_loss, reason = "k is 1 to 8")]
                let share = give / k as f32;
                if let Some(s) = self.scratch.get_mut(i) {
                    *s += v - give;
                }
                for ny in y0..=y1 {
                    for nx in x0..=x1 {
                        if (nx, ny) != (x, y)
                            && is_open(nx, ny)
                            && let Some(s) = self.scratch.get_mut(ny * w + nx)
                        {
                            *s += share;
                        }
                    }
                }
            }
        }
        core::mem::swap(&mut self.value, &mut self.scratch);
    }

    /// Every value times `1 − e` (`e` clamped to `[0, 1]`).
    pub fn decay(&mut self, e: f32) {
        let keep = 1.0
            - if e.is_finite() {
                e.clamp(0.0, 1.0)
            } else {
                0.0
            };
        for v in &mut self.value {
            *v *= keep;
        }
    }

    /// Sets every value to zero.
    pub fn clear(&mut self) {
        self.value.fill(0.0);
    }
}

#[cfg(test)]
mod tests;
