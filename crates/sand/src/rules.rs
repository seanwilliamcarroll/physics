//! One step of the automaton (`docs/11-falling-sand.md`, "The rules" and
//! "Order"): bottom-up, alternating direction each row and each step, each
//! moving material's rule tried in order, a move a swap of two cells.

use crate::grid::{CHUNK, Grid};
use crate::material::{Material, cell, material, shade};
use crate::random::{Purpose, draw};

/// How far water (and steam) looks sideways in one step, cells (our choice:
/// measured on the level test, `tests/automaton.rs`).
pub const DISPERSION: usize = 3;
/// Lava flows on one step in this many (our choice: visibly slower than
/// water), and a cell sideways at most.
pub const LAVA_FLOW_ONE_IN: u64 = 2;
/// Blocked steam condenses back to water with this chance a step, 1 in
/// this many (our choice: a cloud lingers a second or so at 60 Hz).
pub const CONDENSE_ONE_IN: u64 = 64;

impl Grid {
    /// Advances one step; returns how many moves were made (0: nothing
    /// changed, the grid is settled).
    pub fn step(&mut self) -> usize {
        self.moved.fill(0);
        let (w, h) = (self.width(), self.height());
        let mut moves = 0;
        let across = w.div_ceil(CHUNK);
        for y in (0..h).rev() {
            // Left to right when y and the step have the same parity.
            let left_to_right = y.is_multiple_of(2) == self.step.is_multiple_of(2);
            for k in 0..across {
                // A row's scan goes chunk by chunk in its direction, a
                // sleeping chunk's 32 cells skipped at once; awake is read
                // on reaching the chunk, so one woken earlier in this row
                // still counts. The order is the same as cell by cell.
                let cx = if left_to_right { k } else { across - 1 - k };
                if !self.chunks.awake(cx * CHUNK, y) {
                    continue;
                }
                let (lo, hi) = (cx * CHUNK, ((cx + 1) * CHUNK).min(w));
                #[cfg(test)]
                {
                    self.visited += hi - lo;
                }
                for i in 0..hi - lo {
                    let x = if left_to_right { lo + i } else { hi - 1 - i };
                    self.update_cell(x, y, &mut moves);
                }
            }
        }
        self.chunks.advance();
        self.step += 1;
        moves
    }

    /// Updates `(x, y)` unless something already moved there this step.
    fn update_cell(&mut self, x: usize, y: usize, moves: &mut usize) {
        if self.is_moved(x, y) {
            return;
        }
        let target = match self.material_at(x, y) {
            Material::Sand => self.sand_target(x, y),
            Material::Water => self.water_target(x, y),
            Material::Lava => {
                if self.react(x, y) {
                    *moves += 1;
                    return;
                }
                let target = self.lava_target(x, y);
                if target.is_some() && !self.chance(x, y, Purpose::Flow, LAVA_FLOW_ONE_IN) {
                    // It could flow but waits: not still, so its chunk
                    // stays awake (`Chunks::keep`).
                    self.chunks.keep(x, y);
                    return;
                }
                target
            }
            Material::Steam => {
                let target = self.steam_target(x, y);
                if target.is_none() {
                    if self.chance(x, y, Purpose::Condense, CONDENSE_ONE_IN) {
                        self.transmute(x, y, Material::Water);
                        *moves += 1;
                    } else {
                        self.chunks.keep(x, y);
                    }
                    return;
                }
                target
            }
            Material::Empty | Material::Stone => None,
        };
        if let Some((tx, ty)) = target {
            self.swap((x, y), (tx, ty));
            *moves += 1;
        }
    }

    /// Lava touching water: the lava becomes stone and the water steam, the
    /// first water found below, left, right, above. `false` if none.
    fn react(&mut self, x: usize, y: usize) -> bool {
        let around = [
            Some((x, y + 1)),
            x.checked_sub(1).map(|l| (l, y)),
            Some((x + 1, y)),
            y.checked_sub(1).map(|u| (x, u)),
        ];
        let Some((wx, wy)) = around
            .into_iter()
            .flatten()
            .find(|&(nx, ny)| self.at(nx, ny) == Some(Material::Water))
        else {
            return false;
        };
        self.transmute(x, y, Material::Stone);
        self.transmute(wx, wy, Material::Steam);
        true
    }

    /// Lava: down into empty; else diagonally down; else one cell sideways.
    fn lava_target(&self, x: usize, y: usize) -> Option<(usize, usize)> {
        let empty = |m: Material| m == Material::Empty;
        let below = y + 1;
        if self.at(x, below).is_some_and(empty) {
            return Some((x, below));
        }
        let sides = self.sides(x, y);
        sides
            .into_iter()
            .flatten()
            .find_map(|sx| {
                (self.at(sx, below).is_some_and(empty) && self.at(sx, y).is_some_and(empty))
                    .then_some((sx, below))
            })
            .or_else(|| {
                sides
                    .into_iter()
                    .flatten()
                    .find(|&sx| self.at(sx, y).is_some_and(empty))
                    .map(|sx| (sx, y))
            })
    }

