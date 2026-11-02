//! Fixed-timestep accumulator: turns variable frame times into a whole
//! number of fixed physics steps.
//!
//! Lives in Rust, not JS, so the stepping policy is tested natively and JS
//! can never pass a variable `dt` to the engine. Displays at 60/120/144 Hz
//! all advance the simulation at the same rate.

use core::num::NonZeroU32;

/// Most simulated time one frame may request, in seconds. Longer frames
/// (a stalled or backgrounded tab) are clamped, so the simulation slows
/// down instead of running hundreds of catch-up steps that make the next
/// frame slow too (the "spiral of death").
pub const MAX_FRAME_TIME: f64 = 0.25;

/// Accumulates real time and pays it out in steps of `dt`.
#[derive(Clone, Debug)]
pub struct FixedStep {
    /// Seconds per step, `1 / rate`: positive and finite by construction
    /// (a zero or negative `dt` would make `advance` loop forever).
    dt: f64,
    /// Elapsed time not yet simulated. Invariant: `0 <= leftover < dt`
    /// between calls to [`advance`](Self::advance).
    leftover: f64,
}

impl FixedStep {
    /// A clock paying out `rate` steps per simulated second.
    ///
    /// Takes a rate, not a `dt`, so a bad step size can't be expressed:
    /// `1 / rate` for a nonzero integer is always positive and finite
    /// (`docs/type-invariants.md`).
    #[must_use]
    pub fn new(rate: NonZeroU32) -> Self {
        Self {
            dt: 1.0 / f64::from(rate.get()),
            leftover: 0.0,
        }
    }

    /// Seconds per step.
    #[must_use]
    pub const fn dt(&self) -> f64 {
        self.dt
    }

    /// Adds `elapsed` seconds of real time; returns how many steps of `dt`
    /// to simulate now. Negative or `NaN` frame times count as zero.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        // `clamp` passes NaN through, so it's handled first.
        let elapsed = if elapsed.is_nan() {
            0.0
        } else {
            elapsed.clamp(0.0, MAX_FRAME_TIME)
        };
        self.leftover += elapsed;
        let mut steps = 0;
        while self.leftover >= self.dt {
            self.leftover -= self.dt;
            steps += 1;
        }
        steps
    }

    /// Simulated time owed but not yet stepped, in `[0, dt)`. Test-only for
    /// now; render interpolation (`leftover / dt`) would make it public.
    #[cfg(test)]
    #[must_use]
    pub const fn leftover(&self) -> f64 {
        self.leftover
    }
}

#[cfg(test)]
mod tests {
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
}
