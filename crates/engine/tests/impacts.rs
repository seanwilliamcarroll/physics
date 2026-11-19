//! Simultaneous impacts (`docs/08-collision.md`): restitution when a ball
//! meets several contacts at once, on the scenarios that showed Newton
//! restitution's failures, then the scenarios' behavior (the box running
//! down when inelastic, the cradle by iterations and substeps). Both
//! solvers; elastic at 10 substeps unless a test says otherwise.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::diagnostics::{kinetic_energy, momentum, uniform_gravity_potential};
use engine::scenarios::{CRADLE_LENGTH, ball_box, break_shot, cradle, pendulum_gravity};
use engine::{Integrator, Radius, Restitution, Solver, Vec2, World};
use test_support::{kg, nonzero, time_step};

const DT: f64 = 1.0 / 60.0;
const SUBSTEPS: u32 = 10;

/// Bounds, each about 10x the worst measured (f64): elastic impacts in
/// free space keep their energy to 3e-13 (both solvers) and their momentum
/// to 1.1e-15 (impulse) and 5.7e-13 (XPBD, whose velocities are derived
/// from positions, `(x − x_prev) / h`: its baseline drift before the impact
/// stage was 6.1e-13 too).
const ENERGY_TOL: f64 = 3e-12;
fn momentum_tol(solver: Solver) -> f64 {
    match solver {
        Solver::Impulse => 1e-14,
        Solver::Xpbd => 6e-12,
    }
}
/// The cradle's swing against `[0, 0, 0, 0, 1]`, as a fraction of the
/// pull: measured impulse ball 5 at 0.9982 (others under 5e-5), bound
/// ~10x; XPBD ball 5 at 0.9867 and ball 4 at 0.0029 (its rods are
/// projected positions, which take ~1.3% of the swing), bound ~2x.
fn cradle_tol(solver: Solver) -> f64 {
    match solver {
        Solver::Impulse => 0.02,
        Solver::Xpbd => 0.03,
    }
}
/// The ball box's energy over 20 s at 10 substeps (gravity, walls, 20
/// balls): measured +0.11%, each bounce off by `g h (τ − ½)` (where in the
/// substep it lands), which averages out but not exactly.
const BOX_TOL: f64 = 0.01;

/// Kinetic energy kept after one ball (2 m/s) hits two side by side,
/// `gap` m apart, 2 s.
fn one_hits_two(solver: Solver, gap: f64) -> f64 {
    let ball_radius = 0.1;
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    world.set_solver(solver);
    world.set_restitution(Restitution::new(1.0).unwrap());
    let radius = Radius::new(ball_radius).unwrap();
    let target_y = ball_radius + gap / 2.0;
    world.add_circle(Vec2::new(-1.0, 0.0), Vec2::new(2.0, 0.0), kg(1.0), radius);
    world.add_circle(Vec2::new(0.5, target_y), Vec2::ZERO, kg(1.0), radius);
    world.add_circle(Vec2::new(0.5, -target_y), Vec2::ZERO, kg(1.0), radius);
    let start_energy = kinetic_energy(world.particles());
    for _ in 0..120 {
        world.step(time_step(DT));
    }
    kinetic_energy(world.particles()) / start_energy
}

/// The break shot with the rack `gap` m apart, 2 s: (KE kept, |Δp|).
fn break_kept(solver: Solver, gap: f64) -> (f64, f64) {
    let mut world = break_shot::<f64>(solver, nonzero(SUBSTEPS), gap).unwrap();
    let (start_energy, start_momentum) = (
        kinetic_energy(world.particles()),
        momentum(world.particles()),
    );
    for _ in 0..120 {
        world.step(time_step(DT));
    }
    (
        kinetic_energy(world.particles()) / start_energy,
        (momentum(world.particles()) - start_momentum).length(),
    )
}

/// The cradle (5 balls, the first pulled): each ball's furthest swing to
/// the right of its rest position over the first right-hand swing, as a
/// fraction of the pull's horizontal distance. Ideal [0, 0, 0, 0, 1].
fn cradle_swing(solver: Solver, substeps: u32, iterations: u32) -> Vec<f64> {
    let mut world = cradle::<f64>(solver, nonzero(substeps), 5, 1).unwrap();
    world.set_iterations(nonzero(iterations));
    // Balls are particles 1, 3, 5, … (each after its pin); rest x is the
    // pin's x.
    let particle_count = world.particles().len();
    let rest_x: Vec<f64> = (0..particle_count)
        .step_by(2)
        .map(|pin_index| world.particles().pos()[pin_index].x)
        .collect();
    let mut furthest = vec![0.0_f64; rest_x.len()];
    // The impact comes at a quarter period (~0.35 s), the far apex at
    // half (~0.71 s): 0.9 s covers it, before anything swings back.
    for _ in 0..54 {
        world.step(time_step(DT));
        for (ball, ball_furthest) in furthest.iter_mut().enumerate() {
            *ball_furthest =
                ball_furthest.max(world.particles().pos()[2 * ball + 1].x - rest_x[ball]);
        }
    }
    let pull = 0.6 * CRADLE_LENGTH;
    furthest.iter().map(|swing| swing / pull).collect()
}

