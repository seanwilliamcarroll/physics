//! [`Neighbours::Grid`](super::Neighbours::Grid): a cell list, the boids
//! where they are.

use super::Flock;
use crate::rules::steer;

impl Flock {
    /// Candidates are read through the grid's indices, one at a time, by
    /// the scalar rules, without branches (`Seen::add_masked`: 37% faster
    /// at 100,000 on the M4). Copying them into one run for the lane loop
    /// was slower (+27%).
    // Not inlined into `Flock::step`: inlined with the other two searches,
    // the one large function compiled worse in V8: Grid 49–51% slower on
    // Zen 5 (83.7 ms at 100,000 against 42.5), the same on the M4
    // (`experiments/swarm-mask/README.md`).
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
