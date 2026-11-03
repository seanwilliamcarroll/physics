//! [`Demo`]: one running demo instance (world + scene + clock + render buffer).
//!
//! Everything the exports do is implemented here as plain, safe Rust and
//! tested natively; `lib.rs` only adapts it to the C ABI.

use core::num::NonZeroU32;

use engine::diagnostics::total_energy;
use engine::scenarios::{
    Fountain, ORBIT_CIRCULAR, cluster, cluster_gravity, collapse, disk, gravity, orbit,
    orbit_gravity,
};
use engine::{
    BarnesHut, ConfigError, Integrator, OpeningAngle, PairwiseGravity, Scalar, Softening, World,
};

use crate::abi;
use crate::fixed_step::FixedStep;

/// Physics steps per simulated second a demo starts with ([`abi::DEFAULT_RATE_HZ`]).
/// Displays at any refresh rate advance the simulation at this rate via
/// [`FixedStep`]. A `NonZeroU32` so the step size `1 / rate` is positive by
/// construction.
// `unwrap` in a const item runs at compile time: a zero here fails the
// build, so it can't panic at runtime (and clippy's unwrap_used agrees).
pub(crate) const PHYSICS_RATE: NonZeroU32 = NonZeroU32::new(abi::DEFAULT_RATE_HZ).unwrap();

/// Which numeric type the engine runs on, chosen at runtime by JS.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub(crate) enum ScalarKind {
    F32,
    F64,
}

impl ScalarKind {
    /// Decodes a `demo_new` scalar code ([`abi`]).
    #[must_use]
    pub(crate) const fn from_code(code: u32) -> Option<Self> {
        match code {
            abi::SCALAR_F32 => Some(Self::F32),
            abi::SCALAR_F64 => Some(Self::F64),
            _ => None,
        }
    }
}

/// Which scene to run.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub(crate) enum DemoKind {
    Fountain,
    Orbit,
    /// One of the M2 scenes of `n` bodies under pairwise gravity.
    Gravity(GravityScene),
}

/// The M2 gravity scenes, all under `scenarios::cluster_gravity` (same ε).
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub(crate) enum GravityScene {
    /// Random bodies in a disk, drifting (`scenarios::cluster`).
    Cluster,
    /// A heavy center and `n - 1` orbiters (`scenarios::disk`).
    Disk,
    /// A cold cloud at rest (`scenarios::collapse`).
    Collapse,
}

impl DemoKind {
    /// Decodes a `demo_new` kind code ([`abi`]).
    #[must_use]
    pub(crate) const fn from_code(code: u32) -> Option<Self> {
        match code {
            abi::DEMO_FOUNTAIN => Some(Self::Fountain),
            abi::DEMO_ORBIT => Some(Self::Orbit),
            abi::DEMO_CLUSTER => Some(Self::Gravity(GravityScene::Cluster)),
            abi::DEMO_DISK => Some(Self::Gravity(GravityScene::Disk)),
            abi::DEMO_COLLAPSE => Some(Self::Gravity(GravityScene::Collapse)),
            _ => None,
        }
    }
}

/// Decodes a `demo_set_integrator` code ([`abi`]). A free function because
/// `Integrator` belongs to the engine, which knows nothing of wire codes.
#[must_use]
pub(crate) const fn integrator_from_code(code: u32) -> Option<Integrator> {
    match code {
        abi::INTEGRATOR_SYMPLECTIC_EULER => Some(Integrator::SymplecticEuler),
        abi::INTEGRATOR_EXPLICIT_EULER => Some(Integrator::ExplicitEuler),
        abi::INTEGRATOR_VELOCITY_VERLET => Some(Integrator::VelocityVerlet),
        _ => None,
    }
}

