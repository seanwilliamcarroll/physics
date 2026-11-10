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
//! A contact joins a round only once something pushes into it, so an
//! impact travels down a touching row one round per contact (Newton's
//! cradle); contacts struck at once are solved together, so a ball
//! meeting two isn't bounced by each in full. Both were Newton
//! restitution's failures, one contact at a time by its own pre-solve
//! approach (`tests/impacts.rs`).

use crate::collision::Contact;
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

/// Resolves this substep's impacts at restitution `e` (see the module
/// doc). Nothing at `e = 0`: the iterations' inelastic solve is that case
/// already.
pub(crate) fn resolve<S: Scalar>(p: &mut Particles<S>, contacts: &mut Contacts<S>, h: S, e: S) {
    let Contacts {
        list,
        rest_speed,
        kick_n,
        in_round,
        round_impulse: impulse,
        ..
    } = contacts;
    let n = list.len();
    if e == S::ZERO || n == 0 {
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
        for ((c, &member), &lambda) in list.iter().zip(in_round.iter()).zip(impulse.iter()) {
            if member {
                apply(p, c, e * lambda);
            }
        }
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
