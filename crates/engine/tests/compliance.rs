//! Compliant constraints in both solvers (`docs/06-constraints.md`,
//! "compliance"): a bob on a compliant rod is a spring of stiffness
//! `k = 1/α`, so small oscillations have period `2π √(m α)`.
#![cfg(test)]

use engine::{Compliance, DistanceConstraint, Integrator, Solver, Vec2, World};
use test_support::{kg, nonzero, time_step};

/// k = 1/α = 100 N/m with m = 1 kg: ω = 10 rad/s, T = 2π/10 ≈ 0.628 s.
const COMPLIANCE: f64 = 0.01;
const MASS: f64 = 1.0;
const REST_LENGTH: f64 = 1.0;
const STRETCH: f64 = 0.01;
/// 60 Hz frames with 20 substeps: ωh ≈ 0.008, well resolved.
const DT: f64 = 1.0 / 60.0;
const SUBSTEPS: u32 = 20;
const STEPS: u32 = 300;

fn measured_period(solver: Solver) -> f64 {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    let pin = world.add_static(Vec2::ZERO);
    let bob = world.add_particle(Vec2::new(REST_LENGTH + STRETCH, 0.0), Vec2::ZERO, kg(MASS));
    let rod = DistanceConstraint::with_length(
        world.particles(),
        pin,
        bob,
        REST_LENGTH,
        Compliance::new(COMPLIANCE).unwrap(),
    )
    .unwrap();
    world.add_constraint(rod).unwrap();
    world.set_solver(solver);
    let (mut first_crossing, mut last_crossing, mut periods) = (None, 0.0, -1.0_f64);
    let mut previous_stretch = STRETCH;
    for step in 0..STEPS {
        world.step(time_step(DT));
        let stretch = world.particles().positions()[1].x - REST_LENGTH;
        if previous_stretch < 0.0 && stretch >= 0.0 {
            let time = f64::from(step + 1) * DT;
            first_crossing.get_or_insert(time);
            last_crossing = time;
            periods += 1.0;
        }
        previous_stretch = stretch;
    }
    (last_crossing - first_crossing.unwrap()) / periods
}

/// Measured: 0.62857 s in both solvers against 0.62832 s, 0.04% (mostly the
/// 1/60 s sampling of the crossings). ~10x that.
const PERIOD_REL_TOL: f64 = 0.005;

fn check(solver: Solver) {
    let expected = 2.0 * std::f64::consts::PI * (MASS * COMPLIANCE).sqrt();
    let measured = measured_period(solver);
    println!("{solver:?}: period {measured:.5} s, expected {expected:.5} s");
    assert!(
        (measured - expected).abs() <= PERIOD_REL_TOL * expected,
        "{solver:?}: {measured} vs {expected}"
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

fn energy_ratio(solver: Solver, damping_coefficient: f64) -> f64 {
    use engine::Damping;
    use engine::diagnostics::kinetic_energy;
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    let pin = world.add_static(Vec2::ZERO);
    let bob = world.add_particle(Vec2::new(REST_LENGTH + 0.05, 0.0), Vec2::ZERO, kg(MASS));
    let rod = DistanceConstraint::with_length(
        world.particles(),
        pin,
        bob,
        REST_LENGTH,
        Compliance::new(COMPLIANCE).unwrap(),
    )
    .unwrap()
    .with_damping(Damping::new(damping_coefficient).unwrap());
    world.add_constraint(rod).unwrap();
    world.set_solver(solver);
    // Spring energy ½ k x² = ½ x² / α plus kinetic.
    let energy = |world: &World<f64>| {
        let stretch = world.particles().positions()[1].x - REST_LENGTH;
        kinetic_energy(world.particles()) + 0.5 * stretch * stretch / COMPLIANCE
    };
    let start_energy = energy(&world);
    for _ in 0..300 {
        world.step(time_step(DT));
    }
    energy(&world) / start_energy
}

/// Both constraint solvers are implicit for a compliant spring, and an
/// implicit (backward Euler) step damps by itself: energy shrinks by
/// `1 / (1 + ω² h²)` per substep. Undamped here (ω = 10, h = 1/1200, 6000
/// substeps) that predicts 0.6593 of the energy left after 5 s; measured
/// 0.65925 in both solvers. The price of having no stability threshold
/// (`docs/07-soft-bodies.md`).
#[test]
fn compliant_springs_damp_at_backward_eulers_rate() {
    let substep = DT / f64::from(SUBSTEPS);
    let omega_h_squared = substep * substep / (MASS * COMPLIANCE);
    let predicted = (1.0 + omega_h_squared).powf(-f64::from(300 * SUBSTEPS));
    for solver in Solver::ALL {
        let measured = energy_ratio(solver, 0.0);
        assert!(
            (measured - predicted).abs() < 1e-3 * predicted,
            "{solver:?}: {measured} vs {predicted}"
        );
    }
}

/// The physical damper on top: damped / undamped energy decays as
/// `e^(−c t / m)` (e^−2 at c = 0.4, 5 s). Measured 0.1339 vs 0.1353 (1%) in
/// both solvers, which agree to 12 digits (the same update in position and
/// velocity form). Bound ~5x.
#[test]
fn constraint_damping_decays_at_the_analytic_rate() {
    let expected = (-2.0_f64).exp();
    for solver in Solver::ALL {
        let ratio = damped_energy_ratio(solver) / energy_ratio(solver, 0.0);
        assert!(
            (ratio - expected).abs() < 0.05 * expected,
            "{solver:?}: {ratio} vs {expected}"
        );
    }
}
