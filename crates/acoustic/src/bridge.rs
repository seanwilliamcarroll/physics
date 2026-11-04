//! [`Bridge`]: the loop filter both string models share
//! (`docs/12-acoustic-foundations.md`, "Tuning" and "Decay";
//! `docs/13-waveguide.md`, "Rails and ends").

use crate::Scalar;
use crate::dispersion::MAX_BIQUADS;
use crate::voicing::Coefficients;

/// Everything a string's loop does besides delaying: the loss `ρ` folded
/// into a two-point lowpass `(1 − S) + S z⁻¹`, then, when tuned, a
/// first-order allpass for the fractional delay,
///
/// ```text
/// l[n] = ρ ((1 − S) x[n] + S x[n − 1])
/// y[n] = C l[n] + l[n − 1] − C y[n − 1]      (tuned; else y[n] = l[n])
/// ```
///
/// A1's loop runs it on the sample leaving its delay line; A2's waveguide
/// runs it at the bridge. One implementation, so that where the two models
/// are equivalent they do the same arithmetic in the same order, and the
/// equivalence test can be bit-exact.
#[derive(Clone, Debug)]
pub(crate) struct Bridge<S> {
    /// `ρ (1 − S)` and `ρ S`: the lowpass's taps with the loss folded in.
    tap_now: S,
    tap_prev: S,
    /// The previous input (`x[n − 1]`).
    prev: S,
    /// The allpass coefficient `C`, if tuned, and its state (last input
    /// and output).
    allpass: Option<S>,
    ap_in: S,
    ap_out: S,
    /// The dispersion cascade: each biquad's feedback coefficients
    /// `(a1, a2)` and its last two inputs and outputs, `count` of them in
    /// use (fixed arrays: nothing allocates).
    disp: [(S, S); MAX_BIQUADS],
    disp_count: usize,
    disp_x: [(S, S); MAX_BIQUADS],
    disp_y: [(S, S); MAX_BIQUADS],
    /// The pitch the loop plays, Hz.
    pitch: f64,
}

impl<S: Scalar> Bridge<S> {
    /// A silent bridge with the note's coefficients.
    pub(crate) fn new(c: &Coefficients) -> Self {
        let mut b = Self {
            tap_now: S::ZERO,
            tap_prev: S::ZERO,
            prev: S::ZERO,
            allpass: None,
            ap_in: S::ZERO,
            ap_out: S::ZERO,
            disp: [(S::ZERO, S::ZERO); MAX_BIQUADS],
            disp_count: 0,
            disp_x: [(S::ZERO, S::ZERO); MAX_BIQUADS],
            disp_y: [(S::ZERO, S::ZERO); MAX_BIQUADS],
            pitch: 0.0,
        };
        b.apply(c);
        b
    }

    /// Takes a new note's coefficients, and clears the memory.
    pub(crate) fn apply(&mut self, c: &Coefficients) {
        self.tap_now = S::from_f64(c.rho * (1.0 - c.stretch));
        self.tap_prev = S::from_f64(c.rho * c.stretch);
        self.allpass = c.allpass.map(S::from_f64);
        self.disp_count = 0;
        if let Some(d) = c.dispersion {
            for (slot, (a1, a2)) in self.disp.iter_mut().zip(d.coefficients()) {
                *slot = (S::from_f64(a1), S::from_f64(a2));
                self.disp_count += 1;
            }
        }
        self.pitch = c.pitch;
        self.clear();
    }

    /// Clears the filters' memory (a new pluck).
    pub(crate) fn clear(&mut self) {
        self.prev = S::ZERO;
        self.ap_in = S::ZERO;
        self.ap_out = S::ZERO;
        self.disp_x = [(S::ZERO, S::ZERO); MAX_BIQUADS];
        self.disp_y = [(S::ZERO, S::ZERO); MAX_BIQUADS];
    }

    /// The loop filter's next output for input `x`.
    pub(crate) fn process(&mut self, x: S) -> S {
        let mut low = self.tap_now * x + self.tap_prev * self.prev;
        self.prev = x;
        // The dispersion cascade (none for an ideal string, so A1 and A2
        // are untouched).
        // Each biquad: H = (a2 + a1 z⁻¹ + z⁻²) / (1 + a1 z⁻¹ + a2 z⁻²), in
        // direct form I.
        let biquads = self
            .disp
            .iter()
            .zip(self.disp_x.iter_mut())
            .zip(self.disp_y.iter_mut());
        for ((&(a1, a2), x), y) in biquads.take(self.disp_count) {
            let out = a2 * low + a1 * x.0 + x.1 - a1 * y.0 - a2 * y.1;
            *x = (low, x.0);
            *y = (out, y.0);
            low = out;
        }
        match self.allpass {
            Some(c) => {
                let y = c * low + self.ap_in - c * self.ap_out;
                self.ap_in = low;
                self.ap_out = y;
                y
            }
            None => low,
        }
    }

    /// Adds a loss so the fundamental falls 60 dB in about `t60` more
    /// seconds (the release); the pitch is unchanged. Ignored unless
    /// `t60 > 0`.
    pub(crate) fn damp(&mut self, t60: f64) {
        // `t60 > 0` is false for NaN too.
        let positive = t60 > 0.0;
        if !positive {
            return;
        }
        let r = S::from_f64(libm::exp10(-3.0 / (self.pitch * t60)));
        self.tap_now = self.tap_now * r;
        self.tap_prev = self.tap_prev * r;
    }

    /// The pitch the loop plays, Hz.
    pub(crate) const fn pitch(&self) -> f64 {
        self.pitch
    }
}
