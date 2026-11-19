//! Measurements of `scenarios::orbit` worlds (energy, separation, error
//! series) shared by the orbit invariants and known failures.

use crate::time_step;
use engine::diagnostics::total_energy;
use engine::scenarios::{orbit_gravity, orbit_period};
use engine::{Scalar, World};
use math::convert::f64_to_usize;

#[must_use]
pub fn orbit_energy<S: Scalar>(world: &World<S>) -> f64 {
    total_energy(world.particles(), &orbit_gravity().unwrap()).to_f64()
}

/// Distance between the two bodies, m.
#[must_use]
pub fn separation<S: Scalar>(world: &World<S>) -> f64 {
    let positions = world.particles().positions();
    (positions[1] - positions[0]).length().to_f64()
}

#[must_use]
pub fn steps_for(orbits: f64, dt: f64) -> u32 {
    u32::try_from(f64_to_usize((orbits * orbit_period() / dt).round()).unwrap()).unwrap()
}

/// Runs `steps` steps of `dt`, returning the relative energy error
/// `(E - E0) / |E0|` after each step and the separation's (min, max).
pub fn energy_errors<S: Scalar>(
    world: &mut World<S>,
    dt: f64,
    steps: u32,
) -> (Vec<f64>, (f64, f64)) {
    let initial_energy = orbit_energy(world);
    let (mut min_separation, mut max_separation) = (f64::INFINITY, 0.0_f64);
    let errors = (0..steps)
        .map(|_| {
            world.step(time_step(dt));
            let distance = separation(world);
            min_separation = min_separation.min(distance);
            max_separation = max_separation.max(distance);
            (orbit_energy(world) - initial_energy) / initial_energy.abs()
        })
        .collect();
    (errors, (min_separation, max_separation))
}

#[must_use]
pub fn envelope(errors: &[f64]) -> f64 {
    errors
        .iter()
        .fold(0.0, |largest, error| largest.max(error.abs()))
}
