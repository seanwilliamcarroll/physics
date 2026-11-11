//! Counting tunnels: what passed through what in one substep
//! (`docs/09-billiards.md`, "Tunneling"). A diagnostic: it changes
//! nothing, it only reports.

use super::{CONTACT_MARGIN, Statics, candidate_pairs};
use crate::{Particles, Scalar, Vec2};

/// How many things passed through each other between `before` and the
/// positions now in `p` (one substep, straight lines between the two):
///
/// - two circles, whose centres came within **half** their reach
///   (`r_a + r_b`) between the ends without starting or ending that close:
///   deep passes count, a shallow graze doesn't (a real bounce can carry
///   the straight chord slightly inside, and mustn't count);
/// - a circle and a segment, whose centre's path crossed it;
/// - a circle and a wall, whose centre ended behind it.
///
/// `pairs` is the broadphase's scratch.
pub(crate) fn count_tunnels<S: Scalar>(
    before: &[Vec2<S>],
    p: &Particles<S>,
    statics: Statics<'_, S>,
    pairs: &mut Vec<(usize, usize)>,
) -> u32 {
    let after = p.pos();
    let two = S::ONE + S::ONE;
    // Cell: both diameters plus the furthest any circle moved, so every
    // pair whose paths came within reach is a candidate.
    let moved = before.iter().zip(after).fold(S::ZERO, |m, (&a, &b)| {
        let d = (b - a).length();
        if d > m { d } else { m }
    });
    let cell = two * p.max_radius() + two * moved + S::from_f64(CONTACT_MARGIN);
    candidate_pairs(before, p.radius(), cell, pairs);
    let mut count = 0;
    for &(a, b) in pairs.iter() {
        let (Some(&a0), Some(&b0), Some(&a1), Some(&b1)) =
            (before.get(a), before.get(b), after.get(a), after.get(b))
        else {
            continue;
        };
        let (Some(&ra), Some(&rb)) = (p.radius().get(a), p.radius().get(b)) else {
            continue;
        };
        if passed_through(b0 - a0, b1 - a1, (ra + rb) / two) {
            count += 1;
        }
    }
    for (i, ((&x0, &x1), &r)) in before.iter().zip(after).zip(p.radius()).enumerate() {
        let movable = p.inv_mass().get(i).is_some_and(|&w| w != S::ZERO);
        if r == S::ZERO || !movable {
            continue;
        }
        for seg in statics.segments {
            let [s0, s1] = seg.ends();
            if crosses(x0, x1, s0, s1) {
                count += 1;
            }
        }
        for wall in statics.walls {
            if wall.distance(x1) < -r {
                count += 1;
            }
        }
    }
    count
}

/// Whether the relative path from `d0` to `d1` came within `depth` of the
/// origin strictly between its ends, with both ends further out.
fn passed_through<S: Scalar>(d0: Vec2<S>, d1: Vec2<S>, depth: S) -> bool {
    let depth_sq = depth * depth;
    if d0.length_sq() <= depth_sq || d1.length_sq() <= depth_sq {
        return false;
    }
    let step = d1 - d0;
    let len_sq = step.length_sq();
    if len_sq == S::ZERO {
        return false;
    }
    let t = -d0.dot(step) / len_sq;
    t > S::ZERO && t < S::ONE && (d0 + step * t).length_sq() < depth_sq
}

/// Whether segment `p0 p1` properly crosses segment `q0 q1` (each one's
/// ends strictly on opposite sides of the other's line).
fn crosses<S: Scalar>(p0: Vec2<S>, p1: Vec2<S>, q0: Vec2<S>, q1: Vec2<S>) -> bool {
    let side = |a: Vec2<S>, b: Vec2<S>, c: Vec2<S>| {
        let (u, v) = (b - a, c - a);
        u.x * v.y - u.y * v.x
    };
    let opposite = |x: S, y: S| (x > S::ZERO && y < S::ZERO) || (x < S::ZERO && y > S::ZERO);
    opposite(side(q0, q1, p0), side(q0, q1, p1)) && opposite(side(p0, p1, q0), side(p0, p1, q1))
}

#[cfg(test)]
mod tests;
