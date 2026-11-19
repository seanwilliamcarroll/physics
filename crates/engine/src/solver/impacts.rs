//! The impact stage: Generalized Reflections (Smith, Kaufman, Vouga,
//! Tamstorf & Grinspun, "Reflections on Simultaneous Impact", SIGGRAPH
//! 2012; `docs/08-collision.md`, "Simultaneous impacts").
//!
//! Runs after the kick, before the iterations, on the velocities as they
//! arrive. In rounds:
//!
//! ```text
//! V ← the contacts approaching now (faster than the resting speed) that
//!     close this substep
//! if V is empty: done
//! λ̃ ← V's inelastic impulses, solved jointly (projected Gauss–Seidel
//!     over V alone, to convergence)
//! add e λ̃ more: in all (1 + e) λ̃, V's approach reflected and scaled by e
//! ```
//!
//! Each contact bounces with its own restitution, except that a round's
//! contacts **coupled through a shared ball** all bounce with the group's
//! smallest `e`: with one `e` per group a round's energy change is
//! `−½ (1 − e²) λ̃ᵀ K λ̃ ≤ 0`; with mixed `e` it can be positive (a ball
//! squeezed between a ball and a cushion gained 2.5% at e = 1 and 0.5:
//! `docs/09-billiards.md`, "Restitution per contact").
//!
//! A contact joins a round only once something pushes into it, so an
//! impact travels down a touching row one round per contact (Newton's
//! cradle), and contacts struck at once are solved together
//! (`tests/impacts.rs`).

use crate::collision::{Body, Contact};
use crate::solver::Contacts;
use crate::solver::contacts::{bodies, normal_velocity, push_apart};
use crate::{Particles, Scalar};

/// Most rounds per substep, per contact (an impact passes one contact per
/// round), and at most [`MAX_ROUNDS`]. Past it, what still approaches is
/// left to the iterations, which treat it inelastically: with `e < 1`
/// propagation can shrink without ending (the paper's inelastic collapse).
const ROUNDS_PER_CONTACT: usize = 4;
const MAX_ROUNDS: usize = 100;

/// Sweeps of a round's joint solve at most, and its convergence test: the
/// largest change in a sweep, relative to the largest impulse.
const MAX_SWEEPS: usize = 100;
const CONVERGED: f64 = 1e-12;

/// Resolves this substep's impacts, each contact at its own restitution
/// (`Contacts::restitution`; see the module doc). Nothing when every `e`
/// is 0: the iterations' inelastic solve is that case already.
pub(crate) fn resolve<S: Scalar>(particles: &mut Particles<S>, contacts: &mut Contacts<S>, dt: S) {
    let Contacts {
        list,
        rest_speed,
        kick_normal_velocity,
        restitution,
        in_round,
        round_impulse,
        group,
        group_restitution,
        round_restitution,
        ..
    } = contacts;
    let mixed = restitution
        .windows(2)
        .any(|pair| pair.first() != pair.get(1));
    let contact_count = list.len();
    if restitution.iter().all(|&e| e == S::ZERO) {
        return;
    }
    in_round.clear();
    in_round.resize(contact_count, false);
    round_impulse.clear();
    round_impulse.resize(contact_count, S::ZERO);
    let rounds = (ROUNDS_PER_CONTACT * contact_count).min(MAX_ROUNDS);
    let half = S::ONE / (S::ONE + S::ONE);
    for _ in 0..rounds {
        let mut any = false;
        for ((((contact, &rest), &kick), member), lambda) in list
            .iter()
            .zip(rest_speed.iter())
            .zip(kick_normal_velocity.iter())
            .zip(in_round.iter_mut())
            .zip(round_impulse.iter_mut())
        {
            let current_normal_velocity = normal_velocity(particles, contact, contact.normal);
            // Approaching faster than resting, and closing this substep once
            // the second half kick is added: else the speculative stop would
            // catch it at the surface with no bounce left.
            *member = -current_normal_velocity > rest
                && contact.gap + (current_normal_velocity + kick * half) * dt <= S::ZERO;
            *lambda = S::ZERO;
            any |= *member;
        }
        if !any {
            return;
        }
        solve_inelastic(particles, list, in_round, round_impulse);
        let bounce: &[S] = if mixed {
            coupled_restitution(
                particles.positions.len(),
                list,
                in_round,
                restitution,
                group,
                group_restitution,
                round_restitution,
            );
            round_restitution
        } else {
            restitution
        };
        for (((contact, &member), &lambda), &e) in list
            .iter()
            .zip(in_round.iter())
            .zip(round_impulse.iter())
            .zip(bounce.iter())
        {
            if member {
                apply(particles, contact, e * lambda);
            }
        }
    }
}

