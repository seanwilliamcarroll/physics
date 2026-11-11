//! Pockets on a world (M7, `docs/09-billiards.md`, "Pockets"): sensors
//! that take balls out of play, and the events the page reads.

use super::World;
use crate::collision::Pocket;
use crate::{Mass, ParticleId, Radius, Scalar, Vec2};

impl<S: Scalar> World<S> {
    /// Adds a pocket; checked after every substep the solver steps.
    pub fn add_pocket(&mut self, pocket: Pocket<S>) {
        self.pockets.push(pocket);
    }

    #[must_use]
    pub fn pockets(&self) -> &[Pocket<S>] {
        &self.pockets
    }

    /// The balls potted during the last [`step`](Self::step), as `(ball,
    /// pocket index)`, in the order they went in.
    #[must_use]
    pub fn potted(&self) -> &[(ParticleId, usize)] {
        &self.potted
    }

    /// Takes particle `id` out of play: static, radius 0 (it collides with
    /// nothing), at rest, its spin zeroed, left where it is. Every other
    /// index is kept. `false` past the end.
    pub fn retire(&mut self, id: ParticleId) -> bool {
        let i = id.index();
        let Some(&x) = self.particles.pos.get(i) else {
            return false;
        };
        if let Some(om) = self.spin.get_mut(i) {
            *om = Vec2::ZERO;
        }
        self.particles.set_body(i, x, S::ZERO, S::ZERO)
    }

    /// Puts particle `id` back in play at `pos`, at rest, as a ball of
    /// `mass` and `radius` (a scratched cue ball re-spotted). `false` past
    /// the end.
    pub fn reinstate(
        &mut self,
        id: ParticleId,
        pos: Vec2<S>,
        mass: Mass<S>,
        radius: Radius<S>,
    ) -> bool {
        let i = id.index();
        if let Some(om) = self.spin.get_mut(i) {
            *om = Vec2::ZERO;
        }
        self.particles.set_body(i, pos, mass.inv(), radius.get())
    }

    /// Pots every moving ball whose centre is in a pocket.
    pub(super) fn pot(&mut self) {
        let hits: Vec<(ParticleId, usize)> = self
            .particles
            .pos
            .iter()
            .zip(self.particles.inv_mass.iter().zip(&self.particles.radius))
            .enumerate()
            .filter(|(_, (_, (w, r)))| **w != S::ZERO && **r != S::ZERO)
            .filter_map(|(i, (&x, _))| {
                let k = self.pockets.iter().position(|p| p.holds(x))?;
                Some((ParticleId(i), k))
            })
            .collect();
        for &(id, _) in &hits {
            self.retire(id);
        }
        self.potted.extend(hits);
    }
}
