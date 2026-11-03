//! [`Demo`]: one running demo instance (world + scene + clock + render buffer).
//!
//! Everything the exports do is implemented here as plain, safe Rust and
//! tested natively; `lib.rs` only adapts it to the C ABI.

use core::num::NonZeroU32;

use engine::diagnostics::total_energy;
use engine::scenarios::{Fountain, ORBIT_CIRCULAR, cluster, cluster_gravity, orbit, orbit_gravity};
use engine::{ConfigError, Integrator, PairwiseGravity, Scalar, World};

use crate::abi;
use crate::fixed_step::FixedStep;

/// Physics steps per simulated second a demo starts with ([`abi::DEFAULT_RATE_HZ`]).
/// Displays at any refresh rate advance the simulation at this rate via
/// [`FixedStep`]. A `NonZeroU32` so the step size `1 / rate` is positive by
/// construction.
// `unwrap` in a const item runs at compile time: a zero here fails the
// build, so it can't panic at runtime (and clippy's unwrap_used agrees).
pub const PHYSICS_RATE: NonZeroU32 = NonZeroU32::new(abi::DEFAULT_RATE_HZ).unwrap();

/// Which numeric type the engine runs on, chosen at runtime by JS.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum ScalarKind {
    F32,
    F64,
}

impl ScalarKind {
    /// Decodes a `demo_new` scalar code ([`abi`]).
    #[must_use]
    pub const fn from_code(code: u32) -> Option<Self> {
        match code {
            abi::SCALAR_F32 => Some(Self::F32),
            abi::SCALAR_F64 => Some(Self::F64),
            _ => None,
        }
    }
}

/// Which scene to run.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum DemoKind {
    Fountain,
    Orbit,
    /// `n` bodies under pairwise gravity (`scenarios::cluster`): M2.
    Cluster,
}

impl DemoKind {
    /// Decodes a `demo_new` kind code ([`abi`]).
    #[must_use]
    pub const fn from_code(code: u32) -> Option<Self> {
        match code {
            abi::DEMO_FOUNTAIN => Some(Self::Fountain),
            abi::DEMO_ORBIT => Some(Self::Orbit),
            abi::DEMO_CLUSTER => Some(Self::Cluster),
            _ => None,
        }
    }
}

/// Decodes a `demo_set_integrator` code ([`abi`]). A free function because
/// `Integrator` belongs to the engine, which knows nothing of wire codes.
#[must_use]
pub const fn integrator_from_code(code: u32) -> Option<Integrator> {
    match code {
        abi::INTEGRATOR_SYMPLECTIC_EULER => Some(Integrator::SymplecticEuler),
        abi::INTEGRATOR_EXPLICIT_EULER => Some(Integrator::ExplicitEuler),
        abi::INTEGRATOR_VELOCITY_VERLET => Some(Integrator::VelocityVerlet),
        _ => None,
    }
}

/// Runtime scalar choice. Each variant monomorphizes a full engine copy into
/// the `.wasm`, so binary size grows per variant (measure when adding one).
enum AnyWorld {
    F32(World<f32>),
    F64(World<f64>),
}

/// Per-scene state and behavior beyond the world itself.
enum Scene {
    /// Relaunches fallen particles after every step; owns the PRNG.
    Fountain(Fountain),
    /// Nothing between steps; energy is defined (`orbit_gravity`).
    Orbit,
    /// Nothing between steps; energy is defined (`cluster_gravity`).
    Cluster,
}

pub struct Demo {
    world: AnyWorld,
    scene: Scene,
    clock: FixedStep,
    /// `[x0, y0, x1, y1, ...]` in world units (m), always `f32`, so the
    /// renderer is independent of the engine's scalar type.
    render_buf: Vec<f32>,
}

impl Demo {
    /// `n` and `seed` apply to the fountain; the orbit is always one star and
    /// one planet, starting with symplectic Euler.
    ///
    /// # Errors
    /// Propagates [`ConfigError`] from building the scene's world.
    pub fn new(
        kind: DemoKind,
        scalar: ScalarKind,
        n: usize,
        seed: u64,
    ) -> Result<Self, ConfigError> {
        let (world, scene) = match kind {
            DemoKind::Fountain => {
                let mut fountain = Fountain::new(seed);
                let world = match scalar {
                    ScalarKind::F32 => AnyWorld::F32(fountain.world(n)?),
                    ScalarKind::F64 => AnyWorld::F64(fountain.world(n)?),
                };
                (world, Scene::Fountain(fountain))
            }
            DemoKind::Orbit => {
                let start = Integrator::SymplecticEuler;
                let world = match scalar {
                    ScalarKind::F32 => AnyWorld::F32(orbit(start, ORBIT_CIRCULAR)?),
                    ScalarKind::F64 => AnyWorld::F64(orbit(start, ORBIT_CIRCULAR)?),
                };
                (world, Scene::Orbit)
            }
            DemoKind::Cluster => {
                let world = match scalar {
                    ScalarKind::F32 => AnyWorld::F32(cluster(n, seed)?),
                    ScalarKind::F64 => AnyWorld::F64(cluster(n, seed)?),
                };
                (world, Scene::Cluster)
            }
        };
        let mut demo = Self {
            world,
            scene,
            clock: FixedStep::new(PHYSICS_RATE),
            render_buf: Vec::with_capacity(abi::COORDS_PER_PARTICLE * n),
        };
        demo.fill_render_buf();
        Ok(demo)
    }

