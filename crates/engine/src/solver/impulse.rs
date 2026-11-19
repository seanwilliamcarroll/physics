//! The sequential-impulse substep (Catto 2005, 2006; soft form 2011).

mod contact_solve;

use contact_solve::ContactGains;

use super::contacts::CONTACT_SLOP;
use super::impacts;
use super::on_cloth;
use super::{Stabilization, Step};
use crate::integrate::{drift, drift_split, evaluate, kick};
use crate::{Constraint, Particles, Scalar, Vec2};

impl<S: Scalar, C: Constraint<S>> Step<'_, S, C> {
    /// One sequential-impulse substep of `dt` seconds (`h` in the
    /// formulas):
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
    /// warm starting only changes rounding; chains need it.
    ///
    /// With [`Stabilization::Split`], a rigid rod's bias goes to a separate
    /// pseudo-velocity instead (`solve_split`), and `x += h (v + v_pseudo)`.
    ///
    /// With contacts: found before the kick; impacts resolved by the
    /// impact stage (Generalized Reflections, `solver/impacts.rs`)
    /// between two half kicks; then warm-started by pair and solved after
    /// the rods each pass, inelastically (accumulated clamp, speculative
    /// targets, a one-sided pseudo-impulse in split mode); their impulses
    /// are kept for the next substep's warm start (`docs/08-collision.md`).
    #[expect(clippy::too_many_lines, reason = "one substep, read top to bottom")]
    pub(crate) fn impulse(self, dt: S) {
        let particles = self.particles;
        evaluate(self.forces, particles, self.acc);
        let contacts = self.contacts;
        let mut cloth = self.cloth;
        // Impacts resolve between two half kicks. A bounce's true outcome
        // depends on when in the substep it lands (`v − g h (1 − 2τ)` for a
        // falling ball hitting at fraction τ): reflecting after the whole
        // kick assumes τ = 1 and gains `g h` a bounce (a lone bounce rose
        // 2% above its drop), before it τ = 0 and loses it (−0.86% a
        // bounce). Between halves is τ = ½: unbiased.
        let half = dt / (S::ONE + S::ONE);
        if self.collides {
            contacts.find(
                particles,
                self.statics,
                self.restitution,
                self.acc,
                dt,
                self.speculative,
            );
            kick(particles, self.acc, half);
            on_cloth(&mut cloth, particles, half);
            impacts::resolve(particles, contacts, dt);
            kick(particles, self.acc, half);
            on_cloth(&mut cloth, particles, half);
        } else {
            kick(particles, self.acc, dt);
            on_cloth(&mut cloth, particles, dt);
        }
        if self.collides {
            contacts.recall();
            for (contact, &lambda) in contacts.list.iter().zip(&contacts.lambda) {
                contact_solve::apply(particles, contact, lambda);
            }
        }
        let contact_gains = ContactGains {
            dt,
            bias: self.baumgarte.get() / dt,
            slop: S::from_f64(CONTACT_SLOP),
            classic: self.stabilization == Stabilization::Baumgarte,
        };
        // Warm start rigid constraints only. A soft constraint's λ feeds
        // back into its own update (the `α̃ λ` term), so carrying it across
        // substeps re-injects the previous substep's bias each time: on an
        // unconverged network (the jelly, one pass) that pumps energy in
        // without bound (`docs/07-soft-bodies.md`, "Soft constraints aren't
        // warm-started").
        for (constraint, lambda) in self.constraints.iter().zip(self.lambda.iter_mut()) {
            if constraint.compliance() == S::ZERO {
                apply_impulse(particles, constraint, *lambda);
            } else {
                *lambda = S::ZERO;
            }
        }
        let gains = Gains {
            rigid_bias: self.baumgarte.get() / dt,
            soft_bias: S::ONE / dt,
            alpha_scale: S::ONE / (dt * dt),
            dt,
        };
        match self.stabilization {
            Stabilization::Baumgarte => {
                for pass in 0..self.iterations.get() {
                    self.order
                        .sweep(pass, self.constraints, self.lambda, |constraint, lambda| {
                            solve_velocity(particles, constraint, lambda, gains);
                        });
                    self.order.sweep(
                        pass,
                        &contacts.list,
                        &mut contacts.lambda,
                        |contact, lambda| {
                            contact_solve::solve(particles, contact, lambda, contact_gains);
                        },
                    );
                }
                drift(particles, dt);
                contacts.remember();
            }
            Stabilization::Split => {
                let pseudo_velocities = self.scratch;
                pseudo_velocities.clear();
                pseudo_velocities.resize(particles.pos.len(), Vec2::ZERO);
                for pass in 0..self.iterations.get() {
                    self.order
                        .sweep(pass, self.constraints, self.lambda, |constraint, lambda| {
                            solve_split(particles, pseudo_velocities, constraint, lambda, gains);
                        });
                    self.order.sweep(
                        pass,
                        &contacts.list,
                        &mut contacts.lambda,
                        |contact, lambda| {
                            contact_solve::solve(particles, contact, lambda, contact_gains);
                        },
                    );
                    self.order.sweep(
                        pass,
                        &contacts.list,
                        &mut contacts.pseudo_lambda,
                        |contact, lambda| {
                            contact_solve::solve_pseudo(
                                particles,
                                pseudo_velocities,
                                contact,
                                lambda,
                                contact_gains,
                            );
                        },
                    );
                }
                // Positions move by the real and the pseudo-velocity; only
                // the real one is kept.
                drift_split(particles, pseudo_velocities, dt);
                contacts.remember();
            }
        }
    }
}

