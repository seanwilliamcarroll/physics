//! `01-solvers.md`'s measured table as regression tests, one per row, f64.
//! Expected values are our measurements with a 2% band; `01`'s own numbers
//! are listed per row (comparison: `docs/06-constraints.md`).
#![cfg(test)]

use engine::Solver;
use test_support::{PendulumRun, pendulum_run};

const BAND: f64 = 0.02;

fn assert_near(what: &str, measured: f64, expected: f64) {
    assert!(
        (measured - expected).abs() <= BAND * expected.abs(),
        "{what}: got {measured:.6}, expected {expected:.6} ± {:.0}%",
        BAND * 100.0
    );
}

const XPBD_ROD_BOUND: f64 = 8.0 * f64::EPSILON;

fn run(solver: Solver, baumgarte_factor: f64, substeps: u32) -> PendulumRun {
    pendulum_run::<f64>(solver, baumgarte_factor, substeps)
}

/// `01`: 47 cm, 8.4 J ("meaningless: rod stretched").
#[test]
fn impulse_beta_0() {
    let result = run(Solver::Impulse, 0.0, 1);
    assert_near("rod error, m", result.max_rod_error, 0.4746);
    assert_near("energy lost, J", result.energy_lost, 8.393);
}

/// `01`: 1.3 cm, 0.98 J.
#[test]
fn impulse_beta_0_2() {
    let result = run(Solver::Impulse, 0.2, 1);
    assert_near("rod error, m", result.max_rod_error, 0.012_75);
    assert_near("energy lost, J", result.energy_lost, 0.9857);
}

/// `01`: 0.03 mm, 0.005 J.
#[test]
fn impulse_beta_0_2_substeps_20() {
    let result = run(Solver::Impulse, 0.2, 20);
    assert_near("rod error, m", result.max_rod_error, 3.404e-5);
    assert_near("energy lost, J", result.energy_lost, 0.005_6);
}

/// `01`: ~0 (float eps), 8.8 J.
#[test]
fn xpbd_substeps_1() {
    let result = run(Solver::Xpbd, 0.2, 1);
    assert!(
        result.max_rod_error <= XPBD_ROD_BOUND,
        "{}",
        result.max_rod_error
    );
    assert_near("energy lost, J", result.energy_lost, 8.791);
}

/// `01`: ~0, 1.46 J.
#[test]
fn xpbd_substeps_20() {
    let result = run(Solver::Xpbd, 0.2, 20);
    assert!(
        result.max_rod_error <= XPBD_ROD_BOUND,
        "{}",
        result.max_rod_error
    );
    assert_near("energy lost, J", result.energy_lost, 1.454);
}

/// `01`: ~0, 0.31 J.
#[test]
fn xpbd_substeps_100() {
    let result = run(Solver::Xpbd, 0.2, 100);
    assert!(
        result.max_rod_error <= XPBD_ROD_BOUND,
        "{}",
        result.max_rod_error
    );
    assert_near("energy lost, J", result.energy_lost, 0.3122);
}
