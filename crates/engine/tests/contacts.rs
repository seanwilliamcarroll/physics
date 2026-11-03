//! Contacts in the solvers (`docs/08-collision.md`): analytic collisions,
//! momentum, resting, bouncing. Each test runs every solver that handles
//! contacts so far.
#![cfg(test)]

use engine::diagnostics::{kinetic_energy, momentum};
use engine::scenarios::pendulum_gravity;
use engine::{Integrator, Radius, Restitution, Solver, UnitVec2, Vec2, Wall, World};
use test_support::{kg, nonzero};

/// Solvers with contacts so far (M6.5: XPBD; M6.6 adds impulse).
const SOLVERS: [Solver; 1] = [Solver::Xpbd];
const DT: f64 = 1.0 / 60.0;
const SUBSTEPS: u32 = 10;
const R: f64 = 0.1;

fn world(solver: Solver, e: f64) -> World<f64> {
    let mut w = World::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    w.set_solver(solver);
    w.set_restitution(Restitution::new(e).unwrap());
    w
}

fn ball(w: &mut World<f64>, x: (f64, f64), v: (f64, f64), m: f64) {
    w.particles.add_circle(
        Vec2::new(x.0, x.1),
        Vec2::new(v.0, v.1),
        kg(m),
        Radius::new(R).unwrap(),
    );
}

/// 1 kg at +1 m/s meets 3 kg at −1 m/s, 1 m apart, no gravity; returns
/// both velocities after 1 s (long after they meet, at ~0.4 s).
fn head_on(solver: Solver, e: f64) -> (Vec2<f64>, Vec2<f64>) {
    let mut w = world(solver, e);
    ball(&mut w, (-0.5, 0.0), (1.0, 0.0), 1.0);
    ball(&mut w, (0.5, 0.0), (-1.0, 0.0), 3.0);
    for _ in 0..60 {
        w.step(DT);
    }
    (w.particles.vel()[0], w.particles.vel()[1])
}

/// Velocity tolerance for one collision, m/s.
const HEAD_ON_TOL: f64 = 1e-9;

#[test]
fn elastic_head_on_matches_the_analytic_velocities() {
    // v1' = ((m1 − e m2) v1 + (1 + e) m2 v2) / (m1 + m2) = −2, v2' = 0.
    for solver in SOLVERS {
        let (v1, v2) = head_on(solver, 1.0);
        println!("{solver:?}: v1 {v1:?}, v2 {v2:?}");
        assert!(
            (v1 - Vec2::new(-2.0, 0.0)).length() < HEAD_ON_TOL,
            "{solver:?}: {v1:?}"
        );
        assert!(v2.length() < HEAD_ON_TOL, "{solver:?}: {v2:?}");
    }
}

#[test]
fn inelastic_head_on_moves_together() {
    // e = 0: both at the center-of-mass velocity, (1 − 3) / 4 = −0.5.
    for solver in SOLVERS {
        let (v1, v2) = head_on(solver, 0.0);
        println!("{solver:?}: v1 {v1:?}, v2 {v2:?}");
        for v in [v1, v2] {
            assert!(
                (v - Vec2::new(-0.5, 0.0)).length() < HEAD_ON_TOL,
                "{solver:?}: {v:?}"
            );
        }
    }
}

#[test]
fn momentum_is_conserved_through_a_pileup() {
    // Six balls converging on a cluster, glancing, e = 0.7, no gravity or
    // walls: total momentum fixed to rounding.
    for solver in SOLVERS {
        let mut w = world(solver, 0.7);
        let specs = [
            ((-1.0, 0.03), (2.0, 0.0), 1.0),
            ((0.0, 0.0), (0.0, 0.0), 2.0),
            ((0.21, 0.1), (0.0, 0.0), 0.5),
            ((0.25, -0.12), (0.0, 0.0), 1.5),
            ((0.6, 0.6), (-1.0, -1.0), 1.0),
            ((1.0, -0.05), (-1.5, 0.1), 0.8),
        ];
        for (x, v, m) in specs {
            ball(&mut w, x, v, m);
        }
        let p0 = momentum(&w.particles);
        for _ in 0..120 {
            w.step(DT);
        }
        let drift = (momentum(&w.particles) - p0).length();
        println!("{solver:?}: momentum drift {drift:e}");
        assert!(drift < 1e-12, "{solver:?}: {drift}");
    }
}

/// A floor at y = 0 and a ball dropped from `height` (its bottom), with
/// gravity; returns (highest bounce after the first impact, deepest
/// penetration seen, kinetic energy at the end).
fn drop(solver: Solver, e: f64, height: f64, steps: u32) -> (f64, f64, f64) {
    let mut w = world(solver, e);
    w.add_force(pendulum_gravity());
    w.add_wall(Wall::through(Vec2::ZERO, UnitVec2::Y));
    ball(&mut w, (0.0, height + R), (0.0, 0.0), 1.0);
    let (mut deepest, mut peak, mut bounced) = (0.0_f64, 0.0_f64, false);
    let mut prev_vy = 0.0;
    for _ in 0..steps {
        w.step(DT);
        let (y, vy) = (w.particles.pos()[0].y - R, w.particles.vel()[0].y);
        deepest = deepest.max(-y);
        bounced |= prev_vy < 0.0 && vy > 0.0;
        if bounced {
            peak = peak.max(y);
        }
        prev_vy = vy;
    }
    (peak, deepest, kinetic_energy(&w.particles))
}

#[test]
fn a_dropped_ball_comes_to_rest_on_the_floor() {
    for solver in SOLVERS {
        let (_, deepest, ke) = drop(solver, 0.0, 0.5, 120);
        println!("{solver:?}: deepest {deepest:e} m, final KE {ke:e} J");
        assert!(deepest < 1e-3, "{solver:?}: sank {deepest} m");
        assert!(ke < 1e-9, "{solver:?}: still moving, {ke} J");
    }
}

#[test]
fn a_bounce_reaches_e_squared_of_the_drop() {
    // Height after a bounce: e² h (speed scales by e, height by its square).
    for solver in SOLVERS {
        for e in [1.0, 0.5] {
            let (peak, deepest, _) = drop(solver, e, 0.5, 90);
            let want = e * e * 0.5;
            println!("{solver:?} e = {e}: peak {peak:.5} m (want {want}), deepest {deepest:e}");
            assert!(
                (peak - want).abs() < 0.02 * 0.5,
                "{solver:?} e = {e}: {peak}"
            );
        }
    }
}
