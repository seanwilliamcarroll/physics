//! Tunneling (M7, `docs/09-billiards.md`, "Tunneling"): with speculative
//! contacts nothing passes through anything at any substeps; without
//! them, fast balls do at low substeps. Both solvers.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::collision::Segment;
use engine::{Integrator, Radius, Restitution, Solver, Vec2, World};
use test_support::{kg, nonzero, time_step};

const DT: f64 = 1.0 / 60.0;
const R: f64 = 0.028_575;

/// A ball at `speed` into a resting one; tunnels counted over 1 s.
fn head_on(solver: Solver, substeps: u32, speed: f64, speculative: bool, start: f64) -> u64 {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(substeps));
    w.set_solver(solver);
    w.set_restitution(Restitution::new(0.94).unwrap());
    w.set_speculative(speculative);
    w.count_tunnels(true);
    let r = Radius::new(R).unwrap();
    w.add_circle(Vec2::ZERO, Vec2::ZERO, kg(0.17), r);
    // A non-round distance, so the meeting falls anywhere in a substep.
    w.add_circle(Vec2::new(-start, 0.0), Vec2::new(speed, 0.0), kg(0.17), r);
    for _ in 0..60 {
        w.step(time_step(DT));
    }
    w.tunnels().unwrap()
}

/// Tunnels over 20 starting distances (the meeting falls anywhere in a
/// substep).
fn over_starts(solver: Solver, substeps: u32, speed: f64, speculative: bool) -> u64 {
    (0..20)
        .map(|k| {
            head_on(
                solver,
                substeps,
                speed,
                speculative,
                0.5 + 0.0123 * f64::from(k),
            )
        })
        .sum()
}

#[test]
fn with_speculative_contacts_nothing_tunnels_at_any_substeps() {
    for solver in Solver::ALL {
        for sub in [1, 2, 3, 10] {
            for speed in [3.0, 6.0, 9.0, 12.0] {
                assert_eq!(
                    over_starts(solver, sub, speed, true),
                    0,
                    "{solver:?} {sub} {speed}"
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
        for sub in [3, 4, 10] {
            assert_eq!(over_starts(solver, sub, 12.0, false), 0, "{solver:?} {sub}");
        }
        assert_eq!(over_starts(solver, 1, 3.0, false), 0, "{solver:?} slow");
    }
}

#[test]
fn without_them_a_fast_ball_goes_through_a_cushion() {
    for solver in Solver::ALL {
        for (speculative, want) in [(true, 0), (false, 1)] {
            let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(1));
            w.set_solver(solver);
            w.set_speculative(speculative);
            w.count_tunnels(true);
            w.add_segment(Segment::new(
                Vec2::new(-1.0, 0.0),
                Vec2::new(1.0, 0.0),
                Restitution::new(0.8).unwrap(),
            ));
            // 0.1 m off, at 12 m/s: 0.2 m a step.
            w.add_circle(
                Vec2::new(0.0, 0.1),
                Vec2::new(0.0, -12.0),
                kg(0.17),
                Radius::new(R).unwrap(),
            );
            for _ in 0..10 {
                w.step(time_step(DT));
            }
            assert_eq!(
                w.tunnels(),
                Some(want),
                "{solver:?} speculative {speculative}"
            );
        }
    }
}

#[test]
fn counting_is_off_until_asked_for() {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(1));
    assert_eq!(w.tunnels(), None);
    w.count_tunnels(true);
    assert_eq!(w.tunnels(), Some(0));
    assert!(w.speculative(), "on by default");
}
