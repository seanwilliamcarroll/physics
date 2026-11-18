//! [`Neighbours::Sorted`](super::Neighbours::Sorted): the cell list, with
//! the boids moved into cell order.

use super::Flock;
use crate::rules::{Ranges, SORTED_LANES, Seen, finish};

impl Flock {
    /// Every boid's next state into `next`, its candidates the 3 × 3
    /// cells around it, as in [`Self::step_grid`], but with the boids
    /// themselves moved into cell order first: cell c's boids become
    /// slots `start[c]..start[c + 1]`, so a block's candidates are three
    /// contiguous runs of the arrays, read whole by the branchless lane
    /// loop (`Seen::add_span`, vector instructions). The default, and the
    /// fastest. Boids' indices change every step.
    // Not inlined into `Flock::step`: its own function in profiles and
    // listings (once a step: free; see `step_grid`).
    #[inline(never)]
    pub(super) fn step_sorted(&mut self) {
        let (p, arena, predator) = (&self.params, self.arena, self.predator);
        let grid = &mut self.grid;
        grid.rebuild(
            arena.width(),
            arena.height(),
            p.visual_range,
            &self.cur.x,
            &self.cur.y,
        );
        // Into cell order: gathered into `next`, which then becomes `cur`.
        self.next.gather(&self.cur, grid.order());
        core::mem::swap(&mut self.cur, &mut self.next);
        let (cur, ranges) = (&self.cur, Ranges::of(p));
        for i in 0..cur.len() {
            let Some(me) = cur.get(i) else { continue };
            let mut seen = Seen::default();
            let flock = [
                cur.x.as_slice(),
                cur.y.as_slice(),
                cur.vx.as_slice(),
                cur.vy.as_slice(),
            ];
            seen.add_spans::<SORTED_LANES>(ranges, me, flock, grid.spans_around(me.x, me.y));
            self.next.set(i, finish(p, arena, predator, me, &seen));
        }
    }
}
