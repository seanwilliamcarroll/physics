//! [`Pocket`]: a sensor circle on a billiards table (M7,
//! `docs/09-billiards.md`, "Pockets").

use crate::{Scalar, Vec2};

/// A circle that pots any ball whose centre enters it. A sensor: it
/// pushes nothing, it only reports.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Pocket<S> {
    center: Vec2<S>,
    radius: S,
}

impl<S: Scalar> Pocket<S> {
    /// `None` for a radius that isn't positive and finite.
    #[must_use]
    pub fn new(center: Vec2<S>, radius: S) -> Option<Self> {
        (radius > S::ZERO && radius.to_f64().is_finite()).then_some(Self { center, radius })
    }

    pub const fn center(self) -> Vec2<S> {
        self.center
    }

    #[must_use]
    pub const fn radius(self) -> S {
        self.radius
    }

    /// Whether a ball centred at `x` is in.
    #[must_use]
    pub fn holds(self, x: Vec2<S>) -> bool {
        (x - self.center).length_sq() < self.radius * self.radius
    }
}
