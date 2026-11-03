//! The XPBD substep (Macklin et al. 2016): predict, project, derive.

use super::Step;
use crate::integrate::{drift, evaluate, kick};
use crate::{Constraint, Particles, Scalar, Vec2};

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
        self.scratch.clear();
        self.scratch.extend_from_slice(&p.pos);
        drift(&mut p.pos, &p.vel, h);

        self.lambda.fill(S::ZERO);
        let alpha_scale = S::ONE / (h * h);
        let prev = &*self.scratch;
        for pass in 0..self.iterations.get() {
            self.order
                .sweep(pass, self.constraints, self.lambda, |c, lambda| {
                    project(p, prev, c, lambda, alpha_scale, h);
                });
        }

        for ((v, &x), &x0) in p.vel.iter_mut().zip(&p.pos).zip(self.scratch.iter()) {
            *v = (x - x0) / h;
        }
    }
}

/// One XPBD projection of `c`, updating its `lambda`. `alpha_scale` is
/// `1 / h²`, so `α̃ = α · alpha_scale`; `prev` holds positions at the start
/// of the substep (for damping). Skipped (no correction) when the gradient
/// is undefined or neither body can move.
///
/// Damped (Macklin et al. 2016, eq. 26), with `γ = α̃ β̃ / h = α c / h`:
/// `Δλ = (−C − α̃ λ − γ n · (Δx_b − Δx_a)) / ((1 + γ) w + α̃)`, where `Δx`
/// is the motion since the substep began. Undamped keeps the M3 formula
/// exactly (its own branch, so goldens are bit-identical).
fn project<S: Scalar, C: Constraint<S>>(
    p: &mut Particles<S>,
    prev: &[Vec2<S>],
    c: &C,
    lambda: &mut S,
    alpha_scale: S,
    h: S,
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
    let gamma = c.compliance() * c.damping() / h;
    let d_lambda = if gamma == S::ZERO {
        let denom = wa + wb + alpha;
        if denom == S::ZERO {
            return;
        }
        (-value - alpha * *lambda) / denom
    } else {
        let (Some(&pa), Some(&pb)) = (prev.get(a), prev.get(b)) else {
            return;
        };
        let rate = n.dot((*xb - pb) - (*xa - pa));
        (-value - alpha * *lambda - gamma * rate) / ((S::ONE + gamma) * (wa + wb) + alpha)
    };
    *lambda += d_lambda;
    *xa -= n * (wa * d_lambda);
    *xb += n * (wb * d_lambda);
}
