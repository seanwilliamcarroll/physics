//! Constraint solvers: complete ways of advancing a substep when a world
//! has constraints (`docs/06-constraints.md`, "Who steps").

use core::num::NonZeroU32;

use crate::integrate::{drift, evaluate, kick};
use crate::{Constraint, Force, Particles, Scalar, Vec2};

/// How a world with constraints is stepped.
///
/// An enum, like [`Integrator`](crate::Integrator): a small closed set,
/// exhaustive matches, and a wire code for the demo.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Solver {
    /// Extended position-based dynamics (Macklin et al. 2016): predict
    /// positions, project them onto the constraints, derive velocities.
    /// Holds a rigid rod to rounding; dissipates energy, less with more
    /// substeps.
    Xpbd,
}

/// Everything a solver substep reads and writes, borrowed from `World`.
pub(crate) struct Step<'a, S: Scalar, C> {
    pub(crate) forces: &'a [Box<dyn Force<S>>],
    pub(crate) particles: &'a mut Particles<S>,
    pub(crate) constraints: &'a [C],
    /// One λ per constraint, same order.
    pub(crate) lambda: &'a mut [S],
    pub(crate) acc: &'a mut Vec<Vec2<S>>,
    /// Positions at the start of the substep (XPBD's `x_prev`).
    pub(crate) prev: &'a mut Vec<Vec2<S>>,
    pub(crate) iterations: NonZeroU32,
}

impl<S: Scalar, C: Constraint<S>> Step<'_, S, C> {
    /// One XPBD substep of length `h`:
    ///
    /// ```text
    /// v += h a;  x_prev = x;  x += h v          predict (symplectic Euler)
    /// λ = 0
    /// per iteration, per constraint:
    ///   α̃ = α / h²,  Δλ = (−C − α̃ λ) / (w_a + w_b + α̃),  λ += Δλ
    ///   x_a −= w_a n Δλ,  x_b += w_b n Δλ
    /// v = (x − x_prev) / h                      derive
    /// ```
    pub(crate) fn xpbd(self, h: S) {
        let p = self.particles;
        evaluate(self.forces, p, self.acc);
        kick(&mut p.vel, self.acc, h);
        self.prev.clear();
        self.prev.extend_from_slice(&p.pos);
        drift(&mut p.pos, &p.vel, h);

        self.lambda.fill(S::ZERO);
        let alpha_scale = S::ONE / (h * h);
        for _ in 0..self.iterations.get() {
            for (c, lambda) in self.constraints.iter().zip(self.lambda.iter_mut()) {
                project(p, c, lambda, alpha_scale);
            }
        }

        for ((v, &x), &x0) in p.vel.iter_mut().zip(&p.pos).zip(self.prev.iter()) {
            *v = (x - x0) / h;
        }
    }
}

/// One XPBD projection of `c`, updating its `lambda`. `alpha_scale` is
/// `1 / h²`, so `α̃ = α · alpha_scale`. Skipped (no correction) when the
/// gradient is undefined or neither body can move.
fn project<S: Scalar, C: Constraint<S>>(
    p: &mut Particles<S>,
    c: &C,
    lambda: &mut S,
    alpha_scale: S,
) {
    let [a, b] = c.bodies().map(crate::ParticleId::index);
    let (Some(&wa), Some(&wb)) = (p.inv_mass.get(a), p.inv_mass.get(b)) else {
        return;
    };
    // Disjoint by construction (`between` rejects a == b); `Err` otherwise.
    let Ok([xa, xb]) = p.pos.get_disjoint_mut([a, b]) else {
        return;
    };
    let (value, Some(n)) = c.evaluate(*xa, *xb) else {
        return;
    };
    let alpha = c.compliance() * alpha_scale;
    let denom = wa + wb + alpha;
    if denom == S::ZERO {
        return;
    }
    let d_lambda = (-value - alpha * *lambda) / denom;
    *lambda += d_lambda;
    *xa -= n * (wa * d_lambda);
    *xb += n * (wb * d_lambda);
}
