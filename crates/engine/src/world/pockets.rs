//! Pockets on a world (`docs/09-billiards.md`, "Pockets"): sensors that take
//! balls out of play, and the events the page reads.

use super::World;
use crate::collision::Pocket;
use crate::{Mass, ParticleId, Radius, Scalar, Vec2};

impl<S: Scalar> World<S> {
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

    /// Takes `id` out of play: static, radius 0, at rest, left in place so
    /// every other index is kept. `false` past the end.
    pub fn retire(&mut self, id: ParticleId) -> bool {
        let index = id.index();
        let Some(&position) = self.particles.pos.get(index) else {
            return false;
        };
        if let Some(spin) = self.spin.get_mut(index) {
            *spin = Vec2::ZERO;
        }
        self.particles.set_body(index, position, S::ZERO, S::ZERO)
    }

    pub fn reinstate(
        &mut self,
        id: ParticleId,
        position: Vec2<S>,
        mass: Mass<S>,
        radius: Radius<S>,
    ) -> bool {
        let index = id.index();
        if let Some(spin) = self.spin.get_mut(index) {
            *spin = Vec2::ZERO;
        }
        self.particles
            .set_body(index, position, mass.inv(), radius.get())
    }

    pub(super) fn pot(&mut self) {
        let hits: Vec<(ParticleId, usize)> = self
            .particles
            .pos
            .iter()
            .zip(self.particles.inv_mass.iter().zip(&self.particles.radius))
            .enumerate()
            .filter(|(_, (_, (inv_mass, radius)))| **inv_mass != S::ZERO && **radius != S::ZERO)
            .filter_map(|(index, (&position, _))| {
                let pocket_index = self
                    .pockets
                    .iter()
                    .position(|pocket| pocket.holds(position))?;
                Some((ParticleId(index), pocket_index))
            })
            .collect();
        for &(id, _) in &hits {
            self.retire(id);
        }
        self.potted.extend(hits);
    }
}
