//! Contact state and geometry both solvers share (`docs/08-collision.md`,
//! "The contact constraint").

use crate::collision::{
    Body, CONTACT_MARGIN, Contact, Statics, find_contacts, pair_impact, segment_impact,
};
use crate::sort_key::{SortKey, index_key, sort};
use crate::{Particles, Restitution, Scalar, UnitVec2, Vec2};

/// Overlap the impulse solver leaves uncorrected, m: resting contacts sit
/// this deep instead of flickering between touching and not
/// (`docs/08-collision.md`, "Sequential impulses"). Half the contact
/// margin, so a resting contact stays well inside it.
pub(crate) const CONTACT_SLOP: f64 = 5e-4;

/// This substep's contacts and what the solvers keep per contact, in
/// matching order.
pub(crate) struct Contacts<S> {
    pub(crate) list: Vec<Contact<S>>,
    /// The impulse (or XPBD multiplier) applied this substep; never
    /// negative: a contact only pushes.
    pub(crate) lambda: Vec<S>,
    /// Approach speeds at or below this get no bounce: `2 |a_b − a_a| h`,
    /// what the forces alone add in two substeps (Müller et al. 2020's
    /// `2 |g| h`, for any force). Keeps resting contacts at rest.
    pub(crate) rest_speed: Vec<S>,
    /// What this substep's force kick adds to the normal velocity,
    /// `h n · (a_b − a_a)`: the impact stage runs before the kick, but asks
    /// whether a contact closes *after* it.
    pub(crate) kick_n: Vec<S>,
    /// Each contact's restitution: a segment's own, or the world's for
    /// circles and walls (`docs/09-billiards.md`, "Restitution per
    /// contact").
    pub(crate) restitution: Vec<S>,
    /// The impulse solver's split pseudo-impulse per contact, this
    /// substep only (one-sided, like λ; never warm-started).
    pub(crate) pseudo_lambda: Vec<S>,
    /// The impact stage's scratch (`solver/impacts.rs`): whether
    /// each contact is in the current round, and its impulse there.
    /// Impact impulses are never remembered for the warm start.
    pub(crate) in_round: Vec<bool>,
    pub(crate) round_impulse: Vec<S>,
    /// The impact stage's scratch when restitutions differ: a union-find
    /// parent per particle (the round's coupled groups), each group's
    /// smallest `e`, and the `e` each contact bounces with this round.
    pub(crate) group: Vec<usize>,
    pub(crate) group_e: Vec<S>,
    pub(crate) round_e: Vec<S>,
    /// Last substep's contacts as sorted keys `(a, b, i)`, `i` indexing
    /// `warm_lambda`: the impulse solver's warm start. Keys, not `(a, b,
    /// λ)` tuples, so the sort is the engine's one shared instantiation
    /// (`sort_key.rs`) rather than one more per scalar.
    warm: Vec<SortKey>,
    /// Last substep's impulses, in contact order.
    warm_lambda: Vec<S>,
    /// The broadphase's scratch.
    pairs: Vec<(usize, usize)>,
}

impl<S: Scalar> Contacts<S> {
    pub(crate) const fn new() -> Self {
        Self {
            list: Vec::new(),
            lambda: Vec::new(),
            rest_speed: Vec::new(),
            kick_n: Vec::new(),
            restitution: Vec::new(),
            pseudo_lambda: Vec::new(),
            in_round: Vec::new(),
            round_impulse: Vec::new(),
            group: Vec::new(),
            group_e: Vec::new(),
            round_e: Vec::new(),
            warm: Vec::new(),
            warm_lambda: Vec::new(),
            pairs: Vec::new(),
        }
    }

    /// Finds this substep's contacts (`collision::find_contacts`) and
    /// records each one's resting threshold, the kick's normal part and
    /// its restitution (`e` for circles and walls). `acc` is this
    /// substep's per-particle acceleration from the forces.
    pub(crate) fn find(
        &mut self,
        p: &Particles<S>,
        statics: Statics<'_, S>,
        e: Restitution<S>,
        acc: &[Vec2<S>],
        h: S,
        speculative: bool,
    ) {
        // Without speculation, contacts are only what touches (within the
        // margin) at the substep's start: the narrowphase with no time to
        // close in (`docs/09-billiards.md`, "Tunneling").
        let reach = if speculative { h } else { S::ZERO };
        find_contacts(p, statics, reach, &mut self.pairs, &mut self.list);
        self.list.retain_mut(|c| at_impact(p, statics, c, h));
        self.restitution.clear();
        self.restitution.extend(self.list.iter().map(|c| {
            match c.b {
                Body::Segment(i) => statics
                    .segments
                    .get(i)
                    .map_or(e.get(), |s| s.restitution().get()),
                Body::Particle(_) | Body::Wall(_) => e.get(),
            }
        }));
        self.lambda.clear();
        self.lambda.resize(self.list.len(), S::ZERO);
        self.pseudo_lambda.clear();
        self.pseudo_lambda.resize(self.list.len(), S::ZERO);
        self.rest_speed.clear();
        self.kick_n.clear();
        let two = S::ONE + S::ONE;
        for c in &self.list {
            let a_rel = body_acc(acc, c.b) - acc.get(c.a.index()).copied().unwrap_or(Vec2::ZERO);
            self.rest_speed.push(two * a_rel.length() * h);
            self.kick_n.push(c.normal.dot(a_rel) * h);
        }
    }
}

