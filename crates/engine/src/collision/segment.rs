//! [`Segment`]: a static line segment with its own restitution (M7: a
//! cushion), and [`Statics`], everything static circles collide with.

use crate::{Restitution, Scalar, UnitVec2, Vec2, Wall};

/// A static segment from `a` to `b` (`docs/09-billiards.md`, "Cushions").
/// Circles collide with its closest point: along the segment, its side;
/// past either end, the endpoint, so ends act as rounded corners (pocket
/// jaws). Two-sided, and it carries its own restitution, so a cushion can
/// be livelier or deader than the balls (`e_c` against `e_b`).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Segment<S> {
    a: Vec2<S>,
    b: Vec2<S>,
    restitution: Restitution<S>,
}

impl<S: Scalar> Segment<S> {
    /// The segment from `a` to `b`. `a = b` is a point (a round post),
    /// which is fine: the closest point is that point.
    pub const fn new(a: Vec2<S>, b: Vec2<S>, restitution: Restitution<S>) -> Self {
        Self { a, b, restitution }
    }

    pub const fn ends(self) -> [Vec2<S>; 2] {
        [self.a, self.b]
    }

    #[must_use]
    pub const fn restitution(self) -> Restitution<S> {
        self.restitution
    }

    /// The point of the segment closest to `x`.
    pub fn closest(self, x: Vec2<S>) -> Vec2<S> {
        let d = self.b - self.a;
        let len_sq = d.dot(d);
        if len_sq == S::ZERO {
            return self.a;
        }
        let t = (x - self.a).dot(d) / len_sq;
        let t = if t < S::ZERO {
            S::ZERO
        } else if t > S::ONE {
            S::ONE
        } else {
            t
        };
        self.a + d * t
    }

    /// The distance from the segment to `x`, m, and the unit direction
    /// from `x` toward the segment (a contact's normal, circle to
    /// segment). A centre exactly on the segment has no direction; it
    /// gets the segment's left-hand normal (or `+x` for a point segment),
    /// so it's pushed out deterministically, as coincident circles are.
    pub fn toward(self, x: Vec2<S>) -> (S, UnitVec2<S>) {
        let q = self.closest(x);
        (q - x).length_and_direction().unwrap_or_else(|| {
            let d = self.b - self.a;
            let fallback = Vec2::new(d.y, -d.x)
                .length_and_direction()
                .map_or(UnitVec2::X, |(_, n)| n);
            (S::ZERO, fallback)
        })
    }
}

/// Everything static that circles collide with: half-plane walls (M6) and
/// segments (M7). Borrowed from the world for a substep.
#[derive(Copy, Clone, Debug)]
pub struct Statics<'a, S> {
    pub walls: &'a [Wall<S>],
    pub segments: &'a [Segment<S>],
}

impl<S: 'static> Statics<'static, S> {
    /// Nothing static.
    pub const NONE: Self = Statics {
        walls: &[],
        segments: &[],
    };
}

#[cfg(test)]
mod tests;
