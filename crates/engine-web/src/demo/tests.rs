//! `Demo` tests, by topic.

use super::{Demo, DemoKind, ScalarKind};

mod basics;
mod chain;
mod collisions;
mod gravity;
mod jelly;
mod pendulum;
mod pool;

/// One physics step at the 60 Hz `PHYSICS_RATE`.
const PHYSICS_DT: f64 = 1.0 / 60.0;

fn fountain_demo(scalar: ScalarKind) -> Demo {
    Demo::new(DemoKind::Fountain, scalar, 50, 1).unwrap()
}
