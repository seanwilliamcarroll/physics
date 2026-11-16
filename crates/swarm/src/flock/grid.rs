//! [`Neighbours::Grid`](super::Neighbours::Grid): a cell list, the boids
//! where they are.

use super::Flock;
use crate::rules::steer;

impl Flock {
    /// Every boid's next state into `next`, its candidates the boids in
    /// the 3 × 3 cells around it: the grid (`crate::grid`, a counting sort
    /// by cell, cells at least the visual range wide) is rebuilt from the
    /// current positions, and each boid's candidates are read through its
    /// index, one at a time, by the scalar rules (`steer`).
    pub(super) fn step_grid(&mut self) {
        let (cur, p, arena, predator) = (&self.cur, &self.params, self.arena, self.predator);
        let grid = &mut self.grid;
        grid.rebuild(
            arena.width(),
            arena.height(),
            p.visual_range,
            &cur.x,
            &cur.y,
        );
        for i in 0..cur.len() {
            let Some(me) = cur.get(i) else { continue };
            let others = grid
                .around(me.x, me.y)
                .filter(|&j| j != i)
                .filter_map(|j| cur.get(j));
            self.next.set(i, steer(p, arena, predator, me, others));
        }
    }
}
