//! Pockets (`docs/09-billiards.md`, "Pockets"): sensors that take balls out
//! of play. Both solvers.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::collision::Pocket;
use engine::{Integrator, ParticleId, Radius, Restitution, Solver, Vec2, World};
use test_support::{kg, nonzero, time_step};

const DT: f64 = 1.0 / 60.0;
const BALL_RADIUS: f64 = 0.028_575;

fn pocket_world(solver: Solver) -> World<f64> {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(10));
    world.set_solver(solver);
    world.set_restitution(Restitution::new(0.94).unwrap());
    world.add_pocket(Pocket::new(Vec2::new(1.0, 0.0), 0.06).unwrap());
    world
}

fn add_ball(world: &mut World<f64>, position: (f64, f64), velocity: (f64, f64)) -> ParticleId {
    world.add_circle(
        Vec2::new(position.0, position.1),
        Vec2::new(velocity.0, velocity.1),
        kg(0.17),
        Radius::new(BALL_RADIUS).unwrap(),
    )
}

#[test]
fn a_ball_rolled_in_is_potted_and_out_of_play() {
    for solver in Solver::ALL {
        let mut world = pocket_world(solver);
        let ball = add_ball(&mut world, (0.0, 0.0), (2.0, 0.0));
        let mut events = Vec::new();
        for _ in 0..60 {
            world.step(time_step(DT));
            events.extend_from_slice(world.potted());
        }
        assert_eq!(events, [(ball, 0)], "{solver:?}: potted once, in pocket 0");
        let particles = world.particles();
        assert_eq!(
            (
                particles.inverse_mass()[0],
                particles.radius()[0],
                particles.velocities()[0]
            ),
            (0.0, 0.0, Vec2::ZERO)
        );
        // It went in as its centre crossed the pocket's edge (1 − 0.06).
        assert!(
            (particles.positions()[0].x - 0.94).abs() < 2.0 / 600.0,
            "{solver:?}: at {:?}",
            particles.positions()[0]
        );
    }
}

#[test]
fn a_ball_passing_the_pocket_isnt_potted() {
    for solver in Solver::ALL {
        let mut world = pocket_world(solver);
        add_ball(&mut world, (0.0, 0.07), (2.0, 0.0));
        for _ in 0..60 {
            world.step(time_step(DT));
            assert!(world.potted().is_empty(), "{solver:?}");
        }
        assert!(world.particles().positions()[0].x > 1.5);
    }
}

#[test]
fn a_retired_ball_collides_with_nothing_and_a_reinstated_one_does() {
    for solver in Solver::ALL {
        let mut world = pocket_world(solver);
        let parked = add_ball(&mut world, (0.5, 0.0), (0.0, 0.0));
        add_ball(&mut world, (0.0, 0.3), (0.0, 0.0));
        assert!(world.retire(parked));
        let mover = add_ball(&mut world, (0.2, 0.0), (1.0, 0.0));
        for _ in 0..30 {
            world.step(time_step(DT));
        }
        let velocity = world.particles().velocities()[mover.index()];
        // XPBD derives velocity from positions: 2.3e-14 off.
        assert!(
            (velocity - Vec2::new(1.0, 0.0)).length() < 1e-12,
            "{solver:?}: {velocity:?}"
        );
        // Back in play: it stops the next ball sent at it (e = 0.94).
        assert!(world.reinstate(
            parked,
            Vec2::new(-0.5, 0.0),
            kg(0.17),
            Radius::new(BALL_RADIUS).unwrap()
        ));
        let shooter = add_ball(&mut world, (-0.8, 0.0), (1.0, 0.0));
        for _ in 0..60 {
            world.step(time_step(DT));
        }
        let particles = world.particles();
        assert!(
            particles.velocities()[shooter.index()].x < 0.05,
            "{solver:?}: stopped by it"
        );
        assert!(
            particles.velocities()[parked.index()].x > 0.9,
            "{solver:?}: and moved on"
        );
    }
}

#[test]
fn pockets_are_checked() {
    assert!(Pocket::new(Vec2::<f64>::ZERO, 0.0).is_none());
    assert!(Pocket::new(Vec2::<f64>::ZERO, f64::INFINITY).is_none());
    let pocket = Pocket::new(Vec2::<f64>::ZERO, 0.1).unwrap();
    assert!(pocket.holds(Vec2::new(0.05, 0.0)) && !pocket.holds(Vec2::new(0.1, 0.0)));
}
