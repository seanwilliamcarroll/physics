//! Shared math types for every track (engine, acoustic, sand, swarm):
//! the [`Scalar`] trait, [`Vec2<S>`](Vec2), [`UnitVec2<S>`](UnitVec2), and
//! the [`SplitMix64`] PRNG and the [`Fnv1a`] hash (determinism tooling),
//! and checked numeric conversions ([`convert`]).

// Declared first: `#[macro_use]` makes its macros visible to the modules below.
#[cfg(test)]
#[macro_use]
mod test_util;

pub mod convert;
mod hash;
mod rng;
mod scalar;
mod unit_vec2;
mod vec2;

pub use hash::Fnv1a;
pub use rng::SplitMix64;
pub use scalar::Scalar;
pub use unit_vec2::UnitVec2;
pub use vec2::Vec2;
