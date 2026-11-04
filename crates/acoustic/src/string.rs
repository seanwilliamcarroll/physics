//! [`KsString`]: the Karplus–Strong loop (`docs/12-acoustic-foundations.md`,
//! "The Karplus–Strong loop").

use crate::{DelayLine, Scalar};

/// A plucked string: a delay line fed back through a two-point average
/// and a loss factor ρ,
///
/// ```text
/// y[n] = ρ · ½ (y[n − N] + y[n − N − 1])
/// ```
///
/// The average delays every frequency by half a sample, so the loop is
/// `N + ½` samples and the pitch `fs / (N + ½)`. With an integer `N` that's
/// the only pitches available (section 3 adds the allpass that tunes it).
#[derive(Clone, Debug)]
pub struct KsString<S> {
    line: DelayLine<S>,
    /// `y[n − N − 1]`: the previous sample out of the line.
    prev: S,
    /// `ρ / 2`: the average's weight with the loss folded in.
    half_rho: S,
}

/// The shortest loop allowed, samples: below it the average and (section
/// 3) the allpass don't leave a usable delay line.
pub(crate) const MIN_DELAY: f64 = 2.0;

impl<S: Scalar> KsString<S> {
    /// A silent string for pitch `f0` Hz at sample rate `fs` Hz with loss
    /// `rho`: `N = round(fs / f0 − ½)`, so its actual pitch is
    /// `fs / (N + ½)`, the nearest the integer loop can do.
    ///
    /// `None` unless `fs` and `f0` are positive and finite, the loop is at
    /// least 2 samples (`MIN_DELAY`), and `0 < ρ ≤ 1`.
    #[must_use]
    pub fn new(fs: f64, f0: f64, rho: f64) -> Option<Self> {
        let valid =
            fs > 0.0 && f0 > 0.0 && fs.is_finite() && f0.is_finite() && rho > 0.0 && rho <= 1.0;
        if !valid {
            return None;
        }
        let n = (fs / f0 - 0.5).round();
        if n < MIN_DELAY || !n.is_finite() {
            return None;
        }
        #[expect(
            clippy::cast_possible_truncation,
            clippy::cast_sign_loss,
            reason = "n is a positive whole number of samples, checked above"
        )]
        let n = n as usize;
        Some(Self {
            line: DelayLine::new(n)?,
            prev: S::ZERO,
            half_rho: S::from_f64(rho / 2.0),
        })
    }

    /// The delay line's length `N`, samples.
    #[must_use]
    pub fn delay(&self) -> usize {
        self.line.len()
    }

    /// The pitch this loop actually plays, Hz: `fs / (N + ½)`.
    #[must_use]
    #[expect(
        clippy::cast_precision_loss,
        reason = "delay lengths are far below 2^53"
    )]
    pub fn pitch(&self, fs: f64) -> f64 {
        fs / (self.line.len() as f64 + 0.5)
    }

    /// Fills the delay line with `f(i, N)` for slot `i` (0 = oldest): the
    /// excitation. `N` is passed so a shape can be laid out across the line.
    pub fn pluck(&mut self, mut f: impl FnMut(usize, usize) -> S) {
        let n = self.line.len();
        self.line.fill(|i| f(i, n));
        self.prev = S::ZERO;
    }

    /// The next output sample.
    pub fn next_sample(&mut self) -> S {
        let out = self.line.front();
        let y = self.half_rho * (out + self.prev);
        self.prev = out;
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
