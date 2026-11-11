//! The billiards table on a world (M7, `docs/09-billiards.md`): the
//! cloth, the balls' spin, and the cue.

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
        let i = id.index();
        let p = &mut self.particles;
        let (Some(&r), Some(&w)) = (p.radius.get(i), p.inv_mass.get(i)) else {
            return false;
        };
        if r == S::ZERO || w == S::ZERO {
            return false;
        }
        self.spin.resize(p.pos.len(), Vec2::ZERO);
        let d = aim.get();
        let two = S::ONE + S::ONE;
        let five = S::from_f64(5.0);
        let (Some(v), Some(om)) = (p.vel.get_mut(i), self.spin.get_mut(i)) else {
            return false;
        };
        *v = d * speed;
        *om = Vec2::new(-d.y, d.x) * (five * tip * speed / (two * r * r));
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
            before: Vec::new(),
            pairs: Vec::new(),
        });
    }

    /// Tunnels counted since counting started, or `None` if it's off.
    #[must_use]
    pub fn tunnels(&self) -> Option<u64> {
        self.tunnels.as_ref().map(|t| t.count)
    }
}
