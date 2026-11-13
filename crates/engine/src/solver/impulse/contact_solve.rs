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
    pub(super) h: S,
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
pub(super) fn apply<S: Scalar>(p: &mut Particles<S>, c: &Contact<S>, lambda: S) {
    let Some((a, b, wa, wb)) = bodies(p, c) else {
        return;
    };
    push_apart(
        &mut p.vel,
        a,
        b,
        c.normal * (wa * lambda),
        c.normal * (wb * lambda),
    );
}

/// The bias velocity for a gap: what pushes an overlap back out,
/// `(β / h) · max(−(gap + slop), 0)`.
fn bias<S: Scalar>(gap: S, g: ContactGains<S>) -> S {
    let depth = -(gap + g.slop);
    if depth > S::ZERO {
        g.bias * depth
    } else {
        S::ZERO
    }
}

/// One velocity solve of a contact toward `target`, clamping the
/// **accumulated** impulse at ≥ 0 (Catto 2006): a pass may take back an
/// earlier overshoot, but the contact never pulls.
fn solve_toward<S: Scalar>(
    vel: &mut [Vec2<S>],
    p_inv: (usize, Option<usize>, S, S),
    c: &Contact<S>,
    vn: S,
    target: S,
    lambda: &mut S,
) {
    let (a, b, wa, wb) = p_inv;
    let w = wa + wb;
    if w == S::ZERO {
        return;
    }
    let total = *lambda - (vn - target) / w;
    let total = if total > S::ZERO { total } else { S::ZERO };
    let d = total - *lambda;
    *lambda = total;
    push_apart(vel, a, b, c.normal * (wa * d), c.normal * (wb * d));
}

/// The real-velocity solve: a separated contact may close by at most its
/// gap this substep (`v_target = −gap / h`, speculative); a touching or
/// overlapping one targets 0, plus the bias in classic Baumgarte.
pub(super) fn solve<S: Scalar>(
    p: &mut Particles<S>,
    c: &Contact<S>,
    lambda: &mut S,
    g: ContactGains<S>,
) {
    let Some(inv) = bodies(p, c) else {
        return;
    };
    let target = if c.gap > S::ZERO {
        -c.gap / g.h
    } else if g.classic {
        bias(c.gap, g)
    } else {
        S::ZERO
    };
    let vn = normal_velocity(p, c, c.normal);
    solve_toward(&mut p.vel, inv, c, vn, target, lambda);
}

/// The split pseudo-velocity solve: pushes an overlap out through
/// `pseudo`, which moves positions this substep only, so penetration
/// correction never becomes bounce. One-sided, accumulated in
/// `pseudo_lambda`.
pub(super) fn solve_pseudo<S: Scalar>(
    p: &Particles<S>,
    pseudo: &mut [Vec2<S>],
    c: &Contact<S>,
    pseudo_lambda: &mut S,
    g: ContactGains<S>,
) {
    let Some(inv) = bodies(p, c) else {
        return;
    };
    let vn = normal_velocity_in(pseudo, c, c.normal);
    solve_toward(pseudo, inv, c, vn, bias(c.gap, g), pseudo_lambda);
}
