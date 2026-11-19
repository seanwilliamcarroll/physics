//! The `01-solvers.md` pendulum run, shared by the solver-table tests and
//! the known failures.

use crate::time_step;
use engine::diagnostics::{constraint_error, kinetic_energy, uniform_gravity_potential};
use engine::scenarios::{pendulum, pendulum_gravity};
use engine::{Baumgarte, Scalar, Solver, World};

use crate::s;

/// `01`'s measurement: 10 s at a 60 Hz frame rate.
pub const PENDULUM_DT: f64 = 1.0 / 60.0;
pub const PENDULUM_STEPS: u32 = 600;

#[derive(Copy, Clone, Debug)]
pub struct PendulumRun {
    /// Largest |rod length − L| seen after any step, m.
    pub max_rod_error: f64,
    /// Energy at the start minus energy at the end, J (negative: gained).
    pub energy_lost: f64,
}

#[must_use]
pub fn pendulum_energy<S: Scalar>(world: &World<S>) -> f64 {
    (kinetic_energy(world.particles())
        + uniform_gravity_potential(world.particles(), &pendulum_gravity()))
    .to_f64()
}

#[must_use]
pub fn pendulum_run<S: Scalar>(solver: Solver, beta: f64, substeps: u32) -> PendulumRun {
    let mut world = pendulum::<S>(solver, crate::nonzero(substeps)).unwrap();
    world.set_baumgarte(Baumgarte::new(s(beta)).unwrap());
    let initial_energy = pendulum_energy(&world);
    let mut max_rod_error = 0.0_f64;
    for _ in 0..PENDULUM_STEPS {
        world.step(time_step(PENDULUM_DT));
        let (largest_error, _) = constraint_error(world.particles(), world.constraints()).unwrap();
        max_rod_error = max_rod_error.max(largest_error.to_f64());
    }
    PendulumRun {
        max_rod_error,
        energy_lost: initial_energy - pendulum_energy(&world),
    }
}
