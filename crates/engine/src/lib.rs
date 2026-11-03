//! 2D particle physics: storage, forces, integration, and diagnostics.
//!
//! Generic over [`Scalar`]; std only, no rendering or browser code.
//! Design: `docs/02-core-types.md`. Units are SI (m, kg, s).

mod barnes_hut;
mod constraint;
pub mod diagnostics;
mod force;
mod integrate;
mod params;
mod particles;
mod rng;
pub mod scenarios;
mod solver;
mod world;

pub use barnes_hut::BarnesHut;
pub use constraint::{Constraint, DistanceConstraint};
pub use force::{Force, PairwiseGravity, Spring, SpringForce, UniformGravity};
pub use integrate::Integrator;
pub use math::{Scalar, UnitVec2, Vec2};
pub use params::{
    Baumgarte, Compliance, DEFAULT_BAUMGARTE, Damping, Mass, OpeningAngle, Softening, Stiffness,
};
pub use particles::{ParticleId, Particles};
pub use solver::{Order, Solver, Stabilization};
pub use world::{ConfigError, Grab, World};
