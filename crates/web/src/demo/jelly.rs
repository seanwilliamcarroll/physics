//! The M5 jelly: its constructor and live stiffness and damping.

use core::num::NonZeroU32;

use engine::ConfigError;
use engine::diagnostics::kinetic_energy;
use engine::scenarios::{JellyBody, jelly, pendulum_gravity};

use super::any_world::{build_any, each_scalar};
use super::sim::Sim;
use super::{BetweenSteps, Demo, ScalarKind};

/// Substeps the jelly starts with: 10 (h = 1/600 s), where M5.5 measured
/// the force-based jelly blowing up at ~2 250–3 400 N/m; the page can
/// change it.
// `unwrap` in a const item runs at compile time (as `PHYSICS_RATE`).
const JELLY_START_SUBSTEPS: NonZeroU32 = NonZeroU32::new(10).unwrap();

impl Demo {
    /// `scenarios::jelly`: a `cols` × `rows` grid with springs of
    /// stiffness `k` and damping `c`, realized as `body` says.
    ///
    /// # Errors
    /// [`ConfigError`] for a stiffness or damping the realization can't
    /// take, or an empty grid.
    pub(crate) fn new_jelly(
        scalar: ScalarKind,
        body: JellyBody,
        cols: usize,
        rows: usize,
        k: f64,
        c: f64,
    ) -> Result<Self, ConfigError> {
        let world = build_any!(scalar, {
            let j = jelly(body, JELLY_START_SUBSTEPS, cols, rows, k, c)?;
            Sim::with_jelly(j.world, pendulum_gravity(), j.springs)
        });
        Ok(Self::assemble(world, BetweenSteps::Nothing, cols * rows))
    }

    /// A jelly's spring stiffness, live; `false` for a value its
    /// realization can't take (force springs can't be rigid) or a scene
    /// that isn't a jelly. A held drag rod keeps its own stiffness.
    pub(crate) fn set_stiffness(&mut self, k: f64) -> bool {
        let grab = self.grab.as_ref();
        each_scalar!(&mut self.world, s => s.set_stiffness(k, grab))
    }

    /// A jelly's damping, live, as [`Demo::set_stiffness`].
    pub(crate) fn set_damping(&mut self, c: f64) -> bool {
        let grab = self.grab.as_ref();
        each_scalar!(&mut self.world, s => s.set_damping(c, grab))
    }

    /// Kinetic energy, J: the M5 page's explosion indicator (elastic
    /// energy of stiff, unconverged constraints is meaningless).
    #[must_use]
    pub(crate) fn kinetic_energy(&self) -> f64 {
        each_scalar!(&self.world, s => engine::Scalar::to_f64(kinetic_energy(&s.world.particles)))
    }
}