/// Each round member's restitution for this round: the smallest `e` among
/// the members coupled to it through shared particles (a union-find over
/// `particle_count` particles in `group`). Statics don't couple: they
/// don't move.
fn coupled_restitution<S: Scalar>(
    particle_count: usize,
    list: &[Contact<S>],
    in_round: &[bool],
    restitution: &[S],
    group: &mut Vec<usize>,
    group_restitution: &mut Vec<S>,
    round_restitution: &mut Vec<S>,
) {
    group.clear();
    group.extend(0..particle_count);
    for (contact, &member) in list.iter().zip(in_round) {
        if let (true, Body::Particle(second)) = (member, contact.b) {
            union(group, contact.a.index(), second.index());
        }
    }
    group_restitution.clear();
    group_restitution.resize(particle_count, S::ONE);
    for ((contact, &member), &e) in list.iter().zip(in_round).zip(restitution) {
        if member {
            let root = find(group, contact.a.index());
            if let Some(smallest) = group_restitution.get_mut(root)
                && e < *smallest
            {
                *smallest = e;
            }
        }
    }
    round_restitution.clear();
    round_restitution.extend(list.iter().zip(restitution).map(|(contact, &e)| {
        let root = find(group, contact.a.index());
        group_restitution.get(root).copied().unwrap_or(e)
    }));
}

/// Union-find with path halving, over particle indices; an index past
/// the end is its own root.
fn find(parent: &mut [usize], mut index: usize) -> usize {
    while let Some(&parent_index) = parent.get(index) {
        if parent_index == index {
            break;
        }
        let grandparent = parent.get(parent_index).copied().unwrap_or(parent_index);
        if let Some(slot) = parent.get_mut(index) {
            *slot = grandparent;
        }
        index = parent_index;
    }
    index
}

fn union(parent: &mut [usize], first: usize, second: usize) {
    let (first_root, second_root) = (find(parent, first), find(parent, second));
    if let Some(slot) = parent.get_mut(first_root) {
        *slot = second_root;
    }
}

/// The round's contacts (`in_round`), solved jointly and inelastically:
/// each sweep drives every member's normal velocity to 0, clamping its
/// accumulated impulse in `impulses` at ≥ 0, until a sweep changes nothing
/// that matters.
fn solve_inelastic<S: Scalar>(
    particles: &mut Particles<S>,
    list: &[Contact<S>],
    in_round: &[bool],
    impulses: &mut [S],
) {
    for _ in 0..MAX_SWEEPS {
        let (mut largest_change, mut largest) = (0.0_f64, 0.0_f64);
        for ((contact, &member), lambda) in list.iter().zip(in_round).zip(impulses.iter_mut()) {
            if !member {
                continue;
            }
            let Some((first, second, first_inv_mass, second_inv_mass)) = bodies(particles, contact)
            else {
                continue;
            };
            let inv_mass_sum = first_inv_mass + second_inv_mass;
            if inv_mass_sum == S::ZERO {
                continue;
            }
            let current_normal_velocity = normal_velocity(particles, contact, contact.normal);
            let total = *lambda - current_normal_velocity / inv_mass_sum;
            let total = if total > S::ZERO { total } else { S::ZERO };
            let delta_lambda = total - *lambda;
            *lambda = total;
            push_apart(
                &mut particles.velocities,
                first,
                second,
                contact.normal * (first_inv_mass * delta_lambda),
                contact.normal * (second_inv_mass * delta_lambda),
            );
            largest_change = largest_change.max(delta_lambda.to_f64().abs());
            largest = largest.max(total.to_f64());
        }
        if largest_change <= CONVERGED * largest {
            return;
        }
    }
}

/// Applies impulse `lambda` along `contact`'s normal.
fn apply<S: Scalar>(particles: &mut Particles<S>, contact: &Contact<S>, lambda: S) {
    if let Some((first, second, first_inv_mass, second_inv_mass)) = bodies(particles, contact) {
        push_apart(
            &mut particles.velocities,
            first,
            second,
            contact.normal * (first_inv_mass * lambda),
            contact.normal * (second_inv_mass * lambda),
        );
    }
}