/// A world and, for the gravity scenes, a copy of its exact force:
/// energy readouts need it, and `World` owns its forces as `dyn Force`,
/// so it can't hand a `PairwiseGravity` back. With `theta` set, the world
/// runs Barnes–Hut approximating `gravity` instead; energy is still read
/// out exactly, so the readout shows what the approximation costs.
struct Sim<S: Scalar> {
    world: World<S>,
    gravity: Option<PairwiseGravity<S>>,
    theta: Option<OpeningAngle<S>>,
}

impl<S: Scalar> Sim<S> {
    const fn plain(world: World<S>) -> Self {
        Self {
            world,
            gravity: None,
            theta: None,
        }
    }

    const fn with_gravity(world: World<S>, gravity: PairwiseGravity<S>) -> Self {
        Self {
            world,
            gravity: Some(gravity),
            theta: None,
        }
    }

    /// Makes the world's force match `gravity` and `theta`. A scene with
    /// gravity has no other force, so clearing loses nothing.
    fn install(&mut self) {
        let Some(g) = self.gravity else { return };
        self.world.clear_forces();
        match self.theta {
            None => self.world.add_force(g),
            Some(t) => self.world.add_force(BarnesHut::approximating(&g, t)),
        }
    }

    /// Runs the gravity as Barnes–Hut with opening angle `theta`. `false`,
    /// changing nothing, for a scene without gravity.
    fn set_theta(&mut self, theta: OpeningAngle<S>) -> bool {
        if self.gravity.is_none() {
            return false;
        }
        self.theta = Some(theta);
        self.install();
        true
    }

    /// Replaces the gravity (and only it: a scene with gravity has no
    /// other force) with one of softening `eps`. `false`, changing
    /// nothing, for a scene without gravity.
    fn set_softening(&mut self, eps: Softening<S>) -> bool {
        if self.gravity.is_none() {
            return false;
        }
        self.gravity = Some(gravity(eps));
        self.install();
        true
    }

    /// Total energy under the stored force, or `None` without one.
    fn energy(&self) -> Option<f64> {
        self.gravity
            .as_ref()
            .map(|g| total_energy(&self.world.particles, g).to_f64())
    }
}

/// Runtime scalar choice. Each variant monomorphizes a full engine copy into
/// the `.wasm`, so binary size grows per variant (measure when adding one).
enum AnyWorld {
    F32(Sim<f32>),
    F64(Sim<f64>),
}

/// Per-scene behavior between steps.
enum Scene {
    /// Relaunches fallen particles after every step; owns the PRNG.
    Fountain(Fountain),
    /// Nothing between steps (orbit, cluster).
    Gravity,
}

