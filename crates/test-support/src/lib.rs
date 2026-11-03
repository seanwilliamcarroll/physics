//! Shared helpers for the engine's integration tests: per-scalar
//! tolerances and error laws, orbit measurements, the state hash behind the
//! golden hashes, and `proptest` world generators.
//!
//! A dev-dependency only (`crates/engine/Cargo.toml`); it replaces the old
//! `tests/common/mod.rs` (no `mod.rs` files, and as a real crate its `pub`
//! items need no `dead_code` allowance). It forms a dev-dependency cycle
//! with `engine` (this crate uses `engine`; `engine`'s tests use this),
//! which works because integration tests link the same `engine` library
//! this crate does. `engine`'s *unit* tests can't use it: they'd see a
//! second copy of `engine`, with different types.

// Test helpers exist to fail tests: unwrapping a setup that can't fail,
// indexing a world of known shape, and panicking on misuse are the right
// behavior here, unlike in library code. `expect` (not `allow`) errors if
// these ever stop firing.
#![expect(
    clippy::unwrap_used,
    clippy::indexing_slicing,
    clippy::missing_panics_doc,
    reason = "test helpers fail tests by panicking; Option plumbing would only hide failures"
)]

mod barnes_hut;
mod hash;
mod orbit;
mod pendulum;
mod tol;
mod worlds;

pub use barnes_hut::{accelerations, cluster_barnes_hut, cluster_barnes_hut_force};
pub use hash::{Fnv1a, state_hash};
pub use orbit::{energy_errors, envelope, orbit_energy, separation, steps_for};
pub use pendulum::{PENDULUM_DT, PENDULUM_STEPS, PendulumRun, pendulum_energy, pendulum_run};
pub use tol::{Tol, momentum_drift_bound};
pub use worlds::*;

use engine::{Mass, Scalar, Vec2};

/// Runs a generic test body `fn name<S: Tol>()` once per scalar type.
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

/// Shorthand for `S::from_f64(v)`.
#[must_use]
pub fn s<S: Scalar>(v: f64) -> S {
    S::from_f64(v)
}

/// Shorthand for a `Vec2` from `f64` literals.
pub fn v<S: Scalar>(x: f64, y: f64) -> Vec2<S> {
    Vec2::new(s(x), s(y))
}

/// `NonZeroU32` from a literal in a test (`nonzero(4)`), for substeps and
/// the like: panics on 0, which no test passes.
#[must_use]
pub fn nonzero(n: u32) -> core::num::NonZeroU32 {
    core::num::NonZeroU32::new(n).unwrap()
}

/// A [`Mass`] from an `f64` literal known to be valid (panics otherwise).
#[must_use]
pub fn kg<S: Scalar>(m: f64) -> Mass<S> {
    Mass::new(s(m)).unwrap()
}

/// Exact bit pattern of a vector, for bit-identity assertions.
/// `to_f64` is lossless for f32 and f64, so equal bits here mean equal bits
/// in `S` (`==` would also accept `-0.0 == 0.0`).
pub fn bits<S: Scalar>(p: Vec2<S>) -> (u64, u64) {
    (p.x.to_f64().to_bits(), p.y.to_f64().to_bits())
}
