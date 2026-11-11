//! The M6 scenes (the box, the break, the cradle): their constructors,
//! restitution, and the readouts the collision pages draw (radii,
//! momentum, the broadphase's grid and candidate pairs).

use core::num::NonZeroU32;

use engine::collision::{broadphase_cell, candidate_pairs};
use engine::diagnostics::momentum;
use engine::scenarios::{ball_box, break_shot, cradle, pendulum_gravity};
use engine::{ConfigError, Restitution, Scalar, Solver, World};

use super::any_world::{build_any, each_scalar};
use super::sim::Sim;
use super::{BetweenSteps, Demo, ScalarKind};

/// Substeps the M6 scenes start with: 10, the setting `tests/impacts.rs`
/// measured them at (the cradle's last ball within 1.3% under XPBD). The
/// pages can change it.
// `unwrap` in a const item runs at compile time (as `PHYSICS_RATE`).
const START_SUBSTEPS: NonZeroU32 = NonZeroU32::new(10).unwrap();
/// The solver the M6 scenes start with; the pages set their own.
const START_SOLVER: Solver = Solver::Impulse;

impl Demo {
    /// `scenarios::ball_box`: `n` balls (clamped to the scene's slots)
    /// with velocities from `seed`, elastic, under gravity.
    ///
    /// # Errors
    /// [`ConfigError`] from building the scene (not for valid input).
    pub(crate) fn new_ball_box(
        scalar: ScalarKind,
        n: usize,
        seed: u64,
    ) -> Result<Self, ConfigError> {
        let world = build_any!(
            scalar,
            Sim::with_uniform(
                ball_box(START_SOLVER, START_SUBSTEPS, n, seed)?,
                pendulum_gravity()
            )
        );
        Ok(Self::assemble(world, BetweenSteps::Nothing, n))
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

    /// Restitution for every collision, from the next step. `false`,
    /// changing nothing, for a world without collisions (nothing to
    /// bounce) or an `e` that leaves the type in the engine's scalar (it
    /// can't: `[0, 1]` survives rounding).
    pub(crate) fn set_restitution(&mut self, e: Restitution<f64>) -> bool {
        each_scalar!(&mut self.world, s => s.world.collides() && e.cast().is_some_and(|e| {
            s.world.set_restitution(e);
            true
        }))
    }

    /// Particle `i`'s radius, m (0 for a point or a pin), or `None` past
    /// the last particle.
    #[must_use]
    pub(crate) fn particle_radius(&self, i: usize) -> Option<f64> {
        each_scalar!(&self.world, s => s.world.particles().radius().get(i).map(|r| r.to_f64()))
    }

    /// Total momentum `Σ m v`, kg·m/s.
    #[must_use]
    pub(crate) fn momentum(&self) -> (f64, f64) {
        each_scalar!(&self.world, s => {
            let p = momentum(s.world.particles());
            (p.x.to_f64(), p.y.to_f64())
        })
    }

    /// Recomputes the broadphase's candidate pairs for the current state,
    /// as the next substep will see them, into the pairs buffer (`[a0,
    /// b0, a1, b1, …]`). Returns the grid's cell size, m, or `None` for a
    /// world without collisions (the buffer is then empty).
    pub(crate) fn update_pairs(&mut self) -> Option<f64> {
        let rate = self.clock.rate();
        let pairs = &mut self.pairs;
        pairs.clear();
        each_scalar!(&self.world, s => broadphase_of(&s.world, rate, pairs))
    }

    /// The pairs buffer [`Demo::update_pairs`] fills.
    #[must_use]
    pub(crate) fn pairs(&self) -> &[u32] {
        &self.pairs
    }
}

/// The cell size `w`'s next substep uses (steps of `1 / rate` s), and its
/// candidate pairs into `out`; `None` for a world without collisions.
fn broadphase_of<S: Scalar>(w: &World<S>, rate: NonZeroU32, out: &mut Vec<u32>) -> Option<f64> {
    if !w.collides() {
        return None;
    }
    let substeps = f64::from(rate.get()) * f64::from(w.substeps().get());
    let h = S::from_f64(1.0 / substeps);
    let p = w.particles();
    let cell = broadphase_cell(p, h);
    let mut pairs = Vec::new();
    candidate_pairs(p.pos(), p.radius(), cell, &mut pairs);
    // Indices past `u32::MAX` can't occur in a wasm32 address space; a
    // pair with one would be skipped, not wrapped (as the links buffer).
    for (a, b) in pairs {
        if let (Ok(a), Ok(b)) = (u32::try_from(a), u32::try_from(b)) {
            out.extend([a, b]);
        }
    }
    Some(cell.to_f64())
}
