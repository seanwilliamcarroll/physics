//! One boid's update from the boids it might see (`docs/15-swarm.md`,
//! "The model"): ECE 4760's pseudocode, in its order.

use crate::{Arena, Boid, Params};

/// `me` one step on, given `others`: every boid that might be within the
/// visual range (more is fine: each is checked). Separation from those
/// inside the protected range; cohesion and alignment toward the rest in
/// range; edge turning; the speed clamp; then the move.
pub(crate) fn steer(
    p: &Params,
    arena: Arena,
    predator: Option<(f32, f32)>,
    me: Boid,
    others: impl Iterator<Item = Boid>,
) -> Boid {
    let mut seen = Seen::default();
    let ranges = Ranges::of(p);
    for o in others {
        seen.add(ranges, me, o);
    }
    finish(p, arena, predator, me, &seen)
}

/// The squared ranges every candidate is checked against.
#[derive(Copy, Clone)]
pub(crate) struct Ranges {
    protected_sq: f32,
    visual_sq: f32,
}

impl Ranges {
    pub(crate) fn of(p: &Params) -> Self {
        Self {
            protected_sq: p.protected_range * p.protected_range,
            visual_sq: p.visual_range * p.visual_range,
        }
    }
}

/// What a boid saw: sums over its neighbours (cohesion, alignment) and
/// the offsets from boids crowding it (separation).
///
/// A candidate at distance 0 (the boid itself, or one exactly on top of
/// it) adds nothing: its offset is 0, and it isn't a neighbour. That
/// makes skipping the boid itself unnecessary, which the lane loop needs.
#[derive(Copy, Clone, Debug, Default, PartialEq)]
pub(crate) struct Seen {
    sum_x: f32,
    sum_y: f32,
    sum_vx: f32,
    sum_vy: f32,
    count: f32,
    close_dx: f32,
    close_dy: f32,
}

impl Seen {
    /// One candidate, as ECE 4760's pseudocode: inside the protected
    /// range it repels; otherwise, inside the visual range, it counts.
    /// (The source's `|dx|, |dy| < range` pre-check is implied by `d² <
    /// range²` in floats too: squaring is monotone, so it's an
    /// optimization, here left out.)
    pub(crate) fn add(&mut self, r: Ranges, me: Boid, o: Boid) {
        let (dx, dy) = (me.x - o.x, me.y - o.y);
        let d_sq = dx * dx + dy * dy;
        if d_sq < r.protected_sq {
            self.close_dx += dx;
            self.close_dy += dy;
        } else if d_sq < r.visual_sq && d_sq > 0.0 {
            self.sum_x += o.x;
            self.sum_y += o.y;
            self.sum_vx += o.vx;
            self.sum_vy += o.vy;
            self.count += 1.0;
        }
    }

    /// Candidates given as the same span of four arrays, without
    /// branches: each candidate's terms times 0 or 1, in [`LANES`]
    /// independent partial sums (so the loop can run as vector
    /// instructions; float addition isn't associative, so the compiler
    /// won't reorder one running sum into lanes by itself). The sums
    /// round differently from [`Self::add`]'s, as any order does.
    pub(crate) fn add_span(
        &mut self,
        r: Ranges,
        me: Boid,
        x: &[f32],
        y: &[f32],
        vx: &[f32],
        vy: &[f32],
    ) {
        let mut lanes = Lanes::default();
        let ((cx, rx), (cy, ry), (cvx, rvx), (cvy, rvy)) = (
            x.as_chunks::<LANES>(),
            y.as_chunks::<LANES>(),
            vx.as_chunks::<LANES>(),
            vy.as_chunks::<LANES>(),
        );
        for (((a, b), c), d) in cx.iter().zip(cy).zip(cvx).zip(cvy) {
            lanes.add(r, me, a, b, c, d);
        }
        lanes.into(self);
        for (((&x, &y), &vx), &vy) in rx.iter().zip(ry).zip(rvx).zip(rvy) {
            self.add(r, me, Boid { x, y, vx, vy });
        }
    }
}

/// Partial sums in the lane loop.
pub(crate) const LANES: usize = 8;

#[derive(Default)]
struct Lanes {
    sum_x: [f32; LANES],
    sum_y: [f32; LANES],
    sum_vx: [f32; LANES],
    sum_vy: [f32; LANES],
    count: [f32; LANES],
    close_dx: [f32; LANES],
    close_dy: [f32; LANES],
}

