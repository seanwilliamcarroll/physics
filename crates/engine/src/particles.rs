//! [`Particles<S>`]: struct-of-arrays storage for point masses, and
//! [`ParticleId`], the handle `add` returns.

use crate::{Mass, Radius, Scalar, Vec2};

/// Names one particle: its slot in [`Particles`].
///
/// A plain index, no generation counter: particles can't be removed, so an
/// id can never go stale (`docs/type-invariants.md`, item 5, keeps the
/// trigger for a generational handle). Only [`Particles`] creates ids, so
/// every id is a slot that exists in the `Particles` it came from.
/// Not `#[must_use]`: most scenes add particles without naming them.
/// Ordered by slot, so contacts can be sorted and looked up by their
/// bodies (M6).
#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct ParticleId(pub(crate) usize);

impl ParticleId {
    /// The slot, for indexing the slices [`Particles`] hands out.
    #[must_use]
    pub const fn index(self) -> usize {
        self.0
    }
}

/// Point masses stored as a struct of arrays (one `Vec` per field).
///
/// Force and integration loops each touch one or two fields, so this layout keeps
/// them streaming through contiguous memory. The Vecs are private because
/// they must always have the same length; accessors hand out slices, which
/// allow element-wise edits but can't add or remove particles.
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

    /// Adds a dynamic particle, storing `1 / mass` (checked finite and
    /// positive by [`Mass::new`]). Use [`add_static`](Self::add_static) for
    /// immovable particles.
    pub fn add(&mut self, pos: Vec2<S>, vel: Vec2<S>, mass: Mass<S>) -> ParticleId {
        self.push(pos, vel, mass.inv(), S::ZERO)
    }

    /// Adds a dynamic circle: a particle with a radius, which collides
    /// with other circles and with walls (M6).
    pub fn add_circle(
        &mut self,
        pos: Vec2<S>,
        vel: Vec2<S>,
        mass: Mass<S>,
        radius: Radius<S>,
    ) -> ParticleId {
        self.push(pos, vel, mass.inv(), radius.get())
    }

    /// Adds an immovable particle (`inv_mass = 0`, zero velocity).
    pub fn add_static(&mut self, pos: Vec2<S>) -> ParticleId {
        self.push(pos, Vec2::ZERO, S::ZERO, S::ZERO)
    }

    /// Appends to every field; the new slot is the old length.
    fn push(&mut self, pos: Vec2<S>, vel: Vec2<S>, inv_mass: S, radius: S) -> ParticleId {
        let id = ParticleId(self.pos.len());
        self.pos.push(pos);
        self.vel.push(vel);
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

    /// Velocities, mutable in place (e.g. to launch or stop particles).
    pub fn vel_mut(&mut self) -> &mut [Vec2<S>] {
        &mut self.vel
    }

    #[must_use]
    pub fn inv_mass(&self) -> &[S] {
        &self.inv_mass
    }

    /// Radii, m; `0` for points.
    #[must_use]
    pub fn radius(&self) -> &[S] {
        &self.radius
    }

    /// The largest radius, m; `0` when nothing is a circle.
    #[must_use]
    pub const fn max_radius(&self) -> S {
        self.max_radius
    }

    /// Moves a **static** particle to `pos` (a drag anchor, a moving pin).
    /// `false`, changing nothing, if `id` is unknown or dynamic: teleporting
    /// a dynamic particle would break its momentum without a force.
    #[must_use]
    pub fn set_static_position(&mut self, id: ParticleId, pos: Vec2<S>) -> bool {
        match (self.inv_mass.get(id.0), self.pos.get_mut(id.0)) {
            (Some(&w), Some(x)) if w == S::ZERO => {
                *x = pos;
                true
            }
            _ => false,
        }
    }

    /// The dynamic particle nearest to `point` within `radius` (m), if any:
    /// what a pointer grab picks. Static particles can't be grabbed.
    #[must_use]
    pub fn nearest_dynamic(&self, point: Vec2<S>, radius: S) -> Option<ParticleId> {
        let mut best: Option<(usize, S)> = None;
        for (i, (&x, &w)) in self.pos.iter().zip(&self.inv_mass).enumerate() {
            let d_sq = (x - point).length_sq();
            if w != S::ZERO && d_sq <= radius * radius && best.is_none_or(|(_, b)| d_sq < b) {
                best = Some((i, d_sq));
            }
        }
        best.map(|(i, _)| ParticleId(i))
    }

    /// Removes `id` if it is the last particle added; `false` otherwise.
    /// Undoing the latest add (a drag anchor) is the only removal: every
    /// other id stays valid, so `ParticleId` can stay a plain index.
    pub(crate) fn pop_if_last(&mut self, id: ParticleId) -> bool {
        if id.0 + 1 != self.pos.len() {
            return false;
        }
        self.pos.pop();
        self.vel.pop();
        self.inv_mass.pop();
        // Popping is rare (a drag anchor), so recompute rather than track
        // a second-largest.
        if self.radius.pop().is_some_and(|r| r == self.max_radius) {
            self.max_radius = self
                .radius
                .iter()
                .fold(S::ZERO, |m, &r| if r > m { r } else { m });
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
