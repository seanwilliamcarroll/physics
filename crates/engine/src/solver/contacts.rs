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
    /// what the forces alone add in two substeps (Müller et al. 2020).
    pub(crate) rest_speed: Vec<S>,
    /// What this substep's force kick adds to the normal velocity,
    /// `h n · (a_b − a_a)`: the impact stage runs before the kick.
    pub(crate) kick_normal_velocity: Vec<S>,
    /// Each contact's restitution: a segment's own, or the world's.
    pub(crate) restitution: Vec<S>,
    /// The impulse solver's split pseudo-impulse per contact, this
    /// substep only (one-sided, like λ; never warm-started).
    pub(crate) pseudo_lambda: Vec<S>,
    /// The impact stage's scratch (`solver/impacts.rs`): whether
    /// each contact is in the current round, and its impulse there.
    pub(crate) in_round: Vec<bool>,
    pub(crate) round_impulse: Vec<S>,
    /// The impact stage's scratch when restitutions differ: a union-find
    /// parent per particle, each group's smallest restitution, and each
    /// contact's this round.
    pub(crate) group: Vec<usize>,
    pub(crate) group_restitution: Vec<S>,
    pub(crate) round_restitution: Vec<S>,
    /// Last substep's contacts as sorted keys `(first, second, index)`,
    /// `index` into `warm_lambda`: the impulse solver's warm start. Keys,
    /// not λ tuples, share the engine's one sort (`sort_key.rs`).
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
            kick_normal_velocity: Vec::new(),
            restitution: Vec::new(),
            pseudo_lambda: Vec::new(),
            in_round: Vec::new(),
            round_impulse: Vec::new(),
            group: Vec::new(),
            group_restitution: Vec::new(),
            round_restitution: Vec::new(),
            warm: Vec::new(),
            warm_lambda: Vec::new(),
            pairs: Vec::new(),
        }
    }

    /// Finds this substep's contacts and records each one's resting
    /// threshold, kick and restitution. `acc` is the per-particle
    /// acceleration from the forces.
    pub(crate) fn find(
        &mut self,
        particles: &Particles<S>,
        statics: Statics<'_, S>,
        world_restitution: Restitution<S>,
        acc: &[Vec2<S>],
        dt: S,
        speculative: bool,
    ) {
        // Without speculation: only what touches (within the margin) now
        // (`docs/09-billiards.md`, "Tunneling").
        let reach = if speculative { dt } else { S::ZERO };
        find_contacts(particles, statics, reach, &mut self.pairs, &mut self.list);
        self.list
            .retain_mut(|contact| at_impact(particles, statics, contact, dt));
        self.restitution.clear();
        self.restitution.extend(self.list.iter().map(|contact| {
            match contact.b {
                Body::Segment(index) => statics
                    .segments
                    .get(index)
                    .map_or(world_restitution.get(), |segment| {
                        segment.restitution().get()
                    }),
                Body::Particle(_) | Body::Wall(_) => world_restitution.get(),
            }
        }));
        self.lambda.clear();
        self.lambda.resize(self.list.len(), S::ZERO);
        self.pseudo_lambda.clear();
        self.pseudo_lambda.resize(self.list.len(), S::ZERO);
        self.rest_speed.clear();
        self.kick_normal_velocity.clear();
        let two = S::ONE + S::ONE;
        for contact in &self.list {
            let relative_acc = body_acc(acc, contact.b)
                - acc.get(contact.a.index()).copied().unwrap_or(Vec2::ZERO);
            self.rest_speed.push(two * relative_acc.length() * dt);
            self.kick_normal_velocity
                .push(contact.normal.dot(relative_acc) * dt);
        }
    }
}

impl<S: Scalar> Contacts<S> {
    /// Sets each contact's λ to its impulse from the previous substep (0 for
    /// a new contact): the impulse solver's warm start, matched by bodies.
    pub(crate) fn recall(&mut self) {
        for (contact, lambda) in self.list.iter().zip(self.lambda.iter_mut()) {
            let key = pair_key(contact);
            *lambda = self
                .warm
                .binary_search_by(|&(first, second, _)| (first, second).cmp(&key))
                .ok()
                .and_then(|position| self.warm.get(position))
                .and_then(|&(_, _, contact_index)| self.warm_lambda.get(contact_index))
                .copied()
                .unwrap_or(S::ZERO);
        }
    }

