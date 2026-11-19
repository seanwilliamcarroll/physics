//! [`KsString`]: the Karplus–Strong loop (`docs/12-acoustic-foundations.md`,
//! "The Karplus–Strong loop"), tuned and voiced by [`Voicing`].

use crate::bridge::Bridge;
use crate::{DelayLine, Scalar, Voicing};

/// A plucked string: a delay line of `N` samples fed back through the
/// loop filter (the crate's `Bridge`: a loss `ρ`, a two-point lowpass
/// `(1 − S) + S z⁻¹` with `S = ½` Karplus & Strong's average, and, when
/// tuned, a first-order allpass for the fractional delay):
///
/// ```text
/// y[n] = bridge(y[n − N])
/// ```
///
/// The coefficients come from the [`Voicing`] at note on.
#[derive(Clone, Debug)]
pub struct KsString<S> {
    line: DelayLine<S>,
    bridge: Bridge<S>,
}

impl<S: Scalar> KsString<S> {
    /// A silent string for pitch `fundamental_hz` at `sample_rate`, voiced
    /// by `voicing`. `None` for settings it can't play (see [`Voicing`]): a
    /// rate or pitch that isn't positive and finite, a pitch at or above
    /// Nyquist, a loop under 2 samples, `ρ` outside `(0, 1]`, `T₆₀ ≤ 0`.
    #[must_use]
    pub fn new(sample_rate: f64, fundamental_hz: f64, voicing: Voicing) -> Option<Self> {
        let loop_length = voicing.coefficients(sample_rate, fundamental_hz)?.n;
        Self::with_capacity(sample_rate, fundamental_hz, voicing, loop_length)
    }

    /// As [`new`](Self::new), with room in the delay line for `capacity`
    /// samples, so [`restring`](Self::restring) to any note up to that
    /// length never allocates (the audio thread's rule: a voice is sized
    /// once for its lowest note). `None` also if the note needs more than
    /// `capacity` samples.
    #[must_use]
    pub fn with_capacity(
        sample_rate: f64,
        fundamental_hz: f64,
        voicing: Voicing,
        capacity: usize,
    ) -> Option<Self> {
        let coefficients = voicing.coefficients(sample_rate, fundamental_hz)?;
        Some(Self {
            line: DelayLine::with_capacity(coefficients.n, capacity)?,
            bridge: Bridge::new(&coefficients),
        })
    }

    /// Re-voices this string for a new note, silent, reusing its delay
    /// line. `false`, changing nothing, for settings it can't play or a
    /// note longer than the line's capacity.
    pub fn restring(&mut self, sample_rate: f64, fundamental_hz: f64, voicing: Voicing) -> bool {
        let Some(coefficients) = voicing.coefficients(sample_rate, fundamental_hz) else {
            return false;
        };
        if !self.line.reset(coefficients.n) {
            return false;
        }
        self.bridge.apply(&coefficients);
        true
    }

    /// Adds a loss on top of the voicing's, so the note's fundamental falls
    /// 60 dB in about `decay_time_60db` more seconds: the release at note
    /// off. The pitch doesn't change (only the taps' gain does). Ignored
    /// unless `decay_time_60db > 0`. The loss comes in over `ramp` samples:
    /// see [`RELEASE_RAMP`](crate::RELEASE_RAMP).
    pub fn damp(&mut self, decay_time_60db: f64, ramp: core::num::NonZeroUsize) {
        self.bridge.damp(decay_time_60db, ramp);
    }

    pub fn remove_mean(&mut self) {
        self.line.remove_mean();
    }

    #[must_use]
    pub fn delay(&self) -> usize {
        self.line.len()
    }

    /// The pitch this loop plays, Hz: the requested one when tuned, the
    /// nearest the integer loop can do otherwise.
    #[must_use]
    pub const fn pitch(&self) -> f64 {
        self.bridge.pitch()
    }

    /// Fills the delay line with `shape(slot, N)` for each `slot` (0 =
    /// oldest): the excitation. `N` is passed so a shape can be laid out
    /// across the line. Clears the filters' memory.
    pub fn pluck(&mut self, mut shape: impl FnMut(usize, usize) -> S) {
        let loop_length = self.line.len();
        self.line.fill(|slot| shape(slot, loop_length));
        self.bridge.clear();
    }

    pub fn next_sample(&mut self) -> S {
        let output = self.bridge.process(self.line.front());
        self.line.push(output);
        output
    }

    pub fn render(&mut self, out: &mut [S]) {
        for sample in out {
            *sample = self.next_sample();
        }
    }

    pub fn samples(&self) -> impl Iterator<Item = S> + '_ {
        self.line.iter()
    }
}

#[cfg(test)]
mod tests;
