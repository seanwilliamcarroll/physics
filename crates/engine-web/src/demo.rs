//! [`Demo`]: one running demo (world, between-steps behavior, clock, render
//! buffer). Everything the exports do is implemented here as safe Rust and
//! tested natively; `exports.rs` only adapts it to the C ABI.

mod any_world;
mod codes;
mod collisions;
mod constraint_scenes;
mod drag;
mod jelly;
mod pool;
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
use any_world::{AnyWorld, build_any, each_scalar, fill_positions};
#[cfg(test)]
pub(crate) use codes::GravityScene;
pub(crate) use codes::{
    DemoKind, ScalarKind, integrator_from_code, jelly_body_from_code, order_from_code,
    solver_from_code, stabilization_from_code, start_from_code,
};
use sim::{Sim, gravity_scene};
use web_common::FixedStep;

/// Physics steps per simulated second a demo starts with. `NonZeroU32` so the
/// step `1 / rate` is positive by construction.
// `unwrap` in a const item runs at compile time: a zero fails the build.
pub(crate) const PHYSICS_RATE: NonZeroU32 = NonZeroU32::new(abi::DEFAULT_RATE_HZ).unwrap();

/// What runs between physics steps.
enum BetweenSteps {
    /// Relaunch fallen particles (the fountain owns the random generator).
    Respawn(Fountain),
    Nothing,
    /// Collect what each step potted, `[ball, pocket, …]`: `World::potted` is
    /// per step, and a frame runs several.
    Pocket(Vec<u32>),
}

pub(crate) struct Demo {
    world: AnyWorld,
    between_steps: BetweenSteps,
    clock: FixedStep,
    /// `[x0, y0, x1, y1, ...]` in m, always `f32`, so rendering doesn't depend
    /// on the engine's scalar type.
    render_buffer: Vec<f32>,
    grab: Option<Grab>,
    /// `[a0, b0, a1, b1, ...]`: the particles each constraint joins, for
    /// drawing rods. Rebuilt when constraints change.
    links: Vec<u32>,
    /// `[a0, b0, a1, b1, ...]`: the broadphase's candidate pairs, filled on
    /// request.
    pairs: Vec<u32>,
    /// The pool table's segments `[x0, y0, x1, y1, …]` and pockets `[x, y, r, …]`,
    /// `f32`, filled once; empty otherwise.
    segments_buffer: Vec<f32>,
    pockets_buffer: Vec<f32>,
}

