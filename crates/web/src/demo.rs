//! [`Demo`]: one running demo instance (world + scene + clock + render buffer).
//!
//! Everything the exports do is implemented here as plain, safe Rust and
//! tested natively; `lib.rs` only adapts it to the C ABI.

use engine::scenarios::Fountain;
use engine::{ConfigError, Scalar, World};

use crate::abi;
use crate::fixed_step::FixedStep;

/// Physics step, seconds (60 Hz). Displays at any refresh rate advance the
/// simulation at this rate via [`FixedStep`].
pub const PHYSICS_DT: f64 = 1.0 / 60.0;

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
}

impl DemoKind {
    /// Decodes a `demo_new` kind code ([`abi`]).
    #[must_use]
    pub const fn from_code(code: u32) -> Option<Self> {
        match code {
            abi::DEMO_FOUNTAIN => Some(Self::Fountain),
            _ => None,
        }
    }
}

/// Runtime scalar choice. Each variant monomorphizes a full engine copy into
/// the `.wasm`, so binary size grows per variant (measure when adding one).
enum AnyWorld {
    F32(World<f32>),
    F64(World<f64>),
}

pub struct Demo {
    world: AnyWorld,
    scene: Fountain,
    clock: FixedStep,
    /// `[x0, y0, x1, y1, ...]` in world units (m), always `f32`, so the
    /// renderer is independent of the engine's scalar type.
    render_buf: Vec<f32>,
}

impl Demo {
    /// # Errors
    /// Propagates [`ConfigError`] from building the scene's world.
    pub fn new(
        kind: DemoKind,
        scalar: ScalarKind,
        n: usize,
        seed: u64,
    ) -> Result<Self, ConfigError> {
        // Irrefutable while Fountain is the only kind; adding a variant makes
        // this a compile error, prompting a real `match` here.
        let DemoKind::Fountain = kind;
        let mut scene = Fountain::new(seed);
        let world = match scalar {
            ScalarKind::F32 => AnyWorld::F32(scene.world(n)?),
            ScalarKind::F64 => AnyWorld::F64(scene.world(n)?),
        };
        let mut demo = Self {
            world,
            scene,
            clock: FixedStep::new(PHYSICS_DT),
            render_buf: Vec::with_capacity(abi::COORDS_PER_PARTICLE * n),
        };
        demo.fill_render_buf();
        Ok(demo)
    }

    /// Adds `elapsed` seconds of real time, runs the resulting fixed steps,
    /// and refreshes the render buffer. Returns the number of steps taken.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        let steps = self.clock.advance(elapsed);
        match &mut self.world {
            AnyWorld::F32(w) => step_scene(w, &mut self.scene, steps),
            AnyWorld::F64(w) => step_scene(w, &mut self.scene, steps),
        }
        self.fill_render_buf();
        steps
    }

    /// Interleaved particle positions, `f32`, in meters.
    #[must_use]
    pub fn positions(&self) -> &[f32] {
        &self.render_buf
    }

    fn fill_render_buf(&mut self) {
        match &self.world {
            AnyWorld::F32(w) => fill_positions(w, &mut self.render_buf),
            AnyWorld::F64(w) => fill_positions(w, &mut self.render_buf),
        }
    }
}

fn step_scene<S: Scalar>(w: &mut World<S>, scene: &mut Fountain, steps: u32) {
    let dt = S::from_f64(PHYSICS_DT);
    for _ in 0..steps {
        w.step(dt);
        scene.respawn_fallen(w);
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
mod tests {
    use super::{Demo, DemoKind, PHYSICS_DT, ScalarKind};

    fn demo(scalar: ScalarKind) -> Demo {
        Demo::new(DemoKind::Fountain, scalar, 50, 1).unwrap()
    }

    #[test]
    fn codes_map_to_kinds() {
        assert_eq!(ScalarKind::from_code(0), Some(ScalarKind::F32));
        assert_eq!(ScalarKind::from_code(1), Some(ScalarKind::F64));
        assert_eq!(ScalarKind::from_code(2), None);
        assert_eq!(DemoKind::from_code(0), Some(DemoKind::Fountain));
        assert_eq!(DemoKind::from_code(1), None);
    }

    #[test]
    fn render_buffer_holds_interleaved_positions_from_the_start() {
        for scalar in [ScalarKind::F32, ScalarKind::F64] {
            let d = demo(scalar);
            assert_eq!(d.positions().len(), 2 * 50);
            assert!(d.positions().iter().all(|&c| c == 0.0)); // all at the origin
        }
    }

    #[test]
    fn advance_steps_the_world_and_refreshes_the_buffer() {
        let mut d = demo(ScalarKind::F64);
        assert_eq!(d.advance(PHYSICS_DT), 1);
        assert!(d.positions().chunks(2).all(|p| p[1] > 0.0)); // all rising
        let before = d.positions().to_vec();
        assert_eq!(d.advance(0.0), 0);
        assert_eq!(d.positions(), before);
    }

    #[test]
    fn f32_and_f64_demos_agree_before_rounding_compounds() {
        // Same seed, same scene: after 0.5 s (before any particle lands and
        // respawns) the two scalars differ only by f32 rounding.
        let (mut a, mut b) = (demo(ScalarKind::F32), demo(ScalarKind::F64));
        for _ in 0..30 {
            a.advance(PHYSICS_DT);
            b.advance(PHYSICS_DT);
        }
        for (x, y) in a.positions().iter().zip(b.positions()) {
            assert!((x - y).abs() < 1e-4, "{x} vs {y}");
        }
    }

    #[test]
    fn fountain_keeps_running() {
        let mut d = demo(ScalarKind::F32);
        for _ in 0..600 {
            d.advance(PHYSICS_DT);
        }
        assert_eq!(d.positions().len(), 2 * 50);
        assert!(d.positions().chunks(2).all(|p| p[1] >= 0.0));
    }
}
