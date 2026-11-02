//! 2D particle physics: storage, forces, integration, and diagnostics.
//!
//! Generic over [`Scalar`]; std only, no rendering or browser code.
//! Design: `docs/02-core-types.md`. Units are SI (m, kg, s).

mod force;
mod particles;

pub use force::{Force, UniformGravity};
pub use math::{Scalar, Vec2};
pub use particles::Particles;
