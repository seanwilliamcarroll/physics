//! The cloth (`docs/09-billiards.md`, "The ball model"): sliding to
//! rolling to rest, against the analytic results, and the shots that
//! emerge from it. Both solvers.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::diagnostics::{kinetic_energy, rotational_energy};
use engine::table::slip;
use engine::{Integrator, ParticleId, Radius, Restitution, Solver, Table, UnitVec2, Vec2, World};
use test_support::{kg, nonzero, time_step};

const DT: f64 = 1.0 / 60.0;
const BALL_RADIUS: f64 = 0.028_575;
const BALL_MASS: f64 = 0.17;
const SLIDING_FRICTION: f64 = 0.2;
const ROLLING_FRICTION: f64 = 0.01;
const GRAVITY: f64 = 9.81;

fn table_world(solver: Solver, substeps: u32) -> World<f64> {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(substeps));
    world.set_solver(solver);
    world.set_restitution(Restitution::new(0.94).unwrap());
    world.set_table(Table::new(SLIDING_FRICTION, ROLLING_FRICTION, GRAVITY));
    world
}

fn ball(world: &mut World<f64>, x: f64, y: f64) -> ParticleId {
    world.add_circle(
        Vec2::new(x, y),
        Vec2::ZERO,
        kg(BALL_MASS),
        Radius::new(BALL_RADIUS).unwrap(),
    )
}

fn energy(world: &World<f64>) -> f64 {
    kinetic_energy(world.particles()) + rotational_energy(world.particles(), world.spin())
}

/// Bounds for a centre hit at 3 m/s, sampled each step for 25 s (sliding,
/// rolling, at rest), each about 10x the worst measured: the cloth
/// integrates velocity exactly, so the velocity matches to 1.4e-12
/// (impulse) and 6.4e-8 (XPBD, at 40 substeps: its velocity is derived
/// from positions, `(x − x₀) / h`, which magnifies rounding by 1/h); the
/// position comes from the drift, first order: 0.0250 m × (1 substep / n)
/// at n = 1, 10 and 40.
fn velocity_tolerance(solver: Solver) -> f64 {
    match solver {
        Solver::Impulse => 5e-11,
        Solver::Xpbd => 7e-7,
    }
}
const POSITION_TOLERANCE_PER_SUBSTEP: f64 = 0.03;

#[test]
fn a_centre_hit_slides_then_rolls_then_stops_as_the_model_says() {
    // Sliding at μ_s g until t_s = 2 v₀ / (7 μ_s g), rolling on at 5/7 v₀
    // from s = 12 v₀² / (49 μ_s g), slowing at μ_r g to rest.
    let launch_speed = 3.0;
    let sliding_time = 2.0 * launch_speed / (7.0 * SLIDING_FRICTION * GRAVITY);
    let (rolling_speed, sliding_distance) = (
        5.0 * launch_speed / 7.0,
        12.0 * launch_speed * launch_speed / (49.0 * SLIDING_FRICTION * GRAVITY),
    );
    for solver in Solver::ALL {
        for substeps in [1u32, 10, 40] {
            let mut world = table_world(solver, substeps);
            let cue = ball(&mut world, 0.0, 0.0);
            assert!(world.strike(cue, UnitVec2::X, launch_speed, 0.0));
            let mut previous_energy = energy(&world);
            for step in 1..=1500 {
                world.step(time_step(DT));
                let time = f64::from(step) * DT;
                let (x, vx) = (
                    world.particles().positions()[0].x,
                    world.particles().velocities()[0].x,
                );
                let (expected_vx, expected_x) = if time < sliding_time {
                    (
                        launch_speed - SLIDING_FRICTION * GRAVITY * time,
                        launch_speed * time - 0.5 * SLIDING_FRICTION * GRAVITY * time * time,
                    )
                } else {
                    let rolling_time =
                        (time - sliding_time).min(rolling_speed / (ROLLING_FRICTION * GRAVITY));
                    (
                        rolling_speed - ROLLING_FRICTION * GRAVITY * rolling_time,
                        sliding_distance + rolling_speed * rolling_time
                            - 0.5 * ROLLING_FRICTION * GRAVITY * rolling_time * rolling_time,
                    )
                };
                assert!(
                    (vx - expected_vx).abs() < velocity_tolerance(solver),
                    "{solver:?} {substeps}: at {time:.3} s, v {vx} (want {expected_vx})"
                );
                let position_tolerance = POSITION_TOLERANCE_PER_SUBSTEP / f64::from(substeps);
                assert!(
                    (x - expected_x).abs() < position_tolerance,
                    "{solver:?} {substeps}: at {time:.3} s, x {x} (want {expected_x})"
                );
                let current_energy = energy(&world);
                assert!(
                    current_energy <= previous_energy,
                    "{solver:?} {substeps}: energy rose at {time:.3} s"
                );
                previous_energy = current_energy;
            }
            assert_eq!(
                world.particles().velocities()[0],
                Vec2::ZERO,
                "at rest, exactly"
            );
        }
    }
}

