//! [`Wall`]: a static half-plane (M6).

use crate::{Scalar, UnitVec2, Vec2};

/// A static half-plane: everything with `normal · x < offset` is solid.
/// The normal points into the free side, so a circle of radius `r` at `x`
/// is clear of the wall while `normal · x − offset ≥ r`
/// (`docs/08-collision.md`, "Shapes").
///
/// Not a particle: a wall has no position, mass or velocity, only a
/// boundary. Its normal is a [`UnitVec2`], so the distance it measures is
/// in meters.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Wall<S> {
    normal: UnitVec2<S>,
    offset: S,
}

impl<S: Scalar> Wall<S> {
    /// The wall whose boundary passes through `point`, free on the side
    /// `normal` points to.
    pub fn through(point: Vec2<S>, normal: UnitVec2<S>) -> Self {
        Self {
            normal,
            offset: normal.dot(point),
        }
    }

    /// The direction into the free side.
    pub const fn normal(self) -> UnitVec2<S> {
        self.normal
    }

    /// Signed distance from the boundary to `x`, m: positive on the free
    /// side, negative inside the wall.
    #[must_use]
    pub fn distance(self, x: Vec2<S>) -> S {
        self.normal.dot(x) - self.offset
    }
}

#[cfg(test)]
mod tests;
