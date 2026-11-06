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
    /// The static particle that follows the pointer.
    anchor: StaticId,
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
    /// Replaces every constraint `c` with `f(c)`, except the rod of
    /// `except` (a held grab: its stiffness is the drag's, not the
    /// scene's). For live changes that keep the world running, e.g. a
    /// stiffness slider (`docs/07-soft-bodies.md`, "Live stiffness"). `f`
    /// gets each constraint by value and its result replaces it in place
    /// (so λ stays aligned).
    ///
    /// # Errors
    /// [`ConfigError::ChangedBodies`], changing nothing, if `f` changes
    /// which particles any constraint joins.
    pub fn update_constraints(
        &mut self,
        except: Option<&Grab>,
        f: impl Fn(DistanceConstraint<S>) -> DistanceConstraint<S>,
    ) -> Result<(), ConfigError> {
        self.constraints.update(except.map(|g| g.rod), f)
    }

    /// Whether this world can be grabbed: only if a solver already steps it
    /// (it has constraints, or something collides). A grab is a rod; in a
    /// world the integrator steps, adding one would hand the whole world to
    /// a solver for as long as it's held (M5's force-spring jelly would
    /// stop being stepped by symplectic Euler), so such a world refuses.
    #[must_use]
    pub fn grabbable(&self) -> bool {
        !self.constraints.is_empty() || self.collides()
    }

    /// Grabs the dynamic particle nearest to `point` within `radius` (m):
    /// adds a static anchor at `point` and a rod of rest length 0 and
    /// compliance `softness` from it to the particle. `None`, changing
    /// nothing, if no dynamic particle is that close, or the world isn't
    /// [`grabbable`](Self::grabbable).
    pub fn grab(&mut self, point: Vec2<S>, radius: S, softness: Compliance<S>) -> Option<Grab> {
        if !self.grabbable() {
            return None;
        }
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
            let _ = self.particles.pop_if_last(anchor.id());
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
            self.constraints.pop_if_last(grab.rod) && self.particles.pop_if_last(grab.anchor.id());
        if popped { Ok(()) } else { Err(grab) }
    }
}

#[cfg(test)]
mod tests;
