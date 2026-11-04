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
    /// A silent string for pitch `f0` Hz at sample rate `fs` Hz, voiced by
    /// `voicing`. `None` for settings it can't play (see [`Voicing`]): a
    /// rate or pitch that isn't positive and finite, a pitch at or above
    /// Nyquist, a loop under 2 samples, `ρ` outside `(0, 1]`, `T₆₀ ≤ 0`.
    #[must_use]
    pub fn new(fs: f64, f0: f64, voicing: Voicing) -> Option<Self> {
        let n = voicing.coefficients(fs, f0)?.n;
        Self::with_capacity(fs, f0, voicing, n)
    }

    /// As [`new`](Self::new), with room in the delay line for `cap`
    /// samples, so [`restring`](Self::restring) to any note up to that
    /// length never allocates (the audio thread's rule: a voice is sized
    /// once for its lowest note). `None` also if the note needs more than
    /// `cap` samples.
    #[must_use]
    pub fn with_capacity(fs: f64, f0: f64, voicing: Voicing, cap: usize) -> Option<Self> {
        let c = voicing.coefficients(fs, f0)?;
        Some(Self {
            line: DelayLine::with_capacity(c.n, cap)?,
            bridge: Bridge::new(&c),
        })
    }

    /// Re-voices this string for a new note, silent, reusing its delay
    /// line. `false`, changing nothing, for settings it can't play or a
    /// note longer than the line's capacity.
    pub fn restring(&mut self, fs: f64, f0: f64, voicing: Voicing) -> bool {
        let Some(c) = voicing.coefficients(fs, f0) else {
            return false;
        };
        if !self.line.reset(c.n) {
            return false;
        }
        self.bridge.apply(&c);
        true
    }

    /// Adds a loss on top of the voicing's, so the note's fundamental falls
    /// 60 dB in about `t60` more seconds: the release at note off. The
    /// pitch doesn't change (only the taps' gain does). Ignored unless
    /// `t60 > 0`.
    pub fn damp(&mut self, t60: f64) {
        self.bridge.damp(t60);
    }

    /// Subtracts the delay line's mean (see [`DelayLine::remove_mean`]).
    pub fn remove_mean(&mut self) {
        self.line.remove_mean();
    }

    /// The delay line's length `N`, samples.
    #[must_use]
    pub fn delay(&self) -> usize {
        self.line.len()
    }

    /// The pitch this loop plays, Hz: `f0` when tuned, the nearest the
    /// integer loop can do otherwise.
    #[must_use]
    pub const fn pitch(&self) -> f64 {
        self.bridge.pitch()
    }

    /// Fills the delay line with `f(i, N)` for slot `i` (0 = oldest): the
    /// excitation. `N` is passed so a shape can be laid out across the
    /// line. Clears the filters' memory.
    pub fn pluck(&mut self, mut f: impl FnMut(usize, usize) -> S) {
        let n = self.line.len();
        self.line.fill(|i| f(i, n));
        self.bridge.clear();
    }

    /// The next output sample.
    pub fn next_sample(&mut self) -> S {
        let y = self.bridge.process(self.line.front());
        self.line.push(y);
        y
    }

    /// Fills `out` with the next samples.
    pub fn render(&mut self, out: &mut [S]) {
        for s in out {
            *s = self.next_sample();
        }
    }

    /// The delay line, oldest first: what the page draws.
    pub fn samples(&self) -> impl Iterator<Item = S> + '_ {
        self.line.iter()
    }
}

#[cfg(test)]
mod tests;
