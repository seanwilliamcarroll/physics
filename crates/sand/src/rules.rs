//! One step of the automaton (`docs/11-falling-sand.md`, "The rules" and
//! "Order"): bottom-up, alternating direction each row and each step, each
//! moving material's rule tried in order, a move a swap of two cells.

use crate::grid::{CHUNK_SIDE, Grid};
use crate::material::{Material, cell, material, shade};
use crate::random::{Purpose, draw};

/// How far water (and steam) looks sideways in one step, in cells.
pub const DISPERSION: usize = 3;
/// Lava flows on one step in this many: visibly slower than water.
pub(crate) const LAVA_FLOW_ONE_IN: u64 = 2;
/// Blocked steam condenses back to water with a chance of 1 in this many a
/// step: a cloud lingers about a second at 60 Hz.
pub(crate) const CONDENSE_ONE_IN: u64 = 64;

/// A cell's coordinates.
type Position = (usize, usize);

impl Grid {
    /// Advances one step; returns how many moves were made (0: the grid is
    /// settled).
    pub fn step(&mut self) -> usize {
        self.moved.fill(0);
        let (width, height) = (self.width(), self.height());
        let mut moves = 0;
        let chunks_across = width.div_ceil(CHUNK_SIDE);
        for y in (0..height).rev() {
            let left_to_right = y.is_multiple_of(2) == self.steps_taken.is_multiple_of(2);
            for chunk_number in 0..chunks_across {
                // Chunk by chunk in the row's direction, skipping a sleeping
                // chunk's cells at once. Awake is read on reaching the
                // chunk, so one woken earlier in this row still counts: the
                // order is the same as cell by cell.
                let chunk_x = if left_to_right {
                    chunk_number
                } else {
                    chunks_across - 1 - chunk_number
                };
                if !self.chunks.awake(chunk_x * CHUNK_SIDE, y) {
                    continue;
                }
                let first_x = chunk_x * CHUNK_SIDE;
                let end_x = ((chunk_x + 1) * CHUNK_SIDE).min(width);
                #[cfg(test)]
                {
                    self.visited += end_x - first_x;
                }
                for offset in 0..end_x - first_x {
                    let x = if left_to_right {
                        first_x + offset
                    } else {
                        end_x - 1 - offset
                    };
                    self.update_cell(x, y, &mut moves);
                }
            }
        }
        self.chunks.advance();
        self.steps_taken += 1;
        moves
    }

