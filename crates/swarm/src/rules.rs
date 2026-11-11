//! One boid's update from the boids it might see (`docs/15-swarm.md`,
//! "The model"): ECE 4760's pseudocode, in its order.

use crate::{Arena, Boid, Params};

/// `me` one step on, given `others`: every boid that might be within the
/// visual range (more is fine: each is checked; `me` itself must not be
/// among them). Separation from those inside the protected range;
/// cohesion and alignment toward the rest in range; edge turning; the
/// speed clamp; then the move.
pub(crate) fn steer(
    p: &Params,
    arena: Arena,
    me: Boid,
    others: impl Iterator<Item = Boid>,
) -> Boid {
    let (visual_sq, protected_sq) = (
        p.visual_range * p.visual_range,
        p.protected_range * p.protected_range,
    );
    let (mut sum_x, mut sum_y, mut sum_vx, mut sum_vy, mut count) = (0.0, 0.0, 0.0, 0.0, 0.0);
    let (mut close_dx, mut close_dy) = (0.0, 0.0);
    for o in others {
        let (dx, dy) = (me.x - o.x, me.y - o.y);
        if dx.abs() >= p.visual_range || dy.abs() >= p.visual_range {
            continue;
        }
        let d_sq = dx * dx + dy * dy;
        if d_sq < protected_sq {
            close_dx += dx;
            close_dy += dy;
        } else if d_sq < visual_sq {
            sum_x += o.x;
            sum_y += o.y;
            sum_vx += o.vx;
            sum_vy += o.vy;
            count += 1.0;
        }
    }
    let (mut vx, mut vy) = (me.vx, me.vy);
    if count > 0.0 {
        vx += (sum_x / count - me.x) * p.centering + (sum_vx / count - me.vx) * p.matching;
        vy += (sum_y / count - me.y) * p.centering + (sum_vy / count - me.vy) * p.matching;
    }
    vx += close_dx * p.avoid;
    vy += close_dy * p.avoid;
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
