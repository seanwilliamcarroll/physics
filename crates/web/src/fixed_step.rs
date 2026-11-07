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
pub(crate) const MAX_FRAME_TIME: f64 = 0.25;

/// Accumulates real time and pays it out in steps of `dt`.
#[derive(Clone, Debug)]
pub(crate) struct FixedStep {
    /// Steps per simulated second.
    rate: NonZeroU32,
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
    pub(crate) fn new(rate: NonZeroU32) -> Self {
        Self {
            rate,
            dt: 1.0 / f64::from(rate.get()),
            leftover: 0.0,
        }
    }

    /// Steps per simulated second.
    #[must_use]
    pub(crate) const fn rate(&self) -> NonZeroU32 {
        self.rate
    }

    /// Test-only: seconds per step, `1 / rate`.
    #[cfg(test)]
    #[must_use]
    pub(crate) const fn dt(&self) -> f64 {
        self.dt
    }

    /// Switches to `rate` steps per second and drops any owed time: the
    /// leftover was measured in the old step size, and carrying it over
    /// could fire a step immediately at the new one.
    pub(crate) fn set_rate(&mut self, rate: NonZeroU32) {
        *self = Self::new(rate);
    }

    /// Adds `elapsed` seconds of real time; returns how many steps of `dt`
    /// to simulate now. Negative or `NaN` frame times count as zero.
    pub(crate) fn advance(&mut self, elapsed: f64) -> u32 {
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
    pub(crate) const fn leftover(&self) -> f64 {
        self.leftover
    }
}

#[cfg(test)]
mod tests;
