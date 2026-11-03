//! [`SpringForce`]: Hooke springs with dampers between particle pairs, the
//! force-based baseline of M5 (`docs/07-soft-bodies.md`).

use crate::{Damping, Force, ParticleId, Particles, Scalar, Stiffness, Vec2};

/// One spring between two particles: rest length, stiffness, damper.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Spring<S> {
    ends: [ParticleId; 2],
    rest: S,
    k: Stiffness<S>,
    c: Damping<S>,
}

impl<S: Scalar> Spring<S> {
    /// A spring between `a` and `b` at their current distance. `None` if
    /// `a == b` or either isn't in `p`.
    #[must_use]
    pub fn between(
        p: &Particles<S>,
        a: ParticleId,
        b: ParticleId,
        k: Stiffness<S>,
        c: Damping<S>,
    ) -> Option<Self> {
        let (xa, xb) = (p.pos().get(a.index())?, p.pos().get(b.index())?);
        Self::with_rest(p, a, b, (*xb - *xa).length(), k, c)
    }

    /// A spring of rest length `rest` (m, `≥ 0`). `None` if the length is
    /// negative or NaN, `a == b`, or either isn't in `p`.
    #[must_use]
    pub fn with_rest(
        p: &Particles<S>,
        a: ParticleId,
        b: ParticleId,
        rest: S,
        k: Stiffness<S>,
        c: Damping<S>,
    ) -> Option<Self> {
        let known = a.index() < p.len() && b.index() < p.len();
        (known && a != b && rest >= S::ZERO).then_some(Self {
            ends: [a, b],
            rest,
            k,
            c,
        })
    }

    /// The two particles.
    #[must_use]
    pub const fn ends(&self) -> [ParticleId; 2] {
        self.ends
    }

    /// Rest length, m.
    #[must_use]
    pub const fn rest(&self) -> S {
        self.rest
    }

    /// The same spring with stiffness `k` (live stiffness changes).
    #[must_use]
    pub const fn with_stiffness(self, k: Stiffness<S>) -> Self {
        Self { k, ..self }
    }
}

/// Springs between particle pairs: `F = (k (|d| − rest) + c (v_b − v_a)·n) n`
/// on `a`, `−F` on `b`. Equal and opposite, so momentum is conserved to
/// rounding. Stepped by the integrator: past `k_crit = 4m/h²` symplectic
/// Euler goes unstable (`docs/07-soft-bodies.md`).
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

    /// Elastic energy `Σ ½ k (|d| − rest)²`, J. Springs whose ends aren't
    /// in `p` are skipped.
    #[must_use]
    pub fn potential(&self, p: &Particles<S>) -> S {
        let half = S::ONE / (S::ONE + S::ONE);
        self.springs.iter().fold(S::ZERO, |acc, s| {
            let [a, b] = s.ends.map(ParticleId::index);
            let (Some(&xa), Some(&xb)) = (p.pos().get(a), p.pos().get(b)) else {
                return acc;
            };
            let stretch = (xb - xa).length() - s.rest;
            acc + half * s.k.get() * stretch * stretch
        })
    }
}

impl<S: Scalar> Force<S> for SpringForce<S> {
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]) {
        for s in &self.springs {
            let [a, b] = s.ends.map(ParticleId::index);
            let (Some(&xa), Some(&xb), Some(&va), Some(&vb), Some(&wa), Some(&wb)) = (
                p.pos().get(a),
                p.pos().get(b),
                p.vel().get(a),
                p.vel().get(b),
                p.inv_mass().get(a),
                p.inv_mass().get(b),
            ) else {
                continue;
            };
            let d = xb - xa;
            let len = d.length();
            if len == S::ZERO {
                continue; // coincident: no direction
            }
            let n = d / len;
            let f = n * (s.k.get() * (len - s.rest) + s.c.get() * n.dot(vb - va));
            if let Ok([aa, ab]) = acc.get_disjoint_mut([a, b]) {
                *aa += f * wa;
                *ab -= f * wb;
            }
        }
    }
}

#[cfg(test)]
mod tests;
