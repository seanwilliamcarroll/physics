//! Painting the world: food, walls and erasing, each over a disc of cells
//! (`Colony::paint_food` and the rest, the page's brushes).

use math::convert::{f64_to_usize, usize_to_f64};

use super::Colony;

impl Colony {
    /// Cells of the disc of `radius` at `(x, y)`, clipped to the world.
    pub(super) fn disc(&self, x: f32, y: f32, radius: f32) -> Vec<usize> {
        // The bounding box clipped to the world first, then whole cells:
        // stepping an f64 by 1.0 from a huge coordinate never advanced
        // (found by the exports' call-sequence property test: a hang).
        let (r, w, h) = (f64::from(radius.max(0.0)), self.width, self.height);
        let (x, y) = (f64::from(x), f64::from(y));
        let span = |lo: f64, hi: f64, n: usize| -> Option<(usize, usize)> {
            let top = usize_to_f64(n) - 1.0;
            if !(lo.is_finite() && hi.is_finite()) || hi < 0.0 || lo > top {
                return None;
            }
            Some((f64_to_usize(lo.max(0.0))?, f64_to_usize(hi.min(top))?))
        };
        let (Some((x0, x1)), Some((y0, y1))) = (
            span((x - r).floor(), (x + r).ceil(), w),
            span((y - r).floor(), (y + r).ceil(), h),
        ) else {
            return Vec::new();
        };
        let mut out = Vec::new();
        for cy in y0..=y1 {
            for cx in x0..=x1 {
                let (dx, dy) = (usize_to_f64(cx) + 0.5 - x, usize_to_f64(cy) + 0.5 - y);
                if dx * dx + dy * dy <= r * r + 0.5 {
                    out.push(cy * w + cx);
                }
            }
        }
        out
    }

    /// Adds `amount` food to every open cell of a disc (saturating at
    /// `u16::MAX`); returns the units added.
    pub fn paint_food(&mut self, x: f32, y: f32, radius: f32, amount: u16) -> u64 {
        let mut added = 0_u64;
        for i in self.disc(x, y, radius) {
            if self.open.get(i).copied().unwrap_or(false)
                && let Some(f) = self.food.get_mut(i)
            {
                let new = f.saturating_add(amount);
                added += u64::from(new - *f);
                *f = new;
            }
        }
        self.painted += i64::try_from(added).unwrap_or(i64::MAX);
        added
    }

    /// Makes a disc of cells walls (removing their food and pheromone);
    /// returns the cells changed.
    pub fn paint_wall(&mut self, x: f32, y: f32, radius: f32) -> usize {
        let mut changed = 0;
        for i in self.disc(x, y, radius) {
            if let Some(o) = self.open.get_mut(i)
                && *o
            {
                *o = false;
                changed += 1;
            }
            self.remove_food(i);
        }
        self.clear_walls_from_fields();
        self.recount();
        changed
    }

    /// Opens a disc of cells and removes their food; returns the cells
    /// that were walls or held food.
    pub fn erase(&mut self, x: f32, y: f32, radius: f32) -> usize {
        let mut changed = 0;
        for i in self.disc(x, y, radius) {
            let was_wall = self.open.get(i).is_some_and(|o| !o);
            if let Some(o) = self.open.get_mut(i) {
                *o = true;
            }
            changed += usize::from(was_wall || self.remove_food(i) > 0);
        }
        self.recount();
        changed
    }

    fn remove_food(&mut self, i: usize) -> u16 {
        let Some(f) = self.food.get_mut(i) else {
            return 0;
        };
        let had = *f;
        *f = 0;
        self.painted -= i64::from(had);
        had
    }

    fn clear_walls_from_fields(&mut self) {
        // Pheromone under a new wall is removed (walls hold nothing).
        let walls: Vec<usize> = self
            .open
            .iter()
            .enumerate()
            .filter(|&(_, &o)| !o)
            .map(|(i, _)| i)
            .collect();
        for field in [&mut self.home_field, &mut self.food_field] {
            for &i in &walls {
                field.zero(i);
            }
        }
    }
}
