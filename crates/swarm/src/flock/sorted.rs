//! [`Neighbours::Sorted`](super::Neighbours::Sorted): the cell list, with
//! the boids moved into cell order.

use super::Flock;
use crate::rules::{Ranges, SORTED_LANES, Seen, finish};

impl Flock {
    /// Every boid's next state into `next`, its candidates the 3 × 3
    /// cells around it, as in [`Self::step_grid`], but with the boids
    /// themselves moved into cell order first: cell c's boids become
    /// slots `cell_start[c]..cell_start[c + 1]`, so a block's candidates are three
    /// contiguous runs of the arrays, read whole by the branchless lane
    /// loop (`Seen::add_span`, vector instructions). The default, and the
    /// fastest. Boids' indices change every step.
    // Not inlined into `Flock::step`: its own function in profiles and
    // listings (once a step: free; see `step_grid`).
    #[inline(never)]
    pub(super) fn step_sorted(&mut self) {
        let (params, arena, predator) = (&self.params, self.arena, self.predator);
        let grid = &mut self.grid;
        grid.rebuild(
            arena.width(),
            arena.height(),
            params.visual_range,
            &self.now.x,
            &self.now.y,
        );
        // Into cell order: gathered into `next`, which then becomes `now`.
        self.next.gather(&self.now, grid.order());
        core::mem::swap(&mut self.now, &mut self.next);
        let (now, ranges) = (&self.now, Ranges::of(params));
        for index in 0..now.len() {
            let Some(me) = now.get(index) else { continue };
            let mut seen = Seen::default();
            let flock = [
                now.x.as_slice(),
                now.y.as_slice(),
                now.vx.as_slice(),
                now.vy.as_slice(),
            ];
            seen.add_spans::<SORTED_LANES>(ranges, me, flock, grid.spans_around(me.x, me.y));
            self.next
                .set(index, finish(params, arena, predator, me, &seen));
        }
    }
}