/// Aimed any way, not just along x: the spin's axis turns with the aim
/// (a sign lost in the axis survived while every strike was along +x,
/// where the swapped component is 0).
#[test]
fn a_ball_struck_at_two_fifths_of_its_radius_rolls_from_the_start() {
    for solver in Solver::ALL {
        for (dx, dy) in [
            (1.0, 0.0),
            (0.0, 1.0),
            (-0.6, 0.8),
            (0.6, -0.8),
            (-1.0, 0.0),
        ] {
            let aim = Vec2::new(dx, dy).normalized().unwrap();
            let mut world = table_world(solver, 10);
            let cue = ball(&mut world, 0.0, 0.0);
            world.strike(cue, aim, 2.0, 0.4 * BALL_RADIUS);
            let slip_speed = slip(
                world.particles().velocities()[0],
                world.spin()[0],
                BALL_RADIUS,
            )
            .length();
            assert!(
                slip_speed < 1e-12,
                "{solver:?} ({dx}, {dy}): slip {slip_speed}"
            );
            world.step(time_step(DT));
            let velocity = world.particles().velocities()[0];
            let along = aim.dot(velocity);
            let sideways = (velocity - aim.get() * along).length();
            assert!(
                (along - (2.0 - ROLLING_FRICTION * GRAVITY * DT)).abs() < 1e-9,
                "{solver:?}: {along}"
            );
            assert!(
                sideways < 1e-12,
                "{solver:?} ({dx}, {dy}): sideways {sideways}"
            );
        }
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
    let launch_speed = 2.0;
    let substep = DT / 10.0;
    for solver in Solver::ALL {
        for tip_offset in [
            0.0,
            0.4 * BALL_RADIUS,
            0.5 * BALL_RADIUS,
            -0.5 * BALL_RADIUS,
        ] {
            let mut world = table_world(solver, 10);
            world.set_restitution(Restitution::ELASTIC);
            world.set_table(Table::new(SLIDING_FRICTION, 0.0, GRAVITY));
            let cue = ball(&mut world, -2.0 * BALL_RADIUS, 0.0);
            ball(&mut world, 0.0, 0.0);
            world.strike(cue, UnitVec2::X, launch_speed, tip_offset);
            for _ in 0..120 {
                world.step(time_step(DT));
            }
            let velocity = world.particles().velocities()[0];
            let expected = 5.0 / 7.0 * (tip_offset / BALL_RADIUS) * launch_speed;
            let tolerance = 5.0 / 7.0 * SLIDING_FRICTION * GRAVITY * substep;
            assert!(
                (velocity.x - expected).abs() < tolerance && velocity.y == 0.0,
                "{solver:?} b {tip_offset}: cue {velocity:?}, want {expected}"
            );
        }
    }
}

#[test]
fn a_struck_static_or_point_is_refused() {
    let mut world = table_world(Solver::Impulse, 1);
    let pin = world.add_static(Vec2::ZERO);
    let point = world.add_particle(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    assert!(!world.strike(pin.id(), UnitVec2::X, 1.0, 0.0));
    assert!(!world.strike(point, UnitVec2::X, 1.0, 0.0));
}
