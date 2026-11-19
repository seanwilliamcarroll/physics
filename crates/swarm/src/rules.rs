//! One boid's update from the boids it might see (`docs/15-swarm.md`,
//! "The model"): ECE 4760's pseudocode, in its order.

use crate::{Arena, Boid, Params};
use knobs::Mask;

/// `me` one step on, given `others`: every boid that might be within the
/// visual range (more is fine: each is checked). Separation from those
/// inside the protected range; cohesion and alignment toward the rest in
/// range; edge turning; the speed clamp; then the move.
pub(crate) fn steer(
    params: &Params,
    arena: Arena,
    predator: Option<(f32, f32)>,
    me: Boid,
    others: impl Iterator<Item = Boid>,
) -> Boid {
    let mut seen = Seen::default();
    let ranges = Ranges::of(params);
    for other in others {
        seen.add_masked(ranges, me, other);
    }
    finish(params, arena, predator, me, &seen)
}

/// The squared ranges every candidate is checked against.
#[derive(Copy, Clone)]
pub(crate) struct Ranges {
    protected_sq: f32,
    visual_sq: f32,
}

impl Ranges {
    pub(crate) fn of(params: &Params) -> Self {
        Self {
            protected_sq: params.protected_range * params.protected_range,
            visual_sq: params.visual_range * params.visual_range,
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
    /// (The source's `|dx|, |dy| < range` pre-check is implied by
    /// `distance² < range²`, so it's left out.)
    pub(crate) fn add(&mut self, ranges: Ranges, me: Boid, other: Boid) {
        let (dx, dy) = (me.x - other.x, me.y - other.y);
        let distance_sq = dx * dx + dy * dy;
        if distance_sq < ranges.protected_sq {
            self.close_dx += dx;
            self.close_dy += dy;
        } else if distance_sq < ranges.visual_sq && distance_sq > 0.0 {
            self.sum_x += other.x;
            self.sum_y += other.y;
            self.sum_vx += other.vx;
            self.sum_vy += other.vy;
            self.count += 1.0;
        }
    }

    /// [`Self::add`] without branches: both terms, each times a 0/1 mask
    /// (as the lane loop does it, one candidate at a time). The same values
    /// (adding a masked-out 0 changes no sum; tested); faster where the
    /// branch is hard to predict, as in a big flock's candidates: the
    /// grid's step (`steer`) at 100,000 boids is 18–37% faster natively on
    /// the M4 and Zen 5. Slower where it's easy (a small flock's), so
    /// sorted's leftovers keep [`Self::add`]. The masks' form is the
    /// target's (`tuning::GRID_MASK`: natively a select, in wasm a
    /// converted integer, which V8 on x86 doesn't turn into branches).
    pub(crate) fn add_masked(&mut self, ranges: Ranges, me: Boid, other: Boid) {
        let (dx, dy) = (me.x - other.x, me.y - other.y);
        let distance_sq = dx * dx + dy * dy;
        let is_close = distance_sq < ranges.protected_sq;
        let is_near = distance_sq >= ranges.protected_sq
            && distance_sq < ranges.visual_sq
            && distance_sq > 0.0;
        // The target's form (`tuning.rs`), or the build setting's.
        let unit: fn(bool) -> f32 = match GRID_MASK {
            Mask::Convert => |condition| f32::from(u8::from(condition)),
            Mask::Select => |condition| if condition { 1.0 } else { 0.0 },
            Mask::Bits => {
                |condition| f32::from_bits(1.0_f32.to_bits() & u32::from(condition).wrapping_neg())
            }
            Mask::Value => {
                let pick = |condition: bool, value: f32| if condition { value } else { 0.0 };
                self.close_dx += pick(is_close, dx);
                self.close_dy += pick(is_close, dy);
                self.sum_x += pick(is_near, other.x);
                self.sum_y += pick(is_near, other.y);
                self.sum_vx += pick(is_near, other.vx);
                self.sum_vy += pick(is_near, other.vy);
                self.count += pick(is_near, 1.0);
                return;
            }
            Mask::Branch => return self.add(ranges, me, other),
        };
        let (close, near) = (unit(is_close), unit(is_near));
        self.close_dx += close * dx;
        self.close_dy += close * dy;
        self.sum_x += near * other.x;
        self.sum_y += near * other.y;
        self.sum_vx += near * other.vx;
        self.sum_vy += near * other.vy;
        self.count += near;
    }

    /// Candidates given as the same span of four arrays: whole blocks of
    /// `L` through the lane loop (`rules/lanes.rs`: without branches,
    /// into `L` partial sums; `L` per target and search, `tuning.rs`), the
    /// rest one at a time. The sums round differently from
    /// [`Self::add`]'s, as any order does.
    pub(crate) fn add_span<const L: usize>(
        &mut self,
        ranges: Ranges,
        me: Boid,
        x: &[f32],
        y: &[f32],
        vx: &[f32],
        vy: &[f32],
    ) {
        let (
            (blocks_x, leftover_x),
            (blocks_y, leftover_y),
            (blocks_vx, leftover_vx),
            (blocks_vy, leftover_vy),
        ) = (
            x.as_chunks::<L>(),
            y.as_chunks::<L>(),
            vx.as_chunks::<L>(),
            vy.as_chunks::<L>(),
        );
        lanes::add_blocks(self, ranges, me, blocks_x, blocks_y, blocks_vx, blocks_vy);
        for (((&x, &y), &vx), &vy) in leftover_x
            .iter()
            .zip(leftover_y)
            .zip(leftover_vx)
            .zip(leftover_vy)
        {
            self.add(ranges, me, Boid { x, y, vx, vy });
        }
    }

    /// Sorted's candidates: the `spans` of the whole flock's arrays (`x`
    /// and the rest, in cell order), each through the lane loop. How a
    /// span's edges go is the target's (`tuning.rs`) or the build's
    /// (`knobs.rs`: `SWARM_SPAN`, `SWARM_TAIL`); per span and scalar, as
    /// [`Self::add_span`] for each span.
    pub(crate) fn add_spans<const L: usize>(
        &mut self,
        ranges: Ranges,
        me: Boid,
        flock: [&[f32]; 4],
        spans: impl Iterator<Item = core::ops::Range<usize>>,
    ) {
        lanes::add_spans::<L>(self, ranges, me, flock, spans, (PER_BOID, TAIL));
    }
}

mod knobs;
mod lanes;
mod tuning;

pub(crate) use tuning::{BRUTE_LANES, GRID_MASK, SORTED_LANES, TRUNCATE_CELL};
use tuning::{PER_BOID, TAIL};

/// How close the predator must be to be fled, pixels (our choice: a
/// little over twice the visual range, so a flock parts ahead of it).
pub const PREDATOR_RANGE: f32 = 100.0;
/// How hard a boid flees: the fraction of the way to "away at top speed"
/// it steers each step (Reynolds 1999's flee, as a gain; our choice).
pub(crate) const FLEE: f32 = 0.1;

/// The rest of the update, from what `me` saw: cohesion and alignment,
/// separation, fleeing the predator, edge turning, the clamp, the move.
pub(crate) fn finish(
    params: &Params,
    arena: Arena,
    predator: Option<(f32, f32)>,
    me: Boid,
    seen: &Seen,
) -> Boid {
    let (mut vx, mut vy) = (me.vx, me.vy);
    if seen.count > 0.0 {
        let neighbour_count = seen.count;
        vx += (seen.sum_x / neighbour_count - me.x) * params.centering
            + (seen.sum_vx / neighbour_count - me.vx) * params.matching;
        vy += (seen.sum_y / neighbour_count - me.y) * params.centering
            + (seen.sum_vy / neighbour_count - me.vy) * params.matching;
    }
    vx += seen.close_dx * params.avoid;
    vy += seen.close_dy * params.avoid;
    // Flee (Reynolds 1999): steer toward "directly away at top speed".
    if let Some((predator_x, predator_y)) = predator {
        let (dx, dy) = (me.x - predator_x, me.y - predator_y);
        let distance = (dx * dx + dy * dy).sqrt();
        if distance < PREDATOR_RANGE && distance > 0.0 {
            vx += (dx / distance * params.max_speed - vx) * FLEE;
            vy += (dy / distance * params.max_speed - vy) * FLEE;
        }
    }
    // Edge turning: past the margin from a side, pushed back inside.
    if me.x < params.margin {
        vx += params.turn;
    }
    if me.x > arena.width() - params.margin {
        vx -= params.turn;
    }
    if me.y < params.margin {
        vy += params.turn;
    }
    if me.y > arena.height() - params.margin {
        vy -= params.turn;
    }
    let (vx, vy) = clamp_speed(params, (vx, vy), (me.vx, me.vy));
    Boid {
        x: me.x + vx,
        y: me.y + vy,
        vx,
        vy,
    }
}

/// `velocity` scaled into `[min, max]`. At speed exactly 0 (the step's
/// terms cancelled it) there's no direction to scale: `previous`'s is kept
/// (the source divides by the speed unguarded; `docs/15-swarm.md`).
fn clamp_speed(params: &Params, (vx, vy): (f32, f32), previous: (f32, f32)) -> (f32, f32) {
    let speed = (vx * vx + vy * vy).sqrt();
    if speed == 0.0 {
        let previous_speed = (previous.0 * previous.0 + previous.1 * previous.1).sqrt();
        return if previous_speed > 0.0 {
            (
                previous.0 / previous_speed * params.min_speed,
                previous.1 / previous_speed * params.min_speed,
            )
        } else {
            (params.min_speed, 0.0)
        };
    }
    if speed < params.min_speed {
        (vx / speed * params.min_speed, vy / speed * params.min_speed)
    } else if speed > params.max_speed {
        (vx / speed * params.max_speed, vy / speed * params.max_speed)
    } else {
        (vx, vy)
    }
}

#[cfg(test)]
mod tests;
