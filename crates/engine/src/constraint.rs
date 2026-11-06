//! Constraints: geometry only (`C`, `∇C`, compliance). How to enforce
//! them is the solver's job (`docs/06-constraints.md`).

use crate::{Compliance, Damping, ParticleId, Particles, Scalar, UnitVec2, Vec2};

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
    fn evaluate(&self, xa: Vec2<S>, xb: Vec2<S>) -> (S, Option<UnitVec2<S>>);

    /// Compliance α = 1 / stiffness, m/N; 0 is rigid.
    fn compliance(&self) -> S;

    /// Damping c along the constraint, N·s/m; 0 (the default) is
    /// undamped. Only meaningful with compliance > 0: a rigid constraint
    /// has no motion along it to damp.
    fn damping(&self) -> S {
        S::ZERO
    }
}

/// Keeps two particles a fixed distance apart: `C = |x_b − x_a| − L`.
/// A rod; to a static particle, a pendulum's pin.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct DistanceConstraint<S> {
    bodies: [ParticleId; 2],
    length: S,
    compliance: Compliance<S>,
    damping: Damping<S>,
}

impl<S: Scalar> DistanceConstraint<S> {
    /// A rigid rod between `a` and `b` at their current distance, so no
    /// length can be wrong (negative, NaN). `None` if `a == b` or either
    /// isn't in `p`.
    #[must_use]
    pub fn between(
        p: &Particles<S>,
        a: impl Into<ParticleId>,
        b: impl Into<ParticleId>,
    ) -> Option<Self> {
        let (a, b) = (a.into(), b.into());
        let (xa, xb) = (p.pos().get(a.index())?, p.pos().get(b.index())?);
        Self::with_length(p, a, b, (*xb - *xa).length(), Compliance::RIGID)
    }

    /// A rod of rest length `length` (m, `≥ 0`; 0 pulls the two bodies
    /// together, as the drag does) and the given compliance. `None` if the
    /// length is negative or NaN, `a == b`, or either isn't in `p`.
    #[must_use]
    pub fn with_length(
        p: &Particles<S>,
        a: impl Into<ParticleId>,
        b: impl Into<ParticleId>,
        length: S,
        compliance: Compliance<S>,
    ) -> Option<Self> {
        let (a, b) = (a.into(), b.into());
        let known = a.index() < p.len() && b.index() < p.len();
        (known && a != b && length >= S::ZERO).then_some(Self {
            bodies: [a, b],
            length,
            compliance,
            damping: Damping::NONE,
        })
    }

    /// Rest length L, m.
    #[must_use]
    pub const fn length(&self) -> S {
        self.length
    }

    /// The same constraint with damper `c` (`docs/07-soft-bodies.md`,
    /// "Damping in all three steppers").
    #[must_use]
    pub const fn with_damping(self, c: Damping<S>) -> Self {
        Self { damping: c, ..self }
    }

    /// The same constraint with compliance `alpha` (live stiffness).
    #[must_use]
    pub const fn with_compliance(self, alpha: Compliance<S>) -> Self {
        Self {
            compliance: alpha,
            ..self
        }
    }
}

impl<S: Scalar> Constraint<S> for DistanceConstraint<S> {
    fn bodies(&self) -> [ParticleId; 2] {
        self.bodies
    }

    fn evaluate(&self, xa: Vec2<S>, xb: Vec2<S>) -> (S, Option<UnitVec2<S>>) {
        let d = xb - xa;
        // n = d / |d| (`type-invariants.md` item 3). No direction at
        // |d| = 0; the error is still defined there (−length).
        match d.length_and_direction() {
            Some((len, n)) => (len - self.length, Some(n)),
            None => (d.length() - self.length, None),
        }
    }

    fn compliance(&self) -> S {
        self.compliance.get()
    }

    fn damping(&self) -> S {
        self.damping.get()
    }
}

#[cfg(test)]
mod tests;
