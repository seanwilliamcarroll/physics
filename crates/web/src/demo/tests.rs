//! `Demo` tests, by topic: `basics` (clock, render buffer, orbit,
//! fountain), `gravity` (M2 scenes, softening, θ), `pendulum` (M3).

use super::{Demo, DemoKind, ScalarKind};

mod basics;
mod gravity;
mod pendulum;

/// One physics step at the 60 Hz `PHYSICS_RATE`.
const PHYSICS_DT: f64 = 1.0 / 60.0;

fn demo(scalar: ScalarKind) -> Demo {
    Demo::new(DemoKind::Fountain, scalar, 50, 1).unwrap()
}
