//! Cushions (M7, `docs/09-billiards.md`): segments with their own
//! restitution, in both solvers.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::collision::Segment;
use engine::diagnostics::kinetic_energy;
use engine::{Integrator, Radius, Restitution, Solver, UniformGravity, Vec2, World};
use test_support::{kg, nonzero, time_step};

const DT: f64 = 1.0 / 60.0;
const SUBSTEPS: u32 = 10;
/// A pool ball (`docs/09-billiards.md`).
const R: f64 = 0.028_575;
const M: f64 = 0.17;

fn world(solver: Solver, substeps: u32, e_ball: f64) -> World<f64> {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(substeps));
    w.set_solver(solver);
    w.set_restitution(Restitution::new(e_ball).unwrap());
    w
}

fn cushion(w: &mut World<f64>, a: (f64, f64), b: (f64, f64), e: f64) {
    w.add_segment(Segment::new(
        Vec2::new(a.0, a.1),
        Vec2::new(b.0, b.1),
        Restitution::new(e).unwrap(),
    ));
}

fn ball(w: &mut World<f64>, x: (f64, f64), v: (f64, f64)) {
    w.add_circle(
        Vec2::new(x.0, x.1),
        Vec2::new(v.0, v.1),
        kg(M),
        Radius::new(R).unwrap(),
    );
}

fn run(w: &mut World<f64>, steps: usize) {
    for _ in 0..steps {
        w.step(time_step(DT));
    }
}

/// Bounds, each about 10x the worst measured (f64, 10 substeps):
/// reflection off a long cushion, the velocity along it kept to 3.1e-14
/// (XPBD; impulse 4.0e-15) and across it reversed and scaled by `e` to
/// 1.2e-14; energy over a squeeze or a hit on a frozen ball, never more
/// than 7.8e-15 above the start (rounding).
const REFLECT_TOL: f64 = 3e-13;
const GAIN_TOL: f64 = 1e-13;

#[test]
fn a_cushion_reflects_at_the_angle_it_was_hit_scaled_by_its_restitution() {
    for solver in Solver::ALL {
        for e in [1.0, 0.8] {
            let mut w = world(solver, SUBSTEPS, 1.0);
            cushion(&mut w, (-2.0, 0.0), (2.0, 0.0), e);
            // 2 m/s at 30° to the cushion, towards it.
            let a = 30f64.to_radians();
            let (vx, vy) = (2.0 * a.cos(), -2.0 * a.sin());
            ball(&mut w, (-0.3, 0.2), (vx, vy));
            run(&mut w, 30);
            let v = w.particles().vel()[0];
            assert!(
                (v.x - vx).abs() < REFLECT_TOL,
                "{solver:?} e {e}: vx {}",
                v.x
            );
            assert!(
                (v.y + e * vy).abs() < REFLECT_TOL,
                "{solver:?} e {e}: vy {}",
                v.y
            );
        }
    }
}

/// The largest rise in kinetic energy over 0.5 s, relative to the start.
fn worst_gain(w: &mut World<f64>) -> f64 {
    let e0 = kinetic_energy(w.particles());
    let mut worst = 0.0_f64;
    for _ in 0..30 {
        w.step(time_step(DT));
        worst = worst.max(kinetic_energy(w.particles()) / e0 - 1.0);
    }
    worst
}

/// Restitutions for (ball–ball, cushion): the table's, and extremes.
const MIXED: [(f64, f64); 5] = [(0.94, 0.8), (1.0, 0.0), (0.0, 1.0), (1.0, 0.5), (0.5, 1.0)];

#[test]
fn a_ball_squeezed_against_a_cushion_never_gains_energy() {
    // Found while planning (`docs/09-billiards.md`, "Restitution per
    // contact"): an object ball moving into a cushion, struck in the same
    // substep, puts both contacts in one round of the impact stage. With
    // each contact at its own e, (1, 0.5) gained 2.5% at 0° and 0.94% at
    // 20°; with a coupled group's smallest e, nothing.
    for solver in Solver::ALL {
        for angle in [0.0_f64, 20.0, 40.0] {
            for (eb, ec) in MIXED {
                for uo in [0.5, 1.0, 3.0] {
                    let mut w = world(solver, SUBSTEPS, eb);
                    cushion(&mut w, (-1.0, 0.0), (1.0, 0.0), ec);
                    // 0.2 mm off the cushion, moving in; the cue ball
                    // touching it at `angle`, moving in too.
                    let yo = R + 2e-4;
                    ball(&mut w, (0.0, yo), (0.0, -uo));
                    let a = angle.to_radians();
                    let dir = (a.sin(), -a.cos());
                    let c = (-dir.0 * 2.0 * R, yo - dir.1 * 2.0 * R);
                    ball(&mut w, c, (3.0 * dir.0, 3.0 * dir.1 - uo));
                    let gain = worst_gain(&mut w);
                    assert!(
                        gain < GAIN_TOL,
                        "{solver:?} {angle}° e ({eb}, {ec}) {uo} m/s: +{gain:e}"
                    );
                }
            }
        }
    }
}

