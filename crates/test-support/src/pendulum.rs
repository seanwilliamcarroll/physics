//! The `01-solvers.md` pendulum run, shared by the solver-table tests and
//! the known failures.

use engine::diagnostics::{constraint_error, kinetic_energy, uniform_gravity_potential};
use engine::scenarios::{pendulum, pendulum_gravity};
use engine::{Baumgarte, Scalar, Solver, World};

use crate::s;

/// `01`'s measurement: 10 s at a 60 Hz frame rate.
pub const PENDULUM_DT: f64 = 1.0 / 60.0;
pub const PENDULUM_STEPS: u32 = 600;

/// What `01`'s table reports for one run.
#[derive(Copy, Clone, Debug)]
pub struct PendulumRun {
    /// Largest |rod length − L| seen after any step, m.
    pub max_rod_error: f64,
    /// Energy at the start minus energy at the end, J (negative: gained).
    pub energy_lost: f64,
}

/// Pendulum energy (kinetic + gravity), J.
#[must_use]
pub fn pendulum_energy<S: Scalar>(w: &World<S>) -> f64 {
    (kinetic_energy(w.particles()) + uniform_gravity_potential(w.particles(), &pendulum_gravity()))
        .to_f64()
}

/// Runs `01`'s pendulum with `solver`, Baumgarte `beta` (impulse only),
/// and `substeps` per step.
#[must_use]
pub fn pendulum_run<S: Scalar>(solver: Solver, beta: f64, substeps: u32) -> PendulumRun {
    let mut w = pendulum::<S>(solver, crate::nonzero(substeps)).unwrap();
    w.set_baumgarte(Baumgarte::new(s(beta)).unwrap());
    let e0 = pendulum_energy(&w);
    let mut max_rod_error = 0.0_f64;
    for _ in 0..PENDULUM_STEPS {
        w.step(s(PENDULUM_DT));
        let (max, _) = constraint_error(w.particles(), w.constraints()).unwrap();
        max_rod_error = max_rod_error.max(max.to_f64());
    }
    PendulumRun {
        max_rod_error,
        energy_lost: e0 - pendulum_energy(&w),
    }
}
