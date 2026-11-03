//! Measurements of `scenarios::orbit` worlds (energy, separation, error
//! series) shared by the orbit invariants and known failures.

use engine::diagnostics::total_energy;
use engine::scenarios::{orbit_gravity, orbit_period};
use engine::{Scalar, World};

/// Total energy of a `scenarios::orbit` world, under the scene's own force.
#[must_use]
pub fn orbit_energy<S: Scalar>(w: &World<S>) -> f64 {
    total_energy(&w.particles, &orbit_gravity()).to_f64()
}

/// Distance between the two bodies of an orbit world, m.
#[must_use]
pub fn separation<S: Scalar>(w: &World<S>) -> f64 {
    let p = w.particles.pos();
    (p[1] - p[0]).length().to_f64()
}

/// Steps of `dt` for `orbits` periods of the circular orbit (rounded).
#[expect(
    clippy::cast_possible_truncation,
    clippy::cast_sign_loss,
    reason = "a small positive step count, rounded on purpose"
)]
#[must_use]
pub fn steps_for(orbits: f64, dt: f64) -> u32 {
    (orbits * orbit_period() / dt).round() as u32
}

/// Runs `steps` steps of `dt`, returning the relative energy error
/// `(E - E0) / |E0|` after each step and the separation's (min, max).
pub fn energy_errors<S: Scalar>(w: &mut World<S>, dt: f64, steps: u32) -> (Vec<f64>, (f64, f64)) {
    let e0 = orbit_energy(w);
    let (mut lo, mut hi) = (f64::INFINITY, 0.0_f64);
    let errors = (0..steps)
        .map(|_| {
            w.step(S::from_f64(dt));
            let d = separation(w);
            lo = lo.min(d);
            hi = hi.max(d);
            (orbit_energy(w) - e0) / e0.abs()
        })
        .collect();
    (errors, (lo, hi))
}

/// Largest |value| in a slice (the error envelope).
#[must_use]
pub fn envelope(errors: &[f64]) -> f64 {
    errors.iter().fold(0.0, |m, e| m.max(e.abs()))
}
