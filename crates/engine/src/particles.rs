//! [`Particles<S>`]: struct-of-arrays storage for point masses, and
//! [`ParticleId`], the handle `add` returns.

use crate::{Scalar, Vec2};

/// Names one particle: its slot in [`Particles`].
///
/// A plain index, no generation counter: particles can't be removed, so an
/// id can never go stale (`docs/type-invariants.md`, item 5, keeps the
/// trigger for a generational handle). Only [`Particles`] creates ids, so
/// every id is a slot that exists in the `Particles` it came from.
/// Not `#[must_use]`: most scenes add particles without naming them.
#[derive(Copy, Clone, Debug, PartialEq, Eq, Hash)]
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
}

impl<S: Scalar> Particles<S> {
    #[must_use]
    pub const fn new() -> Self {
        Self {
            pos: Vec::new(),
            vel: Vec::new(),
            inv_mass: Vec::new(),
        }
    }

    /// Adds a dynamic particle. `mass` must be positive: it's inverted here,
    /// and `1 / 0` has no fixed-point representation. Use
    /// [`add_static`](Self::add_static) for immovable particles.
    pub fn add(&mut self, pos: Vec2<S>, vel: Vec2<S>, mass: S) -> ParticleId {
        self.push(pos, vel, S::ONE / mass)
    }

    /// Adds an immovable particle (`inv_mass = 0`, zero velocity).
    pub fn add_static(&mut self, pos: Vec2<S>) -> ParticleId {
        self.push(pos, Vec2::ZERO, S::ZERO)
    }

    /// Appends to every field; the new slot is the old length.
    fn push(&mut self, pos: Vec2<S>, vel: Vec2<S>, inv_mass: S) -> ParticleId {
        let id = ParticleId(self.pos.len());
        self.pos.push(pos);
        self.vel.push(vel);
        self.inv_mass.push(inv_mass);
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
}

impl<S: Scalar> Default for Particles<S> {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests;
