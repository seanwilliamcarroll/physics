//! The narrowphase: contacts from candidate pairs and walls
//! (`docs/08-collision.md`, "Contact generation").

use super::{Wall, candidate_pairs};
use crate::{ParticleId, Particles, Scalar, UnitVec2, Vec2};

/// What a contact's first body touches.
#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub enum Body {
    Particle(ParticleId),
    /// Index into the world's walls.
    Wall(usize),
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

/// Every contact this substep, into `out` (cleared first), in a fixed
/// order: circle pairs sorted by `(a, b)`, then wall contacts by particle
/// and wall. `pairs` is the broadphase's scratch.
///
/// A contact is kept when its gap is at most what the pair can close in
/// `h` at their current approach speed (the speculative margin): touching
/// or overlapping always counts. Pairs that can't move (both static) and
/// points (radius 0) make none.
pub fn find_contacts<S: Scalar>(
    p: &Particles<S>,
    walls: &[Wall<S>],
    h: S,
    pairs: &mut Vec<(usize, usize)>,
    out: &mut Vec<Contact<S>>,
) {
    out.clear();
    let two = S::ONE + S::ONE;
    let max_speed = p
        .vel()
        .iter()
        .zip(p.radius())
        .filter(|(_, r)| **r > S::ZERO)
        .fold(S::ZERO, |m, (v, _)| max(m, v.length()));
    // Any pair that can touch this substep: within both radii plus what
    // both can travel.
    let cell = two * p.max_radius() + two * max_speed * h;
    candidate_pairs(p.pos(), p.radius(), cell, pairs);
    for &(a, b) in pairs.iter() {
        if let Some(c) = pair_contact(p, a, b, h) {
            out.push(c);
        }
    }
    for (a, (&x, &r)) in p.pos().iter().zip(p.radius()).enumerate() {
        let movable = p.inv_mass().get(a).is_some_and(|&w| w != S::ZERO);
        if r == S::ZERO || !movable {
            continue;
        }
        let v = p.vel().get(a).copied().unwrap_or(Vec2::ZERO);
        for (i, wall) in walls.iter().enumerate() {
            let normal = -wall.normal();
            let gap = wall.distance(x) - r;
            // The wall doesn't move: v_n = n · (0 − v_a).
            if speculative(gap, -normal.dot(v), h) {
                out.push(Contact {
                    a: ParticleId(a),
                    b: Body::Wall(i),
                    normal,
                    gap,
                });
            }
        }
    }
}

/// The contact between circles `a < b`, if they touch or can this substep.
fn pair_contact<S: Scalar>(p: &Particles<S>, a: usize, b: usize, h: S) -> Option<Contact<S>> {
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
    speculative(gap, normal.dot(vb - va), h).then_some(Contact {
        a: ParticleId(a),
        b: Body::Particle(ParticleId(b)),
        normal,
        gap,
    })
}

/// Whether a `gap` closing at normal velocity `v_n` (negative =
/// approaching) can reach 0 within `h`: `gap ≤ max(0, −v_n) h`.
fn speculative<S: Scalar>(gap: S, v_n: S, h: S) -> bool {
    gap <= max(S::ZERO, -v_n) * h
}

fn max<S: Scalar>(a: S, b: S) -> S {
    if b > a { b } else { a }
}

#[cfg(test)]
mod tests;
