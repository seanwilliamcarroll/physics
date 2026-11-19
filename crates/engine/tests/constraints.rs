//! Constraints and solvers (`docs/06-constraints.md`): what XPBD
//! guarantees, and the seams between solver, integrator, and world.
#![cfg(test)]

use engine::diagnostics::{constraint_error, momentum};
use engine::scenarios::{PENDULUM_LENGTH, pendulum};
use engine::{DistanceConstraint, Integrator, Scalar, Solver, Vec2, World};
use test_support::{Tol, for_each_scalar, kg, nonzero, pendulum_energy, time_step, v};

const DT: f64 = 1.0 / 60.0;
const STEPS: u32 = 600;

fn max_rod_error<S: Scalar>(world: &World<S>) -> f64 {
    constraint_error(world.particles(), world.constraints())
        .map_or(f64::NAN, |(max_error, _)| max_error.to_f64())
}

/// XPBD projects the bob back onto the circle every substep, so the rod
/// error is rounding, not drift: `01`'s "~0 (float eps)" column. Bound:
/// a few ulps of the 1 m rod per step, checked after every step.
fn xpbd_holds_the_rod_to_rounding<S: Tol>() {
    let mut world = pendulum::<S>(Solver::Xpbd, nonzero(1)).unwrap();
    let mut worst = 0.0_f64;
    for _ in 0..STEPS {
        world.step(time_step(DT));
        worst = worst.max(max_rod_error(&world));
    }
    let bound = 8.0 * S::EPSILON * PENDULUM_LENGTH;
    assert!(worst <= bound, "max rod error {worst} > {bound}");
}
for_each_scalar!(xpbd_holds_the_rod_to_rounding);

/// The anchor is a static particle: inverse-mass weighting never moves it.
#[test]
fn the_pin_never_moves() {
    let mut world = pendulum::<f64>(Solver::Xpbd, nonzero(4)).unwrap();
    for _ in 0..STEPS {
        world.step(time_step(DT));
    }
    assert_eq!(world.particles().positions()[0], Vec2::ZERO);
    assert_eq!(world.particles().velocities()[0], Vec2::ZERO);
}

/// XPBD dissipates through projection, less with smaller substeps (`01`,
/// takeaway 2). Measured (f64): 1 substep loses most of the 9.81 J swing,
/// 20 and 100 far less, in order.
#[test]
fn xpbd_energy_loss_shrinks_with_substeps() {
    let energy_lost = |substeps| {
        let mut world = pendulum::<f64>(Solver::Xpbd, nonzero(substeps)).unwrap();
        let start_energy = pendulum_energy(&world);
        for _ in 0..STEPS {
            world.step(time_step(DT));
        }
        start_energy - pendulum_energy(&world)
    };
    let (lost_at_1, lost_at_20, lost_at_100) = (energy_lost(1), energy_lost(20), energy_lost(100));
    println!(
        "XPBD energy lost over 10 s: 1 sub {lost_at_1:.3} J, 20 sub {lost_at_20:.3} J, 100 sub {lost_at_100:.3} J"
    );
    assert!(
        lost_at_1 > lost_at_20 && lost_at_20 > lost_at_100 && lost_at_100 > 0.0,
        "{lost_at_1} {lost_at_20} {lost_at_100}"
    );
}

/// Two free bodies on a rod, spinning with no gravity: the constraint
/// forces are internal, so momentum is conserved (mass weighting, `01`)
/// and the rod holds.
fn free_rod_conserves_momentum<S: Tol>() {
    let mut world = World::<S>::new(Integrator::SymplecticEuler, nonzero(1));
    let light = world.add_particle(v(-0.5, 0.0), v(0.1, -1.0), kg(1.0));
    let heavy = world.add_particle(v(0.5, 0.0), v(0.3, 2.0), kg(3.0));
    let rod = DistanceConstraint::between(world.particles(), light, heavy).unwrap();
    world.add_constraint(rod).unwrap();
    let start_momentum = momentum(world.particles());
    for _ in 0..STEPS {
        world.step(time_step(DT));
    }
    let drift = (momentum(world.particles()) - start_momentum)
        .length()
        .to_f64();
    // Σ m|v| ≈ 7 kg m/s; rounding per step, as the momentum law.
    assert!(
        drift <= f64::from(STEPS) * S::EPSILON * 7.0 * 4.0,
        "drift {drift}"
    );
    assert!(max_rod_error(&world) <= 8.0 * S::EPSILON);
}
for_each_scalar!(free_rod_conserves_momentum);

/// With constraints the solver owns the step, so the integrator setting
/// changes nothing (it can't half-apply).
#[test]
fn integrator_is_ignored_with_constraints() {
    let run = |integrator| {
        let mut world = pendulum::<f64>(Solver::Xpbd, nonzero(2)).unwrap();
        world.set_integrator(integrator);
        for _ in 0..60 {
            world.step(time_step(DT));
        }
        world.particles().positions().to_vec()
    };
    let reference = run(Integrator::SymplecticEuler);
    for integrator in Integrator::ALL {
        assert_eq!(run(integrator), reference, "{integrator:?}");
    }
}

/// One rigid pendulum period at amplitude `amplitude` (rad), length
/// `PENDULUM_LENGTH`, under `solver` at 20 substeps: from the bob's zero
/// crossings over 20 s of 1/60 s steps, each interpolated within its step.
fn small_angle_period(solver: Solver, amplitude: f64) -> f64 {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(20));
    world.add_force(engine::scenarios::pendulum_gravity());
    let pin = world.add_static(Vec2::ZERO);
    let bob = world.add_particle(
        Vec2::new(
            PENDULUM_LENGTH * amplitude.sin(),
            -PENDULUM_LENGTH * amplitude.cos(),
        ),
        Vec2::ZERO,
        kg(1.0),
    );
    world
        .add_constraint(DistanceConstraint::between(world.particles(), pin, bob).unwrap())
        .unwrap();
    world.set_solver(solver);
    let (mut previous_x, mut first_crossing, mut last_crossing, mut crossings) =
        (PENDULUM_LENGTH * amplitude.sin(), None, 0.0, 0_u32);
    for step in 1..=1200_u32 {
        world.step(time_step(DT));
        let x = world.particles().positions()[1].x;
        if previous_x.signum() != x.signum() {
            let time = (f64::from(step) - x / (x - previous_x)) * DT;
            first_crossing.get_or_insert(time);
            last_crossing = time;
            crossings += 1;
        }
        previous_x = x;
    }
    2.0 * (last_crossing - first_crossing.unwrap()) / f64::from(crossings - 1)
}

/// The rigid pendulum's small-angle period, `2π √(L/g)`, with the
/// finite-amplitude factor `1 + θ₀²/16` (θ₀ = 0.05 rad: +1.6e-4), for
/// both solvers (`docs/numerical-testing-checklist.md` §2.7). Measured at
/// 20 substeps: XPBD −0.0010 %, impulse −0.00002 % (at 1 substep +0.080 %
/// and −0.011 %); bound 0.01 %.
#[test]
fn a_rigid_pendulum_swings_at_the_small_angle_period() {
    let amplitude: f64 = 0.05;
    let gravity = engine::scenarios::STANDARD_GRAVITY;
    let expected = 2.0
        * std::f64::consts::PI
        * (PENDULUM_LENGTH / gravity).sqrt()
        * (1.0 + amplitude * amplitude / 16.0);
    for solver in Solver::ALL {
        let measured = small_angle_period(solver, amplitude);
        assert!(
            (measured / expected - 1.0).abs() < 1e-4,
            "{solver:?}: {measured} vs {expected}"
        );
    }
}
