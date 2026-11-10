//! Simultaneous impacts (M6, `docs/08-collision.md`): restitution when a
//! ball meets several contacts at once, on the scenes that showed Newton
//! restitution's failures, then the scenes' behavior (the box running down
//! when inelastic, the cradle by iterations and substeps). Both solvers;
//! elastic at 10 substeps unless a test says otherwise.
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
    let r = 0.1;
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    w.set_solver(solver);
    w.set_restitution(Restitution::new(1.0).unwrap());
    let radius = Radius::new(r).unwrap();
    let y = r + gap / 2.0;
    w.add_circle(Vec2::new(-1.0, 0.0), Vec2::new(2.0, 0.0), kg(1.0), radius);
    w.add_circle(Vec2::new(0.5, y), Vec2::ZERO, kg(1.0), radius);
    w.add_circle(Vec2::new(0.5, -y), Vec2::ZERO, kg(1.0), radius);
    let e0 = kinetic_energy(w.particles());
    for _ in 0..120 {
        w.step(time_step(DT));
    }
    kinetic_energy(w.particles()) / e0
}

/// The break shot with the rack `gap` m apart, 2 s: (KE kept, |Δp|).
fn break_kept(solver: Solver, gap: f64) -> (f64, f64) {
    let mut w = break_shot::<f64>(solver, nonzero(SUBSTEPS), gap).unwrap();
    let (e0, p0) = (kinetic_energy(w.particles()), momentum(w.particles()));
    for _ in 0..120 {
        w.step(time_step(DT));
    }
    (
        kinetic_energy(w.particles()) / e0,
        (momentum(w.particles()) - p0).length(),
    )
}

/// The cradle (5 balls, the first pulled): each ball's furthest swing to
/// the right of its rest position over the first right-hand swing, as a
/// fraction of the pull's horizontal distance. Ideal [0, 0, 0, 0, 1].
fn cradle_swing(solver: Solver, substeps: u32, iterations: u32) -> Vec<f64> {
    let mut w = cradle::<f64>(solver, nonzero(substeps), 5, 1).unwrap();
    w.set_iterations(nonzero(iterations));
    // Balls are particles 1, 3, 5, … (each after its pin); rest x is the
    // pin's x.
    let n = w.particles().len();
    let rest: Vec<f64> = (0..n)
        .step_by(2)
        .map(|i| w.particles().pos()[i].x)
        .collect();
    let mut furthest = vec![0.0_f64; rest.len()];
    // The impact comes at a quarter period (~0.35 s), the far apex at
    // half (~0.71 s): 0.9 s covers it, before anything swings back.
    for _ in 0..54 {
        w.step(time_step(DT));
        for (k, f) in furthest.iter_mut().enumerate() {
            *f = f.max(w.particles().pos()[2 * k + 1].x - rest[k]);
        }
    }
    let pull = 0.6 * CRADLE_LENGTH;
    furthest.iter().map(|f| f / pull).collect()
}

/// The ball box (20 balls), 20 s: total energy kept.
fn box_kept(solver: Solver) -> f64 {
    let mut w = ball_box::<f64>(solver, nonzero(SUBSTEPS), 20, 1).unwrap();
    let g = pendulum_gravity();
    let energy = |w: &World<f64>| {
        kinetic_energy(w.particles()) + uniform_gravity_potential(w.particles(), &g)
    };
    let e0 = energy(&w);
    for _ in 0..1200 {
        w.step(time_step(DT));
    }
    energy(&w) / e0
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
            let (kept, dp) = break_kept(solver, gap);
            println!(
                "{solver:?} gap {gap}: kept 1 {:+e}, |Δp| {dp:e}",
                kept - 1.0
            );
            assert!(
                (kept - 1.0).abs() < ENERGY_TOL,
                "{solver:?} gap {gap}: kept {kept}"
            );
            assert!(dp < momentum_tol(solver), "{solver:?} gap {gap}: |Δp| {dp}");
        }
    }
}

#[test]
fn the_cradle_passes_its_impact_down_the_row() {
    for solver in Solver::ALL {
        let swing = cradle_swing(solver, SUBSTEPS, 1);
        println!("{solver:?} swing / pull: {swing:?}");
        let ideal = [0.0, 0.0, 0.0, 0.0, 1.0];
        for (k, (got, want)) in swing.iter().zip(ideal).enumerate() {
            assert!(
                (got - want).abs() < cradle_tol(solver),
                "{solver:?} ball {k}: {got} (ideal {want})"
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

/// The ball box at restitution `e`, 20 s: total energy every 2 s, as a
/// fraction of the start.
fn box_energy_every_2s(solver: Solver, e: f64) -> Vec<f64> {
    let mut w = ball_box::<f64>(solver, nonzero(SUBSTEPS), 20, 1).unwrap();
    w.set_restitution(Restitution::new(e).unwrap());
    let g = pendulum_gravity();
    let energy = |w: &World<f64>| {
        kinetic_energy(w.particles()) + uniform_gravity_potential(w.particles(), &g)
    };
    let e0 = energy(&w);
    let mut samples = Vec::new();
    for _ in 0..10 {
        for _ in 0..120 {
            w.step(time_step(DT));
        }
        samples.push(energy(&w) / e0);
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

#[test]
fn the_ball_box_runs_down_when_inelastic() {
    for solver in Solver::ALL {
        for e in [0.9, 0.5, 0.0] {
            let s = box_energy_every_2s(solver, e);
            println!("{solver:?} e {e}: {s:.4?}");
            for (k, pair) in s.windows(2).enumerate() {
                if let [a, b] = pair {
                    assert!(b - a < BOX_RISE_TOL, "{solver:?} e {e}: rose at {k}: {s:?}");
                }
            }
            let last = s.last().copied().unwrap_or(1.0);
            assert!(last < BOX_RUN_DOWN, "{solver:?} e {e}: kept {last}");
        }
    }
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
        let (one, many) = (
            cradle_swing(solver, SUBSTEPS, 1),
            cradle_swing(solver, SUBSTEPS, 16),
        );
        let d = one
            .iter()
            .zip(&many)
            .map(|(a, b)| (a - b).abs())
            .fold(0.0, f64::max);
        assert!(d < iterations_tol(solver), "{solver:?}: {d}");
    }
}

/// The cradle's worst ball against `[0, 0, 0, 0, 1]`.
fn cradle_error(solver: Solver, substeps: u32) -> f64 {
    cradle_swing(solver, substeps, 1)
        .iter()
        .zip([0.0, 0.0, 0.0, 0.0, 1.0])
        .map(|(got, want)| (got - want).abs())
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
        let (lo, hi) = XPBD_CRADLE_ORDER;
        assert!(
            (lo..hi).contains(&xpbd),
            "XPBD, {substeps} substeps: {xpbd}"
        );
        assert!(
            impulse < IMPULSE_CRADLE_TOL,
            "impulse, {substeps} substeps: {impulse}"
        );
    }
}
