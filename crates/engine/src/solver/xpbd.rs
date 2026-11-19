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
    /// One XPBD substep of `dt` seconds (`h` in the formulas):
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
    /// With contacts: found before the kick, impacts resolved by the
    /// impact stage between two half kicks (Generalized Reflections,
    /// `solver/impacts.rs`); then projected after the rods in every pass
    /// (only while overlapping), and the derived velocities' leftover
    /// separation removed by an inelastic velocity pass (Müller et al.
    /// 2020's, at `e = 0`; `docs/08-collision.md`).
    pub(crate) fn xpbd(self, dt: S) {
        let particles = self.particles;
        evaluate(self.forces, particles, self.accelerations);
        let contacts = self.contacts;
        let mut cloth = self.cloth;
        if self.collides {
            let half = dt / (S::ONE + S::ONE);
            contacts.find(
                particles,
                self.statics,
                self.restitution,
                self.accelerations,
                dt,
                self.speculative,
            );
            kick(particles, self.accelerations, half);
            on_cloth(&mut cloth, particles, half);
            impacts::resolve(particles, contacts, dt);
            kick(particles, self.accelerations, half);
            on_cloth(&mut cloth, particles, half);
        } else {
            kick(particles, self.accelerations, dt);
            on_cloth(&mut cloth, particles, dt);
        }
        self.scratch.clear();
        self.scratch.extend_from_slice(&particles.positions);
        drift(particles, dt);

        self.lambda.fill(S::ZERO);
        let alpha_scale = S::ONE / (dt * dt);
        let start_positions = &*self.scratch;
        for pass in 0..self.iterations.get() {
            self.order
                .sweep(pass, self.constraints, self.lambda, |constraint, lambda| {
                    project(
                        particles,
                        start_positions,
                        constraint,
                        lambda,
                        alpha_scale,
                        dt,
                    );
                });
            self.order.sweep(
                pass,
                &contacts.list,
                &mut contacts.lambda,
                |contact, lambda| {
                    project_contact(particles, self.statics, contact, lambda);
                },
            );
        }

        for ((velocity, &position), &start_position) in particles
            .velocities
            .iter_mut()
            .zip(&particles.positions)
            .zip(self.scratch.iter())
        {
            *velocity = (position - start_position) / dt;
        }

        // Impacts already bounced in the impact stage: what still pushed
        // here is resting, or approached too slowly to bounce, so its
        // derived normal velocity goes to 0.
        for (contact, &lambda) in contacts.list.iter().zip(&contacts.lambda) {
            if lambda > S::ZERO {
                settle(particles, self.statics, contact);
            }
        }
    }
}

/// One XPBD contact projection: while `contact` overlaps (gap < 0), push
/// its bodies apart along the current normal by the whole overlap,
/// weighted by inverse mass, and add the correction to `lambda`. Rigid and
/// one-sided: a touching or separated contact does nothing, so λ never
/// decreases.
fn project_contact<S: Scalar>(
    particles: &mut Particles<S>,
    statics: Statics<'_, S>,
    contact: &Contact<S>,
    lambda: &mut S,
) {
    let Some((first, second, first_inv_mass, second_inv_mass)) = bodies(particles, contact) else {
        return;
    };
    let inv_mass_sum = first_inv_mass + second_inv_mass;
    let Some((gap, normal)) = geometry(particles, statics, contact) else {
        return;
    };
    if gap >= S::ZERO || inv_mass_sum == S::ZERO {
        return;
    }
    let delta_lambda = -gap / inv_mass_sum;
    *lambda += delta_lambda;
    push_apart(
        &mut particles.positions,
        first,
        second,
        normal * (first_inv_mass * delta_lambda),
        normal * (second_inv_mass * delta_lambda),
    );
}

/// The velocity pass for one contact that pushed this substep: its
/// normal velocity, along the contact's **current** normal, goes to 0
/// (Müller et al. 2020's pass at `e = 0`). The projection can leave a
/// resting pair separating; this keeps stacks at rest.
fn settle<S: Scalar>(particles: &mut Particles<S>, statics: Statics<'_, S>, contact: &Contact<S>) {
    let Some((first, second, first_inv_mass, second_inv_mass)) = bodies(particles, contact) else {
        return;
    };
    let inv_mass_sum = first_inv_mass + second_inv_mass;
    let Some((_, normal)) = geometry(particles, statics, contact) else {
        return;
    };
    if inv_mass_sum == S::ZERO {
        return;
    }
    let closing_speed = -normal_velocity(particles, contact, normal);
    push_apart(
        &mut particles.velocities,
        first,
        second,
        normal * (first_inv_mass / inv_mass_sum * closing_speed),
        normal * (second_inv_mass / inv_mass_sum * closing_speed),
    );
}

/// One XPBD projection of `constraint`, updating its `lambda`.
/// `alpha_scale` is `1 / h²`, so `α̃ = α · alpha_scale`; `start_positions`
/// holds positions at the start of the substep (for damping). Skipped (no
/// correction) when the gradient is undefined or neither body can move.
///
/// Damped (Macklin et al. 2016, eq. 26), with `γ = α̃ β̃ / h = α c / h`:
/// `Δλ = (−C − α̃ λ − γ n · (Δx_b − Δx_a)) / ((1 + γ) w + α̃)`, where `Δx`
/// is the motion since the substep began. Undamped keeps its own branch so
/// its results are bit-identical to the formula without `γ`.
fn project<S: Scalar, C: Constraint<S>>(
    particles: &mut Particles<S>,
    start_positions: &[Vec2<S>],
    constraint: &C,
    lambda: &mut S,
    alpha_scale: S,
    dt: S,
) {
    let [first, second] = constraint.bodies().map(crate::ParticleId::index);
    let (Some(&first_inv_mass), Some(&second_inv_mass)) = (
        particles.inverse_mass.get(first),
        particles.inverse_mass.get(second),
    ) else {
        return;
    };
    // Disjoint by construction (`between` rejects the same body twice).
    let Ok([first_position, second_position]) =
        particles.positions.get_disjoint_mut([first, second])
    else {
        return;
    };
    let (value, Some(normal)) = constraint.evaluate(*first_position, *second_position) else {
        return;
    };
    let alpha = constraint.compliance() * alpha_scale;
    let gamma = constraint.compliance() * constraint.damping() / dt;
    let delta_lambda = if gamma == S::ZERO {
        let denominator = first_inv_mass + second_inv_mass + alpha;
        if denominator == S::ZERO {
            return;
        }
        (-value - alpha * *lambda) / denominator
    } else {
        let (Some(&first_start), Some(&second_start)) =
            (start_positions.get(first), start_positions.get(second))
        else {
            return;
        };
        let rate = normal.dot((*second_position - second_start) - (*first_position - first_start));
        (-value - alpha * *lambda - gamma * rate)
            / ((S::ONE + gamma) * (first_inv_mass + second_inv_mass) + alpha)
    };
    *lambda += delta_lambda;
    *first_position -= normal * (first_inv_mass * delta_lambda);
    *second_position += normal * (second_inv_mass * delta_lambda);
}
