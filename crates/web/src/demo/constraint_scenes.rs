//! The M4 scenes' constructors: they take parameters `demo_new`'s
//! `(n, seed)` can't carry (a mass ratio, a start and an offset).

use core::num::NonZeroU32;

use engine::scenarios::{DoublePendulumStart, chain, double_pendulum, pendulum_gravity};
use engine::{ConfigError, Solver};

use super::any_world::build_any;
use super::sim::Sim;
use super::{BetweenSteps, Demo, ScalarKind};

/// Substeps the M4 scenes start with: 20, the setting `01` and M4.4
/// measured (chains hold under XPBD; the impulse double pendulum keeps its
/// energy). The page can change it.
// `unwrap` in a const item runs at compile time (as `PHYSICS_RATE`).
const START_SUBSTEPS: NonZeroU32 = NonZeroU32::new(20).unwrap();

impl Demo {
    /// `scenarios::chain` with `links` links and a bob `mass_ratio` times
    /// a link's mass, XPBD to start.
    ///
    /// # Errors
    /// [`ConfigError::InvalidMass`] for a mass ratio that makes no valid
    /// mass (≤ 0, NaN, overflow).
    pub(crate) fn new_chain(
        scalar: ScalarKind,
        links: usize,
        mass_ratio: f64,
    ) -> Result<Self, ConfigError> {
        let world = build_any!(
            scalar,
            Sim::with_uniform(
                chain(Solver::Xpbd, START_SUBSTEPS, links, mass_ratio)?,
                pendulum_gravity()
            )
        );
        Ok(Self::assemble(world, BetweenSteps::Nothing, links + 1))
    }

    /// `scenarios::double_pendulum` from `start` with the tip nudged by
    /// `offset` m, impulse to start (it keeps the energy chaos needs).
    ///
    /// # Errors
    /// [`ConfigError`] from building the scene (not for valid input).
    pub(crate) fn new_double_pendulum(
        scalar: ScalarKind,
        start: DoublePendulumStart,
        offset: f64,
    ) -> Result<Self, ConfigError> {
        let world = build_any!(
            scalar,
            Sim::with_uniform(
                double_pendulum(Solver::Impulse, START_SUBSTEPS, start, offset)?,
                pendulum_gravity()
            )
        );
        Ok(Self::assemble(world, BetweenSteps::Nothing, 3))
    }
}
