//! Pairwise gravity: every pair of bodies once, in one of two loops chosen
//! at build time, with body i's sum split into lanes (`knobs.rs`;
//! `docs/gravity-vectorize.md`).

mod blocked;
mod knobs;
mod plain;
mod tuning;
mod two_pass;

#[cfg(test)]
mod tests;

use tuning::{F32_LANES, F64_LANES, PairLoop, TUNING};

use super::Force;
use crate::{Particles, Scalar, Softening, Vec2};

/// Newtonian gravity between every pair of dynamic particles, softened:
///
/// ```text
/// F_ij = G m_i m_j r / (|r|² + ε²)^(3/2),   r = x_j - x_i
/// ```
///
/// Softening (Plummer) caps the force at short range: without it two close
/// bodies get an enormous kick in one step and fling apart
/// (`docs/02-core-types.md`). O(n²): each pair once.
///
/// Static particles (`inv_mass = 0`) have no defined mass, so they neither
/// pull nor are pulled.
///
/// The pair loop is built to vectorize across pairs: body i's sum over the
/// later bodies is kept in partial sums (lanes; pair j in lane j mod the
/// lane count) added in a fixed order. Which loop and how many lanes, per
/// scalar, and below how many bodies a plain loop runs instead, are each
/// target's own (`tuning.rs`), so targets differ in the last bits.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct PairwiseGravity<S> {
    gravitational_constant: S,
    /// ε², stored squared: the force only ever uses ε². Nonnegative ε is
    /// guaranteed by [`Softening`].
    softening_sq: S,
}

impl<S: Scalar> PairwiseGravity<S> {
    /// `gravitational_constant`: the gravitational constant in the scene's units (SI:
    /// [`crate::scenarios::GRAVITATIONAL_CONSTANT`]). `softening`: ε;
    /// [`Softening::ZERO`] is allowed (pure 1/r²).
    #[must_use]
    pub fn new(gravitational_constant: S, softening: Softening<S>) -> Self {
        Self {
            gravitational_constant,
            softening_sq: softening.squared(),
        }
    }

    #[must_use]
    pub const fn g_const(&self) -> S {
        self.gravitational_constant
    }

    #[must_use]
    pub const fn softening_sq(&self) -> S {
        self.softening_sq
    }

    /// A vector loop at `L` lanes, whichever the target didn't choose too
    /// (the tests check both against the plain loop, to rounding).
    fn accumulate_with<const L: usize>(
        &self,
        pair_loop: PairLoop,
        particles: &Particles<S>,
        accelerations: &mut [Vec2<S>],
    ) {
        let bodies = Bodies::of(particles);
        match pair_loop {
            PairLoop::TwoPass => two_pass::accumulate::<S, L>(self, &bodies, accelerations),
            PairLoop::Blocked => blocked::accumulate::<S, L>(self, &bodies, accelerations),
        }
    }
}

impl<S: Scalar> Force<S> for PairwiseGravity<S> {
    fn accumulate(&self, particles: &Particles<S>, accelerations: &mut [Vec2<S>]) {
        if particles.len() < TUNING.plain_below {
            plain::accumulate(self, particles, accelerations);
        } else if size_of::<S>() == size_of::<f64>() {
            // The scalar's kernel: a constant per instantiation, so only
            // its branch is compiled in.
            self.accumulate_with::<F64_LANES>(TUNING.f64.pair_loop, particles, accelerations);
        } else {
            self.accumulate_with::<F32_LANES>(TUNING.f32.pair_loop, particles, accelerations);
        }
    }
}

/// What the vector loops read, one array per quantity, copied once per
/// call: masses computed here (n divisions instead of n² in the loop;
/// static particles get mass 0, so they exert no pull).
struct Bodies<S> {
    x: Vec<S>,
    y: Vec<S>,
    mass: Vec<S>,
    inv_mass: Vec<S>,
}

impl<S: Scalar> Bodies<S> {
    fn of(particles: &Particles<S>) -> Self {
        let count = particles.len();
        let mut bodies = Self {
            x: Vec::with_capacity(count),
            y: Vec::with_capacity(count),
            mass: Vec::with_capacity(count),
            inv_mass: Vec::with_capacity(count),
        };
        for (&position, &inv_mass) in particles.pos().iter().zip(particles.inv_mass()) {
            bodies.x.push(position.x);
            bodies.y.push(position.y);
            bodies.mass.push(if inv_mass == S::ZERO {
                S::ZERO
            } else {
                S::ONE / inv_mass
            });
            bodies.inv_mass.push(inv_mass);
        }
        bodies
    }
}

/// Body i's lanes added as a tree, halves first: `(l0 + l1) + (l2 + l3)`
/// for four, the same shape for any power of two. The order is in the
/// source, so it doesn't depend on whether the target adds in vectors.
/// Level by level (adjacent pairs, then pairs of pairs), not recursively:
/// the same order, and a loop of known length the compiler unrolls, where
/// recursion would be a chain of calls per body.
fn lane_total<S: Scalar, const L: usize>(lanes: &[S; L]) -> S {
    let mut level = *lanes;
    let mut width = L;
    while width > 1 {
        width /= 2;
        let mut next_level = [S::ZERO; L];
        let (pairs, _) = level.as_chunks::<2>();
        for (sum, &[left, right]) in next_level.iter_mut().zip(pairs).take(width) {
            *sum = left + right;
        }
        level = next_level;
    }
    level.first().copied().unwrap_or(S::ZERO)
}
