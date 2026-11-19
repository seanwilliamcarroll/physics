//! Shared helpers for the workspace's integration tests: per-scalar
//! tolerances and error laws, orbit measurements, the state the
//! repeatability tests compare, and `proptest` world generators.
//!
//! A dev-dependency cycle with `engine` (`crates/engine/Cargo.toml`): fine for
//! integration tests, but `engine`'s *unit* tests would see a second copy of
//! `engine` with different types, so they can't use this.

#![expect(
    clippy::unwrap_used,
    clippy::indexing_slicing,
    clippy::missing_panics_doc,
    reason = "test helpers fail tests by panicking; Option plumbing would only hide failures"
)]

mod barnes_hut;
mod hostile;
mod orbit;
mod pendulum;
mod state;
mod tol;
mod worlds;

pub use barnes_hut::{accelerations, cluster_barnes_hut, cluster_barnes_hut_force};
pub use hostile::hostile_f64;
pub use orbit::{energy_errors, envelope, orbit_energy, separation, steps_for};
pub use pendulum::{PENDULUM_DT, PENDULUM_STEPS, PendulumRun, pendulum_energy, pendulum_run};
pub use state::state_bits;
pub use tol::{Tol, momentum_drift_bound, momentum_scale};
pub use worlds::*;

use engine::{Mass, Scalar, TimeStep, Vec2};

#[macro_export]
macro_rules! for_each_scalar {
    ($name:ident) => {
        mod $name {
            #[test]
            fn f32() {
                super::$name::<f32>();
            }
            #[test]
            fn f64() {
                super::$name::<f64>();
            }
        }
    };
}

#[must_use]
pub fn s<S: Scalar>(value: f64) -> S {
    S::from_f64(value)
}

pub fn v<S: Scalar>(x: f64, y: f64) -> Vec2<S> {
    Vec2::new(s(x), s(y))
}

#[must_use]
pub fn nonzero(value: u32) -> core::num::NonZeroU32 {
    core::num::NonZeroU32::new(value).unwrap()
}

#[must_use]
pub fn kg<S: Scalar>(mass: f64) -> Mass<S> {
    Mass::new(s(mass)).unwrap()
}

/// Exact bit pattern of a vector (`==` would accept `-0.0 == 0.0`).
pub fn bits<S: Scalar>(vector: Vec2<S>) -> (u64, u64) {
    (vector.x.to_f64().to_bits(), vector.y.to_f64().to_bits())
}

#[must_use]
pub fn time_step<S: Scalar>(dt: f64) -> TimeStep<S> {
    TimeStep::new(S::from_f64(dt)).unwrap()
}
