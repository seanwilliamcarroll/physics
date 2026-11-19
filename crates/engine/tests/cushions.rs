//! Cushions (`docs/09-billiards.md`): segments with their own restitution,
//! in both solvers.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::collision::Segment;
use engine::diagnostics::kinetic_energy;
use engine::{Integrator, Radius, Restitution, Solver, UniformGravity, Vec2, World};
use test_support::{kg, nonzero, time_step};

const DT: f64 = 1.0 / 60.0;
const SUBSTEPS: u32 = 10;
const BALL_RADIUS: f64 = 0.028_575;
const BALL_MASS: f64 = 0.17;

fn cushion_world(solver: Solver, substeps: u32, ball_restitution: f64) -> World<f64> {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(substeps));
    world.set_solver(solver);
    world.set_restitution(Restitution::new(ball_restitution).unwrap());
    world
}

fn add_cushion(world: &mut World<f64>, from: (f64, f64), to: (f64, f64), restitution: f64) {
    world.add_segment(Segment::new(
        Vec2::new(from.0, from.1),
        Vec2::new(to.0, to.1),
        Restitution::new(restitution).unwrap(),
    ));
}

fn add_ball(world: &mut World<f64>, position: (f64, f64), velocity: (f64, f64)) {
    world.add_circle(
        Vec2::new(position.0, position.1),
        Vec2::new(velocity.0, velocity.1),
        kg(BALL_MASS),
        Radius::new(BALL_RADIUS).unwrap(),
    );
}

fn run(world: &mut World<f64>, steps: usize) {
    for _ in 0..steps {
        world.step(time_step(DT));
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
        for cushion_restitution in [1.0, 0.8] {
            let mut world = cushion_world(solver, SUBSTEPS, 1.0);
            add_cushion(&mut world, (-2.0, 0.0), (2.0, 0.0), cushion_restitution);
            let angle = 30f64.to_radians();
            let (vx, vy) = (2.0 * angle.cos(), -2.0 * angle.sin());
            add_ball(&mut world, (-0.3, 0.2), (vx, vy));
            run(&mut world, 30);
            let velocity = world.particles().vel()[0];
            assert!(
                (velocity.x - vx).abs() < REFLECT_TOL,
                "{solver:?} e {cushion_restitution}: vx {}",
                velocity.x
            );
            assert!(
                (velocity.y + cushion_restitution * vy).abs() < REFLECT_TOL,
                "{solver:?} e {cushion_restitution}: vy {}",
                velocity.y
            );
        }
    }
}

fn worst_gain(world: &mut World<f64>) -> f64 {
    let start_energy = kinetic_energy(world.particles());
    let mut worst = 0.0_f64;
    for _ in 0..30 {
        world.step(time_step(DT));
        worst = worst.max(kinetic_energy(world.particles()) / start_energy - 1.0);
    }
    worst
}

/// Restitutions for (ball–ball, cushion): the table's, and extremes.
const MIXED: [(f64, f64); 5] = [(0.94, 0.8), (1.0, 0.0), (0.0, 1.0), (1.0, 0.5), (0.5, 1.0)];

