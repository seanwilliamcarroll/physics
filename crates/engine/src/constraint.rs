//! Constraints: geometry only (`C`, `∇C`, compliance). How to enforce
//! them is the solver's job (`docs/06-constraints.md`).

use crate::{ParticleId, Particles, Scalar, Vec2};

/// A two-body constraint `C(x_a, x_b) = 0`, described by its geometry.
///
/// Solvers are generic over this trait (monomorphized, no `dyn`): it is
/// the interface they are written against, so they can't depend on what
/// kind of constraint they're solving.
pub trait Constraint<S: Scalar> {
    /// The two particles it joins.
    fn bodies(&self) -> [ParticleId; 2];

    /// `C` at positions `xa`, `xb`, and `∇C` with respect to `xb` (with
    /// respect to `xa` it is the negation, for every two-body constraint
    /// here). The gradient is `None` where no direction is defined, e.g.
    /// coincident bodies; `C` itself is always defined, so error readouts
    /// still see it.
    fn evaluate(&self, xa: Vec2<S>, xb: Vec2<S>) -> (S, Option<Vec2<S>>);

    /// Compliance α = 1 / stiffness, m/N; 0 is rigid.
    fn compliance(&self) -> S;
}

/// Keeps two particles a fixed distance apart: `C = |x_b − x_a| − L`.
/// A rod; to a static particle, a pendulum's pin.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct DistanceConstraint<S> {
    bodies: [ParticleId; 2],
    length: S,
}

impl<S: Scalar> DistanceConstraint<S> {
    /// A rigid rod between `a` and `b` at their current distance, so no
    /// length can be wrong (negative, NaN). `None` if `a == b` or either
    /// isn't in `p`. Rigid only until M5's `Compliance` type.
    #[must_use]
    pub fn between(p: &Particles<S>, a: ParticleId, b: ParticleId) -> Option<Self> {
        let (xa, xb) = (p.pos().get(a.index())?, p.pos().get(b.index())?);
        (a != b).then(|| Self {
            bodies: [a, b],
            length: (*xb - *xa).length(),
        })
    }

    /// Rest length L, m.
    #[must_use]
    pub const fn length(&self) -> S {
        self.length
    }
}

impl<S: Scalar> Constraint<S> for DistanceConstraint<S> {
    fn bodies(&self) -> [ParticleId; 2] {
        self.bodies
    }

    fn evaluate(&self, xa: Vec2<S>, xb: Vec2<S>) -> (S, Option<Vec2<S>>) {
        let d = xb - xa;
        let len = d.length();
        // n = d / |d|: the first normalization in a constraint gradient
        // (`type-invariants.md` item 3). No direction at |d| = 0.
        // Divides each component (correctly rounded), not d * (1 / len).
        let grad = (len != S::ZERO).then(|| d / len);
        (len - self.length, grad)
    }

    fn compliance(&self) -> S {
        S::ZERO
    }
}

#[cfg(test)]
mod tests;
