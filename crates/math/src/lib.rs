//! Shared math types for the physics engine and the acoustic track:
//! the [`Scalar`] trait, [`Vec2<S>`](Vec2) and [`UnitVec2<S>`](UnitVec2).

// Declared first: `#[macro_use]` makes its macros visible to the modules below.
#[cfg(test)]
#[macro_use]
mod test_util;

mod scalar;
mod unit_vec2;
mod vec2;

pub use scalar::Scalar;
pub use unit_vec2::UnitVec2;
pub use vec2::Vec2;
