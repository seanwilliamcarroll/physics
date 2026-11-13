//! `01-solvers.md`'s measured table as regression tests,
//! one test per row, f64.
//!
//! Each expected value is **our** measurement (M3.4), with a 2% band:
//! results are deterministic, so the band only absorbs harmless rounding
//! changes from a refactor; a real change in behavior moves them far more.
//! `01`'s own numbers came from a separate script, and ours agree with
//! them to its printed precision or close to it; both are listed per row
//! and the comparison is recorded in `docs/06-constraints.md`.
#![cfg(test)]

use engine::Solver;
use test_support::{PendulumRun, pendulum_run};

/// Relative band around each measured value.
const BAND: f64 = 0.02;

fn assert_near(what: &str, got: f64, want: f64) {
    assert!(
        (got - want).abs() <= BAND * want.abs(),
        "{what}: got {got:.6}, expected {want:.6} ± {:.0}%",
        BAND * 100.0
    );
}

/// XPBD's rod error is rounding: within a few ulps of the 1 m rod.
const XPBD_ROD_BOUND: f64 = 8.0 * f64::EPSILON;

fn run(solver: Solver, beta: f64, substeps: u32) -> PendulumRun {
    pendulum_run::<f64>(solver, beta, substeps)
}

/// `01`: 47 cm, 8.4 J ("meaningless: rod stretched").
#[test]
fn impulse_beta_0() {
    let r = run(Solver::Impulse, 0.0, 1);
    assert_near("rod error, m", r.max_rod_error, 0.4746);
    assert_near("energy lost, J", r.energy_lost, 8.393);
}

/// `01`: 1.3 cm, 0.98 J.
#[test]
fn impulse_beta_0_2() {
    let r = run(Solver::Impulse, 0.2, 1);
    assert_near("rod error, m", r.max_rod_error, 0.012_75);
    assert_near("energy lost, J", r.energy_lost, 0.9857);
}

/// `01`: 0.03 mm, 0.005 J.
#[test]
fn impulse_beta_0_2_substeps_20() {
    let r = run(Solver::Impulse, 0.2, 20);
    assert_near("rod error, m", r.max_rod_error, 3.404e-5);
    assert_near("energy lost, J", r.energy_lost, 0.005_6);
}

/// `01`: ~0 (float eps), 8.8 J.
#[test]
fn xpbd_substeps_1() {
    let r = run(Solver::Xpbd, 0.2, 1);
    assert!(r.max_rod_error <= XPBD_ROD_BOUND, "{}", r.max_rod_error);
    assert_near("energy lost, J", r.energy_lost, 8.791);
}

/// `01`: ~0, 1.46 J.
#[test]
fn xpbd_substeps_20() {
    let r = run(Solver::Xpbd, 0.2, 20);
    assert!(r.max_rod_error <= XPBD_ROD_BOUND, "{}", r.max_rod_error);
    assert_near("energy lost, J", r.energy_lost, 1.454);
}

/// `01`: ~0, 0.31 J.
#[test]
fn xpbd_substeps_100() {
    let r = run(Solver::Xpbd, 0.2, 100);
    assert!(r.max_rod_error <= XPBD_ROD_BOUND, "{}", r.max_rod_error);
    assert_near("energy lost, J", r.energy_lost, 0.3122);
}
