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
    g_const: S,
    /// ε², stored squared: the force only ever uses ε². Nonnegative ε is
    /// guaranteed by [`Softening`], checked where it was built.
    softening_sq: S,
}

impl<S: Scalar> PairwiseGravity<S> {
    /// `g_const`: the gravitational constant in the scene's units (SI:
    /// [`crate::scenarios::GRAVITATIONAL_CONSTANT`]). `softening`: ε;
    /// [`Softening::ZERO`] is allowed (pure 1/r², what M2 demonstrates
    /// blowing up).
    #[must_use]
    pub fn new(g_const: S, softening: Softening<S>) -> Self {
        Self {
            g_const,
            softening_sq: softening.squared(),
        }
    }

    #[must_use]
    pub const fn g_const(&self) -> S {
        self.g_const
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
        p: &Particles<S>,
        acc: &mut [Vec2<S>],
    ) {
        let bodies = Bodies::of(p);
        match pair_loop {
            PairLoop::TwoPass => two_pass::accumulate::<S, L>(self, &bodies, acc),
            PairLoop::Blocked => blocked::accumulate::<S, L>(self, &bodies, acc),
        }
    }
}

impl<S: Scalar> Force<S> for PairwiseGravity<S> {
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]) {
        if p.len() < TUNING.plain_below {
            plain::accumulate(self, p, acc);
        } else if size_of::<S>() == size_of::<f64>() {
            // The scalar's kernel: a constant per instantiation, so only
            // its branch is compiled in.
            self.accumulate_with::<F64_LANES>(TUNING.f64.pair_loop, p, acc);
        } else {
            self.accumulate_with::<F32_LANES>(TUNING.f32.pair_loop, p, acc);
        }
    }
}

/// What the vector loops read, one array per quantity, copied once per
/// call: masses computed here (n divisions instead of n² in the loop;
/// static particles get mass 0, so they exert no pull).
struct Bodies<S> {
    x: Vec<S>,
    y: Vec<S>,
    m: Vec<S>,
    w: Vec<S>,
}

impl<S: Scalar> Bodies<S> {
    fn of(p: &Particles<S>) -> Self {
        let n = p.len();
        let mut b = Self {
            x: Vec::with_capacity(n),
            y: Vec::with_capacity(n),
            m: Vec::with_capacity(n),
            w: Vec::with_capacity(n),
        };
        for (&x, &w) in p.pos().iter().zip(p.inv_mass()) {
            b.x.push(x.x);
            b.y.push(x.y);
            b.m.push(if w == S::ZERO { S::ZERO } else { S::ONE / w });
            b.w.push(w);
        }
        b
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
        let mut next = [S::ZERO; L];
        let (pairs, _) = level.as_chunks::<2>();
        for (sum, &[a, b]) in next.iter_mut().zip(pairs).take(width) {
            *sum = a + b;
        }
        level = next;
    }
    level.first().copied().unwrap_or(S::ZERO)
}
