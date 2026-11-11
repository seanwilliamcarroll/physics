//! The narrowphase: contacts from candidate pairs and walls
//! (`docs/08-collision.md`, "Contact generation").

use super::{Statics, candidate_pairs};
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
pub const CONTACT_MARGIN: f64 = 1e-3;

/// What a contact's first body touches.
#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub enum Body {
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
pub struct Contact<S> {
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
pub fn find_contacts<S: Scalar>(
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
            // Static, as a wall: v_n = n · (0 − v_a).
            if speculative(gap, -normal.dot(v), h, margin) {
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
    speculative(gap, normal.dot(vb - va), h, margin).then_some(Contact {
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

#[cfg(test)]
mod tests;
