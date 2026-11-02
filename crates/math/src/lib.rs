//! Shared math types for the physics engine and the acoustic track:
//! the [`Scalar`] trait and [`Vec2<S>`](Vec2).

// Declared first: `#[macro_use]` makes its macros visible to the modules below.
#[cfg(test)]
#[macro_use]
mod test_util;

mod scalar;
mod vec2;

pub use scalar::Scalar;
pub use vec2::Vec2;