#[test]
fn a_ball_squeezed_against_a_cushion_never_gains_energy() {
    // An object ball moving into a cushion, struck in the same substep,
    // puts both contacts in one round of the impact stage
    // (`docs/09-billiards.md`, "Restitution per contact"). With each
    // contact at its own e, (1, 0.5) gained 2.5% at 0° and 0.94% at 20°; with a coupled
    // group's smallest e, nothing.
    //
    // Both insertion orders: a contact's group is looked up from its first
    // body, and with the object ball added first it's first in both its
    // contacts, so they shared a group even with the union-find's `union`
    // deleted. Cue first, only `union` joins them.
    for solver in Solver::ALL {
        for angle in [0.0_f64, 20.0, 40.0] {
            for (ball_restitution, cushion_restitution) in MIXED {
                for (object_speed, cue_first) in [0.5, 1.0, 3.0]
                    .into_iter()
                    .flat_map(|speed| [(speed, false), (speed, true)])
                {
                    let mut world = cushion_world(solver, SUBSTEPS, ball_restitution);
                    add_cushion(&mut world, (-1.0, 0.0), (1.0, 0.0), cushion_restitution);
                    let object_y = BALL_RADIUS + 2e-4;
                    let angle_radians = angle.to_radians();
                    let direction = (angle_radians.sin(), -angle_radians.cos());
                    let cue_position = (
                        -direction.0 * 2.0 * BALL_RADIUS,
                        object_y - direction.1 * 2.0 * BALL_RADIUS,
                    );
                    let object = ((0.0, object_y), (0.0, -object_speed));
                    let cue = (
                        cue_position,
                        (3.0 * direction.0, 3.0 * direction.1 - object_speed),
                    );
                    for (position, velocity) in if cue_first {
                        [cue, object]
                    } else {
                        [object, cue]
                    } {
                        add_ball(&mut world, position, velocity);
                    }
                    let gain = worst_gain(&mut world);
                    assert!(
                        gain < GAIN_TOL,
                        "{solver:?} {angle}° e ({ball_restitution}, {cushion_restitution}) {object_speed} m/s, cue first {cue_first}: +{gain:e}"
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
            for (ball_restitution, cushion_restitution) in MIXED {
                let mut world = cushion_world(solver, SUBSTEPS, ball_restitution);
                add_cushion(&mut world, (-1.0, 0.0), (1.0, 0.0), cushion_restitution);
                add_ball(&mut world, (0.0, BALL_RADIUS), (0.0, 0.0));
                let angle_radians = angle.to_radians();
                let direction = (angle_radians.sin(), -angle_radians.cos());
                add_ball(
                    &mut world,
                    (-direction.0 * 0.3, BALL_RADIUS - direction.1 * 0.3),
                    (3.0 * direction.0, 3.0 * direction.1),
                );
                let gain = worst_gain(&mut world);
                assert!(
                    gain < GAIN_TOL,
                    "{solver:?} {angle}° e ({ball_restitution}, {cushion_restitution}): +{gain:e}"
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
        let mut world = cushion_world(solver, SUBSTEPS, 0.94);
        world.add_force(UniformGravity::new(Vec2::new(0.0, -1.0)));
        add_cushion(&mut world, (-1.0, 0.0), (1.0, 0.0), 0.8);
        add_ball(&mut world, (0.0, BALL_RADIUS), (0.0, 0.0));
        run(&mut world, 120);
        let (position, velocity) = (world.particles().pos()[0], world.particles().vel()[0]);
        assert!(
            (position.y - BALL_RADIUS).abs() < 1e-12,
            "{solver:?}: depth {}",
            BALL_RADIUS - position.y
        );
        assert!(
            velocity.length() < 1e-12,
            "{solver:?}: speed {}",
            velocity.length()
        );
    }
}

/// Off a cushion's end (a pocket jaw), the ball reflects about the line
/// from the end to its centre at the moment it touches. Measured within
/// 4.2e-8 m/s of the geometry (conservative advancement, three steps),
/// speed kept to 3e-14; bound ~10x.
#[test]
fn a_ball_glancing_off_a_cushions_end_reflects_about_the_corner() {
    for solver in Solver::ALL {
        let mut world = cushion_world(solver, SUBSTEPS, 0.94);
        add_cushion(&mut world, (0.0, 0.0), (1.0, 0.0), 1.0);
        add_ball(&mut world, (-0.3, 0.01), (2.0, 0.0));
        run(&mut world, 30);
        let velocity = world.particles().vel()[0];
        let normal =
            Vec2::new(-(BALL_RADIUS * BALL_RADIUS - 0.01 * 0.01).sqrt(), 0.01) / BALL_RADIUS;
        let incoming = Vec2::new(2.0, 0.0);
        let expected = incoming - normal * (2.0 * incoming.dot(normal));
        assert!(
            (velocity - expected).length() < 5e-7,
            "{solver:?}: {velocity:?}, want {expected:?}"
        );
    }
}

#[test]
fn nothing_passes_through_a_cushion_at_one_substep() {
    for solver in Solver::ALL {
        let mut world = cushion_world(solver, 1, 0.94);
        add_cushion(&mut world, (-1.0, 0.0), (1.0, 0.0), 0.8);
        add_ball(&mut world, (0.0, 0.537), (0.0, -12.0));
        run(&mut world, 30);
        let y = world.particles().pos()[0].y;
        assert!(y > BALL_RADIUS, "{solver:?}: y {y}");
    }
}

/// A cut shot: the object ball leaves along the line of centres at the
/// moment of impact. At the start of a substep the normal is up to a
/// substep's travel early, and on a glancing hit still turning, so contacts
/// are taken at the moment of impact (`solver/contacts.rs`, `at_impact`).
/// Measured: at most 1.5e-11° over 5–80° cuts, 1–12 m/s, 1–40 substeps;
/// bound ~10x.
#[test]
fn a_cut_shot_leaves_along_the_line_of_centres() {
    for solver in Solver::ALL {
        for substeps in [1u32, 10, 40] {
            for speed in [1.0, 3.0, 8.0, 12.0] {
                for cut in [5.0_f64, 15.0, 30.0, 45.0, 60.0, 80.0] {
                    let mut world = cushion_world(solver, substeps, 1.0);
                    let offset = 2.0 * BALL_RADIUS * cut.to_radians().sin();
                    add_ball(&mut world, (0.0, 0.0), (0.0, 0.0));
                    add_ball(&mut world, (-0.4123, offset), (speed, 0.0));
                    run(&mut world, 60);
                    let velocity = world.particles().vel()[0];
                    let error = velocity.y.atan2(velocity.x).to_degrees() + cut;
                    assert!(
                        error.abs() < 2e-10,
                        "{solver:?} {substeps} substeps {speed} m/s, {cut}°: off by {error}°"
                    );
                }
            }
        }
    }
}