    /// Keeps this substep's impulses for the next substep's [`recall`](Self::recall).
    pub(crate) fn remember(&mut self) {
        self.warm.clear();
        self.warm
            .extend(self.list.iter().enumerate().map(|(index, contact)| {
                let (first, second) = pair_key(contact);
                (first, second, index)
            }));
        sort(&mut self.warm);
        self.warm_lambda.clear();
        self.warm_lambda.extend_from_slice(&self.lambda);
    }

    pub(crate) fn clear(&mut self) {
        self.list.clear();
        self.lambda.clear();
        self.warm.clear();
        self.warm_lambda.clear();
    }
}

/// A contact's bodies as the first two fields of a [`SortKey`]: the first
/// body's index, then the second's for a particle or `−1 − i` for wall `i`.
/// Each pair of bodies has one contact per substep, so keys are distinct.
fn pair_key<S>(contact: &Contact<S>) -> (i64, i64) {
    let second = match contact.b {
        Body::Particle(particle) => index_key(particle.index()),
        Body::Wall(index) => -1 - index_key(index),
        // Below every wall's key: distinct from them up to 2⁴⁰ walls.
        Body::Segment(index) => -(1_i64 << 40) - index_key(index),
    };
    (index_key(contact.a.index()), second)
}

/// Moves a speculative contact (separated, approaching) to the moment of
/// impact: the normal and gap where the pair first touches this substep,
/// moving in straight lines at their current velocities. The normal found
/// at the substep's start is still turning on a glancing hit: cut shots
/// went 1–8° off at 10 substeps (`tests/cushions.rs`). Head-on hits,
/// touching contacts and walls are unchanged. The gap becomes `(closing
/// speed along the new normal) · t`.
///
/// Returns whether to keep the contact: one that doesn't touch this
/// substep is dropped, unless it's within [`CONTACT_MARGIN`] (resting).
/// Kept otherwise, a glancing pair bounced a substep early at the stale
/// normal (an 80° cut left at 60°).
fn at_impact<S: Scalar>(
    particles: &Particles<S>,
    statics: Statics<'_, S>,
    contact: &mut Contact<S>,
    dt: S,
) -> bool {
    if contact.gap <= S::ZERO {
        return true;
    }
    // Within the margin but not touching: a resting neighbour, kept as found.
    let near = contact.gap <= S::from_f64(CONTACT_MARGIN);
    let first = contact.a.index();
    let (Some(&first_position), Some(&first_velocity), Some(&first_radius)) = (
        particles.pos().get(first),
        particles.vel().get(first),
        particles.radius().get(first),
    ) else {
        return true;
    };
    let hit = match contact.b {
        Body::Particle(second) => {
            let second = second.index();
            let (Some(&second_position), Some(&second_velocity), Some(&second_radius)) = (
                particles.pos().get(second),
                particles.vel().get(second),
                particles.radius().get(second),
            ) else {
                return true;
            };
            pair_impact(
                second_position - first_position,
                second_velocity - first_velocity,
                first_radius + second_radius,
                dt,
            )
        }
        Body::Segment(index) => {
            let Some(segment) = statics.segments.get(index) else {
                return true;
            };
            segment_impact(*segment, first_position, first_velocity, first_radius, dt)
        }
        Body::Wall(_) => return true,
    };
    let Some((normal, gap)) = hit else {
        return near;
    };
    contact.normal = normal;
    contact.gap = gap;
    true
}

