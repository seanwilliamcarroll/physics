//! The jelly: its constructor and live stiffness and damping.

use core::num::NonZeroU32;

use engine::ConfigError;
use engine::diagnostics::kinetic_energy;
use engine::scenarios::{JellyBody, jelly, pendulum_gravity};

use super::any_world::{build_any, each_scalar};
use super::sim::Sim;
use super::{BetweenSteps, Demo, ScalarKind};

/// At 10 substeps (h = 1/600 s) the force-based jelly blows up at ~2 250–3 400
/// N/m.
pub(super) const JELLY_START_SUBSTEPS: NonZeroU32 = NonZeroU32::new(10).unwrap();

impl Demo {
    /// `scenarios::jelly`: a `cols` × `rows` grid with springs of `stiffness`
    /// and `damping`, realized as `body` says.
    ///
    /// # Errors
    /// [`ConfigError`] for a stiffness or damping the realization can't
    /// take, or an empty grid.
    pub(crate) fn new_jelly(
        scalar: ScalarKind,
        body: JellyBody,
        cols: usize,
        rows: usize,
        stiffness: f64,
        damping: f64,
    ) -> Result<Self, ConfigError> {
        let world = build_any!(scalar, {
            let built = jelly(body, JELLY_START_SUBSTEPS, cols, rows, stiffness, damping)?;
            Sim::with_jelly(built.world, pendulum_gravity(), built.springs)
        });
        Ok(Self::assemble(world, BetweenSteps::Nothing, cols * rows))
    }

    /// A jelly's spring stiffness, live; `false` for a value its
    /// realization can't take (force springs can't be rigid) or a scene
    /// that isn't a jelly. A held drag rod keeps its own stiffness.
    pub(crate) fn set_stiffness(&mut self, stiffness: f64) -> bool {
        let grab = self.grab.as_ref();
        each_scalar!(&mut self.world, sim => sim.set_stiffness(stiffness, grab))
    }

    /// A jelly's damping, live, as [`Demo::set_stiffness`].
    pub(crate) fn set_damping(&mut self, damping: f64) -> bool {
        let grab = self.grab.as_ref();
        each_scalar!(&mut self.world, sim => sim.set_damping(damping, grab))
    }

    /// Kinetic energy, J: the jelly page's explosion indicator (elastic
    /// energy of stiff, unconverged constraints is meaningless).
    #[must_use]
    pub(crate) fn kinetic_energy(&self) -> f64 {
        each_scalar!(&self.world, sim => engine::Scalar::to_f64(kinetic_energy(sim.world.particles())))
    }
}