    /// Steam, upside down: up into empty or through water; else diagonally
    /// up; else sideways as water does.
    fn steam_target(&self, x: usize, y: usize) -> Option<(usize, usize)> {
        let empty = |m: Material| m == Material::Empty;
        let above = y.checked_sub(1)?;
        if self
            .at(x, above)
            .is_some_and(|m| matches!(m, Material::Empty | Material::Water))
        {
            return Some((x, above));
        }
        self.sides(x, y)
            .into_iter()
            .flatten()
            .find_map(|sx| {
                (self.at(sx, above).is_some_and(empty) && self.at(sx, y).is_some_and(empty))
                    .then_some((sx, above))
            })
            .or_else(|| self.sideways(x, y))
    }

    /// Whether this cell's draw for `purpose` comes up 1 in `one_in`.
    fn chance(&self, x: usize, y: usize, purpose: Purpose, one_in: u64) -> bool {
        draw(self.seed, self.step, x, y, purpose).is_multiple_of(one_in)
    }

    /// Changes the material at `(x, y)` in place, keeping its shade, as a
    /// move: marked, its neighbourhood woken.
    fn transmute(&mut self, x: usize, y: usize, to: Material) {
        if let Some(i) = self.index(x, y)
            && let Some(c) = self.cells.get_mut(i)
        {
            *c = cell(to, shade(*c));
            self.mark_moved(i);
            self.chunks.wake(x, y);
        }
    }

    /// Sand: down into empty or water; else diagonally down, sides in a
    /// random order, each needing the side cell passable too.
    fn sand_target(&self, x: usize, y: usize) -> Option<(usize, usize)> {
        let passes = |m: Material| matches!(m, Material::Empty | Material::Water);
        let below = y + 1;
        if self.at(x, below).is_some_and(passes) {
            return Some((x, below));
        }
        self.sides(x, y).into_iter().flatten().find_map(|sx| {
            (self.at(sx, below).is_some_and(passes) && self.at(sx, y).is_some_and(passes))
                .then_some((sx, below))
        })
    }

    /// Water: down into empty; else diagonally down; else sideways, up to
    /// [`DISPERSION`] cells, as far as it's empty, sides in a random order.
    fn water_target(&self, x: usize, y: usize) -> Option<(usize, usize)> {
        let empty = |m: Material| m == Material::Empty;
        let below = y + 1;
        if self.at(x, below).is_some_and(empty) {
            return Some((x, below));
        }
        let sides = self.sides(x, y);
        if let Some(t) = sides.into_iter().flatten().find_map(|sx| {
            (self.at(sx, below).is_some_and(empty) && self.at(sx, y).is_some_and(empty))
                .then_some((sx, below))
        }) {
            return Some(t);
        }
        self.sideways(x, y)
    }

    /// Up to [`DISPERSION`] cells sideways, as far as it's empty, sides in a
    /// random order (water and steam).
    fn sideways(&self, x: usize, y: usize) -> Option<(usize, usize)> {
        let first_right = self.coin(x, y);
        for right in [first_right, !first_right] {
            let mut furthest = None;
            for d in 1..=DISPERSION {
                let sx = if right {
                    x.checked_add(d)
                } else {
                    x.checked_sub(d)
                };
                match sx.and_then(|sx| self.at(sx, y)) {
                    Some(Material::Empty) => furthest = sx,
                    _ => break,
                }
            }
            if let Some(sx) = furthest {
                return Some((sx, y));
            }
        }
        None
    }

    /// The two side columns, in this cell's random order (`None` past an
    /// edge).
    fn sides(&self, x: usize, y: usize) -> [Option<usize>; 2] {
        let (left, right) = (x.checked_sub(1), x.checked_add(1));
        if self.coin(x, y) {
            [right, left]
        } else {
            [left, right]
        }
    }

    /// This cell's coin for this step.
    fn coin(&self, x: usize, y: usize) -> bool {
        draw(self.seed, self.step, x, y, Purpose::Side) & 1 == 1
    }

    /// The material at `(x, y)`, `None` outside (solid).
    fn at(&self, x: usize, y: usize) -> Option<Material> {
        self.get(x, y)
    }

    fn material_at(&self, x: usize, y: usize) -> Material {
        self.index(x, y)
            .and_then(|i| self.cells.get(i))
            .map_or(Material::Stone, |&c| material(c))
    }

    fn is_moved(&self, x: usize, y: usize) -> bool {
        self.index(x, y)
            .and_then(|i| self.moved.get(i / 64).map(|w| w >> (i % 64) & 1 == 1))
            .unwrap_or(false)
    }

    fn mark_moved(&mut self, i: usize) {
        if let Some(w) = self.moved.get_mut(i / 64) {
            *w |= 1 << (i % 64);
        }
    }

    /// Swaps two cells and marks both moved.
    fn swap(&mut self, a: (usize, usize), b: (usize, usize)) {
        if let (Some(i), Some(j)) = (self.index(a.0, a.1), self.index(b.0, b.1)) {
            self.cells.swap(i, j);
            self.mark_moved(i);
            self.mark_moved(j);
            self.chunks.wake(a.0, a.1);
            self.chunks.wake(b.0, b.1);
        }
    }
}
