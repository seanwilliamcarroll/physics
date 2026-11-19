//! [`Particles<S>`]: struct-of-arrays storage for point masses, and
//! [`ParticleId`], the handle `add` returns.

use crate::{Mass, Radius, Scalar, Vec2};

/// Names one particle: its slot in [`Particles`].
///
/// A plain index, no generation counter: the only removal is a grab's
/// release popping its anchor, the last particle added, whose id only that
/// `Grab` holds. So every id outlives its use (`docs/type-invariants.md`,
/// item 5). Only [`Particles`] creates ids, so each is a slot that exists.
///
/// Ordered by slot, so contacts can be sorted by their bodies.
#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct ParticleId(pub(crate) usize);

impl ParticleId {
    #[must_use]
    pub const fn index(self) -> usize {
        self.0
    }
}

/// Names one **static** particle (`inv_mass = 0`): what
/// [`Particles::add_static`] returns and
/// [`set_static_position`](Particles::set_static_position) takes, so
/// teleporting a dynamic particle is a type error. Converts into a
/// [`ParticleId`].
///
/// A handle, not separate storage: a static is a particle of infinite mass,
/// so solvers need no special case.
#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct StaticId(ParticleId);

impl StaticId {
    #[must_use]
    pub const fn index(self) -> usize {
        self.0.index()
    }

    #[must_use]
    pub const fn id(self) -> ParticleId {
        self.0
    }
}

impl From<StaticId> for ParticleId {
    fn from(id: StaticId) -> Self {
        id.0
    }
}

/// Point masses stored as a struct of arrays (one `Vec` per field), always
/// the same length: accessors hand out slices, which can't add or remove.
#[derive(Clone, Debug)]
pub struct Particles<S> {
    pub(crate) pos: Vec<Vec2<S>>,
    pub(crate) vel: Vec<Vec2<S>>,
    /// `1 / mass`; `0` means static (immovable).
    pub(crate) inv_mass: Vec<S>,
    /// Circle radius, m; `0` means a point that never collides
    /// (`docs/08-collision.md`, "Shapes").
    pub(crate) radius: Vec<S>,
    /// The largest radius: the broadphase's cell size, and whether
    /// anything collides at all. Kept on every add and pop.
    max_radius: S,
}

impl<S: Scalar> Particles<S> {
    #[must_use]
    pub const fn new() -> Self {
        Self {
            pos: Vec::new(),
            vel: Vec::new(),
            inv_mass: Vec::new(),
            radius: Vec::new(),
            max_radius: S::ZERO,
        }
    }

    pub fn add(&mut self, position: Vec2<S>, velocity: Vec2<S>, mass: Mass<S>) -> ParticleId {
        self.push(position, velocity, mass.inv(), S::ZERO)
    }

    pub fn add_circle(
        &mut self,
        position: Vec2<S>,
        velocity: Vec2<S>,
        mass: Mass<S>,
        radius: Radius<S>,
    ) -> ParticleId {
        self.push(position, velocity, mass.inv(), radius.get())
    }

    pub fn add_static(&mut self, position: Vec2<S>) -> StaticId {
        StaticId(self.push(position, Vec2::ZERO, S::ZERO, S::ZERO))
    }

    /// Re-forms the particle in `slot` as a body at rest (retiring or
    /// reinstating a ball). A smaller radius leaves `max_radius` as it was
    /// (only a slightly large broadphase cell). `false` past the end.
    pub(crate) fn set_body(
        &mut self,
        slot: usize,
        position: Vec2<S>,
        inv_mass: S,
        radius: S,
    ) -> bool {
        let (Some(slot_position), Some(slot_velocity), Some(slot_inv_mass), Some(slot_radius)) = (
            self.pos.get_mut(slot),
            self.vel.get_mut(slot),
            self.inv_mass.get_mut(slot),
            self.radius.get_mut(slot),
        ) else {
            return false;
        };
        (*slot_position, *slot_velocity, *slot_inv_mass, *slot_radius) =
            (position, Vec2::ZERO, inv_mass, radius);
        if radius > self.max_radius {
            self.max_radius = radius;
        }
        true
    }

    fn push(&mut self, position: Vec2<S>, velocity: Vec2<S>, inv_mass: S, radius: S) -> ParticleId {
        let id = ParticleId(self.pos.len());
        self.pos.push(position);
        self.vel.push(velocity);
        self.inv_mass.push(inv_mass);
        self.radius.push(radius);
        if radius > self.max_radius {
            self.max_radius = radius;
        }
        id
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.pos.len()
    }

    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.pos.is_empty()
    }

    #[must_use]
    pub fn pos(&self) -> &[Vec2<S>] {
        &self.pos
    }

    #[must_use]
    pub fn vel(&self) -> &[Vec2<S>] {
        &self.vel
    }

    pub fn vel_mut(&mut self) -> &mut [Vec2<S>] {
        &mut self.vel
    }

    #[must_use]
    pub fn inv_mass(&self) -> &[S] {
        &self.inv_mass
    }

    #[must_use]
    pub fn radius(&self) -> &[S] {
        &self.radius
    }

    #[must_use]
    pub const fn max_radius(&self) -> S {
        self.max_radius
    }

    /// Moves a **static** particle (a drag anchor, a moving pin). `false`,
    /// changing nothing, if `id` isn't a static particle of *these*
    /// particles (one from another world).
    #[must_use]
    pub fn set_static_position(&mut self, id: StaticId, position: Vec2<S>) -> bool {
        match (self.inv_mass.get(id.index()), self.pos.get_mut(id.index())) {
            (Some(&inv_mass), Some(slot_position)) if inv_mass == S::ZERO => {
                *slot_position = position;
                true
            }
            _ => false,
        }
    }

    #[must_use]
    pub fn nearest_dynamic(&self, point: Vec2<S>, radius: S) -> Option<ParticleId> {
        let mut nearest: Option<(usize, S)> = None;
        for (slot, (&position, &inv_mass)) in self.pos.iter().zip(&self.inv_mass).enumerate() {
            let distance_squared = (position - point).length_sq();
            if inv_mass != S::ZERO
                && distance_squared <= radius * radius
                && nearest.is_none_or(|(_, best)| distance_squared < best)
            {
                nearest = Some((slot, distance_squared));
            }
        }
        nearest.map(|(slot, _)| ParticleId(slot))
    }

    /// Removes `id` if it is the last particle added (a drag anchor); the
    /// only removal, so every other id stays valid.
    pub(crate) fn pop_if_last(&mut self, id: ParticleId) -> bool {
        if id.0 + 1 != self.pos.len() {
            return false;
        }
        self.pos.pop();
        self.vel.pop();
        self.inv_mass.pop();
        // Popping is rare (a drag anchor), so recompute rather than track
        // a second-largest.
        if self
            .radius
            .pop()
            .is_some_and(|popped| popped == self.max_radius)
        {
            self.max_radius =
                self.radius.iter().fold(
                    S::ZERO,
                    |largest, &radius| {
                        if radius > largest { radius } else { largest }
                    },
                );
        }
        true
    }
}

impl<S: Scalar> Default for Particles<S> {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests;
