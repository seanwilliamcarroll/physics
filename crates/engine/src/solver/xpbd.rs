//! The XPBD substep (Macklin et al. 2016): predict, project, derive.

use super::Step;
use super::contacts::{bodies, geometry, normal_velocity, push_apart};
use super::impacts;
use super::on_cloth;
use crate::collision::Contact;
use crate::collision::Statics;
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
    ///
    /// With contacts (M6): found before the kick, impacts resolved by the
    /// impact stage between two half kicks (Generalized Reflections,
    /// `solver/impacts.rs`, as in the impulse solver); then projected
    /// after the rods in every pass (only while overlapping), and the
    /// derived velocities' leftover separation removed by an inelastic
    /// velocity pass (Müller et al. 2020's, at `e = 0`: bouncing is the
    /// impact stage's; `docs/08-collision.md`).
    pub(crate) fn xpbd(self, h: S) {
        let p = self.particles;
        evaluate(self.forces, p, self.acc);
        let contacts = self.contacts;
        let mut cloth = self.cloth;
        if self.collides {
            let half = h / (S::ONE + S::ONE);
            contacts.find(p, self.statics, self.restitution, self.acc, h);
            kick(p, self.acc, half);
            on_cloth(&mut cloth, p, half);
            impacts::resolve(p, contacts, h);
            kick(p, self.acc, half);
            on_cloth(&mut cloth, p, half);
        } else {
            kick(p, self.acc, h);
            on_cloth(&mut cloth, p, h);
        }
        self.scratch.clear();
        self.scratch.extend_from_slice(&p.pos);
        drift(p, h);

        self.lambda.fill(S::ZERO);
        let alpha_scale = S::ONE / (h * h);
        let prev = &*self.scratch;
        for pass in 0..self.iterations.get() {
            self.order
                .sweep(pass, self.constraints, self.lambda, |c, lambda| {
                    project(p, prev, c, lambda, alpha_scale, h);
                });
            self.order
                .sweep(pass, &contacts.list, &mut contacts.lambda, |c, lambda| {
                    project_contact(p, self.statics, c, lambda);
                });
        }

        for ((v, &x), &x0) in p.vel.iter_mut().zip(&p.pos).zip(self.scratch.iter()) {
            *v = (x - x0) / h;
        }

        // Impacts already bounced in the impact stage: what still pushed
        // here is resting, or approached too slowly to bounce, so its
        // derived normal velocity goes to 0 (no separation left over from
        // the projection).
        for (c, &lambda) in contacts.list.iter().zip(&contacts.lambda) {
            if lambda > S::ZERO {
                settle(p, self.statics, c);
            }
        }
    }
}

/// One XPBD contact projection: while `c` overlaps (gap < 0), push its
/// bodies apart along the current normal by the whole overlap, weighted by
/// inverse mass, and add the correction to `lambda`. Rigid, and one-sided:
/// a touching or separated contact does nothing, so λ never decreases.
fn project_contact<S: Scalar>(
    p: &mut Particles<S>,
    statics: Statics<'_, S>,
    c: &Contact<S>,
    lambda: &mut S,
) {
    let Some((a, b, wa, wb)) = bodies(p, c) else {
        return;
    };
    let w = wa + wb;
    let Some((gap, n)) = geometry(p, statics, c) else {
        return;
    };
    if gap >= S::ZERO || w == S::ZERO {
        return;
    }
    let d_lambda = -gap / w;
    *lambda += d_lambda;
    push_apart(&mut p.pos, a, b, n * (wa * d_lambda), n * (wb * d_lambda));
}

/// The velocity pass for one contact that pushed this substep: its
/// normal velocity, along the contact's **current** normal, goes to 0
/// (Müller et al. 2020's pass at `e = 0`). The projection can leave a
/// resting pair separating; this keeps stacks at rest. Bouncing is the
/// impact stage's (`solver/impacts.rs`).
fn settle<S: Scalar>(p: &mut Particles<S>, statics: Statics<'_, S>, c: &Contact<S>) {
    let Some((a, b, wa, wb)) = bodies(p, c) else {
        return;
    };
    let w = wa + wb;
    let Some((_, n)) = geometry(p, statics, c) else {
        return;
    };
    if w == S::ZERO {
        return;
    }
    let dv = -normal_velocity(p, c, n);
    push_apart(&mut p.vel, a, b, n * (wa / w * dv), n * (wb / w * dv));
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
