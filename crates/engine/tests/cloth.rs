//! The cloth (M7, `docs/09-billiards.md`, "The ball model"): sliding to
//! rolling to rest, against the analytic results, and the shots that
//! emerge from it. Both solvers.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::diagnostics::{kinetic_energy, rotational_energy};
use engine::table::slip;
use engine::{Integrator, ParticleId, Radius, Restitution, Solver, Table, UnitVec2, Vec2, World};
use test_support::{kg, nonzero, time_step};

const DT: f64 = 1.0 / 60.0;
const R: f64 = 0.028_575;
const M: f64 = 0.17;
const MU_S: f64 = 0.2;
const MU_R: f64 = 0.01;
const G: f64 = 9.81;

fn world(solver: Solver, substeps: u32) -> World<f64> {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(substeps));
    w.set_solver(solver);
    w.set_restitution(Restitution::new(0.94).unwrap());
    w.set_table(Table::new(MU_S, MU_R, G));
    w
}

fn ball(w: &mut World<f64>, x: f64, y: f64) -> ParticleId {
    w.add_circle(Vec2::new(x, y), Vec2::ZERO, kg(M), Radius::new(R).unwrap())
}

fn energy(w: &World<f64>) -> f64 {
    kinetic_energy(w.particles()) + rotational_energy(w.particles(), w.spin())
}

/// Bounds for a centre hit at 3 m/s, sampled each step for 25 s (sliding,
/// rolling, at rest), each about 10x the worst measured: the cloth
/// integrates velocity exactly, so the velocity matches to 1.4e-12
/// (impulse) and 6.4e-8 (XPBD, at 40 substeps: its velocity is derived
/// from positions, `(x − x₀) / h`, which magnifies rounding by 1/h); the
/// position comes from the drift, first order: 0.0250 m × (1 substep / n)
/// at n = 1, 10 and 40.
fn velocity_tol(solver: Solver) -> f64 {
    match solver {
        Solver::Impulse => 5e-11,
        Solver::Xpbd => 7e-7,
    }
}
const POSITION_TOL_PER_SUBSTEP: f64 = 0.03;

#[test]
fn a_centre_hit_slides_then_rolls_then_stops_as_the_model_says() {
    // Sliding at μ_s g until t_s = 2 v₀ / (7 μ_s g), rolling on at 5/7 v₀
    // from s = 12 v₀² / (49 μ_s g), slowing at μ_r g to rest.
    let v0 = 3.0;
    let t_s = 2.0 * v0 / (7.0 * MU_S * G);
    let (vr, s) = (5.0 * v0 / 7.0, 12.0 * v0 * v0 / (49.0 * MU_S * G));
    for solver in Solver::ALL {
        for sub in [1u32, 10, 40] {
            let mut w = world(solver, sub);
            let id = ball(&mut w, 0.0, 0.0);
            assert!(w.strike(id, UnitVec2::X, v0, 0.0));
            let mut prev = energy(&w);
            for k in 1..=1500 {
                w.step(time_step(DT));
                let t = f64::from(k) * DT;
                let (x, v) = (w.particles().pos()[0].x, w.particles().vel()[0].x);
                let (want_v, want_x) = if t < t_s {
                    (v0 - MU_S * G * t, v0 * t - 0.5 * MU_S * G * t * t)
                } else {
                    let tr = (t - t_s).min(vr / (MU_R * G));
                    (vr - MU_R * G * tr, s + vr * tr - 0.5 * MU_R * G * tr * tr)
                };
                assert!(
                    (v - want_v).abs() < velocity_tol(solver),
                    "{solver:?} {sub}: at {t:.3} s, v {v} (want {want_v})"
                );
                let x_tol = POSITION_TOL_PER_SUBSTEP / f64::from(sub);
                assert!(
                    (x - want_x).abs() < x_tol,
                    "{solver:?} {sub}: at {t:.3} s, x {x} (want {want_x})"
                );
                // The cloth only takes energy (kinetic and spin).
                let e = energy(&w);
                assert!(e <= prev, "{solver:?} {sub}: energy rose at {t:.3} s");
                prev = e;
            }
            assert_eq!(w.particles().vel()[0], Vec2::ZERO, "at rest, exactly");
        }
    }
}

#[test]
fn a_ball_struck_at_two_fifths_of_its_radius_rolls_from_the_start() {
    for solver in Solver::ALL {
        let mut w = world(solver, 10);
        let id = ball(&mut w, 0.0, 0.0);
        w.strike(id, UnitVec2::X, 2.0, 0.4 * R);
        assert!(slip(w.particles().vel()[0], w.spin()[0], R).length() < 1e-12);
        w.step(time_step(DT));
        // Only rolling resistance: no sliding friction's μ_s g.
        let v = w.particles().vel()[0].x;
        assert!((v - (2.0 - MU_R * G * DT)).abs() < 1e-9, "{solver:?}: {v}");
    }
}

/// Stun, follow and draw: a full hit (e = 1) passes the cue ball's
/// velocity to the object ball and leaves its spin, so it then rolls at
/// `(2/7) R ω = (5/7)(b/R) v₀`: 0 for a stun, back for draw. Rolling
/// resistance off, so that's its final speed. Measured: natural roll
/// exact; the others `(5/7) μ_s g h/2` (1.17e-3 m/s at 10 substeps)
/// from the half substep of cloth before the impact stage (impacts sit
/// mid-substep, `docs/08-collision.md`); bound at the whole substep.
#[test]
fn stun_follow_and_draw_after_a_full_hit() {
    let v0 = 2.0;
    let h = DT / 10.0;
    for solver in Solver::ALL {
        for b in [0.0, 0.4 * R, 0.5 * R, -0.5 * R] {
            let mut w = world(solver, 10);
            w.set_restitution(Restitution::ELASTIC);
            w.set_table(Table::new(MU_S, 0.0, G));
            // Touching: the hit is in the first substep, at the struck spin.
            let cue = ball(&mut w, -2.0 * R, 0.0);
            ball(&mut w, 0.0, 0.0);
            w.strike(cue, UnitVec2::X, v0, b);
            for _ in 0..120 {
                w.step(time_step(DT));
            }
            let v = w.particles().vel()[0];
            let want = 5.0 / 7.0 * (b / R) * v0;
            let tol = 5.0 / 7.0 * MU_S * G * h;
            assert!(
                (v.x - want).abs() < tol && v.y == 0.0,
                "{solver:?} b {b}: cue {v:?}, want {want}"
            );
        }
    }
}

#[test]
fn a_struck_static_or_point_is_refused() {
    let mut w = world(Solver::Impulse, 1);
    let pin = w.add_static(Vec2::ZERO);
    let point = w.add_particle(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    assert!(!w.strike(pin.id(), UnitVec2::X, 1.0, 0.0));
    assert!(!w.strike(point, UnitVec2::X, 1.0, 0.0));
}