pub(crate) struct Demo {
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
    pub(crate) fn new(
        kind: DemoKind,
        scalar: ScalarKind,
        n: usize,
        seed: u64,
    ) -> Result<Self, ConfigError> {
        let (world, scene) = match kind {
            DemoKind::Fountain => {
                let mut fountain = Fountain::new(seed);
                let world = match scalar {
                    ScalarKind::F32 => AnyWorld::F32(Sim::plain(fountain.world(n)?)),
                    ScalarKind::F64 => AnyWorld::F64(Sim::plain(fountain.world(n)?)),
                };
                (world, Scene::Fountain(fountain))
            }
            DemoKind::Orbit => {
                let start = Integrator::SymplecticEuler;
                let world = match scalar {
                    ScalarKind::F32 => AnyWorld::F32(Sim::with_gravity(
                        orbit(start, ORBIT_CIRCULAR)?,
                        orbit_gravity()?,
                    )),
                    ScalarKind::F64 => AnyWorld::F64(Sim::with_gravity(
                        orbit(start, ORBIT_CIRCULAR)?,
                        orbit_gravity()?,
                    )),
                };
                (world, Scene::Gravity)
            }
            DemoKind::Gravity(scene) => {
                let world = match scalar {
                    ScalarKind::F32 => AnyWorld::F32(gravity_scene(scene, n, seed)?),
                    ScalarKind::F64 => AnyWorld::F64(gravity_scene(scene, n, seed)?),
                };
                (world, Scene::Gravity)
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
    pub(crate) fn advance(&mut self, elapsed: f64) -> u32 {
        let steps = self.clock.advance(elapsed);
        let dt = self.clock.dt();
        match &mut self.world {
            AnyWorld::F32(s) => step_scene(&mut s.world, &mut self.scene, steps, dt),
            AnyWorld::F64(s) => step_scene(&mut s.world, &mut self.scene, steps, dt),
        }
        self.fill_render_buf();
        steps
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
        match &self.world {
            AnyWorld::F32(s) => s.world.integrator(),
            AnyWorld::F64(s) => s.world.integrator(),
        }
    }

    /// Takes effect from the next step.
    pub(crate) const fn set_integrator(&mut self, integrator: Integrator) {
        match &mut self.world {
            AnyWorld::F32(s) => s.world.set_integrator(integrator),
            AnyWorld::F64(s) => s.world.set_integrator(integrator),
        }
    }

    /// Physics steps per simulated second (`dt = 1 / rate`). Drops owed
    /// time, so a rate change never fires a catch-up step.
    pub(crate) fn set_rate(&mut self, rate: NonZeroU32) {
        self.clock.set_rate(rate);
    }

    /// Sets the gravity scenes' softening (from the next step); the energy
    /// readout follows. `eps` was parsed at the boundary in `f64` and is
    /// cast, still checked, to the engine's scalar. Returns `false`,
    /// changing nothing, for the fountain (no gravity to soften).
    pub(crate) fn set_softening(&mut self, eps: Softening<f64>) -> bool {
        match &mut self.world {
            AnyWorld::F32(s) => s.set_softening(eps.cast()),
            AnyWorld::F64(s) => s.set_softening(eps),
        }
    }

    /// Switches a gravity scene to Barnes–Hut with opening angle `theta`
    /// (parsed at the boundary in `f64`, cast like `set_softening`'s ε);
    /// it stays on through softening changes. `false`, changing nothing,
    /// for the fountain.
    pub(crate) fn set_theta(&mut self, theta: OpeningAngle<f64>) -> bool {
        match &mut self.world {
            AnyWorld::F32(s) => s.set_theta(theta.cast()),
            AnyWorld::F64(s) => s.set_theta(theta),
        }
    }

    /// Test-only: θ if Barnes–Hut is on, as `f64`.
    #[cfg(test)]
    pub(crate) fn theta(&self) -> Option<f64> {
        match &self.world {
            AnyWorld::F32(s) => s.theta.map(|t| t.get().to_f64()),
            AnyWorld::F64(s) => s.theta.map(OpeningAngle::get),
        }
    }

    /// Total energy (kinetic + potential) in joules, read out as `f64`, or
    /// `None` where it isn't defined (the fountain: `diagnostics` has no
    /// uniform-gravity potential).
    #[must_use]
    pub(crate) fn energy(&self) -> Option<f64> {
        match &self.world {
            AnyWorld::F32(s) => s.energy(),
            AnyWorld::F64(s) => s.energy(),
        }
    }

    fn fill_render_buf(&mut self) {
        match &self.world {
            AnyWorld::F32(s) => fill_positions(&s.world, &mut self.render_buf),
            AnyWorld::F64(s) => fill_positions(&s.world, &mut self.render_buf),
        }
    }
}

/// `scene`'s world, with its gravity.
fn gravity_scene<S: Scalar>(
    scene: GravityScene,
    n: usize,
    seed: u64,
) -> Result<Sim<S>, ConfigError> {
    let world = match scene {
        GravityScene::Cluster => cluster(n, seed)?,
        GravityScene::Disk => disk(n, seed)?,
        GravityScene::Collapse => collapse(n, seed)?,
    };
    Ok(Sim::with_gravity(world, cluster_gravity()?))
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
