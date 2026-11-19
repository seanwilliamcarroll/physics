//! [`SpringForce`]: Hooke springs with dampers between particle pairs
//! (`docs/07-soft-bodies.md`).

use crate::{Damping, Force, ParticleId, Particles, Scalar, Stiffness, Vec2};

/// One spring between two particles: rest length, stiffness, damper.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Spring<S> {
    ends: [ParticleId; 2],
    rest: S,
    stiffness: Stiffness<S>,
    damping: Damping<S>,
}

impl<S: Scalar> Spring<S> {
    /// A spring between `first` and `second` at their current distance.
    /// `None` if they are the same particle or either isn't in `particles`.
    #[must_use]
    pub fn between(
        particles: &Particles<S>,
        first: impl Into<ParticleId>,
        second: impl Into<ParticleId>,
        stiffness: Stiffness<S>,
        damping: Damping<S>,
    ) -> Option<Self> {
        let (first, second) = (first.into(), second.into());
        let (first_x, second_x) = (
            particles.pos().get(first.index())?,
            particles.pos().get(second.index())?,
        );
        Self::with_rest(
            particles,
            first,
            second,
            (*second_x - *first_x).length(),
            stiffness,
            damping,
        )
    }

    /// A spring of rest length `rest` (m, `≥ 0`). `None` if the length is
    /// negative or NaN, the ends are the same particle, or either isn't in
    /// `particles`.
    #[must_use]
    pub fn with_rest(
        particles: &Particles<S>,
        first: impl Into<ParticleId>,
        second: impl Into<ParticleId>,
        rest: S,
        stiffness: Stiffness<S>,
        damping: Damping<S>,
    ) -> Option<Self> {
        let (first, second) = (first.into(), second.into());
        let known = first.index() < particles.len() && second.index() < particles.len();
        (known && first != second && rest >= S::ZERO).then_some(Self {
            ends: [first, second],
            rest,
            stiffness,
            damping,
        })
    }

    /// The two particles.
    #[must_use]
    pub const fn ends(&self) -> [ParticleId; 2] {
        self.ends
    }

    /// Test-only: rest length, m.
    #[cfg(test)]
    #[must_use]
    pub(crate) const fn rest(&self) -> S {
        self.rest
    }

    /// The same spring with a different stiffness.
    #[must_use]
    pub const fn with_stiffness(self, stiffness: Stiffness<S>) -> Self {
        Self { stiffness, ..self }
    }
}

/// Springs between particle pairs: `F = (k (|d| − rest) + c (v_b − v_a)·n) n`
/// on `a`, `−F` on `b`. Equal and opposite, so momentum is conserved to
/// rounding. Stepped by the integrator: past `k_crit = 4m/h²` symplectic
/// Euler goes unstable (`docs/07-soft-bodies.md`).
///
/// A spring's ends are checked against the particles it was built from, not
/// the world it's added to (`World::add_force` can't see ids). One naming
/// particles the world doesn't have is skipped: no crash, and no force.
#[derive(Clone, Debug, PartialEq)]
pub struct SpringForce<S> {
    springs: Vec<Spring<S>>,
}

impl<S: Scalar> SpringForce<S> {
    #[must_use]
    pub const fn new(springs: Vec<Spring<S>>) -> Self {
        Self { springs }
    }

    #[must_use]
    pub fn springs(&self) -> &[Spring<S>] {
        &self.springs
    }

    /// The same springs, each with a different stiffness.
    #[must_use]
    pub fn with_stiffness(&self, stiffness: Stiffness<S>) -> Self {
        Self::new(
            self.springs
                .iter()
                .map(|spring| spring.with_stiffness(stiffness))
                .collect(),
        )
    }

    /// The same springs, each with a different damper.
    #[must_use]
    pub fn with_damping(&self, damping: Damping<S>) -> Self {
        Self::new(
            self.springs
                .iter()
                .map(|spring| Spring { damping, ..*spring })
                .collect(),
        )
    }

    /// Elastic energy `Σ ½ k (|d| − rest)²`, J. Springs whose ends aren't
    /// in `particles` are skipped.
    #[must_use]
    pub fn potential(&self, particles: &Particles<S>) -> S {
        let half = S::ONE / (S::ONE + S::ONE);
        self.springs.iter().fold(S::ZERO, |total, spring| {
            let [first, second] = spring.ends.map(ParticleId::index);
            let (Some(&first_x), Some(&second_x)) =
                (particles.pos().get(first), particles.pos().get(second))
            else {
                return total;
            };
            let stretch = (second_x - first_x).length() - spring.rest;
            total + half * spring.stiffness.get() * stretch * stretch
        })
    }
}

impl<S: Scalar> Force<S> for SpringForce<S> {
    fn accumulate(&self, particles: &Particles<S>, accelerations: &mut [Vec2<S>]) {
        for spring in &self.springs {
            let [first, second] = spring.ends.map(ParticleId::index);
            let (
                Some(&first_x),
                Some(&second_x),
                Some(&first_velocity),
                Some(&second_velocity),
                Some(&first_inv_mass),
                Some(&second_inv_mass),
            ) = (
                particles.pos().get(first),
                particles.pos().get(second),
                particles.vel().get(first),
                particles.vel().get(second),
                particles.inv_mass().get(first),
                particles.inv_mass().get(second),
            )
            else {
                continue;
            };
            let Some((length, direction)) = (second_x - first_x).length_and_direction() else {
                continue; // coincident: no direction
            };
            let force = direction
                * (spring.stiffness.get() * (length - spring.rest)
                    + spring.damping.get() * direction.dot(second_velocity - first_velocity));
            if let Ok([first_acceleration, second_acceleration]) =
                accelerations.get_disjoint_mut([first, second])
            {
                *first_acceleration += force * first_inv_mass;
                *second_acceleration -= force * second_inv_mass;
            }
        }
    }
}

#[cfg(test)]
mod tests;
