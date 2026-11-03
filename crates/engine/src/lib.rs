//! 2D particle physics: storage, forces, integration, and diagnostics.
//!
//! Generic over [`Scalar`]; std only, no rendering or browser code.
//! Design: `docs/02-core-types.md`. Units are SI (m, kg, s).

mod barnes_hut;
pub mod diagnostics;
mod force;
mod integrate;
mod particles;
mod rng;
pub mod scenarios;
mod softening;
mod world;

pub use barnes_hut::{BarnesHut, OpeningAngle};
pub use force::{Force, PairwiseGravity, UniformGravity};
pub use integrate::Integrator;
pub use math::{Scalar, Vec2};
pub use particles::{ParticleId, Particles};
pub use softening::Softening;
pub use world::{ConfigError, World};
