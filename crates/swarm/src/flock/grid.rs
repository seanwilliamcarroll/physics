//! [`Neighbours::Grid`](super::Neighbours::Grid): a cell list, the boids
//! where they are.

use super::Flock;
use crate::rules::steer;

impl Flock {
    /// Every boid's next state into `next`, its candidates the boids in
    /// the 3 × 3 cells around it: the grid (`crate::grid`, a counting sort
    /// by cell, cells at least the visual range wide) is rebuilt from the
    /// current positions, and each boid's candidates are read through its
    /// index, one at a time, by the scalar rules (`steer`), without
    /// branches (`Seen::add_masked`: in a big flock the branch was hard to
    /// predict; 37% faster at 100,000 on the M4). Copying the candidates
    /// into one run for the lane loop instead was slower (+27%): the copy
    /// cost more than the vector arithmetic saved.
    // Not inlined into `Flock::step` (called once a step: free). Inlined
    // with the other two searches, the one large function compiled worse
    // in V8 on x86: Grid 49–51% slower on Zen 5 (83.7 ms at 100,000 against
    // 42.5), the same on the M4 (`experiments/swarm-mask/README.md`).
    #[inline(never)]
    pub(super) fn step_grid(&mut self) {
        let (now, params, arena, predator) = (&self.now, &self.params, self.arena, self.predator);
        let grid = &mut self.grid;
        grid.rebuild(
            arena.width(),
            arena.height(),
            params.visual_range,
            &now.x,
            &now.y,
        );
        for index in 0..now.len() {
            let Some(me) = now.get(index) else { continue };
            let others = grid
                .around(me.x, me.y)
                .filter(|&other| other != index)
                .filter_map(|other| now.get(other));
            self.next
                .set(index, steer(params, arena, predator, me, others));
        }
    }
}
