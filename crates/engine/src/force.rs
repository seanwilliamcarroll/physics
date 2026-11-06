//! Force generators: anything that contributes acceleration each substep.

mod spring;

pub use spring::{Spring, SpringForce};

use crate::{Particles, Scalar, Softening, Vec2};

/// A source of acceleration.
///
/// Called once per substep through `dyn Force<S>`. The indirect call is
/// negligible next to the O(n) or O(n²) loop inside each impl
/// (`docs/02-core-types.md`, "Decision: `dyn Force<S>`").
pub trait Force<S: Scalar> {
    /// Adds this force's acceleration into `acc` (one entry per particle,
    /// zeroed by the world before the first force runs). Must add, never
    /// overwrite, so multiple forces combine.
    ///
    /// Accelerations, not forces: static particles (`inv_mass = 0`) are
    /// skipped, since a static has no mass to divide by or to pull with.
    /// (Skipping them isn't what keeps them still: `kick` and `drift` never
    /// move a static, whatever a force writes for it.)
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]);
}

/// The same acceleration `g` for every dynamic particle, e.g.
/// `(0, -STANDARD_GRAVITY)` m/s² (see [`crate::scenarios::STANDARD_GRAVITY`]).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct UniformGravity<S> {
    g: Vec2<S>,
}

impl<S: Scalar> UniformGravity<S> {
    #[must_use]
    pub const fn new(g: Vec2<S>) -> Self {
        Self { g }
    }

    /// The acceleration, m/s².
    pub const fn g(&self) -> Vec2<S> {
        self.g
    }
}

impl<S: Scalar> Force<S> for UniformGravity<S> {
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]) {
        for (a, &w) in acc.iter_mut().zip(p.inv_mass()) {
            if w != S::ZERO {
                *a += self.g;
            }
        }
    }
}

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
}

impl<S: Scalar> Force<S> for PairwiseGravity<S> {
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]) {
        // Masses once per call: n divisions here instead of n² in the pair
        // loop. Static particles get mass 0, so they exert no pull.
        let bodies: Vec<(Vec2<S>, S, S)> = p
            .pos()
            .iter()
            .zip(p.inv_mass())
            .map(|(&x, &w)| (x, if w == S::ZERO { S::ZERO } else { S::ONE / w }, w))
            .collect();

        // Each pair once (i < j), without indexing: take the first body,
        // pair it with every later one, continue with the rest.
        // `mem::take` moves the slice out so its tail can replace it.
        let mut acc_rest = acc;
        let mut body_rest = bodies.as_slice();
        while let (Some((a_i, acc_tail)), Some((&(x_i, m_i, w_i), body_tail))) = (
            core::mem::take(&mut acc_rest).split_first_mut(),
            body_rest.split_first(),
        ) {
            for (a_j, &(x_j, m_j, w_j)) in acc_tail.iter_mut().zip(body_tail) {
                let r = x_j - x_i;
                let d_sq = r.length_sq() + self.softening_sq;
                if d_sq == S::ZERO {
                    // Coincident and unsoftened: no direction; skip, not 0/0.
                    continue;
                }
                // One force vector per pair, applied +/-: equal and
                // opposite by construction. Accelerations are F * w, so a
                // static body (w = 0) isn't moved.
                let f = r * (self.g_const * m_i * m_j / (d_sq * d_sq.sqrt()));
                *a_i += f * w_i;
                *a_j -= f * w_j;
            }
            acc_rest = acc_tail;
            body_rest = body_tail;
        }
    }
}

#[cfg(test)]
mod tests;
