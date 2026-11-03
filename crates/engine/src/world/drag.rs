//! Dragging a particle (`docs/06-constraints.md`, "Dragging"): a static
//! anchor at the pointer, joined to the particle by a compliant rod of rest
//! length 0, removed again on release.

use super::World;
use crate::{Compliance, DistanceConstraint, ParticleId, Scalar, Vec2};

/// A grab in progress. Not `Clone`: [`World::release`] consumes it, so a
/// grab can't be released twice or dragged after release.
#[derive(Debug, PartialEq, Eq)]
pub struct Grab {
    /// The static particle that follows the pointer.
    anchor: ParticleId,
    /// The particle being dragged.
    particle: ParticleId,
    /// Index of the anchor's rod in the constraint list.
    rod: usize,
}

impl Grab {
    /// The particle being dragged.
    #[must_use]
    pub const fn particle(&self) -> ParticleId {
        self.particle
    }
}

impl<S: Scalar> World<S> {
    /// Grabs the dynamic particle nearest to `point` within `radius` (m):
    /// adds a static anchor at `point` and a rod of rest length 0 and
    /// compliance `softness` from it to the particle. `None`, changing
    /// nothing, if no dynamic particle is that close.
    pub fn grab(&mut self, point: Vec2<S>, radius: S, softness: Compliance<S>) -> Option<Grab> {
        let particle = self.particles.nearest_dynamic(point, radius)?;
        let anchor = self.particles.add_static(point);
        let rod = self.constraints().len();
        let link =
            DistanceConstraint::with_length(&self.particles, anchor, particle, S::ZERO, softness);
        if link.is_some_and(|c| self.add_constraint(c).is_ok()) {
            Some(Grab {
                anchor,
                particle,
                rod,
            })
        } else {
            // Unreachable by construction (both ids exist, length 0); undo.
            let _ = self.particles.pop_if_last(anchor);
            None
        }
    }

    /// Moves the grab's anchor to `point`; the rod pulls the particle after
    /// it from the next step.
    pub fn drag(&mut self, grab: &Grab, point: Vec2<S>) {
        // The anchor is static by construction, so this can't be refused.
        let _ = self.particles.set_static_position(grab.anchor, point);
    }

    /// Ends the grab, removing its rod and anchor.
    ///
    /// # Errors
    /// Gives the grab back, changing nothing, if particles or constraints
    /// were added after it (removing the anchor would shift the newer ids);
    /// the caller can remove those and retry.
    pub fn release(&mut self, grab: Grab) -> Result<(), Grab> {
        let last_particle = grab.anchor.index() + 1 == self.particles.len();
        let last_rod = grab.rod + 1 == self.constraints().len();
        if !(last_particle && last_rod) {
            return Err(grab);
        }
        let popped =
            self.constraints.pop_if_last(grab.rod) && self.particles.pop_if_last(grab.anchor);
        if popped { Ok(()) } else { Err(grab) }
    }
}

#[cfg(test)]
mod tests;
