//! Fixed-timestep accumulator: turns variable frame times into a whole
//! number of fixed physics steps.
//!
//! Lives in Rust so the policy is tested natively and JS can never pass a
//! variable `dt` to the engine.

use core::num::NonZeroU32;

/// Most simulated time one frame may request, in seconds: longer frames (a
/// backgrounded tab) slow the simulation instead of spiralling into catch-up
/// steps.
pub(crate) const MAX_FRAME_TIME: f64 = 0.25;

#[derive(Clone, Debug)]
pub struct FixedStep {
    rate: NonZeroU32,
    /// `1 / rate`: positive and finite by construction (else `advance` could loop forever).
    dt: f64,
    /// Elapsed time not yet simulated. Invariant: `0 <= leftover < dt`
    /// between calls to [`advance`](Self::advance).
    leftover: f64,
    /// Step budget (`docs/workers.md`): steps owed beyond it are dropped, so a
    /// slow page runs in slow motion instead of building a backlog.
    cap: Option<NonZeroU32>,
}

impl FixedStep {
    /// Takes a rate, not a `dt`, so a bad step size can't be expressed
    /// (`docs/type-invariants.md`).
    #[must_use]
    pub fn new(rate: NonZeroU32) -> Self {
        Self {
            rate,
            dt: 1.0 / f64::from(rate.get()),
            leftover: 0.0,
            cap: None,
        }
    }

    #[must_use]
    pub const fn rate(&self) -> NonZeroU32 {
        self.rate
    }

    #[cfg(test)]
    #[must_use]
    pub(crate) const fn dt(&self) -> f64 {
        self.dt
    }

    /// Drops any owed time: it was measured in the old step size.
    pub fn set_rate(&mut self, rate: NonZeroU32) {
        *self = Self {
            cap: self.cap,
            ..Self::new(rate)
        };
    }

    /// [`set_rate`](Self::set_rate) from a bare number: `false` (nothing changed)
    /// for 0 or above `max`.
    pub fn set_rate_hz(&mut self, hz: u32, max: u32) -> bool {
        let rate = NonZeroU32::new(hz).filter(|rate| rate.get() <= max);
        rate.map(|rate| self.set_rate(rate)).is_some()
    }

    /// [`set_cap`](Self::set_cap) from a bare number: 0 is no cap; `false` (and nothing changed) above `max`.
    pub const fn set_cap_steps(&mut self, steps: u32, max: u32) -> bool {
        if steps > max {
            return false;
        }
        self.set_cap(NonZeroU32::new(steps));
        true
    }

    /// [`advance`](Self::advance), then `step` once per step owed; returns how many.
    pub fn run(&mut self, elapsed: f64, mut step: impl FnMut()) -> u32 {
        let steps = self.advance(elapsed);
        for _ in 0..steps {
            step();
        }
        steps
    }

    /// `None`: no cap. Owed time past the cap is dropped, not carried.
    pub const fn set_cap(&mut self, cap: Option<NonZeroU32>) {
        self.cap = cap;
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
            if self.cap.is_some_and(|cap| steps >= cap.get()) {
                // Over budget: drop the whole steps still owed, keep the
                // fraction (slow motion, not a backlog).
                self.leftover %= self.dt;
                break;
            }
            self.leftover -= self.dt;
            steps += 1;
        }
        steps
    }

    /// Simulated time owed but not yet stepped, in `[0, dt)`.
    #[cfg(test)]
    #[must_use]
    pub(crate) const fn leftover(&self) -> f64 {
        self.leftover
    }
}

#[cfg(test)]
mod tests;
