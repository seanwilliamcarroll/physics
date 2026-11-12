//! Swarms (`docs/15-swarm.md`): agents that follow rules, not bodies that
//! feel forces. S1 is boids: Reynolds' separation, alignment and cohesion
//! in ECE 4760's form, a map from one step to the next (Δt = 1, pixels
//! per step), double-buffered so the result doesn't depend on the order
//! boids are stored in. S2 is the Vicsek model ([`Vicsek`]): constant
//! speed, align with the neighbourhood, add noise, in a periodic box.
//! `f32` throughout.

mod ants;
mod evolve;
mod field;
mod flock;
mod grid;
mod params;
mod physarum;
mod rules;
mod vicsek;

pub use ants::{Ant, AntParams, Colony, MAX_ANTS, Pheromone};
pub use evolve::{Evolve, Gene, Generation, evolve, mean_over};
pub use field::{Field, MAX_CELLS};
pub use flock::{Boid, Flock, MAX_BOIDS, Neighbours};
pub use params::{Arena, Params};
pub use physarum::{MAX_AGENTS, Slime, SlimeParams};
pub use rules::{FLEE, PREDATOR_RANGE};
pub use vicsek::{MAX_PARTICLES, Particle, Vicsek, VicsekParams};
