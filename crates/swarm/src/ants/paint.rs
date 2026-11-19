//! Painting the world: food, walls and erasing, each over a disc of cells
//! (`Colony::paint_food` and the rest, the page's brushes).

use math::convert::{f64_to_usize, usize_to_f64};

use super::Colony;

impl Colony {
    pub(super) fn disc(&self, x: f32, y: f32, radius: f32) -> Vec<usize> {
        // Clip the box first, then step whole cells: an f64 stepped by 1.0 from a huge
        // coordinate never advances (a hang).
        let (reach, width, height) = (f64::from(radius.max(0.0)), self.width, self.height);
        let (x, y) = (f64::from(x), f64::from(y));
        let clipped_span = |first: f64, last: f64, cell_count: usize| -> Option<(usize, usize)> {
            let last_cell = usize_to_f64(cell_count) - 1.0;
            if !(first.is_finite() && last.is_finite()) || last < 0.0 || first > last_cell {
                return None;
            }
            Some((
                f64_to_usize(first.max(0.0))?,
                f64_to_usize(last.min(last_cell))?,
            ))
        };
        let (Some((first_x, last_x)), Some((first_y, last_y))) = (
            clipped_span((x - reach).floor(), (x + reach).ceil(), width),
            clipped_span((y - reach).floor(), (y + reach).ceil(), height),
        ) else {
            return Vec::new();
        };
        let mut cells = Vec::new();
        for cell_y in first_y..=last_y {
            for cell_x in first_x..=last_x {
                let (dx, dy) = (
                    usize_to_f64(cell_x) + 0.5 - x,
                    usize_to_f64(cell_y) + 0.5 - y,
                );
                if dx * dx + dy * dy <= reach * reach + 0.5 {
                    cells.push(cell_y * width + cell_x);
                }
            }
        }
        cells
    }

    pub fn paint_food(&mut self, x: f32, y: f32, radius: f32, amount: u16) -> u64 {
        let mut added = 0_u64;
        for cell in self.disc(x, y, radius) {
            if self.open.get(cell).copied().unwrap_or(false)
                && let Some(food) = self.food.get_mut(cell)
            {
                let new_food = food.saturating_add(amount);
                added += u64::from(new_food - *food);
                *food = new_food;
            }
        }
        self.painted += i64::try_from(added).unwrap_or(i64::MAX);
        added
    }

    /// Makes a disc of cells walls (removing their food and pheromone);
    /// returns the cells changed.
    pub fn paint_wall(&mut self, x: f32, y: f32, radius: f32) -> usize {
        let mut changed = 0;
        for cell in self.disc(x, y, radius) {
            if let Some(open) = self.open.get_mut(cell)
                && *open
            {
                *open = false;
                changed += 1;
            }
            self.remove_food(cell);
        }
        self.clear_walls_from_fields();
        self.recount();
        changed
    }

    /// Opens a disc of cells and removes their food; returns the cells
    /// that were walls or held food.
    pub fn erase(&mut self, x: f32, y: f32, radius: f32) -> usize {
        let mut changed = 0;
        for cell in self.disc(x, y, radius) {
            let was_wall = self.open.get(cell).is_some_and(|open| !open);
            if let Some(open) = self.open.get_mut(cell) {
                *open = true;
            }
            changed += usize::from(was_wall || self.remove_food(cell) > 0);
        }
        self.recount();
        changed
    }

    fn remove_food(&mut self, cell: usize) -> u16 {
        let Some(food) = self.food.get_mut(cell) else {
            return 0;
        };
        let had = *food;
        *food = 0;
        self.painted -= i64::from(had);
        had
    }

    /// Pheromone under a wall is removed (walls hold nothing).
    fn clear_walls_from_fields(&mut self) {
        let walls: Vec<usize> = self
            .open
            .iter()
            .enumerate()
            .filter(|&(_, &open)| !open)
            .map(|(cell, _)| cell)
            .collect();
        for field in [&mut self.home_field, &mut self.food_field] {
            for &cell in &walls {
                field.zero(cell);
            }
        }
    }
}
