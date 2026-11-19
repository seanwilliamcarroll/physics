//! The narrowphase: contacts from candidate pairs and walls
//! (`docs/08-collision.md`, "Contact generation").

use super::{Segment, Statics, candidate_pairs};
use crate::{ParticleId, Particles, Scalar, UnitVec2, Vec2};

/// Pairs this close (m) are contacts even when they aren't approaching.
///
/// Without it, a ball resting on another (gap ~0 from rounding, no
/// approach) isn't a contact, so in a stack the upper ball falls freely
/// for a substep, overlaps by `g h²`, is pushed apart, and misses again:
/// six balls jittered at ~5 cm/s forever. With 1 mm every stack settles to
/// exactly zero velocity. Extra contacts cost nothing physically: XPBD
/// corrects only overlap, and the impulse solver lets a speculative gap
/// close. `Box2D` keeps a margin for the same reason.
pub(crate) const CONTACT_MARGIN: f64 = 1e-3;

#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub(crate) enum Body {
    Particle(ParticleId),
    Wall(usize),
    Segment(usize),
}

/// A contact for one substep: circle `a` touching, or about to touch, `b`.
/// `normal` points from `a` toward `b`; `gap` is `|x_b − x_a| − (r_a + r_b)`,
/// negative when overlapping (`docs/08-collision.md`).
#[derive(Copy, Clone, Debug, PartialEq)]
pub(crate) struct Contact<S> {
    pub a: ParticleId,
    pub b: Body,
    pub normal: UnitVec2<S>,
    pub gap: S,
}

/// The broadphase cell size, m, for a substep of `dt` s: both diameters,
/// plus what both can travel at the fastest speed, plus the contact
/// margin. Public so a page can draw the grid.
pub fn broadphase_cell<S: Scalar>(particles: &Particles<S>, dt: S) -> S {
    let two = S::ONE + S::ONE;
    let max_speed = particles
        .velocities()
        .iter()
        .zip(particles.radius())
        .filter(|(_, radius)| **radius > S::ZERO)
        .fold(S::ZERO, |fastest, (velocity, _)| {
            max(fastest, velocity.length())
        });
    two * particles.max_radius() + two * max_speed * dt + S::from_f64(CONTACT_MARGIN)
}

/// Every contact this substep, into `out` (cleared first), in a fixed
/// order: circle pairs sorted by `(a, b)`, then wall and segment contacts
/// by particle, walls before segments. `pairs` is the broadphase's scratch.
///
/// A contact is kept when its gap is at most what the pair can close in
/// `dt` (the speculative margin) plus [`CONTACT_MARGIN`]. Static pairs and
/// points make none.
pub(crate) fn find_contacts<S: Scalar>(
    particles: &Particles<S>,
    statics: Statics<'_, S>,
    dt: S,
    pairs: &mut Vec<(usize, usize)>,
    out: &mut Vec<Contact<S>>,
) {
    out.clear();
    let margin = S::from_f64(CONTACT_MARGIN);
    candidate_pairs(
        particles.positions(),
        particles.radius(),
        broadphase_cell(particles, dt),
        pairs,
    );
    for &(first, second) in pairs.iter() {
        if let Some(contact) = pair_contact(particles, first, second, dt, margin) {
            out.push(contact);
        }
    }
    for (index, (&position, &radius)) in particles
        .positions()
        .iter()
        .zip(particles.radius())
        .enumerate()
    {
        let movable = particles
            .inverse_mass()
            .get(index)
            .is_some_and(|&inverse_mass| inverse_mass != S::ZERO);
        if radius == S::ZERO || !movable {
            continue;
        }
        let velocity = particles
            .velocities()
            .get(index)
            .copied()
            .unwrap_or(Vec2::ZERO);
        for (wall_index, wall) in statics.walls.iter().enumerate() {
            let normal = -wall.normal();
            let gap = wall.distance(position) - radius;
            // The wall doesn't move: v_n = n · (0 − v_a).
            if speculative(gap, -normal.dot(velocity), dt, margin) {
                out.push(Contact {
                    a: ParticleId(index),
                    b: Body::Wall(wall_index),
                    normal,
                    gap,
                });
            }
        }
        for (segment_index, segment) in statics.segments.iter().enumerate() {
            let (distance, normal) = segment.toward(position);
            let gap = distance - radius;
            // Static, as a wall: v_n = n · (0 − v_a). Swept too: a glancing
            // approach closes faster than the start's normal shows.
            if speculative(gap, -normal.dot(velocity), dt, margin)
                || segment_impact(*segment, position, velocity, radius, dt).is_some()
            {
                out.push(Contact {
                    a: ParticleId(index),
                    b: Body::Segment(segment_index),
                    normal,
                    gap,
                });
            }
        }
    }
}

