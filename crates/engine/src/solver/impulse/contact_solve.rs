//! Contacts in the sequential-impulse substep (`docs/08-collision.md`,
//! "Sequential impulses"): the accumulated clamp, speculative targets, and
//! split pseudo-impulses. Restitution is the impact stage's
//! (`solver/impacts.rs`).

use crate::collision::Contact;
use crate::solver::contacts::{bodies, normal_velocity, normal_velocity_in, push_apart};
use crate::{Particles, Scalar, Vec2};

/// What a contact solve needs besides the contact.
#[derive(Copy, Clone)]
pub(super) struct ContactGains<S> {
    pub(super) dt: S,
    /// `β / h`: the rate penetration is corrected at (pseudo-velocity in
    /// split mode, real velocity in classic Baumgarte).
    pub(super) bias: S,
    /// Overlap left uncorrected, m.
    pub(super) slop: S,
    /// Whether the bias goes to the real velocity (classic Baumgarte)
    /// instead of the pseudo-velocity.
    pub(super) classic: bool,
}

/// Applies a contact's (warm-start) impulse `lambda` along its normal.
pub(super) fn apply<S: Scalar>(particles: &mut Particles<S>, contact: &Contact<S>, lambda: S) {
    let Some((first, second, first_inv_mass, second_inv_mass)) = bodies(particles, contact) else {
        return;
    };
    push_apart(
        &mut particles.vel,
        first,
        second,
        contact.normal * (first_inv_mass * lambda),
        contact.normal * (second_inv_mass * lambda),
    );
}

/// The bias velocity for a gap: what pushes an overlap back out,
/// `(β / h) · max(−(gap + slop), 0)`.
fn bias<S: Scalar>(gap: S, gains: ContactGains<S>) -> S {
    let depth = -(gap + gains.slop);
    if depth > S::ZERO {
        gains.bias * depth
    } else {
        S::ZERO
    }
}

/// One velocity solve of a contact toward `target_velocity`, clamping the
/// **accumulated** impulse at ≥ 0 (Catto 2006): a pass may take back an
/// earlier overshoot, but the contact never pulls.
fn solve_toward<S: Scalar>(
    velocities: &mut [Vec2<S>],
    contact_bodies: (usize, Option<usize>, S, S),
    contact: &Contact<S>,
    current_normal_velocity: S,
    target_velocity: S,
    lambda: &mut S,
) {
    let (first, second, first_inv_mass, second_inv_mass) = contact_bodies;
    let inv_mass_sum = first_inv_mass + second_inv_mass;
    if inv_mass_sum == S::ZERO {
        return;
    }
    let total = *lambda - (current_normal_velocity - target_velocity) / inv_mass_sum;
    let total = if total > S::ZERO { total } else { S::ZERO };
    let delta_lambda = total - *lambda;
    *lambda = total;
    push_apart(
        velocities,
        first,
        second,
        contact.normal * (first_inv_mass * delta_lambda),
        contact.normal * (second_inv_mass * delta_lambda),
    );
}

/// The real-velocity solve: a separated contact may close by at most its
/// gap this substep (`v_target = −gap / h`, speculative); a touching or
/// overlapping one targets 0, plus the bias in classic Baumgarte.
pub(super) fn solve<S: Scalar>(
    particles: &mut Particles<S>,
    contact: &Contact<S>,
    lambda: &mut S,
    gains: ContactGains<S>,
) {
    let Some(contact_bodies) = bodies(particles, contact) else {
        return;
    };
    let target_velocity = if contact.gap > S::ZERO {
        -contact.gap / gains.dt
    } else if gains.classic {
        bias(contact.gap, gains)
    } else {
        S::ZERO
    };
    let current_normal_velocity = normal_velocity(particles, contact, contact.normal);
    solve_toward(
        &mut particles.vel,
        contact_bodies,
        contact,
        current_normal_velocity,
        target_velocity,
        lambda,
    );
}

/// The split pseudo-velocity solve: pushes an overlap out through
/// `pseudo_velocities`, which move positions this substep only, so
/// penetration correction never becomes bounce. One-sided, accumulated in
/// `pseudo_lambda`.
pub(super) fn solve_pseudo<S: Scalar>(
    particles: &Particles<S>,
    pseudo_velocities: &mut [Vec2<S>],
    contact: &Contact<S>,
    pseudo_lambda: &mut S,
    gains: ContactGains<S>,
) {
    let Some(contact_bodies) = bodies(particles, contact) else {
        return;
    };
    let current_normal_velocity = normal_velocity_in(pseudo_velocities, contact, contact.normal);
    solve_toward(
        pseudo_velocities,
        contact_bodies,
        contact,
        current_normal_velocity,
        bias(contact.gap, gains),
        pseudo_lambda,
    );
}
