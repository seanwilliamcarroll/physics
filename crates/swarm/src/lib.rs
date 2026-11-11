//! Swarms (`docs/15-swarm.md`): agents that follow rules, not bodies that
//! feel forces. S1 is boids: Reynolds' separation, alignment and cohesion
//! in ECE 4760's form, a map from one step to the next (Δt = 1, pixels
//! per step), double-buffered so the result doesn't depend on the order
//! boids are stored in. `f32` throughout.

mod flock;
mod grid;
mod params;
mod rules;

pub use flock::{Boid, Flock, MAX_BOIDS, Neighbours};
pub use params::{Arena, Params};
pub use rules::{FLEE, PREDATOR_RANGE};