/// The ball box (20 balls), 20 s: total energy kept.
fn box_kept(solver: Solver) -> f64 {
    let mut world = ball_box::<f64>(solver, nonzero(SUBSTEPS), 20, 1).unwrap();
    let gravity = pendulum_gravity();
    let energy = |world: &World<f64>| {
        kinetic_energy(world.particles()) + uniform_gravity_potential(world.particles(), &gravity)
    };
    let start_energy = energy(&world);
    for _ in 0..1200 {
        world.step(time_step(DT));
    }
    energy(&world) / start_energy
}

/// The impact stage (Generalized Reflections), in both solvers, against
/// each failure Newton restitution had.

#[test]
fn one_ball_hitting_two_keeps_its_energy() {
    for solver in Solver::ALL {
        for gap in [0.0, 0.002, 0.01] {
            let kept = one_hits_two(solver, gap);
            println!("{solver:?} gap {gap}: kept 1 {:+e}", kept - 1.0);
            assert!(
                (kept - 1.0).abs() < ENERGY_TOL,
                "{solver:?} gap {gap}: kept {kept}"
            );
        }
    }
}

#[test]
fn the_break_keeps_its_energy_and_momentum_touching_or_not() {
    for solver in Solver::ALL {
        for gap in [0.0, 0.002, 0.01] {
            let (kept, momentum_change) = break_kept(solver, gap);
            println!(
                "{solver:?} gap {gap}: kept 1 {:+e}, |Δp| {momentum_change:e}",
                kept - 1.0
            );
            assert!(
                (kept - 1.0).abs() < ENERGY_TOL,
                "{solver:?} gap {gap}: kept {kept}"
            );
            assert!(
                momentum_change < momentum_tol(solver),
                "{solver:?} gap {gap}: |Δp| {momentum_change}"
            );
        }
    }
}

#[test]
fn the_cradle_passes_its_impact_down_the_row() {
    for solver in Solver::ALL {
        let swing = cradle_swing(solver, SUBSTEPS, 1);
        println!("{solver:?} swing / pull: {swing:?}");
        let ideal = [0.0, 0.0, 0.0, 0.0, 1.0];
        for (ball, (measured, wanted)) in swing.iter().zip(ideal).enumerate() {
            assert!(
                (measured - wanted).abs() < cradle_tol(solver),
                "{solver:?} ball {ball}: {measured} (ideal {wanted})"
            );
        }
    }
}

#[test]
fn the_ball_box_keeps_its_energy() {
    for solver in Solver::ALL {
        let kept = box_kept(solver);
        println!("{solver:?} box, 20 s: kept {kept}");
        assert!((kept - 1.0).abs() < BOX_TOL, "{solver:?} kept {kept}");
    }
}

/// The ball box at restitution `restitution`, 20 s: total energy every 2 s,
/// as a fraction of the start.
fn box_energy_every_2s(solver: Solver, restitution: f64) -> Vec<f64> {
    let mut world = ball_box::<f64>(solver, nonzero(SUBSTEPS), 20, 1).unwrap();
    world.set_restitution(Restitution::new(restitution).unwrap());
    let gravity = pendulum_gravity();
    let energy = |world: &World<f64>| {
        kinetic_energy(world.particles()) + uniform_gravity_potential(world.particles(), &gravity)
    };
    let start_energy = energy(&world);
    let mut samples = Vec::new();
    for _ in 0..10 {
        for _ in 0..120 {
            world.step(time_step(DT));
        }
        samples.push(energy(&world) / start_energy);
    }
    samples
}

/// Each 2 s sample may rise by this much (measured: 1.6e-11, XPBD e = 0;
/// otherwise 0 or 1 ulp), bound ~10x.
const BOX_RISE_TOL: f64 = 2e-10;
/// Below this, the box has run down: measured 0.2552–0.2593 at 20 s
/// (balls at rest, potential energy only; the impulse solver's piles
/// settle a little higher), against 1 when elastic.
const BOX_RUN_DOWN: f64 = 0.3;

