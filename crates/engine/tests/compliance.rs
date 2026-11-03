//! Compliant constraints in both solvers (`docs/06-constraints.md`, "M4:
//! compliance"): a bob on a compliant rod is a spring of stiffness
//! `k = 1/α`, so small oscillations have period `2π √(m α)`.
#![cfg(test)]

use engine::{Compliance, DistanceConstraint, Integrator, Solver, Vec2, World};
use test_support::{kg, nonzero};

/// k = 1/α = 100 N/m with m = 1 kg: ω = 10 rad/s, T = 2π/10 ≈ 0.628 s.
const ALPHA: f64 = 0.01;
const MASS: f64 = 1.0;
/// Rest length and initial stretch, m: small next to the rest length.
const REST: f64 = 1.0;
const STRETCH: f64 = 0.01;
/// 60 Hz frames with 20 substeps: ωh ≈ 0.008, well resolved.
const DT: f64 = 1.0 / 60.0;
const SUBSTEPS: u32 = 20;
/// Long enough for several periods.
const STEPS: u32 = 300;

/// Measured period from upward zero crossings of the stretch, averaged.
fn measured_period(solver: Solver) -> f64 {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    let pin = w.particles.add_static(Vec2::ZERO);
    let bob = w
        .particles
        .add(Vec2::new(REST + STRETCH, 0.0), Vec2::ZERO, kg(MASS));
    let rod = DistanceConstraint::with_length(
        &w.particles,
        pin,
        bob,
        REST,
        Compliance::new(ALPHA).unwrap(),
    )
    .unwrap();
    w.add_constraint(rod).unwrap();
    w.set_solver(solver);
    // First and last crossing times, and how many periods lie between.
    let (mut first, mut last, mut periods) = (None, 0.0, -1.0_f64);
    let mut prev = STRETCH;
    for i in 0..STEPS {
        w.step(DT);
        let stretch = w.particles.pos()[1].x - REST;
        if prev < 0.0 && stretch >= 0.0 {
            let t = f64::from(i + 1) * DT;
            first.get_or_insert(t);
            last = t;
            periods += 1.0;
        }
        prev = stretch;
    }
    (last - first.unwrap()) / periods
}

/// Measured (M4.2): 0.62857 s in both solvers against 0.62832 s, 0.04%
/// (mostly the 1/60 s sampling of the crossings). ~10x that.
const PERIOD_REL_TOL: f64 = 0.005;

fn check(solver: Solver) {
    let expected = 2.0 * std::f64::consts::PI * (MASS * ALPHA).sqrt();
    let got = measured_period(solver);
    println!("{solver:?}: period {got:.5} s, expected {expected:.5} s");
    assert!(
        (got - expected).abs() <= PERIOD_REL_TOL * expected,
        "{solver:?}: {got} vs {expected}"
    );
}

#[test]
fn xpbd_compliant_rod_has_the_spring_period() {
    check(Solver::Xpbd);
}

#[test]
fn impulse_compliant_rod_has_the_spring_period() {
    check(Solver::Impulse);
}