    /// Adds `elapsed` seconds of real time, runs the resulting fixed steps,
    /// and refreshes the render buffer. Returns the number of steps taken.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        let steps = self.clock.advance(elapsed);
        let dt = self.clock.dt();
        match &mut self.world {
            AnyWorld::F32(w) => step_scene(w, &mut self.scene, steps, dt),
            AnyWorld::F64(w) => step_scene(w, &mut self.scene, steps, dt),
        }
        self.fill_render_buf();
        steps
    }

    /// Interleaved particle positions, `f32`, in meters.
    #[must_use]
    pub fn positions(&self) -> &[f32] {
        &self.render_buf
    }

    /// Test-only: JS sets integrators but never reads them back.
    #[cfg(test)]
    #[must_use]
    pub const fn integrator(&self) -> Integrator {
        match &self.world {
            AnyWorld::F32(w) => w.integrator(),
            AnyWorld::F64(w) => w.integrator(),
        }
    }

    /// Takes effect from the next step.
    pub const fn set_integrator(&mut self, integrator: Integrator) {
        match &mut self.world {
            AnyWorld::F32(w) => w.set_integrator(integrator),
            AnyWorld::F64(w) => w.set_integrator(integrator),
        }
    }

    /// Physics steps per simulated second (`dt = 1 / rate`). Drops owed
    /// time, so a rate change never fires a catch-up step.
    pub fn set_rate(&mut self, rate: NonZeroU32) {
        self.clock.set_rate(rate);
    }

    /// Total energy (kinetic + potential) in joules, read out as `f64`, or
    /// `None` where it isn't defined (the fountain: `diagnostics` has no
    /// uniform-gravity potential).
    #[must_use]
    pub fn energy(&self) -> Option<f64> {
        match (&self.scene, &self.world) {
            (Scene::Fountain(_), _) => None,
            (Scene::Orbit, AnyWorld::F32(w)) => Some(energy_under(w, &orbit_gravity())),
            (Scene::Orbit, AnyWorld::F64(w)) => Some(energy_under(w, &orbit_gravity())),
            (Scene::Cluster, AnyWorld::F32(w)) => Some(energy_under(w, &cluster_gravity())),
            (Scene::Cluster, AnyWorld::F64(w)) => Some(energy_under(w, &cluster_gravity())),
        }
    }

    fn fill_render_buf(&mut self) {
        match &self.world {
            AnyWorld::F32(w) => fill_positions(w, &mut self.render_buf),
            AnyWorld::F64(w) => fill_positions(w, &mut self.render_buf),
        }
    }
}

fn step_scene<S: Scalar>(w: &mut World<S>, scene: &mut Scene, steps: u32, dt: f64) {
    let dt = S::from_f64(dt);
    for _ in 0..steps {
        w.step(dt);
        if let Scene::Fountain(fountain) = scene {
            fountain.respawn_fallen(w);
        }
    }
}

/// Total energy under `gravity`, which must be the scene's own force.
fn energy_under<S: Scalar>(w: &World<S>, gravity: &PairwiseGravity<S>) -> f64 {
    total_energy(&w.particles, gravity).to_f64()
}

fn fill_positions<S: Scalar>(w: &World<S>, buf: &mut Vec<f32>) {
    buf.clear();
    for p in w.particles.pos() {
        buf.push(to_render(p.x));
        buf.push(to_render(p.y));
    }
}

/// Engine scalar to render coordinate. `to_f64` is the lossless readout;
/// narrowing to `f32` is fine for drawing (sub-micrometer at demo scales).
#[expect(
    clippy::cast_possible_truncation,
    reason = "intended narrowing: render coordinates only need f32 precision"
)]
fn to_render<S: Scalar>(x: S) -> f32 {
    x.to_f64() as f32
}

#[cfg(test)]
mod tests;
