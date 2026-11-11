//! Pockets (M7, `docs/09-billiards.md`, "Pockets"): sensors that take
//! balls out of play. Both solvers.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::collision::Pocket;
use engine::{Integrator, ParticleId, Radius, Restitution, Solver, Vec2, World};
use test_support::{kg, nonzero, time_step};

const DT: f64 = 1.0 / 60.0;
const R: f64 = 0.028_575;

fn world(solver: Solver) -> World<f64> {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(10));
    w.set_solver(solver);
    w.set_restitution(Restitution::new(0.94).unwrap());
    w.add_pocket(Pocket::new(Vec2::new(1.0, 0.0), 0.06).unwrap());
    w
}

fn ball(w: &mut World<f64>, x: (f64, f64), v: (f64, f64)) -> ParticleId {
    w.add_circle(
        Vec2::new(x.0, x.1),
        Vec2::new(v.0, v.1),
        kg(0.17),
        Radius::new(R).unwrap(),
    )
}

#[test]
fn a_ball_rolled_in_is_potted_and_out_of_play() {
    for solver in Solver::ALL {
        let mut w = world(solver);
        let id = ball(&mut w, (0.0, 0.0), (2.0, 0.0));
        let mut events = Vec::new();
        for _ in 0..60 {
            w.step(time_step(DT));
            events.extend_from_slice(w.potted());
        }
        assert_eq!(events, [(id, 0)], "{solver:?}: potted once, in pocket 0");
        let p = w.particles();
        assert_eq!(
            (p.inv_mass()[0], p.radius()[0], p.vel()[0]),
            (0.0, 0.0, Vec2::ZERO)
        );
        // It went in as its centre crossed the pocket's edge (1 − 0.06).
        assert!(
            (p.pos()[0].x - 0.94).abs() < 2.0 / 600.0,
            "{solver:?}: at {:?}",
            p.pos()[0]
        );
    }
}

#[test]
fn a_ball_passing_the_pocket_isnt_potted() {
    for solver in Solver::ALL {
        let mut w = world(solver);
        // Its centre passes 0.07 from the pocket's: outside the 0.06.
        ball(&mut w, (0.0, 0.07), (2.0, 0.0));
        for _ in 0..60 {
            w.step(time_step(DT));
            assert!(w.potted().is_empty(), "{solver:?}");
        }
        assert!(w.particles().pos()[0].x > 1.5);
    }
}

#[test]
fn a_retired_ball_collides_with_nothing_and_a_reinstated_one_does() {
    for solver in Solver::ALL {
        let mut w = world(solver);
        let parked = ball(&mut w, (0.5, 0.0), (0.0, 0.0));
        ball(&mut w, (0.0, 0.3), (0.0, 0.0));
        assert!(w.retire(parked));
        // A ball through where the retired one sits: no contact.
        let mover = ball(&mut w, (0.2, 0.0), (1.0, 0.0));
        for _ in 0..30 {
            w.step(time_step(DT));
        }
        let v = w.particles().vel()[mover.index()];
        // XPBD derives velocity from positions: 2.3e-14 off.
        assert!(
            (v - Vec2::new(1.0, 0.0)).length() < 1e-12,
            "{solver:?}: {v:?}"
        );
        // Back in play: it stops the next ball sent at it (e = 0.94).
        assert!(w.reinstate(
            parked,
            Vec2::new(-0.5, 0.0),
            kg(0.17),
            Radius::new(R).unwrap()
        ));
        let shooter = ball(&mut w, (-0.8, 0.0), (1.0, 0.0));
        for _ in 0..60 {
            w.step(time_step(DT));
        }
        let p = w.particles();
        assert!(
            p.vel()[shooter.index()].x < 0.05,
            "{solver:?}: stopped by it"
        );
        assert!(p.vel()[parked.index()].x > 0.9, "{solver:?}: and moved on");
    }
}

#[test]
fn pockets_are_checked() {
    assert!(Pocket::new(Vec2::<f64>::ZERO, 0.0).is_none());
    assert!(Pocket::new(Vec2::<f64>::ZERO, f64::INFINITY).is_none());
    let p = Pocket::new(Vec2::<f64>::ZERO, 0.1).unwrap();
    assert!(p.holds(Vec2::new(0.05, 0.0)) && !p.holds(Vec2::new(0.1, 0.0)));
}
