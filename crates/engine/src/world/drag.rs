//! Dragging a particle (`docs/06-constraints.md`, "Dragging"): a static
//! anchor at the pointer, joined to the particle by a compliant rod of rest
//! length 0, removed again on release.

use super::ConfigError;
use super::World;
use crate::{Compliance, DistanceConstraint, ParticleId, Scalar, StaticId, Vec2};

/// A grab in progress. Not `Clone`: [`World::release`] consumes it, so a
/// grab can't be released twice or dragged after release.
#[derive(Debug, PartialEq, Eq)]
pub struct Grab {
    anchor: StaticId,
    particle: ParticleId,
    rod: usize,
}

impl Grab {
    #[must_use]
    pub const fn particle(&self) -> ParticleId {
        self.particle
    }
}

impl<S: Scalar> World<S> {
    /// Replaces every constraint with `change` of it, except the rod of a
    /// held grab (`except`), for live changes like a stiffness slider
    /// (`docs/07-soft-bodies.md`, "Live stiffness").
    ///
    /// # Errors
    /// [`ConfigError::ChangedBodies`], changing nothing, if `change` changes
    /// which particles a constraint joins.
    pub fn update_constraints(
        &mut self,
        except: Option<&Grab>,
        change: impl Fn(DistanceConstraint<S>) -> DistanceConstraint<S>,
    ) -> Result<(), ConfigError> {
        self.constraints.update(except.map(|grab| grab.rod), change)
    }

    /// Only a world a solver already steps can be grabbed: a grab's rod
    /// would otherwise hand the whole world to a solver while held.
    #[must_use]
    pub fn grabbable(&self) -> bool {
        !self.constraints.is_empty() || self.collides()
    }

    /// Grabs the dynamic particle nearest to `point` within `radius` (m)
    /// with a rod of compliance `softness`. `None` if none is that close or
    /// the world isn't [`grabbable`](Self::grabbable).
    pub fn grab(&mut self, point: Vec2<S>, radius: S, softness: Compliance<S>) -> Option<Grab> {
        if !self.grabbable() {
            return None;
        }
        let particle = self.particles.nearest_dynamic(point, radius)?;
        let anchor = self.particles.add_static(point);
        let rod = self.constraints().len();
        let link =
            DistanceConstraint::with_length(&self.particles, anchor, particle, S::ZERO, softness);
        if link.is_some_and(|constraint| self.add_constraint(constraint).is_ok()) {
            Some(Grab {
                anchor,
                particle,
                rod,
            })
        } else {
            // Unreachable by construction (both ids exist, length 0); undo.
            let _ = self.particles.pop_if_last(anchor.id());
            None
        }
    }

    pub fn drag(&mut self, grab: &Grab, point: Vec2<S>) {
        // The anchor is static by construction, so this can't be refused.
        let _ = self.particles.set_static_position(grab.anchor, point);
    }

    /// # Errors
    /// Gives the grab back if particles or constraints were added after it
    /// (removing the anchor would shift their ids).
    pub fn release(&mut self, grab: Grab) -> Result<(), Grab> {
        let last_particle = grab.anchor.index() + 1 == self.particles.len();
        let last_rod = grab.rod + 1 == self.constraints().len();
        if !(last_particle && last_rod) {
            return Err(grab);
        }
        let popped =
            self.constraints.pop_if_last(grab.rod) && self.particles.pop_if_last(grab.anchor.id());
        if popped { Ok(()) } else { Err(grab) }
    }
}

#[cfg(test)]
mod tests;
