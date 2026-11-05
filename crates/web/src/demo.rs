//! [`Demo`]: one running demo instance (world + between-steps behavior +
//! clock + render buffer).
//!
//! Everything the exports do is implemented here as plain, safe Rust and
//! tested natively; `exports.rs` only adapts it to the C ABI. The parts
//! live in `demo/`: wire codes (`codes.rs`), the world and its force
//! (`sim.rs`), and the runtime scalar choice (`any_world.rs`).

mod any_world;
mod codes;
mod constraint_scenes;
mod drag;
mod jelly;
mod sim;

use core::num::NonZeroU32;

use engine::scenarios::{
    Fountain, ORBIT_CIRCULAR, orbit, orbit_gravity, pendulum, pendulum_gravity,
};
use engine::{
    Baumgarte, ConfigError, Grab, Integrator, OpeningAngle, Scalar, Softening, Solver, TimeStep,
    World,
};

use crate::abi;
use crate::fixed_step::FixedStep;
use any_world::{AnyWorld, build_any, each_scalar, fill_positions};
#[cfg(test)]
pub(crate) use codes::GravityScene;
pub(crate) use codes::{
    DemoKind, ScalarKind, integrator_from_code, jelly_body_from_code, order_from_code,
    solver_from_code, stabilization_from_code, start_from_code,
};
use sim::{Sim, gravity_scene};

/// Physics steps per simulated second a demo starts with ([`abi::DEFAULT_RATE_HZ`]).
/// Displays at any refresh rate advance the simulation at this rate via
/// [`FixedStep`]. A `NonZeroU32` so the step size `1 / rate` is positive by
/// construction.
// `unwrap` in a const item runs at compile time: a zero here fails the
// build, so it can't panic at runtime (and clippy's unwrap_used agrees).
pub(crate) const PHYSICS_RATE: NonZeroU32 = NonZeroU32::new(abi::DEFAULT_RATE_HZ).unwrap();

/// What runs between physics steps.
enum BetweenSteps {
    /// Relaunch fallen particles (the fountain, which owns the PRNG).
    Respawn(Fountain),
    /// Nothing: every other scene just steps.
    Nothing,
}

pub(crate) struct Demo {
    world: AnyWorld,
    between_steps: BetweenSteps,
    clock: FixedStep,
    /// `[x0, y0, x1, y1, ...]` in world units (m), always `f32`, so the
    /// renderer is independent of the engine's scalar type.
    render_buf: Vec<f32>,
    /// The grab in progress, if any (`demo/drag.rs`).
    grab: Option<Grab>,
    /// `[a0, b0, a1, b1, ...]`: the particles each constraint joins, for
    /// drawing rods. Rebuilt when constraints change (new, grab, release).
    links: Vec<u32>,
}

impl Demo {
    /// `n` and `seed` apply to the fountain and the M2 scenes; the orbit is
    /// always one star and one planet (symplectic Euler to start), the
    /// pendulum one pin and one bob (XPBD, one substep to start).
    ///
    /// # Errors
    /// Propagates [`ConfigError`] from building the scene's world.
    pub(crate) fn new(
        kind: DemoKind,
        scalar: ScalarKind,
        n: usize,
        seed: u64,
    ) -> Result<Self, ConfigError> {
        let (world, between_steps) = match kind {
            DemoKind::Fountain => {
                let mut fountain = Fountain::new(seed);
                let world = build_any!(scalar, Sim::plain(fountain.world(n)));
                (world, BetweenSteps::Respawn(fountain))
            }
            DemoKind::Orbit => {
                let start = Integrator::SymplecticEuler;
                let world = build_any!(
                    scalar,
                    Sim::with_gravity(orbit(start, ORBIT_CIRCULAR)?, orbit_gravity()?)
                );
                (world, BetweenSteps::Nothing)
            }
            DemoKind::Gravity(scene) => (
                build_any!(scalar, gravity_scene(scene, n, seed)?),
                BetweenSteps::Nothing,
            ),
            DemoKind::Pendulum => {
                let world = build_any!(
                    scalar,
                    Sim::with_uniform(pendulum(Solver::Xpbd, NonZeroU32::MIN)?, pendulum_gravity())
                );
                (world, BetweenSteps::Nothing)
            }
        };
        Ok(Self::assemble(world, between_steps, n))
    }

    /// A demo around `world`, its buffers filled. `n` sizes the render
    /// buffer up front (a hint: it grows if needed).
    fn assemble(world: AnyWorld, between_steps: BetweenSteps, n: usize) -> Self {
        let mut demo = Self {
            world,
            between_steps,
            clock: FixedStep::new(PHYSICS_RATE),
            render_buf: Vec::with_capacity(abi::COORDS_PER_PARTICLE * n),
            grab: None,
            links: Vec::new(),
        };
        demo.fill_render_buf();
        demo.refresh_links();
        demo
    }

    /// Adds `elapsed` seconds of real time, runs the resulting fixed steps,
    /// and refreshes the render buffer. Returns the number of steps taken.
    pub(crate) fn advance(&mut self, elapsed: f64) -> u32 {
        let steps = self.clock.advance(elapsed);
        let dt = self.clock.dt();
        let between = &mut self.between_steps;
        each_scalar!(&mut self.world, s => run_steps(&mut s.world, between, steps, dt));
        self.fill_render_buf();
        steps
    }

