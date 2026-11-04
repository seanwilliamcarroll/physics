//! [`KsString`]: the Karplus–Strong loop (`docs/12-acoustic-foundations.md`,
//! "The Karplus–Strong loop"), tuned and voiced by [`Voicing`].

mod voicing;

pub use voicing::{Decay, Voicing};

use crate::{DelayLine, Scalar};

/// A plucked string: a delay line of `N` samples fed back through a loss
/// `ρ`, a two-point lowpass `(1 − S) + S z⁻¹` (`S = ½` is Karplus &
/// Strong's average), and, when tuned, a first-order allpass for the
/// fractional delay:
///
/// ```text
/// l[n] = ρ ((1 − S) y[n − N] + S y[n − N − 1])
/// y[n] = C l[n] + l[n − 1] − C y'[n − 1]      (tuned; else y[n] = l[n])
/// ```
///
/// The coefficients come from the [`Voicing`] at note on.
#[derive(Clone, Debug)]
pub struct KsString<S> {
    line: DelayLine<S>,
    /// `y[n − N − 1]`: the previous sample out of the line.
    prev: S,
    /// `ρ (1 − S)` and `ρ S`: the lowpass's taps with the loss folded in.
    tap_now: S,
    tap_prev: S,
    /// The allpass coefficient `C`, if tuned, and its state (last input
    /// and output).
    allpass: Option<S>,
    ap_in: S,
    ap_out: S,
    /// The pitch the loop plays, Hz.
    pitch: f64,
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
        let mut s = Self {
            line: DelayLine::with_capacity(c.n, cap)?,
            prev: S::ZERO,
            tap_now: S::ZERO,
            tap_prev: S::ZERO,
            allpass: None,
            ap_in: S::ZERO,
            ap_out: S::ZERO,
            pitch: 0.0,
        };
        s.apply(c);
        Some(s)
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
        self.apply(c);
        true
    }

    /// Takes the coefficients (the line already has length `c.n`) and
    /// clears the filters' memory.
    fn apply(&mut self, c: voicing::Coefficients) {
        self.tap_now = S::from_f64(c.rho * (1.0 - c.stretch));
        self.tap_prev = S::from_f64(c.rho * c.stretch);
        self.allpass = c.allpass.map(S::from_f64);
        self.pitch = c.pitch;
        self.prev = S::ZERO;
        self.ap_in = S::ZERO;
        self.ap_out = S::ZERO;
    }

    /// Adds a loss on top of the voicing's, so the note's fundamental falls
    /// 60 dB in about `t60` more seconds: the release at note off. The
    /// pitch doesn't change (only the taps' gain does). Ignored unless
    /// `t60 > 0`.
    pub fn damp(&mut self, t60: f64) {
        // `t60 > 0` is false for NaN too.
        let positive = t60 > 0.0;
        if !positive {
            return;
        }
        let r = S::from_f64(libm::exp10(-3.0 / (self.pitch * t60)));
        self.tap_now = self.tap_now * r;
        self.tap_prev = self.tap_prev * r;
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
        self.pitch
    }

    /// Fills the delay line with `f(i, N)` for slot `i` (0 = oldest): the
    /// excitation. `N` is passed so a shape can be laid out across the
    /// line. Clears the filters' memory.
    pub fn pluck(&mut self, mut f: impl FnMut(usize, usize) -> S) {
        let n = self.line.len();
        self.line.fill(|i| f(i, n));
        self.prev = S::ZERO;
        self.ap_in = S::ZERO;
        self.ap_out = S::ZERO;
    }

    /// The next output sample.
    pub fn next_sample(&mut self) -> S {
        let out = self.line.front();
        let low = self.tap_now * out + self.tap_prev * self.prev;
        self.prev = out;
        let y = match self.allpass {
            Some(c) => {
                let y = c * low + self.ap_in - c * self.ap_out;
                self.ap_in = low;
                self.ap_out = y;
                y
            }
            None => low,
        };
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