impl Demo {
    /// `particle_count` and `seed` apply to the fountain and the gravity
    /// scenes; the orbit and the pendulum have fixed sizes.
    ///
    /// # Errors
    /// Propagates [`ConfigError`] from building the scene's world.
    pub(crate) fn new(
        kind: DemoKind,
        scalar: ScalarKind,
        particle_count: usize,
        seed: u64,
    ) -> Result<Self, ConfigError> {
        let (world, between_steps) = match kind {
            DemoKind::Fountain => {
                let mut fountain = Fountain::new(seed);
                let world = build_any!(scalar, Sim::plain(fountain.world(particle_count)));
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
                build_any!(scalar, gravity_scene(scene, particle_count, seed)?),
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
        Ok(Self::assemble(world, between_steps, particle_count))
    }

    /// A demo around `world`, its buffers filled. `particle_count` is a
    /// capacity hint for the render buffer.
    fn assemble(world: AnyWorld, between_steps: BetweenSteps, particle_count: usize) -> Self {
        let mut demo = Self {
            world,
            between_steps,
            clock: FixedStep::new(PHYSICS_RATE),
            render_buffer: Vec::with_capacity(abi::COORDS_PER_PARTICLE * particle_count),
            grab: None,
            links: Vec::new(),
            pairs: Vec::new(),
            segments_buffer: Vec::new(),
            pockets_buffer: Vec::new(),
        };
        demo.fill_render_buffer();
        demo.refresh_links();
        demo
    }

    /// Adds `elapsed` seconds of real time, runs the resulting fixed steps,
    /// and refreshes the render buffer. Returns the number of steps taken.
    pub(crate) fn advance(&mut self, elapsed: f64) -> u32 {
        let steps = self.clock.advance(elapsed);
        let rate = self.clock.rate();
        let between = &mut self.between_steps;
        each_scalar!(&mut self.world, sim => run_steps(&mut sim.world, between, steps, rate));
        self.fill_render_buffer();
        steps
    }

    /// Particle `index`'s position in the engine's own scalar, widened to
    /// `f64`, for readouts the `f32` render buffer can't resolve (`f32`
    /// spacing near 2 m is ~2.4e-7 m). `None` past the last particle.
    #[must_use]
    pub(crate) fn particle_position(&self, index: usize) -> Option<(f64, f64)> {
        each_scalar!(&self.world, sim => sim.world.particles().positions().get(index).map(|position| (position.x.to_f64(), position.y.to_f64())))
    }

    /// Interleaved particle positions, `f32`, in meters.
    #[must_use]
    pub(crate) fn positions(&self) -> &[f32] {
        &self.render_buffer
    }

    /// Test-only: JS never reads the integrator back.
    #[cfg(test)]
    #[must_use]
    pub(crate) const fn integrator(&self) -> Integrator {
        each_scalar!(&self.world, sim => sim.world.integrator())
    }

    pub(crate) const fn set_integrator(&mut self, integrator: Integrator) {
        each_scalar!(&mut self.world, sim => sim.world.set_integrator(integrator));
    }

    pub(crate) fn set_solver(&mut self, solver: Solver) {
        each_scalar!(&mut self.world, sim => sim.world.set_solver(solver));
    }

    /// The impulse solver's β, parsed in `f64` and cast to the engine's
    /// scalar. `false`, changing nothing, if the cast fails (it can't: `[0, 1]`
    /// survives rounding).
    pub(crate) fn set_baumgarte(&mut self, beta: Baumgarte<f64>) -> bool {
        each_scalar!(&mut self.world, sim => beta.cast().is_some_and(|beta| {
            sim.world.set_baumgarte(beta);
            true
        }))
    }

    pub(crate) const fn set_substeps(&mut self, substeps: NonZeroU32) {
        each_scalar!(&mut self.world, sim => sim.world.set_substeps(substeps));
    }

    pub(crate) const fn set_iterations(&mut self, iterations: NonZeroU32) {
        each_scalar!(&mut self.world, sim => sim.world.set_iterations(iterations));
    }

    /// Max constraint error (m), or `None` for a world without constraints.
    #[must_use]
    pub(crate) fn constraint_error(&self) -> Option<f64> {
        // A held grab's rod is the last constraint; its stretch is the
        // pull, not error, so the readout leaves it out.
        let skip = usize::from(self.grab.is_some());
        each_scalar!(&self.world, sim => sim.constraint_error(skip))
    }

    pub(crate) const fn clock(&mut self) -> &mut FixedStep {
        &mut self.clock
    }

    /// Sets a pairwise-gravity scene's softening, parsed in `f64` and cast to
    /// the engine's scalar. `false`, changing nothing, for other scenes or a
    /// value that overflows the scalar.
    pub(crate) fn set_softening(&mut self, softening: Softening<f64>) -> bool {
        each_scalar!(&mut self.world, sim => softening.cast().is_some_and(|softening| sim.set_softening(softening)))
    }

    /// Switches a pairwise-gravity scene to Barnes–Hut with the given opening
    /// angle; it stays on through softening changes. `false`, changing
    /// nothing, for other scenes.
    pub(crate) fn set_theta(&mut self, theta: OpeningAngle<f64>) -> bool {
        each_scalar!(&mut self.world, sim => theta.cast().is_some_and(|theta| sim.set_theta(theta)))
    }

    #[cfg(test)]
    pub(crate) fn theta(&self) -> Option<f64> {
        each_scalar!(&self.world, sim => sim.theta().map(|theta| theta.get().to_f64()))
    }

    /// Total energy in joules, or `None` where it isn't defined (the
    /// fountain).
    #[must_use]
    pub(crate) fn energy(&self) -> Option<f64> {
        each_scalar!(&self.world, sim => sim.energy())
    }

    fn fill_render_buffer(&mut self) {
        let buffer = &mut self.render_buffer;
        each_scalar!(&self.world, sim => fill_positions(&sim.world, buffer));
    }
}

/// Runs `steps` fixed steps of `1 / rate` seconds, with what runs between
/// them.
fn run_steps<S: Scalar>(
    world: &mut World<S>,
    between: &mut BetweenSteps,
    steps: u32,
    rate: NonZeroU32,
) {
    // `1 / rate` for a positive whole rate is always a valid step (even
    // u32::MAX's, ~2.3e-10 s, is a normal f32); anything else steps nothing.
    let Some(time_step) = TimeStep::<S>::per_second(f64::from(rate.get())) else {
        return;
    };
    for _ in 0..steps {
        world.step(time_step);
        match between {
            BetweenSteps::Respawn(fountain) => {
                fountain.respawn_fallen(world);
            }
            BetweenSteps::Pocket(potted) => {
                for &(ball, pocket) in world.potted() {
                    if let (Ok(ball), Ok(pocket)) =
                        (u32::try_from(ball.index()), u32::try_from(pocket))
                    {
                        potted.extend([ball, pocket]);
                    }
                }
            }
            BetweenSteps::Nothing => {}
        }
    }
}

#[cfg(test)]
mod tests;
