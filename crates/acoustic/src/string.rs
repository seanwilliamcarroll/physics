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
        let c = voicing.coefficients(fs, f0)?;
        Some(Self {
            line: DelayLine::new(c.n)?,
            prev: S::ZERO,
            tap_now: S::from_f64(c.rho * (1.0 - c.stretch)),
            tap_prev: S::from_f64(c.rho * c.stretch),
            allpass: c.allpass.map(S::from_f64),
            ap_in: S::ZERO,
            ap_out: S::ZERO,
            pitch: c.pitch,
        })
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
