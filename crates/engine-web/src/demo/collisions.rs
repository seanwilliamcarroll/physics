//! The collision scenes (box, break, cradle): constructors, restitution, and
//! the readouts the collision pages draw.

use core::num::NonZeroU32;

use engine::collision::{broadphase_cell, candidate_pairs};
use engine::diagnostics::momentum;
use engine::scenarios::{ball_box, break_shot, cradle, pendulum_gravity};
use engine::{ConfigError, Restitution, Scalar, Solver, World};

use super::any_world::{build_any, each_scalar};
use super::sim::Sim;
use super::{BetweenSteps, Demo, ScalarKind};

/// Measured in `tests/impacts.rs`: the cradle's last ball within 1.3% under
/// XPBD.
const START_SUBSTEPS: NonZeroU32 = NonZeroU32::new(10).unwrap();
const START_SOLVER: Solver = Solver::Impulse;

impl Demo {
    /// `scenarios::ball_box`: `ball_count` balls (clamped to the scene's
    /// slots) with velocities from `seed`, elastic, under gravity.
    ///
    /// # Errors
    /// [`ConfigError`] from building the scene (not for valid input).
    pub(crate) fn new_ball_box(
        scalar: ScalarKind,
        ball_count: usize,
        seed: u64,
    ) -> Result<Self, ConfigError> {
        let world = build_any!(
            scalar,
            Sim::with_uniform(
                ball_box(START_SOLVER, START_SUBSTEPS, ball_count, seed)?,
                pendulum_gravity()
            )
        );
        Ok(Self::assemble(world, BetweenSteps::Nothing, ball_count))
    }

    /// `scenarios::break_shot` with the rack `gap` m apart, elastic, in
    /// free space. `gap` was checked at the boundary (finite, in range).
    ///
    /// # Errors
    /// [`ConfigError`] from building the scene (not for valid input).
    pub(crate) fn new_break_shot(scalar: ScalarKind, gap: f64) -> Result<Self, ConfigError> {
        let world = build_any!(
            scalar,
            Sim::free(break_shot(START_SOLVER, START_SUBSTEPS, gap)?)
        );
        Ok(Self::assemble(world, BetweenSteps::Nothing, 0))
    }

    /// `scenarios::cradle`: `balls` on rods, the first `pulled` swung out.
    ///
    /// # Errors
    /// [`ConfigError`] from building the scene (not for valid input).
    pub(crate) fn new_cradle(
        scalar: ScalarKind,
        balls: usize,
        pulled: usize,
    ) -> Result<Self, ConfigError> {
        let world = build_any!(
            scalar,
            Sim::with_uniform(
                cradle(START_SOLVER, START_SUBSTEPS, balls, pulled)?,
                pendulum_gravity()
            )
        );
        Ok(Self::assemble(world, BetweenSteps::Nothing, 2 * balls))
    }

    /// Restitution for every collision. `false`, changing nothing, for a
    /// world without collisions or a failed cast to the engine's scalar (it
    /// can't fail: `[0, 1]` survives rounding).
    pub(crate) fn set_restitution(&mut self, restitution: Restitution<f64>) -> bool {
        each_scalar!(&mut self.world, sim => sim.world.collides() && restitution.cast().is_some_and(|restitution| {
            sim.world.set_restitution(restitution);
            true
        }))
    }

    /// Particle `index`'s radius, m (0 for a point or a pin), or `None` past
    /// the last particle.
    #[must_use]
    pub(crate) fn particle_radius(&self, index: usize) -> Option<f64> {
        each_scalar!(&self.world, sim => sim.world.particles().radius().get(index).map(|radius| radius.to_f64()))
    }

    /// Total momentum `Σ m v`, kg·m/s.
    #[must_use]
    pub(crate) fn momentum(&self) -> (f64, f64) {
        each_scalar!(&self.world, sim => {
            let total = momentum(sim.world.particles());
            (total.x.to_f64(), total.y.to_f64())
        })
    }

    /// Recomputes the broadphase's candidate pairs as the next substep will
    /// see them, into the pairs buffer. Returns the grid's cell size, m, or
    /// `None` for a world without collisions (the buffer is then empty).
    pub(crate) fn update_pairs(&mut self) -> Option<f64> {
        let rate = self.clock.rate();
        let pairs = &mut self.pairs;
        pairs.clear();
        each_scalar!(&self.world, sim => broadphase_of(&sim.world, rate, pairs))
    }

    /// The pairs buffer [`Demo::update_pairs`] fills.
    #[must_use]
    pub(crate) fn pairs(&self) -> &[u32] {
        &self.pairs
    }
}

/// The cell size `world`'s next substep uses (steps of `1 / rate` s), and its
/// candidate pairs into `pairs_out`; `None` for a world without collisions.
fn broadphase_of<S: Scalar>(
    world: &World<S>,
    rate: NonZeroU32,
    pairs_out: &mut Vec<u32>,
) -> Option<f64> {
    if !world.collides() {
        return None;
    }
    let substeps_per_second = f64::from(rate.get()) * f64::from(world.substeps().get());
    let substep_length = S::from_f64(1.0 / substeps_per_second);
    let particles = world.particles();
    let cell = broadphase_cell(particles, substep_length);
    let mut pairs = Vec::new();
    candidate_pairs(particles.positions(), particles.radius(), cell, &mut pairs);
    // Indices past `u32::MAX` can't occur in a wasm32 address space; a pair
    // with one would be skipped, not wrapped.
    for (first, second) in pairs {
        if let (Ok(first), Ok(second)) = (u32::try_from(first), u32::try_from(second)) {
            pairs_out.extend([first, second]);
        }
    }
    Some(cell.to_f64())
}
