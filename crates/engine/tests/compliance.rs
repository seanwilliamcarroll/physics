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
    let pin = w.add_static(Vec2::ZERO);
    let bob = w.add_particle(Vec2::new(REST + STRETCH, 0.0), Vec2::ZERO, kg(MASS));
    let rod = DistanceConstraint::with_length(
        w.particles(),
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
        let stretch = w.particles().pos()[1].x - REST;
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

/// A bob on a compliant, damped rod (k = 100 N/m, c = 0.4 N·s/m, m = 1 kg;
/// no gravity), released stretched 5 cm: energy at 5 s relative to the
/// start, in the solver given.
fn damped_energy_ratio(solver: Solver) -> f64 {
    energy_ratio(solver, 0.4)
}

fn energy_ratio(solver: Solver, c: f64) -> f64 {
    use engine::Damping;
    use engine::diagnostics::kinetic_energy;
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    let pin = w.add_static(Vec2::ZERO);
    let bob = w.add_particle(Vec2::new(REST + 0.05, 0.0), Vec2::ZERO, kg(MASS));
    let rod = DistanceConstraint::with_length(
        w.particles(),
        pin,
        bob,
        REST,
        Compliance::new(ALPHA).unwrap(),
    )
    .unwrap()
    .with_damping(Damping::new(c).unwrap());
    w.add_constraint(rod).unwrap();
    w.set_solver(solver);
    // Spring energy ½ k x² = ½ x² / α plus kinetic.
    let energy = |w: &World<f64>| {
        let x = w.particles().pos()[1].x - REST;
        kinetic_energy(w.particles()) + 0.5 * x * x / ALPHA
    };
    let e0 = energy(&w);
    for _ in 0..300 {
        w.step(DT);
    }
    energy(&w) / e0
}

/// Both constraint solvers are implicit for a compliant spring, and an
/// implicit (backward Euler) step damps by itself: energy shrinks by
/// `1 / (1 + ω² h²)` per substep. Undamped here (ω = 10, h = 1/1200, 6000
/// substeps) that predicts 0.6593 of the energy left after 5 s; measured
/// 0.65925 in both solvers. The price of having no stability threshold
/// (`docs/07-soft-bodies.md`).
#[test]
fn compliant_springs_damp_at_backward_eulers_rate() {
    let h = DT / f64::from(SUBSTEPS);
    let omega_h_sq = h * h / (MASS * ALPHA);
    let predicted = (1.0 + omega_h_sq).powf(-f64::from(300 * SUBSTEPS));
    for solver in Solver::ALL {
        let got = energy_ratio(solver, 0.0);
        assert!(
            (got - predicted).abs() < 1e-3 * predicted,
            "{solver:?}: {got} vs {predicted}"
        );
    }
}

/// The physical damper on top: damped / undamped energy decays as
/// `e^(−c t / m)` (e^−2 at c = 0.4, 5 s). Measured 0.1339 vs 0.1353 (1%) in
/// both solvers, which agree to 12 digits (the same update in position and
/// velocity form). Bound ~5x.
#[test]
fn constraint_damping_decays_at_the_analytic_rate() {
    let want = (-2.0_f64).exp();
    for solver in Solver::ALL {
        let ratio = damped_energy_ratio(solver) / energy_ratio(solver, 0.0);
        assert!(
            (ratio - want).abs() < 0.05 * want,
            "{solver:?}: {ratio} vs {want}"
        );
    }
}
