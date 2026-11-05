//! The sequential-impulse substep (Catto 2005, 2006; soft form 2011).

mod contact_solve;

use contact_solve::ContactGains;

use super::contacts::CONTACT_SLOP;
use super::{Stabilization, Step};
use crate::integrate::{drift, drift_split, evaluate, kick};
use crate::{Constraint, Particles, Scalar, Vec2};

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
    ///
    /// With [`Stabilization::Split`], a rigid rod's bias goes to a separate
    /// pseudo-velocity instead (`solve_split`), and `x += h (v + v_pseudo)`.
    ///
    /// With contacts (M6): found after the kick and warm-started by pair;
    /// solved after the rods each pass (accumulated clamp, speculative
    /// targets, a one-sided pseudo-impulse in split mode); then the
    /// restitution pass; their impulses are kept for the next substep
    /// (`docs/08-collision.md`).
    pub(crate) fn impulse(self, h: S) {
        let p = self.particles;
        evaluate(self.forces, p, self.acc);
        kick(p, self.acc, h);
        let contacts = self.contacts;
        if self.collides {
            contacts.find(p, self.walls, self.acc, h);
            contacts.recall();
            for (c, &lambda) in contacts.list.iter().zip(&contacts.lambda) {
                contact_solve::apply(p, c, lambda);
            }
        }
        let cg = ContactGains {
            h,
            bias: self.baumgarte.get() / h,
            slop: S::from_f64(CONTACT_SLOP),
            classic: self.stabilization == Stabilization::Baumgarte,
        };
        // Warm start rigid constraints only. A soft constraint's λ feeds
        // back into its own update (the `α̃ λ` term), so carrying it across
        // substeps re-injects the previous substep's bias each time: on an
        // unconverged network (the jelly, one pass) that pumps energy in
        // without bound, the M4 Baumgarte mechanism through the soft form.
        // Soft λ restarts at 0 each substep instead (M5.5,
        // `docs/07-soft-bodies.md`, "Soft constraints aren't warm-started").
        for (c, lambda) in self.constraints.iter().zip(self.lambda.iter_mut()) {
            if c.compliance() == S::ZERO {
                apply_impulse(p, c, *lambda);
            } else {
                *lambda = S::ZERO;
            }
        }
        let gains = Gains {
            rigid_bias: self.baumgarte.get() / h,
            soft_bias: S::ONE / h,
            alpha_scale: S::ONE / (h * h),
            h,
        };
        match self.stabilization {
            Stabilization::Baumgarte => {
                for pass in 0..self.iterations.get() {
                    self.order
                        .sweep(pass, self.constraints, self.lambda, |c, lambda| {
                            solve_velocity(p, c, lambda, gains);
                        });
                    self.order
                        .sweep(pass, &contacts.list, &mut contacts.lambda, |c, lambda| {
                            contact_solve::solve(p, c, lambda, cg);
                        });
                }
                drift(p, h);
                restitution_pass(p, contacts, self.restitution.get());
            }
            Stabilization::Split => {
                let pseudo = self.scratch;
                pseudo.clear();
                pseudo.resize(p.pos.len(), Vec2::ZERO);
                for pass in 0..self.iterations.get() {
                    self.order
                        .sweep(pass, self.constraints, self.lambda, |c, lambda| {
                            solve_split(p, pseudo, c, lambda, gains);
                        });
                    self.order
                        .sweep(pass, &contacts.list, &mut contacts.lambda, |c, lambda| {
                            contact_solve::solve(p, c, lambda, cg);
                        });
                    self.order.sweep(
                        pass,
                        &contacts.list,
                        &mut contacts.pseudo_lambda,
                        |c, lambda| contact_solve::solve_pseudo(p, pseudo, c, lambda, cg),
                    );
                }
                // Positions move by the real and the pseudo-velocity; only
                // the real one is kept.
                drift_split(p, pseudo, h);
                restitution_pass(p, contacts, self.restitution.get());
            }
        }
    }
}

/// Keeps the contacts' impulses for the next substep's warm start, then
/// applies restitution to every contact that pushed this substep. Runs
/// after positions move (`Box2D` v3's order), so a bounce takes effect
/// from the next substep.
///
/// Both orders matter (M6.6, a box of balls at `e = 1`):
/// - **Remember before restituting.** A bounced pair usually stays within
///   `CONTACT_MARGIN` for the next substep, so warm-starting with the
///   bounce impulse re-applies the bounce; with two contacts on a ball
///   (one against a wall) one pass can't take it back, and the leftover is
///   energy: +14 J of step-to-step rises over 20 s at 10 substeps, vs
///   +4 J without it.
/// - **Restitute after the drift.** Before it, the ball rebounded from
///   where it started the substep, never travelling the gap to the
///   surface: a dropped ball bounced 2% above its release height.
fn restitution_pass<S: Scalar>(p: &mut Particles<S>, contacts: &mut super::Contacts<S>, e: S) {
    contacts.remember();
    for (((c, lambda), &approach), &rest) in contacts
        .list
        .iter()
        .zip(contacts.lambda.iter_mut())
        .zip(&contacts.approach)
        .zip(&contacts.rest_speed)
    {
        contact_solve::restitute(p, c, lambda, approach, rest, e);
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
    /// The substep, s (the damped soft form needs it directly).
    h: S,
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
    let damping = c.damping();
    let d_lambda = if alpha == S::ZERO {
        -(jv + gains.rigid_bias * value) / w
    } else if damping == S::ZERO {
        -(jv + gains.soft_bias * value + alpha * *lambda) / (w + alpha)
    } else {
        // Catto 2011 with a damper: γ = 1 / (h (c + h k)), bias
        // C / (α c + h); with c = 0 these are α̃ and C / h (branch above).
        let (compliance, h) = (c.compliance(), gains.h);
        let gamma = compliance / (h * (compliance * damping + h));
        let bias = value / (compliance * damping + h);
        -(jv + bias + gamma * *lambda) / (w + gamma)
    };
    *lambda += d_lambda;
    *va -= n * (wa * d_lambda);
    *vb += n * (wb * d_lambda);
}

/// One split-impulse solve of `c`: the real velocity gets the impulse that
/// zeroes `Jv` (accumulated in `lambda`, warm-started next substep); a
/// rigid rod's Baumgarte bias goes to `pseudo` instead, which moves
/// positions this substep only. Compliant rods have no stabilization to
/// split (their `C/h` term is the spring itself), so they take the normal
/// soft solve.
fn solve_split<S: Scalar, C: Constraint<S>>(
    p: &mut Particles<S>,
    pseudo: &mut [Vec2<S>],
    c: &C,
    lambda: &mut S,
    gains: Gains<S>,
) {
    if c.compliance() != S::ZERO {
        solve_velocity(p, c, lambda, gains);
        return;
    }
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
    let (Ok([va, vb]), Ok([pa, pb])) = (
        p.vel.get_disjoint_mut([a, b]),
        pseudo.get_disjoint_mut([a, b]),
    ) else {
        return;
    };
    let d_lambda = -n.dot(*vb - *va) / w;
    *lambda += d_lambda;
    *va -= n * (wa * d_lambda);
    *vb += n * (wb * d_lambda);
    let d_pseudo = -(n.dot(*pb - *pa) + gains.rigid_bias * value) / w;
    *pa -= n * (wa * d_pseudo);
    *pb += n * (wb * d_pseudo);
}