/// The bodies of `constraint` as `(first, second, first_inv_mass,
/// second_inv_mass)`, or `None` if either isn't in `particles`.
fn masses<S: Scalar, C: Constraint<S>>(
    particles: &Particles<S>,
    constraint: &C,
) -> Option<(usize, usize, S, S)> {
    let [first, second] = constraint.bodies().map(crate::ParticleId::index);
    Some((
        first,
        second,
        *particles.inv_mass.get(first)?,
        *particles.inv_mass.get(second)?,
    ))
}

/// Applies impulse `lambda` along `constraint`'s gradient: `v_a −= w_a n λ`,
/// `v_b += w_b n λ`. Nothing if the gradient is undefined.
fn apply_impulse<S: Scalar, C: Constraint<S>>(
    particles: &mut Particles<S>,
    constraint: &C,
    lambda: S,
) {
    let Some((first, second, first_inv_mass, second_inv_mass)) = masses(particles, constraint)
    else {
        return;
    };
    let (Some(&first_position), Some(&second_position)) =
        (particles.pos.get(first), particles.pos.get(second))
    else {
        return;
    };
    let (_, Some(normal)) = constraint.evaluate(first_position, second_position) else {
        return;
    };
    let Ok([first_velocity, second_velocity]) = particles.vel.get_disjoint_mut([first, second])
    else {
        return;
    };
    *first_velocity -= normal * (first_inv_mass * lambda);
    *second_velocity += normal * (second_inv_mass * lambda);
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
    dt: S,
}

/// One velocity solve of `constraint`, updating its accumulated `lambda`:
/// rigid `Δλ = −(Jv + (β/h) C) / w`; compliant (Catto's soft form)
/// `Δλ = −(Jv + C/h + α̃ λ) / (w + α̃)`. Two branches rather than the soft
/// formula with α = 0: adding `0 · λ` can flip a zero's sign, and the
/// rigid path stays bit-identical. Skipped when the gradient is undefined
/// or neither body can move.
fn solve_velocity<S: Scalar, C: Constraint<S>>(
    particles: &mut Particles<S>,
    constraint: &C,
    lambda: &mut S,
    gains: Gains<S>,
) {
    let Some((first, second, first_inv_mass, second_inv_mass)) = masses(particles, constraint)
    else {
        return;
    };
    let inv_mass_sum = first_inv_mass + second_inv_mass;
    let (Some(&first_position), Some(&second_position)) =
        (particles.pos.get(first), particles.pos.get(second))
    else {
        return;
    };
    let (value, Some(normal)) = constraint.evaluate(first_position, second_position) else {
        return;
    };
    if inv_mass_sum == S::ZERO {
        return;
    }
    let Ok([first_velocity, second_velocity]) = particles.vel.get_disjoint_mut([first, second])
    else {
        return;
    };
    let relative_speed = normal.dot(*second_velocity - *first_velocity);
    let alpha = constraint.compliance() * gains.alpha_scale;
    let damping = constraint.damping();
    let delta_lambda = if alpha == S::ZERO {
        -(relative_speed + gains.rigid_bias * value) / inv_mass_sum
    } else if damping == S::ZERO {
        -(relative_speed + gains.soft_bias * value + alpha * *lambda) / (inv_mass_sum + alpha)
    } else {
        // Catto 2011 with a damper: γ = 1 / (h (c + h k)), bias
        // C / (α c + h); with c = 0 these are α̃ and C / h (branch above).
        let (compliance, dt) = (constraint.compliance(), gains.dt);
        let gamma = compliance / (dt * (compliance * damping + dt));
        let bias = value / (compliance * damping + dt);
        -(relative_speed + bias + gamma * *lambda) / (inv_mass_sum + gamma)
    };
    *lambda += delta_lambda;
    *first_velocity -= normal * (first_inv_mass * delta_lambda);
    *second_velocity += normal * (second_inv_mass * delta_lambda);
}

/// One split-impulse solve of `constraint`: the real velocity gets the
/// impulse that zeroes `Jv` (accumulated in `lambda`, warm-started next
/// substep); a rigid rod's Baumgarte bias goes to `pseudo_velocities`
/// instead, which move positions this substep only. Compliant rods have no
/// stabilization to split (their `C/h` term is the spring itself), so they
/// take the normal soft solve.
fn solve_split<S: Scalar, C: Constraint<S>>(
    particles: &mut Particles<S>,
    pseudo_velocities: &mut [Vec2<S>],
    constraint: &C,
    lambda: &mut S,
    gains: Gains<S>,
) {
    if constraint.compliance() != S::ZERO {
        solve_velocity(particles, constraint, lambda, gains);
        return;
    }
    let Some((first, second, first_inv_mass, second_inv_mass)) = masses(particles, constraint)
    else {
        return;
    };
    let inv_mass_sum = first_inv_mass + second_inv_mass;
    let (Some(&first_position), Some(&second_position)) =
        (particles.pos.get(first), particles.pos.get(second))
    else {
        return;
    };
    let (value, Some(normal)) = constraint.evaluate(first_position, second_position) else {
        return;
    };
    if inv_mass_sum == S::ZERO {
        return;
    }
    let (Ok([first_velocity, second_velocity]), Ok([first_pseudo, second_pseudo])) = (
        particles.vel.get_disjoint_mut([first, second]),
        pseudo_velocities.get_disjoint_mut([first, second]),
    ) else {
        return;
    };
    let delta_lambda = -normal.dot(*second_velocity - *first_velocity) / inv_mass_sum;
    *lambda += delta_lambda;
    *first_velocity -= normal * (first_inv_mass * delta_lambda);
    *second_velocity += normal * (second_inv_mass * delta_lambda);
    let delta_pseudo =
        -(normal.dot(*second_pseudo - *first_pseudo) + gains.rigid_bias * value) / inv_mass_sum;
    *first_pseudo -= normal * (first_inv_mass * delta_pseudo);
    *second_pseudo += normal * (second_inv_mass * delta_pseudo);
}
