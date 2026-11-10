//! Constraints and solvers (`docs/06-constraints.md`): what XPBD
//! guarantees, and the seams between solver, integrator, and world.
#![cfg(test)]

use engine::diagnostics::{constraint_error, momentum};
use engine::scenarios::{PENDULUM_LENGTH, pendulum};
use engine::{DistanceConstraint, Integrator, Scalar, Solver, Vec2, World};
use test_support::{Tol, for_each_scalar, kg, nonzero, pendulum_energy, time_step, v};

/// The `01-solvers.md` setup: 10 s at 60 Hz.
const DT: f64 = 1.0 / 60.0;
const STEPS: u32 = 600;

fn max_rod_error<S: Scalar>(w: &World<S>) -> f64 {
    constraint_error(w.particles(), w.constraints()).map_or(f64::NAN, |(max, _)| max.to_f64())
}

/// XPBD projects the bob back onto the circle every substep, so the rod
/// error is rounding, not drift: `01`'s "~0 (float eps)" column. Bound:
/// a few ulps of the 1 m rod per step, checked after every step.
fn xpbd_holds_the_rod_to_rounding<S: Tol>() {
    let mut w = pendulum::<S>(Solver::Xpbd, nonzero(1)).unwrap();
    let mut worst = 0.0_f64;
    for _ in 0..STEPS {
        w.step(time_step(DT));
        worst = worst.max(max_rod_error(&w));
    }
    let bound = 8.0 * S::EPSILON * PENDULUM_LENGTH;
    assert!(worst <= bound, "max rod error {worst} > {bound}");
}
for_each_scalar!(xpbd_holds_the_rod_to_rounding);

/// The anchor is a static particle: inverse-mass weighting never moves it.
#[test]
fn the_pin_never_moves() {
    let mut w = pendulum::<f64>(Solver::Xpbd, nonzero(4)).unwrap();
    for _ in 0..STEPS {
        w.step(time_step(DT));
    }
    assert_eq!(w.particles().pos()[0], Vec2::ZERO);
    assert_eq!(w.particles().vel()[0], Vec2::ZERO);
}

/// XPBD dissipates through projection, less with smaller substeps (`01`,
/// takeaway 2). Measured (f64): 1 substep loses most of the 9.81 J swing,
/// 20 and 100 far less, in order.
#[test]
fn xpbd_energy_loss_shrinks_with_substeps() {
    let lost = |substeps| {
        let mut w = pendulum::<f64>(Solver::Xpbd, nonzero(substeps)).unwrap();
        let e0 = pendulum_energy(&w);
        for _ in 0..STEPS {
            w.step(time_step(DT));
        }
        e0 - pendulum_energy(&w)
    };
    let (l1, l20, l100) = (lost(1), lost(20), lost(100));
    println!("XPBD energy lost over 10 s: 1 sub {l1:.3} J, 20 sub {l20:.3} J, 100 sub {l100:.3} J");
    assert!(l1 > l20 && l20 > l100 && l100 > 0.0, "{l1} {l20} {l100}");
}

/// Two free bodies on a rod, spinning with no gravity: the constraint
/// forces are internal, so momentum is conserved (mass weighting, `01`)
/// and the rod holds.
fn free_rod_conserves_momentum<S: Tol>() {
    let mut w = World::<S>::new(Integrator::SymplecticEuler, nonzero(1));
    let a = w.add_particle(v(-0.5, 0.0), v(0.1, -1.0), kg(1.0));
    let b = w.add_particle(v(0.5, 0.0), v(0.3, 2.0), kg(3.0));
    let rod = DistanceConstraint::between(w.particles(), a, b).unwrap();
    w.add_constraint(rod).unwrap();
    let p0 = momentum(w.particles());
    for _ in 0..STEPS {
        w.step(time_step(DT));
    }
    let drift = (momentum(w.particles()) - p0).length().to_f64();
    // Σ m|v| ≈ 7 kg m/s; rounding per step, as M1's momentum law.
    assert!(
        drift <= f64::from(STEPS) * S::EPSILON * 7.0 * 4.0,
        "drift {drift}"
    );
    assert!(max_rod_error(&w) <= 8.0 * S::EPSILON);
}
for_each_scalar!(free_rod_conserves_momentum);

/// With constraints the solver owns the step, so the integrator setting
/// changes nothing (it can't half-apply).
#[test]
fn integrator_is_ignored_with_constraints() {
    let run = |integrator| {
        let mut w = pendulum::<f64>(Solver::Xpbd, nonzero(2)).unwrap();
        w.set_integrator(integrator);
        for _ in 0..60 {
            w.step(time_step(DT));
        }
        w.particles().pos().to_vec()
    };
    let reference = run(Integrator::SymplecticEuler);
    for integrator in Integrator::ALL {
        assert_eq!(run(integrator), reference, "{integrator:?}");
    }
}

/// One rigid pendulum period at amplitude `theta0` (rad), length
/// `PENDULUM_LENGTH`,
/// under `solver` at 20 substeps: from the bob's zero crossings over 20 s
/// of 1/60 s steps, each interpolated within its step.
fn small_angle_period(solver: Solver, theta0: f64) -> f64 {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(20));
    w.add_force(engine::scenarios::pendulum_gravity());
    let pin = w.add_static(Vec2::ZERO);
    let bob = w.add_particle(
        Vec2::new(
            PENDULUM_LENGTH * theta0.sin(),
            -PENDULUM_LENGTH * theta0.cos(),
        ),
        Vec2::ZERO,
        kg(1.0),
    );
    w.add_constraint(DistanceConstraint::between(w.particles(), pin, bob).unwrap())
        .unwrap();
    w.set_solver(solver);
    let (mut prev, mut first, mut last, mut crossings) =
        (PENDULUM_LENGTH * theta0.sin(), None, 0.0, 0_u32);
    for i in 1..=1200_u32 {
        w.step(time_step(DT));
        let x = w.particles().pos()[1].x;
        if prev.signum() != x.signum() {
            let t = (f64::from(i) - x / (x - prev)) * DT;
            first.get_or_insert(t);
            last = t;
            crossings += 1;
        }
        prev = x;
    }
    // Crossings come every half period.
    2.0 * (last - first.unwrap()) / f64::from(crossings - 1)
}

/// The rigid pendulum's small-angle period, `2π √(L/g)`, with the
/// finite-amplitude factor `1 + θ₀²/16` (θ₀ = 0.05 rad: +1.6e-4), for
/// both solvers (docs/numerical-testing-checklist.md §2.7, AN). Measured
/// at 20 substeps: XPBD −0.0010 %, impulse −0.00002 % (at 1 substep
/// +0.080 % and −0.011 %); bound 0.01 %.
#[test]
fn a_rigid_pendulum_swings_at_the_small_angle_period() {
    let theta0: f64 = 0.05;
    let g = engine::scenarios::STANDARD_GRAVITY;
    let want =
        2.0 * std::f64::consts::PI * (PENDULUM_LENGTH / g).sqrt() * (1.0 + theta0 * theta0 / 16.0);
    for solver in Solver::ALL {
        let got = small_angle_period(solver, theta0);
        assert!(
            (got / want - 1.0).abs() < 1e-4,
            "{solver:?}: {got} vs {want}"
        );
    }
}
