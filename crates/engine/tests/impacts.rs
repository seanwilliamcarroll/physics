//! Simultaneous impacts (M6, `docs/08-collision.md`): restitution when a
//! ball meets several contacts at once, on the scenes that showed Newton
//! restitution's failures. Both solvers, elastic, 10 substeps.
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
fn cradle_swing(solver: Solver) -> Vec<f64> {
    let mut w = cradle::<f64>(solver, nonzero(SUBSTEPS), 5, 1).unwrap();
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
        let swing = cradle_swing(solver);
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
