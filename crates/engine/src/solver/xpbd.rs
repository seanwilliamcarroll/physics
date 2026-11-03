//! The XPBD substep (Macklin et al. 2016): predict, project, derive.

use super::Step;
use super::contacts::{bodies, geometry, normal_velocity, normal_velocity_in, push_apart};
use crate::collision::Contact;
use crate::integrate::{drift, evaluate, kick};
use crate::{Constraint, Particles, Scalar, Vec2, Wall};

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
    /// With contacts (M6): found after the kick, projected after the rods
    /// in every pass (only while overlapping), and followed by the
    /// restitution pass on the derived velocities (Müller et al. 2020;
    /// `docs/08-collision.md`).
    pub(crate) fn xpbd(self, h: S) {
        let p = self.particles;
        evaluate(self.forces, p, self.acc);
        kick(&mut p.vel, self.acc, h);
        let contacts = self.contacts;
        if self.collides {
            contacts.find(p, self.walls, self.acc, h);
        }
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
            self.order
                .sweep(pass, &contacts.list, &mut contacts.lambda, |c, lambda| {
                    project_contact(p, self.walls, c, lambda);
                });
        }

        for ((v, &x), &x0) in p.vel.iter_mut().zip(&p.pos).zip(self.scratch.iter()) {
            *v = (x - x0) / h;
        }

        let e = self.restitution.get();
        for ((c, &lambda), &rest) in contacts
            .list
            .iter()
            .zip(&contacts.lambda)
            .zip(&contacts.rest_speed)
        {
            if lambda > S::ZERO {
                restitute(p, self.walls, c, &contacts.vel_before, rest, e);
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
    walls: &[Wall<S>],
    c: &Contact<S>,
    lambda: &mut S,
) {
    let Some((a, b, wa, wb)) = bodies(p, c) else {
        return;
    };
    let w = wa + wb;
    let Some((gap, n)) = geometry(p, walls, c) else {
        return;
    };
    if gap >= S::ZERO || w == S::ZERO {
        return;
    }
    let d_lambda = -gap / w;
    *lambda += d_lambda;
    push_apart(&mut p.pos, a, b, n * (wa * d_lambda), n * (wb * d_lambda));
}

/// The velocity pass for one contact that pushed this substep (Müller et
/// al. 2020): replace its normal velocity with `max(−e v_n⁻, 0)`. Both
/// are measured along the contact's **current** normal: `v_n⁻` from the
/// velocities saved before the solve (`vel_before`). Measuring `v_n⁻`
/// along the normal from when the contact was found instead gains energy
/// on every glancing elastic hit, in proportion to `h` (the normal turns
/// during the substep; found in M6.5). Approaches no faster than `rest`
/// get `e = 0`. With `e = 0` this removes whatever separating speed the
/// position projection left behind.
fn restitute<S: Scalar>(
    p: &mut Particles<S>,
    walls: &[Wall<S>],
    c: &Contact<S>,
    vel_before: &[Vec2<S>],
    rest: S,
    e: S,
) {
    let Some((a, b, wa, wb)) = bodies(p, c) else {
        return;
    };
    let w = wa + wb;
    let Some((_, n)) = geometry(p, walls, c) else {
        return;
    };
    if w == S::ZERO {
        return;
    }
    let approach = normal_velocity_in(vel_before, c, n);
    let e = if -approach > rest { e } else { S::ZERO };
    let target = -e * approach;
    let target = if target > S::ZERO { target } else { S::ZERO };
    let dv = target - normal_velocity(p, c, n);
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
