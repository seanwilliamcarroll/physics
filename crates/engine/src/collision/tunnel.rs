//! Counting tunnels (`docs/09-billiards.md`, "Tunneling"): a diagnostic
//! that only reports.

use super::{CONTACT_MARGIN, Statics, candidate_pairs};
use crate::{Particles, Scalar, Vec2};

/// How many things passed through each other between `before` and the
/// positions now in `particles` (one substep, straight lines):
///
/// - two circles, whose centres came within **half** their reach
///   (`r_a + r_b`) between the ends without starting or ending that close:
///   deep passes count, a shallow graze doesn't (a real bounce can carry
///   the straight chord slightly inside, and mustn't count);
/// - a circle and a segment, whose centre's path crossed it;
/// - a circle and a wall, whose centre ended behind it.
pub(crate) fn count_tunnels<S: Scalar>(
    before: &[Vec2<S>],
    particles: &Particles<S>,
    statics: Statics<'_, S>,
    pairs: &mut Vec<(usize, usize)>,
) -> u32 {
    let after = particles.pos();
    let two = S::ONE + S::ONE;
    // Cell: both diameters plus the furthest any circle moved, so every
    // pair whose paths came within reach is a candidate.
    let furthest_moved = before
        .iter()
        .zip(after)
        .fold(S::ZERO, |furthest, (&start, &end)| {
            let moved = (end - start).length();
            if moved > furthest { moved } else { furthest }
        });
    let cell_size =
        two * particles.max_radius() + two * furthest_moved + S::from_f64(CONTACT_MARGIN);
    candidate_pairs(before, particles.radius(), cell_size, pairs);
    let mut count = 0;
    for &(first, second) in pairs.iter() {
        let (Some(&first_before), Some(&second_before), Some(&first_after), Some(&second_after)) = (
            before.get(first),
            before.get(second),
            after.get(first),
            after.get(second),
        ) else {
            continue;
        };
        let (Some(&first_radius), Some(&second_radius)) = (
            particles.radius().get(first),
            particles.radius().get(second),
        ) else {
            continue;
        };
        if passed_through(
            second_before - first_before,
            second_after - first_after,
            (first_radius + second_radius) / two,
        ) {
            count += 1;
        }
    }
    for (index, ((&start, &end), &radius)) in
        before.iter().zip(after).zip(particles.radius()).enumerate()
    {
        let movable = particles
            .inv_mass()
            .get(index)
            .is_some_and(|&inv_mass| inv_mass != S::ZERO);
        if radius == S::ZERO || !movable {
            continue;
        }
        for segment in statics.segments {
            let [segment_start, segment_end] = segment.ends();
            if crosses(start, end, segment_start, segment_end) {
                count += 1;
            }
        }
        for wall in statics.walls {
            if wall.distance(end) < -radius {
                count += 1;
            }
        }
    }
    count
}

/// Whether the path `start` to `end` came within `depth` of the origin
/// strictly between its ends, with both ends further out.
fn passed_through<S: Scalar>(start: Vec2<S>, end: Vec2<S>, depth: S) -> bool {
    let depth_sq = depth * depth;
    if start.length_sq() <= depth_sq || end.length_sq() <= depth_sq {
        return false;
    }
    let step = end - start;
    let step_length_sq = step.length_sq();
    if step_length_sq == S::ZERO {
        return false;
    }
    let fraction = -start.dot(step) / step_length_sq;
    fraction > S::ZERO && fraction < S::ONE && (start + step * fraction).length_sq() < depth_sq
}

/// Whether the segments properly cross: each one's ends strictly on
/// opposite sides of the other's line.
fn crosses<S: Scalar>(
    first_start: Vec2<S>,
    first_end: Vec2<S>,
    second_start: Vec2<S>,
    second_end: Vec2<S>,
) -> bool {
    let side = |from: Vec2<S>, to: Vec2<S>, point: Vec2<S>| {
        let (line, offset) = (to - from, point - from);
        line.x * offset.y - line.y * offset.x
    };
    let opposite = |x: S, y: S| (x > S::ZERO && y < S::ZERO) || (x < S::ZERO && y > S::ZERO);
    opposite(
        side(second_start, second_end, first_start),
        side(second_start, second_end, first_end),
    ) && opposite(
        side(first_start, first_end, second_start),
        side(first_start, first_end, second_end),
    )
}

#[cfg(test)]
mod tests;
