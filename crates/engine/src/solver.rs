//! Constraint solvers: complete ways of advancing a substep when a world
//! has constraints (`docs/06-constraints.md`, "Who steps").

use core::num::NonZeroU32;

use crate::integrate::{drift, evaluate, kick};
use crate::{Baumgarte, Constraint, Force, Particles, Scalar, Vec2};

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
    /// Sequential impulses (Catto 2005, 2006): solve the constraints'
    /// *velocities*, with a Baumgarte bias feeding position error back,
    /// then integrate positions. Drifts without the bias; with substeps,
    /// keeps energy far better than XPBD.
    Impulse,
}

impl Solver {
    /// Both solvers, for tests and side-by-side demos.
    pub const ALL: [Self; 2] = [Self::Xpbd, Self::Impulse];
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
    pub(crate) baumgarte: Baumgarte<S>,
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

impl<S: Scalar, C: Constraint<S>> Step<'_, S, C> {
    /// One sequential-impulse substep of length `h`:
    ///
    /// ```text
    /// v += h a
    /// warm start: apply each constraint's λ from the previous substep
    /// per iteration, per constraint:
    ///   Δλ = −(n · (v_b − v_a) + (β / h) C) / (w_a + w_b),  λ += Δλ
    ///   v_a −= w_a n Δλ,  v_b += w_b n Δλ
    /// x += h v
    /// ```
    ///
    /// λ is the impulse applied this substep, accumulated over the
    /// iterations and kept for the next substep's warm start. One
    /// constraint is solved exactly in one pass, so for a single pendulum
    /// warm starting only changes rounding; chains (M4) need it.
    pub(crate) fn impulse(self, h: S) {
        let p = self.particles;
        evaluate(self.forces, p, self.acc);
        kick(&mut p.vel, self.acc, h);
        for (c, &lambda) in self.constraints.iter().zip(self.lambda.iter()) {
            apply_impulse(p, c, lambda);
        }
        let gains = Gains {
            rigid_bias: self.baumgarte.get() / h,
            soft_bias: S::ONE / h,
            alpha_scale: S::ONE / (h * h),
        };
        for _ in 0..self.iterations.get() {
            for (c, lambda) in self.constraints.iter().zip(self.lambda.iter_mut()) {
                solve_velocity(p, c, lambda, gains);
            }
        }
        drift(&mut p.pos, &p.vel, h);
    }
}

/// The bodies of `c` as `(index_a, index_b, w_a, w_b)`, or `None` if
/// either isn't in `p`.
fn masses<S: Scalar, C: Constraint<S>>(p: &Particles<S>, c: &C) -> Option<(usize, usize, S, S)> {
    let [a, b] = c.bodies().map(crate::ParticleId::index);
    Some((a, b, *p.inv_mass.get(a)?, *p.inv_mass.get(b)?))
}

/// Applies impulse `lambda` along `c`'s gradient: `v_a −= w_a n λ`,
/// `v_b += w_b n λ`. Nothing if the gradient is undefined.
fn apply_impulse<S: Scalar, C: Constraint<S>>(p: &mut Particles<S>, c: &C, lambda: S) {
    let Some((a, b, wa, wb)) = masses(p, c) else {
        return;
    };
    let (Some(&xa), Some(&xb)) = (p.pos.get(a), p.pos.get(b)) else {
        return;
    };
    let (_, Some(n)) = c.evaluate(xa, xb) else {
        return;
    };
    let Ok([va, vb]) = p.vel.get_disjoint_mut([a, b]) else {
        return;
    };
    *va -= n * (wa * lambda);
    *vb += n * (wb * lambda);
}

/// Per-substep factors of the impulse update (`docs/06-constraints.md`,
/// "Compliance in both solvers").
#[derive(Copy, Clone)]
struct Gains<S> {
    /// `β / h`: a rigid rod's Baumgarte bias per meter of error.
    rigid_bias: S,
    /// `1 / h`: a compliant rod's own bias (Catto's bias factor 1).
    soft_bias: S,
    /// `1 / h²`, so `α̃ = α / h²`.
    alpha_scale: S,
}

/// One velocity solve of `c`, updating its accumulated `lambda`:
/// rigid `Δλ = −(Jv + (β/h) C) / w`; compliant (Catto's soft form)
/// `Δλ = −(Jv + C/h + α̃ λ) / (w + α̃)`. Two branches rather than the soft
/// formula with α = 0: adding `0 · λ` can flip a zero's sign, and the
/// rigid path must stay bit-identical to M3 (goldens). Skipped when the
/// gradient is undefined or neither body can move.
fn solve_velocity<S: Scalar, C: Constraint<S>>(
    p: &mut Particles<S>,
    c: &C,
    lambda: &mut S,
    gains: Gains<S>,
) {
    let Some((a, b, wa, wb)) = masses(p, c) else {
        return;
    };
    let w = wa + wb;
    let (Some(&xa), Some(&xb)) = (p.pos.get(a), p.pos.get(b)) else {
        return;
    };
    let (value, Some(n)) = c.evaluate(xa, xb) else {
        return;
    };
    if w == S::ZERO {
        return;
    }
    let Ok([va, vb]) = p.vel.get_disjoint_mut([a, b]) else {
        return;
    };
    let jv = n.dot(*vb - *va);
    let alpha = c.compliance() * gains.alpha_scale;
    let d_lambda = if alpha == S::ZERO {
        -(jv + gains.rigid_bias * value) / w
    } else {
        -(jv + gains.soft_bias * value + alpha * *lambda) / (w + alpha)
    };
    *lambda += d_lambda;
    *va -= n * (wa * d_lambda);
    *vb += n * (wb * d_lambda);
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
