//! The narrowphase: contacts from candidate pairs and walls
//! (`docs/08-collision.md`, "Contact generation").

use super::{Segment, Statics, candidate_pairs};
use crate::{ParticleId, Particles, Scalar, UnitVec2, Vec2};

/// Pairs this close (m) are contacts even when they aren't approaching.
///
/// Without it, a ball resting on another (gap ~0 from rounding, both
/// falling at the same rate, so no approach) isn't a contact. During that
/// substep the lower ball is held up by its own contact while the upper
/// one falls freely, so they overlap by `g h²`, get pushed apart, separate
/// by a hair, and miss each other again: a stack of three or more never
/// settles (M6.5: six balls jittered at ~5 cm/s, forever). With 1 mm,
/// every stack measured settles to exactly zero velocity. Extra contacts
/// cost nothing physically: XPBD corrects only overlap, and the impulse
/// solver lets a speculative gap close. `Box2D` keeps a margin for the same
/// reason.
pub(crate) const CONTACT_MARGIN: f64 = 1e-3;

/// What a contact's first body touches.
#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub(crate) enum Body {
    Particle(ParticleId),
    /// Index into the world's walls.
    Wall(usize),
    /// Index into the world's segments (M7).
    Segment(usize),
}

/// A contact for one substep: body `a` (a circle) touching, or about to
/// touch, `b`. Signs follow `docs/08-collision.md`: `normal` points from
/// `a` toward `b` (into the wall, for a wall), `gap` is
/// `C = |x_b − x_a| − (r_a + r_b)` (negative when overlapping), and the
/// normal velocity `n · (v_b − v_a)` is positive when separating.
#[derive(Copy, Clone, Debug, PartialEq)]
pub(crate) struct Contact<S> {
    pub a: ParticleId,
    pub b: Body,
    pub normal: UnitVec2<S>,
    pub gap: S,
}

/// The broadphase cell size, m, [`find_contacts`] uses for a substep of
/// `h` s: any pair that can be a contact this substep is within both radii,
/// plus what both can travel (at the fastest circle's speed), plus
/// [`CONTACT_MARGIN`]. Public so a page can draw the grid the engine uses.
pub fn broadphase_cell<S: Scalar>(p: &Particles<S>, h: S) -> S {
    let two = S::ONE + S::ONE;
    let max_speed = p
        .vel()
        .iter()
        .zip(p.radius())
        .filter(|(_, r)| **r > S::ZERO)
        .fold(S::ZERO, |m, (v, _)| max(m, v.length()));
    two * p.max_radius() + two * max_speed * h + S::from_f64(CONTACT_MARGIN)
}

/// Every contact this substep, into `out` (cleared first), in a fixed
/// order: circle pairs sorted by `(a, b)`, then wall and segment contacts
/// by particle, walls before segments. `pairs` is the broadphase's scratch.
///
/// A contact is kept when its gap is at most what the pair can close in
/// `h` at their current approach speed (the speculative margin), plus
/// [`CONTACT_MARGIN`]: touching or overlapping always counts. Pairs that can't move (both static) and
/// points (radius 0) make none.
pub(crate) fn find_contacts<S: Scalar>(
    p: &Particles<S>,
    statics: Statics<'_, S>,
    h: S,
    pairs: &mut Vec<(usize, usize)>,
    out: &mut Vec<Contact<S>>,
) {
    out.clear();
    let margin = S::from_f64(CONTACT_MARGIN);
    candidate_pairs(p.pos(), p.radius(), broadphase_cell(p, h), pairs);
    for &(a, b) in pairs.iter() {
        if let Some(c) = pair_contact(p, a, b, h, margin) {
            out.push(c);
        }
    }
    for (a, (&x, &r)) in p.pos().iter().zip(p.radius()).enumerate() {
        let movable = p.inv_mass().get(a).is_some_and(|&w| w != S::ZERO);
        if r == S::ZERO || !movable {
            continue;
        }
        let v = p.vel().get(a).copied().unwrap_or(Vec2::ZERO);
        for (i, wall) in statics.walls.iter().enumerate() {
            let normal = -wall.normal();
            let gap = wall.distance(x) - r;
            // The wall doesn't move: v_n = n · (0 − v_a).
            if speculative(gap, -normal.dot(v), h, margin) {
                out.push(Contact {
                    a: ParticleId(a),
                    b: Body::Wall(i),
                    normal,
                    gap,
                });
            }
        }
        for (i, seg) in statics.segments.iter().enumerate() {
            let (dist, normal) = seg.toward(x);
            let gap = dist - r;
            // Static, as a wall: v_n = n · (0 − v_a). Swept too: a glancing
            // approach closes faster than the start's normal shows.
            if speculative(gap, -normal.dot(v), h, margin)
                || segment_impact(*seg, x, v, r, h).is_some()
            {
                out.push(Contact {
                    a: ParticleId(a),
                    b: Body::Segment(i),
                    normal,
                    gap,
                });
            }
        }
    }
}