#[test]
fn a_ball_frozen_to_a_cushion_and_struck_never_gains_energy() {
    for solver in Solver::ALL {
        for angle in [0.0_f64, 15.0, 30.0, 45.0, 60.0] {
            for (eb, ec) in MIXED {
                let mut w = world(solver, SUBSTEPS, eb);
                cushion(&mut w, (-1.0, 0.0), (1.0, 0.0), ec);
                ball(&mut w, (0.0, R), (0.0, 0.0));
                let a = angle.to_radians();
                let dir = (a.sin(), -a.cos());
                ball(
                    &mut w,
                    (-dir.0 * 0.3, R - dir.1 * 0.3),
                    (3.0 * dir.0, 3.0 * dir.1),
                );
                let gain = worst_gain(&mut w);
                assert!(
                    gain < GAIN_TOL,
                    "{solver:?} {angle}° e ({eb}, {ec}): +{gain:e}"
                );
            }
        }
    }
}

/// A ball pushed into a cushion by a steady 1 m/s² (a tilted table) for
/// 2 s: measured exactly at the surface and at rest, both solvers.
#[test]
fn a_ball_pushed_into_a_cushion_rests_against_it() {
    for solver in Solver::ALL {
        let mut w = world(solver, SUBSTEPS, 0.94);
        w.add_force(UniformGravity::new(Vec2::new(0.0, -1.0)));
        cushion(&mut w, (-1.0, 0.0), (1.0, 0.0), 0.8);
        ball(&mut w, (0.0, R), (0.0, 0.0));
        run(&mut w, 120);
        let (x, v) = (w.particles().pos()[0], w.particles().vel()[0]);
        assert!((x.y - R).abs() < 1e-12, "{solver:?}: depth {}", R - x.y);
        assert!(v.length() < 1e-12, "{solver:?}: speed {}", v.length());
    }
}

/// Off a cushion's end (a pocket jaw), the ball reflects about the line
/// from the end to its centre at the moment it touches. Measured within
/// 4.2e-8 m/s of the geometry (conservative advancement, three steps),
/// speed kept to 3e-14; bound ~10x.
#[test]
fn a_ball_glancing_off_a_cushions_end_reflects_about_the_corner() {
    for solver in Solver::ALL {
        let mut w = world(solver, SUBSTEPS, 0.94);
        cushion(&mut w, (0.0, 0.0), (1.0, 0.0), 1.0);
        ball(&mut w, (-0.3, 0.01), (2.0, 0.0));
        run(&mut w, 30);
        let v = w.particles().vel()[0];
        // At contact the centre is R from (0, 0) at y = 0.01.
        let n = Vec2::new(-(R * R - 0.01 * 0.01).sqrt(), 0.01) / R;
        let v0 = Vec2::new(2.0, 0.0);
        let want = v0 - n * (2.0 * v0.dot(n));
        assert!(
            (v - want).length() < 5e-7,
            "{solver:?}: {v:?}, want {want:?}"
        );
    }
}

/// A 12 m/s ball (the cue's fastest) at a cushion, one substep a step:
/// it bounces back; it doesn't pass through.
#[test]
fn nothing_passes_through_a_cushion_at_one_substep() {
    for solver in Solver::ALL {
        let mut w = world(solver, 1, 0.94);
        cushion(&mut w, (-1.0, 0.0), (1.0, 0.0), 0.8);
        ball(&mut w, (0.0, 0.537), (0.0, -12.0));
        run(&mut w, 30);
        let y = w.particles().pos()[0].y;
        assert!(y > R, "{solver:?}: y {y}");
    }
}

/// A cut shot: the object ball leaves along the line of centres at the
/// moment of impact. At the start of a substep the normal is up to a
/// substep's travel early, and on a glancing hit still turning: cut shots
/// went 1–8° off at 10 substeps, and grazes were found a substep early,
/// at the stale normal (an 80° cut left at 60°), until contacts moved to
/// the moment of impact (`solver/contacts.rs`, `at_impact`). Measured: at
/// most 1.5e-11° over 5–80° cuts, 1–12 m/s, 1–40 substeps; bound ~10x.
#[test]
fn a_cut_shot_leaves_along_the_line_of_centres() {
    for solver in Solver::ALL {
        for sub in [1u32, 10, 40] {
            for speed in [1.0, 3.0, 8.0, 12.0] {
                for cut in [5.0_f64, 15.0, 30.0, 45.0, 60.0, 80.0] {
                    let mut w = world(solver, sub, 1.0);
                    let b = 2.0 * R * cut.to_radians().sin();
                    ball(&mut w, (0.0, 0.0), (0.0, 0.0));
                    // A non-round distance away, so the hit falls mid-substep.
                    ball(&mut w, (-0.4123, b), (speed, 0.0));
                    run(&mut w, 60);
                    let v = w.particles().vel()[0];
                    let err = v.y.atan2(v.x).to_degrees() + cut;
                    assert!(
                        err.abs() < 2e-10,
                        "{solver:?} {sub} substeps {speed} m/s, {cut}°: off by {err}°"
                    );
                }
            }
        }
    }
}