fn pair_contact<S: Scalar>(
    particles: &Particles<S>,
    first: usize,
    second: usize,
    dt: S,
    margin: S,
) -> Option<Contact<S>> {
    let (first_position, second_position) = (
        *particles.positions().get(first)?,
        *particles.positions().get(second)?,
    );
    let (first_velocity, second_velocity) = (
        *particles.velocities().get(first)?,
        *particles.velocities().get(second)?,
    );
    let (first_inv_mass, second_inv_mass) = (
        *particles.inverse_mass().get(first)?,
        *particles.inverse_mass().get(second)?,
    );
    let reach = *particles.radius().get(first)? + *particles.radius().get(second)?;
    if first_inv_mass == S::ZERO && second_inv_mass == S::ZERO {
        return None;
    }
    // Coincident centers have no direction; +x separates them
    // deterministically (`docs/08-collision.md`).
    let (distance, normal) = (second_position - first_position)
        .length_and_direction()
        .unwrap_or((S::ZERO, UnitVec2::X));
    let gap = distance - reach;
    let closes = speculative(
        gap,
        normal.dot(second_velocity - first_velocity),
        dt,
        margin,
    ) || pair_impact(
        second_position - first_position,
        second_velocity - first_velocity,
        reach,
        dt,
    )
    .is_some();
    closes.then_some(Contact {
        a: ParticleId(first),
        b: Body::Particle(ParticleId(second)),
        normal,
        gap,
    })
}

/// `gap ≤ max(0, −normal_velocity) dt + margin`; negative velocity approaches.
fn speculative<S: Scalar>(gap: S, normal_velocity: S, dt: S, margin: S) -> bool {
    gap <= max(S::ZERO, -normal_velocity) * dt + margin
}

fn max<S: Scalar>(first: S, second: S) -> S {
    if second > first { second } else { first }
}

/// When `|offset + velocity t| = reach` first, for `t` in `[0, dt]`: the
/// unit `offset + velocity t` and the gap `(n · −velocity) t`; `None` if
/// they don't touch this substep.
pub(crate) fn pair_impact<S: Scalar>(
    offset: Vec2<S>,
    velocity: Vec2<S>,
    reach: S,
    dt: S,
) -> Option<(UnitVec2<S>, S)> {
    let two = S::ONE + S::ONE;
    let quadratic_a = velocity.dot(velocity);
    let quadratic_b = two * offset.dot(velocity);
    let quadratic_c = offset.dot(offset) - reach * reach;
    let discriminant = quadratic_b * quadratic_b - two * two * quadratic_a * quadratic_c;
    if quadratic_a == S::ZERO || discriminant < S::ZERO {
        return None;
    }
    let time = (-quadratic_b - discriminant.sqrt()) / (two * quadratic_a);
    if time < S::ZERO || time > dt {
        return None;
    }
    let (_, normal) = (offset + velocity * time).length_and_direction()?;
    Some((normal, -normal.dot(velocity) * time))
}

/// Conservative advancement of a circle toward a segment: step to where the
/// gap along the current normal would close, re-measure, a few times.
pub(crate) fn segment_impact<S: Scalar>(
    segment: Segment<S>,
    position: Vec2<S>,
    velocity: Vec2<S>,
    radius: S,
    dt: S,
) -> Option<(UnitVec2<S>, S)> {
    /// Steps of the advancement: each one lands within the curvature of
    /// an end's corner of the true contact, and three are exact on a side
    /// (one step) and well under a micrometre at a corner.
    const ADVANCE_STEPS: usize = 3;
    let mut time = S::ZERO;
    let mut normal = None;
    for _ in 0..ADVANCE_STEPS {
        let (distance, step_normal) = segment.toward(position + velocity * time);
        let closing_speed = step_normal.dot(velocity);
        if closing_speed <= S::ZERO {
            return None;
        }
        normal = Some(step_normal);
        time += (distance - radius) / closing_speed;
        if time > dt {
            return None;
        }
    }
    normal.map(|normal| (normal, normal.dot(velocity) * time))
}

#[cfg(test)]
mod properties;
#[cfg(test)]
mod tests;