    /// Updates `(x, y)` unless something already moved there this step.
    fn update_cell(&mut self, x: usize, y: usize, moves: &mut usize) {
        if self.is_moved(x, y) {
            return;
        }
        let here = self.material_at(x, y);
        // Empty (most cells) leaves on a predictable branch before the
        // match below, which compiles to a jump table whose indirect jump
        // mispredicts.
        if here == Material::Empty {
            return;
        }
        let target = match here {
            Material::Sand => self.sand_target(x, y),
            Material::Water => self.water_target(x, y),
            Material::Lava => {
                if self.react(x, y) {
                    *moves += 1;
                    return;
                }
                let target = self.lava_target(x, y);
                if target.is_some() && !self.chance(x, y, Purpose::Flow, LAVA_FLOW_ONE_IN) {
                    // It could flow but waits: it isn't still, so its chunk
                    // must stay awake.
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
        if let Some(destination) = target {
            self.swap((x, y), destination);
            *moves += 1;
        }
    }

    /// Lava touching water: the lava becomes stone and the water steam, the
    /// first water found below, left, right, above. `false` if none.
    fn react(&mut self, x: usize, y: usize) -> bool {
        let around = [
            Some((x, y + 1)),
            x.checked_sub(1).map(|left| (left, y)),
            Some((x + 1, y)),
            y.checked_sub(1).map(|up| (x, up)),
        ];
        let Some((water_x, water_y)) =
            around
                .into_iter()
                .flatten()
                .find(|&(neighbour_x, neighbour_y)| {
                    self.at(neighbour_x, neighbour_y) == Some(Material::Water)
                })
        else {
            return false;
        };
        self.transmute(x, y, Material::Stone);
        self.transmute(water_x, water_y, Material::Steam);
        true
    }

    /// Lava: down into empty; else diagonally down; else one cell sideways.
    fn lava_target(&self, x: usize, y: usize) -> Option<Position> {
        let empty = |found: Material| found == Material::Empty;
        let below = y + 1;
        if self.at(x, below).is_some_and(empty) {
            return Some((x, below));
        }
        let sides = self.sides(x, y);
        sides
            .into_iter()
            .flatten()
            .find_map(|side_x| {
                (self.at(side_x, below).is_some_and(empty) && self.at(side_x, y).is_some_and(empty))
                    .then_some((side_x, below))
            })
            .or_else(|| {
                sides
                    .into_iter()
                    .flatten()
                    .find(|&side_x| self.at(side_x, y).is_some_and(empty))
                    .map(|side_x| (side_x, y))
            })
    }

    /// Steam, upside down: up into empty or through water; else diagonally
    /// up; else sideways as water does.
    fn steam_target(&self, x: usize, y: usize) -> Option<Position> {
        let empty = |found: Material| found == Material::Empty;
        let above = y.checked_sub(1)?;
        if self
            .at(x, above)
            .is_some_and(|found| matches!(found, Material::Empty | Material::Water))
        {
            return Some((x, above));
        }
        self.sides(x, y)
            .into_iter()
            .flatten()
            .find_map(|side_x| {
                (self.at(side_x, above).is_some_and(empty) && self.at(side_x, y).is_some_and(empty))
                    .then_some((side_x, above))
            })
            .or_else(|| self.sideways(x, y))
    }

    /// Whether this cell's draw for `purpose` comes up 1 in `one_in`.
    fn chance(&self, x: usize, y: usize, purpose: Purpose, one_in: u64) -> bool {
        draw(self.seed, self.steps_taken, x, y, purpose).is_multiple_of(one_in)
    }

    /// Changes the material at `(x, y)` in place, keeping its shade, as a
    /// move: marked, its neighbourhood woken.
    fn transmute(&mut self, x: usize, y: usize, to: Material) {
        if let Some(index) = self.index(x, y)
            && let Some(cell_byte) = self.cells.get_mut(index)
        {
            *cell_byte = cell(to, shade(*cell_byte));
            self.mark_moved(index);
            self.chunks.wake(x, y);
        }
    }

    /// Sand: down into empty or water; else diagonally down, sides in a
    /// random order, each needing the side cell passable too.
    fn sand_target(&self, x: usize, y: usize) -> Option<Position> {
        let passable = |found: Material| matches!(found, Material::Empty | Material::Water);
        let below = y + 1;
        if self.at(x, below).is_some_and(passable) {
            return Some((x, below));
        }
        self.sides(x, y).into_iter().flatten().find_map(|side_x| {
            (self.at(side_x, below).is_some_and(passable)
                && self.at(side_x, y).is_some_and(passable))
            .then_some((side_x, below))
        })
    }

    /// Water: down into empty; else diagonally down; else sideways, up to
    /// [`DISPERSION`] cells, as far as it's empty, sides in a random order.
    fn water_target(&self, x: usize, y: usize) -> Option<Position> {
        let empty = |found: Material| found == Material::Empty;
        let below = y + 1;
        if self.at(x, below).is_some_and(empty) {
            return Some((x, below));
        }
        let sides = self.sides(x, y);
        let diagonal = sides.into_iter().flatten().find_map(|side_x| {
            (self.at(side_x, below).is_some_and(empty) && self.at(side_x, y).is_some_and(empty))
                .then_some((side_x, below))
        });
        if diagonal.is_some() {
            return diagonal;
        }
        self.sideways(x, y)
    }

    /// Up to [`DISPERSION`] cells sideways, as far as it's empty, sides in a
    /// random order (water and steam).
    fn sideways(&self, x: usize, y: usize) -> Option<Position> {
        let right_first = self.coin(x, y);
        for right in [right_first, !right_first] {
            let mut furthest = None;
            for distance in 1..=DISPERSION {
                let side_x = if right {
                    x.checked_add(distance)
                } else {
                    x.checked_sub(distance)
                };
                match side_x.and_then(|side_x| self.at(side_x, y)) {
                    Some(Material::Empty) => furthest = side_x,
                    _ => break,
                }
            }
            if let Some(side_x) = furthest {
                return Some((side_x, y));
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
        draw(self.seed, self.steps_taken, x, y, Purpose::Side) & 1 == 1
    }

    /// The material at `(x, y)`, `None` outside (solid).
    fn at(&self, x: usize, y: usize) -> Option<Material> {
        self.get(x, y)
    }

    /// The material at `(x, y)`, stone outside.
    fn material_at(&self, x: usize, y: usize) -> Material {
        self.index(x, y)
            .and_then(|index| self.cells.get(index))
            .map_or(Material::Stone, |&cell_byte| material(cell_byte))
    }

    fn is_moved(&self, x: usize, y: usize) -> bool {
        self.index(x, y)
            .and_then(|index| {
                self.moved
                    .get(index / 64)
                    .map(|word| word >> (index % 64) & 1 == 1)
            })
            .unwrap_or(false)
    }

    fn mark_moved(&mut self, index: usize) {
        if let Some(word) = self.moved.get_mut(index / 64) {
            *word |= 1 << (index % 64);
        }
    }

    /// Swaps two cells and marks both moved.
    fn swap(&mut self, from: Position, to: Position) {
        if let (Some(from_index), Some(to_index)) =
            (self.index(from.0, from.1), self.index(to.0, to.1))
        {
            self.cells.swap(from_index, to_index);
            self.mark_moved(from_index);
            self.mark_moved(to_index);
            self.chunks.wake(from.0, from.1);
            self.chunks.wake(to.0, to.1);
        }
    }
}