    /// Particle `i`'s position in the engine's own scalar, widened to
    /// `f64` (lossless): for readouts the `f32` render buffer can't resolve,
    /// e.g. two tips 1e-9 m apart near 2 m, where `f32`'s spacing is
    /// ~2.4e-7 m. `None` past the last particle.
    #[must_use]
    pub(crate) fn particle_position(&self, i: usize) -> Option<(f64, f64)> {
        each_scalar!(&self.world, s => s.world.particles().pos().get(i).map(|p| (p.x.to_f64(), p.y.to_f64())))
    }

    /// Interleaved particle positions, `f32`, in meters.
    #[must_use]
    pub(crate) fn positions(&self) -> &[f32] {
        &self.render_buf
    }

    /// Test-only: JS sets integrators but never reads them back.
    #[cfg(test)]
    #[must_use]
    pub(crate) const fn integrator(&self) -> Integrator {
        each_scalar!(&self.world, s => s.world.integrator())
    }

    /// Takes effect from the next step.
    pub(crate) const fn set_integrator(&mut self, integrator: Integrator) {
        each_scalar!(&mut self.world, s => s.world.set_integrator(integrator));
    }

    /// Which solver steps the world when it has constraints.
    pub(crate) fn set_solver(&mut self, solver: Solver) {
        each_scalar!(&mut self.world, s => s.world.set_solver(solver));
    }

    /// The impulse solver's β, parsed at the boundary in `f64` and cast
    /// (checked again). `false`, changing nothing, if it leaves the type in
    /// the engine's scalar (it can't: `[0, 1]` survives rounding).
    pub(crate) fn set_baumgarte(&mut self, beta: Baumgarte<f64>) -> bool {
        each_scalar!(&mut self.world, s => beta.cast().is_some_and(|b| {
            s.world.set_baumgarte(b);
            true
        }))
    }

    pub(crate) const fn set_substeps(&mut self, substeps: NonZeroU32) {
        each_scalar!(&mut self.world, s => s.world.set_substeps(substeps));
    }

    pub(crate) const fn set_iterations(&mut self, iterations: NonZeroU32) {
        each_scalar!(&mut self.world, s => s.world.set_iterations(iterations));
    }

    /// Max constraint error (m), or `None` for a world without
    /// constraints.
    #[must_use]
    pub(crate) fn constraint_error(&self) -> Option<f64> {
        // A held grab's rod is the last constraint; its stretch is the
        // pull, not error, so the readout leaves it out.
        let skip = usize::from(self.grab.is_some());
        each_scalar!(&self.world, s => s.constraint_error(skip))
    }

    /// Physics steps per simulated second (`dt = 1 / rate`). Drops owed
    /// time, so a rate change never fires a catch-up step.
    pub(crate) fn set_rate(&mut self, rate: NonZeroU32) {
        self.clock.set_rate(rate);
    }

    /// Sets a pairwise-gravity scene's softening (from the next step); the
    /// energy readout follows. `eps` was parsed at the boundary in `f64`
    /// and is cast, checked again, to the engine's scalar. Returns `false`,
    /// changing nothing, for other scenes or an ε that overflows there.
    pub(crate) fn set_softening(&mut self, eps: Softening<f64>) -> bool {
        each_scalar!(&mut self.world, s => eps.cast().is_some_and(|e| s.set_softening(e)))
    }

    /// Switches a pairwise-gravity scene to Barnes–Hut with opening angle
    /// `theta` (parsed in `f64`, cast like ε); it stays on through softening
    /// changes. `false`, changing nothing, for other scenes.
    pub(crate) fn set_theta(&mut self, theta: OpeningAngle<f64>) -> bool {
        each_scalar!(&mut self.world, s => theta.cast().is_some_and(|t| s.set_theta(t)))
    }

    /// Test-only: θ if Barnes–Hut is on, as `f64`.
    #[cfg(test)]
    pub(crate) fn theta(&self) -> Option<f64> {
        each_scalar!(&self.world, s => s.theta().map(|t| t.get().to_f64()))
    }

    /// Total energy (kinetic + potential) in joules, read out as `f64`, or
    /// `None` where it isn't defined (the fountain).
    #[must_use]
    pub(crate) fn energy(&self) -> Option<f64> {
        each_scalar!(&self.world, s => s.energy())
    }

    fn fill_render_buf(&mut self) {
        let buf = &mut self.render_buf;
        each_scalar!(&self.world, s => fill_positions(&s.world, buf));
    }
}

/// Runs `steps` fixed steps of `dt` seconds, with what runs between them.
fn run_steps<S: Scalar>(w: &mut World<S>, between: &mut BetweenSteps, steps: u32, dt: f64) {
    // `dt` is `1 / rate` for a positive whole rate, so always a valid step;
    // anything else steps nothing.
    let Some(dt) = TimeStep::<S>::new(S::from_f64(dt)) else {
        return;
    };
    for _ in 0..steps {
        w.step(dt);
        if let BetweenSteps::Respawn(fountain) = between {
            fountain.respawn_fallen(w);
        }
    }
}

#[cfg(test)]
mod tests;