impl Lanes {
    fn add(
        &mut self,
        r: Ranges,
        me: Boid,
        x: &[f32; LANES],
        y: &[f32; LANES],
        vx: &[f32; LANES],
        vy: &[f32; LANES],
    ) {
        let sums = self
            .sum_x
            .iter_mut()
            .zip(&mut self.sum_y)
            .zip(&mut self.sum_vx)
            .zip(&mut self.sum_vy)
            .zip(&mut self.count)
            .zip(&mut self.close_dx)
            .zip(&mut self.close_dy);
        let others = x.iter().zip(y).zip(vx).zip(vy);
        for (((((((sx, sy), svx), svy), n), cdx), cdy), (((&ox, &oy), &ovx), &ovy)) in
            sums.zip(others)
        {
            let (dx, dy) = (me.x - ox, me.y - oy);
            let d_sq = dx * dx + dy * dy;
            let close = f32::from(u8::from(d_sq < r.protected_sq));
            let near = f32::from(u8::from(
                d_sq >= r.protected_sq && d_sq < r.visual_sq && d_sq > 0.0,
            ));
            *cdx += close * dx;
            *cdy += close * dy;
            *sx += near * ox;
            *sy += near * oy;
            *svx += near * ovx;
            *svy += near * ovy;
            *n += near;
        }
    }

    /// Adds the lanes, in order, into `seen`.
    fn into(self, seen: &mut Seen) {
        let total = |a: [f32; LANES]| a.iter().sum::<f32>();
        seen.sum_x += total(self.sum_x);
        seen.sum_y += total(self.sum_y);
        seen.sum_vx += total(self.sum_vx);
        seen.sum_vy += total(self.sum_vy);
        seen.count += total(self.count);
        seen.close_dx += total(self.close_dx);
        seen.close_dy += total(self.close_dy);
    }
}

/// How close the predator must be to be fled, pixels (our choice: a
/// little over twice the visual range, so a flock parts ahead of it).
pub const PREDATOR_RANGE: f32 = 100.0;
/// How hard a boid flees: the fraction of the way to "away at top speed"
/// it steers each step (Reynolds 1999's flee, as a gain; our choice).
pub const FLEE: f32 = 0.1;

/// The rest of the update, from what `me` saw: cohesion and alignment,
/// separation, fleeing the predator, edge turning, the clamp, the move.
pub(crate) fn finish(
    p: &Params,
    arena: Arena,
    predator: Option<(f32, f32)>,
    me: Boid,
    seen: &Seen,
) -> Boid {
    let (mut vx, mut vy) = (me.vx, me.vy);
    if seen.count > 0.0 {
        let n = seen.count;
        vx += (seen.sum_x / n - me.x) * p.centering + (seen.sum_vx / n - me.vx) * p.matching;
        vy += (seen.sum_y / n - me.y) * p.centering + (seen.sum_vy / n - me.vy) * p.matching;
    }
    vx += seen.close_dx * p.avoid;
    vy += seen.close_dy * p.avoid;
    // Flee (Reynolds 1999): steer toward "directly away at top speed".
    if let Some((px, py)) = predator {
        let (dx, dy) = (me.x - px, me.y - py);
        let d = (dx * dx + dy * dy).sqrt();
        if d < PREDATOR_RANGE && d > 0.0 {
            vx += (dx / d * p.max_speed - vx) * FLEE;
            vy += (dy / d * p.max_speed - vy) * FLEE;
        }
    }
    // Edge turning: past the margin from a side, pushed back inside.
    if me.x < p.margin {
        vx += p.turn;
    }
    if me.x > arena.width() - p.margin {
        vx -= p.turn;
    }
    if me.y < p.margin {
        vy += p.turn;
    }
    if me.y > arena.height() - p.margin {
        vy -= p.turn;
    }
    let (vx, vy) = clamp_speed(p, (vx, vy), (me.vx, me.vy));
    Boid {
        x: me.x + vx,
        y: me.y + vy,
        vx,
        vy,
    }
}

/// `v` scaled into `[min, max]`. At speed exactly 0 (the step's terms
/// cancelled it) there's no direction to scale: `before`'s is kept (the
/// source divides by the speed unguarded; `docs/15-swarm.md`).
fn clamp_speed(p: &Params, (vx, vy): (f32, f32), before: (f32, f32)) -> (f32, f32) {
    let speed = (vx * vx + vy * vy).sqrt();
    if speed == 0.0 {
        let s0 = (before.0 * before.0 + before.1 * before.1).sqrt();
        return if s0 > 0.0 {
            (before.0 / s0 * p.min_speed, before.1 / s0 * p.min_speed)
        } else {
            (p.min_speed, 0.0)
        };
    }
    if speed < p.min_speed {
        (vx / speed * p.min_speed, vy / speed * p.min_speed)
    } else if speed > p.max_speed {
        (vx / speed * p.max_speed, vy / speed * p.max_speed)
    } else {
        (vx, vy)
    }
}

#[cfg(test)]
mod tests;
