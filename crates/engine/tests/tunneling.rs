//! Tunneling (`docs/09-billiards.md`, "Tunneling"): with speculative
//! contacts nothing passes through anything at any substeps; without
//! them, fast balls do at low substeps. Both solvers.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::collision::Segment;
use engine::{Integrator, Radius, Restitution, Solver, Vec2, World};
use test_support::{kg, nonzero, time_step};

const DT: f64 = 1.0 / 60.0;
const BALL_RADIUS: f64 = 0.028_575;

fn head_on(
    solver: Solver,
    substeps: u32,
    speed: f64,
    speculative: bool,
    start_distance: f64,
) -> u64 {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(substeps));
    world.set_solver(solver);
    world.set_restitution(Restitution::new(0.94).unwrap());
    world.set_speculative(speculative);
    world.count_tunnels(true);
    let radius = Radius::new(BALL_RADIUS).unwrap();
    world.add_circle(Vec2::ZERO, Vec2::ZERO, kg(0.17), radius);
    world.add_circle(
        Vec2::new(-start_distance, 0.0),
        Vec2::new(speed, 0.0),
        kg(0.17),
        radius,
    );
    for _ in 0..60 {
        world.step(time_step(DT));
    }
    world.tunnels().unwrap()
}

fn over_starts(solver: Solver, substeps: u32, speed: f64, speculative: bool) -> u64 {
    (0..20)
        .map(|start| {
            head_on(
                solver,
                substeps,
                speed,
                speculative,
                0.5 + 0.0123 * f64::from(start),
            )
        })
        .sum()
}

#[test]
fn with_speculative_contacts_nothing_tunnels_at_any_substeps() {
    for solver in Solver::ALL {
        for substeps in [1, 2, 3, 10] {
            for speed in [3.0, 6.0, 9.0, 12.0] {
                assert_eq!(
                    over_starts(solver, substeps, speed, true),
                    0,
                    "{solver:?} {substeps} {speed}"
                );
            }
        }
    }
}

/// Measured, of 20 starts at 12 m/s (both solvers): 13 tunnel at one
/// substep, 2 at two, none from three (and at one substep, 2 of 20 at
/// 6 m/s, none at 3).
#[test]
fn without_them_a_fast_ball_tunnels_at_low_substeps() {
    for solver in Solver::ALL {
        assert!(over_starts(solver, 1, 12.0, false) >= 10, "{solver:?}");
        assert!(over_starts(solver, 2, 12.0, false) >= 1, "{solver:?}");
        for substeps in [3, 4, 10] {
            assert_eq!(
                over_starts(solver, substeps, 12.0, false),
                0,
                "{solver:?} {substeps}"
            );
        }
        assert_eq!(over_starts(solver, 1, 3.0, false), 0, "{solver:?} slow");
    }
}

#[test]
fn without_them_a_fast_ball_goes_through_a_cushion() {
    for solver in Solver::ALL {
        for (speculative, expected_tunnels) in [(true, 0), (false, 1)] {
            let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(1));
            world.set_solver(solver);
            world.set_speculative(speculative);
            world.count_tunnels(true);
            world.add_segment(Segment::new(
                Vec2::new(-1.0, 0.0),
                Vec2::new(1.0, 0.0),
                Restitution::new(0.8).unwrap(),
            ));
            world.add_circle(
                Vec2::new(0.0, 0.1),
                Vec2::new(0.0, -12.0),
                kg(0.17),
                Radius::new(BALL_RADIUS).unwrap(),
            );
            for _ in 0..10 {
                world.step(time_step(DT));
            }
            assert_eq!(
                world.tunnels(),
                Some(expected_tunnels),
                "{solver:?} speculative {speculative}"
            );
        }
    }
}

#[test]
fn counting_is_off_until_asked_for() {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(1));
    assert_eq!(world.tunnels(), None);
    world.count_tunnels(true);
    assert_eq!(world.tunnels(), Some(0));
    assert!(world.speculative(), "on by default");
}
