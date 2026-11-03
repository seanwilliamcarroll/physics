//! 2D particle physics: storage, forces, integration, and diagnostics.
//!
//! Generic over [`Scalar`]; std only, no rendering or browser code.
//! Design: `docs/02-core-types.md`. Units are SI (m, kg, s).

mod barnes_hut;
mod constraint;
pub mod diagnostics;
mod force;
mod integrate;
mod mass;
mod particles;
mod rng;
pub mod scenarios;
mod softening;
mod solver;
mod world;

pub use barnes_hut::{BarnesHut, OpeningAngle};
pub use constraint::{Constraint, DistanceConstraint};
pub use force::{Force, PairwiseGravity, UniformGravity};
pub use integrate::Integrator;
pub use mass::Mass;
pub use math::{Scalar, Vec2};
pub use particles::{ParticleId, Particles};
pub use softening::Softening;
pub use solver::{Baumgarte, DEFAULT_BAUMGARTE, Solver};
pub use world::{ConfigError, World};
