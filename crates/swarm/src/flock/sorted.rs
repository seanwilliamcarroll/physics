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
            for span in grid.spans_around(me.x, me.y) {
                let (x, y, vx, vy) = (
                    cur.x.get(span.clone()).unwrap_or_default(),
                    cur.y.get(span.clone()).unwrap_or_default(),
                    cur.vx.get(span.clone()).unwrap_or_default(),
                    cur.vy.get(span).unwrap_or_default(),
                );
                seen.add_span::<SORTED_LANES>(ranges, me, x, y, vx, vy);
            }
            self.next.set(i, finish(p, arena, predator, me, &seen));
        }
    }
}
