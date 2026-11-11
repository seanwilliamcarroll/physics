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
//! Each contact bounces with its own restitution (a cushion's against the
//! balls'), except that a round's contacts **coupled through a shared
//! ball** all bounce with the group's smallest `e`. With one `e` per
//! group, a round's energy change is `−½ (1 − e²) λ̃ᵀ K λ̃ ≤ 0` per group
//! (`K` is block-diagonal across groups); with mixed `e` inside a group it
//! can be positive (a ball squeezed between a ball and a cushion gained
//! 2.5% at e = 1 and 0.5: `docs/09-billiards.md`, "Restitution per
//! contact").
//!
//! A contact joins a round only once something pushes into it, so an
//! impact travels down a touching row one round per contact (Newton's
//! cradle); contacts struck at once are solved together, so a ball
//! meeting two isn't bounced by each in full. Both were Newton
//! restitution's failures, one contact at a time by its own pre-solve
//! approach (`tests/impacts.rs`).

use crate::collision::{Body, Contact};
use crate::solver::Contacts;
use crate::solver::contacts::{bodies, normal_velocity, push_apart};
use crate::{Particles, Scalar};

/// Most rounds per substep, per contact in the substep (an impact passes
/// one contact per round, so a row of `n` needs about `n`), and at most
/// [`MAX_ROUNDS`] in all. Past it, what still approaches is left to the
/// iterations, which treat it inelastically: with `e < 1` propagation can
/// shrink geometrically without ending (the paper's inelastic collapse).
const ROUNDS_PER_CONTACT: usize = 4;
const MAX_ROUNDS: usize = 100;

/// Sweeps of a round's joint solve at most, and its convergence test: the
/// largest change in a sweep, relative to the largest impulse.
const MAX_SWEEPS: usize = 100;
const CONVERGED: f64 = 1e-12;

/// Resolves this substep's impacts, each contact at its own restitution
/// (`Contacts::restitution`; see the module doc). Nothing when every `e`
/// is 0: the iterations' inelastic solve is that case already.
pub(crate) fn resolve<S: Scalar>(p: &mut Particles<S>, contacts: &mut Contacts<S>, h: S) {
    let Contacts {
        list,
        rest_speed,
        kick_n,
        restitution,
        in_round,
        round_impulse: impulse,
        group,
        group_e,
        round_e,
        ..
    } = contacts;
    let mixed = restitution.windows(2).any(|w| w.first() != w.get(1));
    let n = list.len();
    if restitution.iter().all(|&e| e == S::ZERO) {
        return;
    }
    in_round.clear();
    in_round.resize(n, false);
    impulse.clear();
    impulse.resize(n, S::ZERO);
    let rounds = (ROUNDS_PER_CONTACT * n).min(MAX_ROUNDS);
    let half = S::ONE / (S::ONE + S::ONE);
    for _ in 0..rounds {
        let mut any = false;
        for ((((c, &rest), &kick), member), lambda) in list
            .iter()
            .zip(rest_speed.iter())
            .zip(kick_n.iter())
            .zip(in_round.iter_mut())
            .zip(impulse.iter_mut())
        {
            let vn = normal_velocity(p, c, c.normal);
            // Approaching faster than resting, and closing this substep
            // once the second half kick (after this stage) is added: else
            // the iterations' speculative stop would catch it at the
            // surface with no bounce left.
            *member = -vn > rest && c.gap + (vn + kick * half) * h <= S::ZERO;
            *lambda = S::ZERO;
            any |= *member;
        }
        if !any {
            return;
        }
        solve_inelastic(p, list, in_round, impulse);
        let bounce: &[S] = if mixed {
            coupled_restitution(
                p.pos.len(),
                list,
                in_round,
                restitution,
                group,
                group_e,
                round_e,
            );
            round_e
        } else {
            restitution
        };
        for (((c, &member), &lambda), &e) in list
            .iter()
            .zip(in_round.iter())
            .zip(impulse.iter())
            .zip(bounce.iter())
        {
            if member {
                apply(p, c, e * lambda);
            }
        }
    }
}

/// Each round member's restitution for this round: the smallest `e` among
/// the members coupled to it through shared particles (a union-find over
/// `n` particles in `group`). Statics don't couple: they don't move.
fn coupled_restitution<S: Scalar>(
    n: usize,
    list: &[Contact<S>],
    in_round: &[bool],
    restitution: &[S],
    group: &mut Vec<usize>,
    group_e: &mut Vec<S>,
    round_e: &mut Vec<S>,
) {
    group.clear();
    group.extend(0..n);
    for (c, &member) in list.iter().zip(in_round) {
        if let (true, Body::Particle(b)) = (member, c.b) {
            union(group, c.a.index(), b.index());
        }
    }
    group_e.clear();
    group_e.resize(n, S::ONE);
    for ((c, &member), &e) in list.iter().zip(in_round).zip(restitution) {
        if member {
            let root = find(group, c.a.index());
            if let Some(g) = group_e.get_mut(root)
                && e < *g
            {
                *g = e;
            }
        }
    }
    round_e.clear();
    round_e.extend(list.iter().zip(restitution).map(|(c, &e)| {
        let root = find(group, c.a.index());
        group_e.get(root).copied().unwrap_or(e)
    }));
}

/// Union-find with path halving, over particle indices; an index past
/// the end is its own root.
fn find(parent: &mut [usize], mut i: usize) -> usize {
    while let Some(&p) = parent.get(i) {
        if p == i {
            break;
        }
        let grand = parent.get(p).copied().unwrap_or(p);
        if let Some(slot) = parent.get_mut(i) {
            *slot = grand;
        }
        i = p;
    }
    i
}

fn union(parent: &mut [usize], a: usize, b: usize) {
    let (ra, rb) = (find(parent, a), find(parent, b));
    if let Some(slot) = parent.get_mut(ra) {
        *slot = rb;
    }
}

/// The round's contacts (`in_round`), solved jointly and inelastically:
/// each sweep drives every member's normal velocity to 0, clamping its
/// accumulated impulse in `impulse` at ≥ 0, until a sweep changes nothing
/// that matters.
fn solve_inelastic<S: Scalar>(
    p: &mut Particles<S>,
    list: &[Contact<S>],
    in_round: &[bool],
    impulse: &mut [S],
) {
    for _ in 0..MAX_SWEEPS {
        let (mut largest_change, mut largest) = (0.0_f64, 0.0_f64);
        for ((c, &member), lambda) in list.iter().zip(in_round).zip(impulse.iter_mut()) {
            if !member {
                continue;
            }
            let Some((a, b, wa, wb)) = bodies(p, c) else {
                continue;
            };
            let w = wa + wb;
            if w == S::ZERO {
                continue;
            }
            let vn = normal_velocity(p, c, c.normal);
            let total = *lambda - vn / w;
            let total = if total > S::ZERO { total } else { S::ZERO };
            let d = total - *lambda;
            *lambda = total;
            push_apart(&mut p.vel, a, b, c.normal * (wa * d), c.normal * (wb * d));
            largest_change = largest_change.max(d.to_f64().abs());
            largest = largest.max(total.to_f64());
        }
        if largest_change <= CONVERGED * largest {
            return;
        }
    }
}

/// Applies impulse `lambda` along `c`'s normal.
fn apply<S: Scalar>(p: &mut Particles<S>, c: &Contact<S>, lambda: S) {
    if let Some((a, b, wa, wb)) = bodies(p, c) {
        push_apart(
            &mut p.vel,
            a,
            b,
            c.normal * (wa * lambda),
            c.normal * (wb * lambda),
        );
    }
}
