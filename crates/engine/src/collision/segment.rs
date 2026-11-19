//! [`Segment`]: a static line segment with its own restitution (a
//! cushion), and [`Statics`], everything static circles collide with.

use crate::{Restitution, Scalar, UnitVec2, Vec2, Wall};

/// A static segment from `start` to `end` (`docs/09-billiards.md`,
/// "Cushions"). Circles collide with its closest point: along the segment,
/// its side; past either end, the endpoint, so ends act as rounded corners
/// (pocket jaws). Two-sided, and it carries its own restitution, so a
/// cushion can be livelier or deader than the balls (`e_c` against `e_b`).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Segment<S> {
    start: Vec2<S>,
    end: Vec2<S>,
    restitution: Restitution<S>,
}

impl<S: Scalar> Segment<S> {
    /// The segment from `start` to `end`. `start = end` is a point (a round
    /// post), which is fine: the closest point is that point.
    pub const fn new(start: Vec2<S>, end: Vec2<S>, restitution: Restitution<S>) -> Self {
        Self {
            start,
            end,
            restitution,
        }
    }

    pub const fn ends(self) -> [Vec2<S>; 2] {
        [self.start, self.end]
    }

    #[must_use]
    pub const fn restitution(self) -> Restitution<S> {
        self.restitution
    }

    /// The point of the segment closest to `x`.
    pub fn closest(self, x: Vec2<S>) -> Vec2<S> {
        let along = self.end - self.start;
        let length_sq = along.dot(along);
        if length_sq == S::ZERO {
            return self.start;
        }
        let fraction = (x - self.start).dot(along) / length_sq;
        let fraction = if fraction < S::ZERO {
            S::ZERO
        } else if fraction > S::ONE {
            S::ONE
        } else {
            fraction
        };
        self.start + along * fraction
    }

    /// The distance from the segment to `x`, m, and the unit direction
    /// from `x` toward the segment (a contact's normal, circle to
    /// segment). A centre exactly on the segment has no direction; it
    /// gets the segment's left-hand normal (or `+x` for a point segment),
    /// so it's pushed out deterministically, as coincident circles are.
    pub fn toward(self, x: Vec2<S>) -> (S, UnitVec2<S>) {
        let closest = self.closest(x);
        (closest - x).length_and_direction().unwrap_or_else(|| {
            let along = self.end - self.start;
            let fallback = Vec2::new(along.y, -along.x)
                .length_and_direction()
                .map_or(UnitVec2::X, |(_, normal)| normal);
            (S::ZERO, fallback)
        })
    }
}

/// Everything static that circles collide with: half-plane walls and
/// segments. Borrowed from the world for a substep.
#[derive(Copy, Clone, Debug)]
pub(crate) struct Statics<'a, S> {
    pub walls: &'a [Wall<S>],
    pub segments: &'a [Segment<S>],
}

impl<S: 'static> Statics<'static, S> {
    /// Nothing static.
    pub(crate) const NONE: Self = Statics {
        walls: &[],
        segments: &[],
    };
}

#[cfg(test)]
mod tests;
