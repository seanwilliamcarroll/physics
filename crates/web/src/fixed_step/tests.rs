use core::num::NonZeroU32;

use super::{FixedStep, MAX_FRAME_TIME};

const DT: f64 = 1.0 / 60.0;

fn clock_60hz() -> FixedStep {
    FixedStep::new(NonZeroU32::new(60).unwrap())
}

/// Runs frames through a fresh clock; returns (total steps, clock).
fn run(frames: impl IntoIterator<Item = f64>) -> (u32, FixedStep) {
    let mut clock = clock_60hz();
    let steps = frames.into_iter().map(|e| clock.advance(e)).sum();
    (steps, clock)
}

#[test]
fn dt_is_the_reciprocal_of_the_rate() {
    // Bit-identical to the literal 1/60 that the tests (and JS) use.
    assert_eq!(clock_60hz().dt().to_bits(), DT.to_bits());
    let slow = FixedStep::new(NonZeroU32::new(1).unwrap());
    assert_eq!(slow.dt(), 1.0);
}

#[test]
fn set_rate_changes_dt_and_drops_owed_time() {
    // A half-step of owed time at 60 Hz must not leak into the new rate:
    // the slider changes dt, not how much time has passed.
    let mut clock = clock_60hz();
    assert_eq!(clock.advance(DT / 2.0), 0);
    clock.set_rate(NonZeroU32::new(30).unwrap());
    assert_eq!(clock.dt(), 1.0 / 30.0);
    assert_eq!(clock.leftover(), 0.0);
    assert_eq!(clock.advance(1.0 / 30.0), 1);
}

#[test]
fn one_frame_at_the_physics_rate_takes_one_step() {
    let (steps, clock) = run([DT]);
    assert_eq!(steps, 1);
    assert_eq!(clock.leftover(), 0.0);
}

#[test]
fn short_frames_accumulate_into_a_step() {
    // 240 Hz display, 60 Hz physics: a step every 4th frame.
    let mut clock = clock_60hz();
    let per_frame: Vec<u32> = (0..8).map(|_| clock.advance(DT / 4.0)).collect();
    assert_eq!(per_frame.iter().sum::<u32>(), 2);
    assert!(per_frame.iter().all(|&n| n <= 1));
}

#[test]
fn irregular_frames_conserve_time() {
    // Jittery frame times that don't divide dt evenly.
    let frames = [0.016, 0.017, 0.0335, 0.008, 0.1, 0.0161, 0.05, 0.004];
    let mut clock = clock_60hz();
    let (mut steps, mut total) = (0, 0.0);
    for _ in 0..100 {
        for e in frames {
            steps += clock.advance(e);
            total += e;
            // The accumulator invariant, after every frame:
            assert!((0.0..DT).contains(&clock.leftover()));
            let accounted = f64::from(steps) * DT + clock.leftover();
            assert!(
                (accounted - total).abs() < 1e-9,
                "drift {}",
                accounted - total
            );
        }
    }
}

#[test]
fn display_rate_does_not_change_simulation_speed() {
    // 10 s at 60, 120 and 144 Hz: same number of physics steps (600),
    // up to one step that lands on a boundary and rounds either way.
    for hz in [60_u32, 120, 144] {
        let frames = (0..10 * hz).map(|_| 1.0 / f64::from(hz));
        let (steps, _) = run(frames);
        assert!(steps.abs_diff(600) <= 1, "{hz} Hz: {steps} steps");
    }
}

#[test]
fn long_frames_are_clamped() {
    // A 10 s stall (tab in background) must not trigger 600 catch-up
    // steps: at most MAX_FRAME_TIME of simulation per frame.
    let (steps, clock) = run([10.0]);
    let max_steps = 15; // MAX_FRAME_TIME / DT = 0.25 s * 60 Hz
    assert!((MAX_FRAME_TIME / DT - 15.0).abs() < 1e-9);
    assert!(steps.abs_diff(max_steps) <= 1, "{steps} steps");
    assert!(clock.leftover() < DT);
}

#[test]
fn negative_and_nan_elapsed_are_ignored() {
    // rAF timestamps can precede a performance.now() taken earlier,
    // giving a negative first frame; NaN would poison the accumulator.
    let (steps, clock) = run([-0.5, f64::NAN, -0.0]);
    assert_eq!(steps, 0);
    assert_eq!(clock.leftover(), 0.0);
    let (steps, _) = run([f64::NAN, DT]);
    assert_eq!(steps, 1);
}
