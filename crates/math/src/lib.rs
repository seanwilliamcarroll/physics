//! Shared math types for the physics engine and the acoustic track:
//! the [`Scalar`] trait and `Vec2<S>`.

// Declared first: `#[macro_use]` makes its macros visible to the modules below.
#[cfg(test)]
#[macro_use]
mod test_util;

mod scalar;

pub use scalar::Scalar;