/// The box at restitution `restitution` runs down: energy never rising
/// between 2 s samples, and at rest by 20 s. One test per (solver,
/// restitution), so a parallel runner (nextest) spreads them: as one test
/// they took 30 s, the longest in the workspace.
fn runs_down(solver: Solver, restitution: f64) {
    let samples = box_energy_every_2s(solver, restitution);
    println!("{solver:?} e {restitution}: {samples:.4?}");
    for (index, pair) in samples.windows(2).enumerate() {
        if let [earlier, later] = pair {
            assert!(
                later - earlier < BOX_RISE_TOL,
                "{solver:?} e {restitution}: rose at {index}: {samples:?}"
            );
        }
    }
    let last = samples.last().copied().unwrap_or(1.0);
    assert!(
        last < BOX_RUN_DOWN,
        "{solver:?} e {restitution}: kept {last}"
    );
}

#[test]
fn the_ball_box_runs_down_at_e_0_9_xpbd() {
    runs_down(Solver::Xpbd, 0.9);
}
#[test]
fn the_ball_box_runs_down_at_e_0_5_xpbd() {
    runs_down(Solver::Xpbd, 0.5);
}
#[test]
fn the_ball_box_runs_down_at_e_0_xpbd() {
    runs_down(Solver::Xpbd, 0.0);
}
#[test]
fn the_ball_box_runs_down_at_e_0_9_impulse() {
    runs_down(Solver::Impulse, 0.9);
}
/// The longest of the six (the impulse solver's piles at e = 0.5 take 20 s
/// of test time to come to rest): in the slow tier; e = 0.9 and e = 0
/// cover the impulse solver on every push.
#[test]
#[ignore = "slow: cargo xtask slow"]
fn slow_the_ball_box_runs_down_at_e_0_5_impulse() {
    runs_down(Solver::Impulse, 0.5);
}
#[test]
fn the_ball_box_runs_down_at_e_0_impulse() {
    runs_down(Solver::Impulse, 0.0);
}

/// One rod per ball, nothing between them for Gauss–Seidel to pass on, and
/// the impact stage solves to convergence on its own: so iterations change
/// nothing. Measured 1 vs 16 iterations: 1.8e-13 (XPBD), 2.4e-8 (impulse),
/// bound ~10x.
fn iterations_tol(solver: Solver) -> f64 {
    match solver {
        Solver::Impulse => 3e-7,
        Solver::Xpbd => 2e-12,
    }
}

#[test]
fn the_cradle_ignores_iterations() {
    for solver in Solver::ALL {
        let (one_iteration, many_iterations) = (
            cradle_swing(solver, SUBSTEPS, 1),
            cradle_swing(solver, SUBSTEPS, 16),
        );
        let largest_difference = one_iteration
            .iter()
            .zip(&many_iterations)
            .map(|(one, many)| (one - many).abs())
            .fold(0.0, f64::max);
        assert!(
            largest_difference < iterations_tol(solver),
            "{solver:?}: {largest_difference}"
        );
    }
}

/// The cradle's worst ball against `[0, 0, 0, 0, 1]`.
fn cradle_error(solver: Solver, substeps: u32) -> f64 {
    cradle_swing(solver, substeps, 1)
        .iter()
        .zip([0.0, 0.0, 0.0, 0.0, 1.0])
        .map(|(measured, wanted)| (measured - wanted).abs())
        .fold(0.0, f64::max)
}

/// XPBD's error times the substeps: first order, so about constant.
/// Measured 0.119 (1 substep) rising to 0.140 (40); bounds around it.
const XPBD_CRADLE_ORDER: (f64, f64) = (0.1, 0.2);
/// The impulse solver's error at any substeps: measured at most 0.028 (1
/// substep), and not monotone (0.0083 at 2, 0.0091 at 5).
const IMPULSE_CRADLE_TOL: f64 = 0.05;

#[test]
fn the_cradle_by_substeps() {
    for substeps in [1, 2, 5, 10, 20, 40] {
        let xpbd = cradle_error(Solver::Xpbd, substeps) * f64::from(substeps);
        let impulse = cradle_error(Solver::Impulse, substeps);
        println!("{substeps} substeps: XPBD error × n {xpbd:.4}, impulse error {impulse:.4}");
        let (lowest, highest) = XPBD_CRADLE_ORDER;
        assert!(
            (lowest..highest).contains(&xpbd),
            "XPBD, {substeps} substeps: {xpbd}"
        );
        assert!(
            impulse < IMPULSE_CRADLE_TOL,
            "impulse, {substeps} substeps: {impulse}"
        );
    }
}