impl<S: Scalar> Contacts<S> {
    /// Sets each contact's λ to its impulse from the previous substep, if
    /// the same pair was in contact then (0 for new contacts): the impulse
    /// solver's warm start, matched by bodies.
    pub(crate) fn recall(&mut self) {
        for (c, lambda) in self.list.iter().zip(self.lambda.iter_mut()) {
            let key = pair_key(c);
            *lambda = self
                .warm
                .binary_search_by(|&(a, b, _)| (a, b).cmp(&key))
                .ok()
                .and_then(|i| self.warm.get(i))
                .and_then(|&(_, _, j)| self.warm_lambda.get(j))
                .copied()
                .unwrap_or(S::ZERO);
        }
    }

    /// Keeps this substep's impulses for the next substep's [`recall`](Self::recall).
    pub(crate) fn remember(&mut self) {
        self.warm.clear();
        self.warm.extend(self.list.iter().enumerate().map(|(i, c)| {
            let (a, b) = pair_key(c);
            (a, b, i)
        }));
        sort(&mut self.warm);
        self.warm_lambda.clear();
        self.warm_lambda.extend_from_slice(&self.lambda);
    }

    /// Forgets everything (a world that stopped colliding, or a solver
    /// switch).
    pub(crate) fn clear(&mut self) {
        self.list.clear();
        self.lambda.clear();
        self.warm.clear();
        self.warm_lambda.clear();
    }
}

/// A contact's bodies as the first two fields of a [`SortKey`]: `a`'s
/// index, then `b`'s for a particle or `−1 − i` for wall `i`. Any
/// consistent order serves the warm start's lookup; each pair of bodies
/// has one contact per substep, so keys are distinct.
fn pair_key<S>(c: &Contact<S>) -> (i64, i64) {
    let b = match c.b {
        Body::Particle(b) => index_key(b.index()),
        Body::Wall(i) => -1 - index_key(i),
        // Below every wall's key: distinct from them up to 2⁴⁰ walls.
        Body::Segment(i) => -(1_i64 << 40) - index_key(i),
    };
    (index_key(c.a.index()), b)
}

/// Moves a speculative contact (separated, approaching) to the moment of
/// impact: the normal and gap where the pair first touches this substep,
/// if it does, moving in straight lines at their current velocities. The
/// normal found at the substep's start is up to a substep's travel early,
/// and on a glancing hit it's still turning as the gap closes: cut shots
/// went 1–8° off at 10 substeps (`tests/cushions.rs`, `docs/09-billiards.md`).
/// A head-on hit and a touching contact are unchanged; so are walls, whose
/// normal never turns. The gap becomes `(closing speed along the new
/// normal) · t`, so the contact still closes at the time of impact.
///
/// Returns whether to keep the contact: one that doesn't touch this
/// substep is dropped, unless it's within [`CONTACT_MARGIN`] (resting). Along
/// the start's normal a glancing pair can look as if it closes when its
/// true path only touches next substep; kept, it bounced a substep early
/// at the stale normal (an 80° cut left at 60°). Next substep it's found
/// again, closer, with the right normal.
fn at_impact<S: Scalar>(
    p: &Particles<S>,
    statics: Statics<'_, S>,
    c: &mut Contact<S>,
    h: S,
) -> bool {
    if c.gap <= S::ZERO {
        return true;
    }
    // Within the margin but not touching this substep: a resting
    // neighbour, kept as found (`CONTACT_MARGIN`'s reason).
    let near = c.gap <= S::from_f64(CONTACT_MARGIN);
    let a = c.a.index();
    let (Some(&xa), Some(&va), Some(&ra)) = (p.pos().get(a), p.vel().get(a), p.radius().get(a))
    else {
        return true;
    };
    let hit = match c.b {
        Body::Particle(b) => {
            let b = b.index();
            let (Some(&xb), Some(&vb), Some(&rb)) =
                (p.pos().get(b), p.vel().get(b), p.radius().get(b))
            else {
                return true;
            };
            pair_impact(xb - xa, vb - va, ra + rb, h)
        }
        Body::Segment(i) => {
            let Some(seg) = statics.segments.get(i) else {
                return true;
            };
            segment_impact(*seg, xa, va, ra, h)
        }
        Body::Wall(_) => return true,
    };
    let Some((normal, gap)) = hit else {
        return near;
    };
    c.normal = normal;
    c.gap = gap;
    true
}