/// `(first, second, first_inv_mass, second_inv_mass)`: the particle
/// indices (`second` is `None` for a wall or segment, whose inverse mass is
/// 0) and inverse masses, or `None` if a body isn't in `particles`.
pub(crate) fn bodies<S: Scalar>(
    particles: &Particles<S>,
    contact: &Contact<S>,
) -> Option<(usize, Option<usize>, S, S)> {
    let first = contact.a.index();
    let first_inv_mass = *particles.inv_mass().get(first)?;
    match contact.b {
        Body::Particle(second) => Some((
            first,
            Some(second.index()),
            first_inv_mass,
            *particles.inv_mass().get(second.index())?,
        )),
        Body::Wall(_) | Body::Segment(_) => Some((first, None, first_inv_mass, S::ZERO)),
    }
}

/// The contact's gap and normal (first body toward second) at the
/// *current* positions: XPBD re-measures within a substep.
pub(crate) fn geometry<S: Scalar>(
    particles: &Particles<S>,
    statics: Statics<'_, S>,
    contact: &Contact<S>,
) -> Option<(S, UnitVec2<S>)> {
    let first = contact.a.index();
    let (first_position, first_radius) = (
        *particles.pos().get(first)?,
        *particles.radius().get(first)?,
    );
    match contact.b {
        Body::Particle(second) => {
            let second = second.index();
            let (second_position, second_radius) = (
                *particles.pos().get(second)?,
                *particles.radius().get(second)?,
            );
            // Coincident: +x, as when the contact was found.
            let (distance, normal) = (second_position - first_position)
                .length_and_direction()
                .unwrap_or((S::ZERO, UnitVec2::X));
            Some((distance - first_radius - second_radius, normal))
        }
        Body::Wall(index) => {
            let wall = statics.walls.get(index)?;
            Some((wall.distance(first_position) - first_radius, -wall.normal()))
        }
        Body::Segment(index) => {
            let (distance, normal) = statics.segments.get(index)?.toward(first_position);
            Some((distance - first_radius, normal))
        }
    }
}

/// `n · (v_b − v_a)` at the particles' current velocities: positive when
/// separating. A wall's velocity is 0.
pub(crate) fn normal_velocity<S: Scalar>(
    particles: &Particles<S>,
    contact: &Contact<S>,
    normal: UnitVec2<S>,
) -> S {
    normal_velocity_in(particles.vel(), contact, normal)
}

/// `n · (v_b − v_a)` with velocities from `velocities` (current, or saved).
pub(crate) fn normal_velocity_in<S: Scalar>(
    velocities: &[Vec2<S>],
    contact: &Contact<S>,
    normal: UnitVec2<S>,
) -> S {
    let first_velocity = velocities
        .get(contact.a.index())
        .copied()
        .unwrap_or(Vec2::ZERO);
    let second_velocity = match contact.b {
        Body::Particle(second) => velocities
            .get(second.index())
            .copied()
            .unwrap_or(Vec2::ZERO),
        Body::Wall(_) | Body::Segment(_) => Vec2::ZERO,
    };
    normal.dot(second_velocity - first_velocity)
}

/// A body's acceleration this substep (a wall's is 0).
fn body_acc<S: Scalar>(acc: &[Vec2<S>], body: Body) -> Vec2<S> {
    match body {
        Body::Particle(particle) => acc.get(particle.index()).copied().unwrap_or(Vec2::ZERO),
        Body::Wall(_) | Body::Segment(_) => Vec2::ZERO,
    }
}

/// Moves `first` by `−first_delta` and `second` (if a particle) by
/// `+second_delta` in `vectors` (positions or velocities, whichever slice
/// is passed).
pub(crate) fn push_apart<S: Scalar>(
    vectors: &mut [Vec2<S>],
    first: usize,
    second: Option<usize>,
    first_delta: Vec2<S>,
    second_delta: Vec2<S>,
) {
    match second {
        Some(second) => {
            if let Ok([first_vector, second_vector]) = vectors.get_disjoint_mut([first, second]) {
                *first_vector -= first_delta;
                *second_vector += second_delta;
            }
        }
        None => {
            if let Some(first_vector) = vectors.get_mut(first) {
                *first_vector -= first_delta;
            }
        }
    }
}

#[cfg(test)]
mod tests;
