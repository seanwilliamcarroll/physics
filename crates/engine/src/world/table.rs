//! The billiards table on a world (`docs/09-billiards.md`): the cloth, the
//! balls' spin, and the cue.

use super::World;
use crate::table::Table;
use crate::{ParticleId, Scalar, UnitVec2, Vec2};

impl<S: Scalar> World<S> {
    /// Puts the world on a cloth, or takes it off (`None`, the default).
    pub const fn set_table(&mut self, table: Option<Table<S>>) {
        self.table = table;
    }

    #[must_use]
    pub const fn table(&self) -> Option<Table<S>> {
        self.table
    }

    #[must_use]
    pub fn spin(&self) -> &[Vec2<S>] {
        &self.spin
    }

    /// Strikes ball `id` with the cue along `aim` at `speed` m/s, the tip
    /// `tip` m above the ball's centre (`docs/09-billiards.md`, "The cue"):
    /// `v = speed · aim`, `ω = (5 tip speed / 2R²) (ẑ × aim)`. `tip = 0`
    /// is a stun, `2R/5` natural roll. `false` if `id` isn't a ball.
    pub fn strike(&mut self, id: ParticleId, aim: UnitVec2<S>, speed: S, tip: S) -> bool {
        let index = id.index();
        let particles = &mut self.particles;
        let (Some(&radius), Some(&inverse_mass)) = (
            particles.radius.get(index),
            particles.inverse_mass.get(index),
        ) else {
            return false;
        };
        if radius == S::ZERO || inverse_mass == S::ZERO {
            return false;
        }
        self.spin.resize(particles.positions.len(), Vec2::ZERO);
        let direction = aim.get();
        let two = S::ONE + S::ONE;
        let five = S::from_f64(5.0);
        let (Some(velocity), Some(spin)) = (
            particles.velocities.get_mut(index),
            self.spin.get_mut(index),
        ) else {
            return false;
        };
        *velocity = direction * speed;
        *spin =
            Vec2::new(-direction.y, direction.x) * (five * tip * speed / (two * radius * radius));
        true
    }
}

impl<S: Scalar> World<S> {
    /// Speculative contacts (default on). Off, fast balls can pass through
    /// each other at low substeps (`docs/09-billiards.md`, "Tunneling").
    pub const fn set_speculative(&mut self, on: bool) {
        self.speculative = on;
    }

    #[must_use]
    pub const fn speculative(&self) -> bool {
        self.speculative
    }

    /// Starts counting tunnels from zero, or stops (default: it costs a
    /// broadphase a substep).
    pub fn count_tunnels(&mut self, on: bool) {
        self.tunnels = on.then(|| super::TunnelCount {
            count: 0,
            starting_positions: Vec::new(),
            pairs: Vec::new(),
        });
    }

    #[must_use]
    pub fn tunnels(&self) -> Option<u64> {
        self.tunnels.as_ref().map(|tunnels| tunnels.count)
    }
}