/// `(a, b, w_a, w_b)`: the particle indices (`b` is `None` for a wall,
/// which has `w_b = 0`) and inverse masses, or `None` if a body isn't in
/// `p`.
pub(crate) fn bodies<S: Scalar>(
    p: &Particles<S>,
    c: &Contact<S>,
) -> Option<(usize, Option<usize>, S, S)> {
    let a = c.a.index();
    let wa = *p.inv_mass().get(a)?;
    match c.b {
        Body::Particle(b) => Some((a, Some(b.index()), wa, *p.inv_mass().get(b.index())?)),
        Body::Wall(_) | Body::Segment(_) => Some((a, None, wa, S::ZERO)),
    }
}

/// The contact's gap and normal (`a` toward `b`) at the *current*
/// positions: XPBD re-measures as positions move within a substep.
pub(crate) fn geometry<S: Scalar>(
    p: &Particles<S>,
    statics: Statics<'_, S>,
    c: &Contact<S>,
) -> Option<(S, UnitVec2<S>)> {
    let a = c.a.index();
    let (xa, ra) = (*p.pos().get(a)?, *p.radius().get(a)?);
    match c.b {
        Body::Particle(b) => {
            let b = b.index();
            let (xb, rb) = (*p.pos().get(b)?, *p.radius().get(b)?);
            // Coincident: +x, as when the contact was found.
            let (dist, n) = (xb - xa)
                .length_and_direction()
                .unwrap_or((S::ZERO, UnitVec2::X));
            Some((dist - ra - rb, n))
        }
        Body::Wall(i) => {
            let wall = statics.walls.get(i)?;
            Some((wall.distance(xa) - ra, -wall.normal()))
        }
        Body::Segment(i) => {
            let (dist, n) = statics.segments.get(i)?.toward(xa);
            Some((dist - ra, n))
        }
    }
}

/// `n · (v_b − v_a)` at the particles' current velocities: positive when
/// separating. A wall's velocity is 0.
pub(crate) fn normal_velocity<S: Scalar>(p: &Particles<S>, c: &Contact<S>, n: UnitVec2<S>) -> S {
    normal_velocity_in(p.vel(), c, n)
}

/// `n · (v_b − v_a)` with velocities from `vel` (current, or saved).
pub(crate) fn normal_velocity_in<S: Scalar>(vel: &[Vec2<S>], c: &Contact<S>, n: UnitVec2<S>) -> S {
    let va = vel.get(c.a.index()).copied().unwrap_or(Vec2::ZERO);
    let vb = match c.b {
        Body::Particle(b) => vel.get(b.index()).copied().unwrap_or(Vec2::ZERO),
        Body::Wall(_) | Body::Segment(_) => Vec2::ZERO,
    };
    n.dot(vb - va)
}

/// A body's acceleration this substep (a wall's is 0).
fn body_acc<S: Scalar>(acc: &[Vec2<S>], b: Body) -> Vec2<S> {
    match b {
        Body::Particle(b) => acc.get(b.index()).copied().unwrap_or(Vec2::ZERO),
        Body::Wall(_) | Body::Segment(_) => Vec2::ZERO,
    }
}

/// Moves `a` by `−da` and `b` (if a particle) by `+db` in `v` (positions
/// or velocities, whichever slice is passed).
pub(crate) fn push_apart<S: Scalar>(
    v: &mut [Vec2<S>],
    a: usize,
    b: Option<usize>,
    da: Vec2<S>,
    db: Vec2<S>,
) {
    match b {
        Some(b) => {
            if let Ok([va, vb]) = v.get_disjoint_mut([a, b]) {
                *va -= da;
                *vb += db;
            }
        }
        None => {
            if let Some(va) = v.get_mut(a) {
                *va -= da;
            }
        }
    }
}

#[cfg(test)]
mod tests;
