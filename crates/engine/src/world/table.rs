//! The billiards table on a world (`docs/09-billiards.md`): the cloth, the
//! balls' spin, and the cue.

use super::World;
use crate::table::Table;
use crate::{ParticleId, Scalar, UnitVec2, Vec2};

impl<S: Scalar> World<S> {
    /// Puts the world on a cloth (`Some`) or takes it off (`None`, the
    /// default), from the next step. Spins are kept either way.
    pub const fn set_table(&mut self, table: Option<Table<S>>) {
        self.table = table;
    }

    #[must_use]
    pub const fn table(&self) -> Option<Table<S>> {
        self.table
    }

    /// Each particle's spin about the horizontal axes, `(ω_x, ω_y)`,
    /// rad/s, aligned with the particles (0 for any not yet stepped).
    #[must_use]
    pub fn spin(&self) -> &[Vec2<S>] {
        &self.spin
    }

    /// Strikes ball `id` with the cue along `aim` at `speed` m/s, the tip
    /// `tip` m above the ball's centre (`docs/09-billiards.md`, "The cue"):
    /// `v = speed · aim`, `ω = (5 tip speed / 2R²) (ẑ × aim)`. `tip = 0`
    /// is a stun, `2R/5` natural roll, above follow, below draw. `false`,
    /// changing nothing, for a particle that isn't a ball (static, or no
    /// radius) or isn't there.
    pub fn strike(&mut self, id: ParticleId, aim: UnitVec2<S>, speed: S, tip: S) -> bool {
        let index = id.index();
        let particles = &mut self.particles;
        let (Some(&radius), Some(&inv_mass)) =
            (particles.radius.get(index), particles.inv_mass.get(index))
        else {
            return false;
        };
        if radius == S::ZERO || inv_mass == S::ZERO {
            return false;
        }
        self.spin.resize(particles.pos.len(), Vec2::ZERO);
        let direction = aim.get();
        let two = S::ONE + S::ONE;
        let five = S::from_f64(5.0);
        let (Some(velocity), Some(spin)) = (particles.vel.get_mut(index), self.spin.get_mut(index))
        else {
            return false;
        };
        *velocity = direction * speed;
        *spin =
            Vec2::new(-direction.y, direction.x) * (five * tip * speed / (two * radius * radius));
        true
    }
}

impl<S: Scalar> World<S> {
    /// Speculative contacts on (the default) or off, from the next step.
    /// Off, a contact is only what touches (within the margin) at a
    /// substep's start, so fast balls can pass through each other at low
    /// substeps (`docs/09-billiards.md`, "Tunneling").
    pub const fn set_speculative(&mut self, on: bool) {
        self.speculative = on;
    }

    #[must_use]
    pub const fn speculative(&self) -> bool {
        self.speculative
    }

    /// Starts counting tunnels from zero (`collision::count_tunnels`, after
    /// every substep the solver steps), or stops (`false`, the default:
    /// counting costs a broadphase a substep).
    pub fn count_tunnels(&mut self, on: bool) {
        self.tunnels = on.then(|| super::TunnelCount {
            count: 0,
            starting_positions: Vec::new(),
            pairs: Vec::new(),
        });
    }

    /// Tunnels counted since counting started, or `None` if it's off.
    #[must_use]
    pub fn tunnels(&self) -> Option<u64> {
        self.tunnels.as_ref().map(|tunnels| tunnels.count)
    }
}