/// The contact between circles `a < b`, if they touch or can this substep.
fn pair_contact<S: Scalar>(
    p: &Particles<S>,
    a: usize,
    b: usize,
    h: S,
    margin: S,
) -> Option<Contact<S>> {
    let (xa, xb) = (*p.pos().get(a)?, *p.pos().get(b)?);
    let (va, vb) = (*p.vel().get(a)?, *p.vel().get(b)?);
    let (wa, wb) = (*p.inv_mass().get(a)?, *p.inv_mass().get(b)?);
    let reach = *p.radius().get(a)? + *p.radius().get(b)?;
    if wa == S::ZERO && wb == S::ZERO {
        return None;
    }
    // Coincident centers have no direction; +x separates them
    // deterministically (`docs/08-collision.md`).
    let (dist, normal) = (xb - xa)
        .length_and_direction()
        .unwrap_or((S::ZERO, UnitVec2::X));
    let gap = dist - reach;
    let closes = speculative(gap, normal.dot(vb - va), h, margin)
        || pair_impact(xb - xa, vb - va, reach, h).is_some();
    closes.then_some(Contact {
        a: ParticleId(a),
        b: Body::Particle(ParticleId(b)),
        normal,
        gap,
    })
}

/// Whether a `gap` closing at normal velocity `v_n` (negative =
/// approaching) is a contact: `gap ≤ max(0, −v_n) h + margin`.
fn speculative<S: Scalar>(gap: S, v_n: S, h: S, margin: S) -> bool {
    gap <= max(S::ZERO, -v_n) * h + margin
}

fn max<S: Scalar>(a: S, b: S) -> S {
    if b > a { b } else { a }
}

/// When `|d + v t| = reach` first, for `t` in `[0, h]`: the unit `d + v t`
/// and the gap `(n · −v) t`. `None` if they don't touch this substep.
pub(crate) fn pair_impact<S: Scalar>(
    d: Vec2<S>,
    v: Vec2<S>,
    reach: S,
    h: S,
) -> Option<(UnitVec2<S>, S)> {
    let two = S::ONE + S::ONE;
    let qa = v.dot(v);
    let qb = two * d.dot(v);
    let qc = d.dot(d) - reach * reach;
    let disc = qb * qb - two * two * qa * qc;
    if qa == S::ZERO || disc < S::ZERO {
        return None;
    }
    let t = (-qb - disc.sqrt()) / (two * qa);
    if t < S::ZERO || t > h {
        return None;
    }
    let (_, n) = (d + v * t).length_and_direction()?;
    Some((n, -n.dot(v) * t))
}

/// Conservative advancement of a circle at `x`, velocity `v`, toward a
/// segment: step to where the gap along the current normal would close,
/// re-measure, a few times. `None` if it doesn't touch within `h`.
pub(crate) fn segment_impact<S: Scalar>(
    seg: Segment<S>,
    x: Vec2<S>,
    v: Vec2<S>,
    r: S,
    h: S,
) -> Option<(UnitVec2<S>, S)> {
    /// Steps of the advancement: each one lands within the curvature of
    /// an end's corner of the true contact, and three are exact on a side
    /// (one step) and well under a micrometre at a corner.
    const ADVANCE_STEPS: usize = 3;
    let mut t = S::ZERO;
    let mut normal = None;
    for _ in 0..ADVANCE_STEPS {
        let (dist, n) = seg.toward(x + v * t);
        let closing = n.dot(v);
        if closing <= S::ZERO {
            return None;
        }
        normal = Some(n);
        t += (dist - r) / closing;
        if t > h {
            return None;
        }
    }
    normal.map(|n| (n, n.dot(v) * t))
}

#[cfg(test)]
mod properties;
#[cfg(test)]
mod tests;
