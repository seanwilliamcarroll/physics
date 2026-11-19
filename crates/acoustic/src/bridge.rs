//! [`Bridge`]: the loop filter both string models share
//! (`docs/12-acoustic-foundations.md`, "Tuning" and "Decay";
//! `docs/13-waveguide.md`, "Rails and ends").

use core::num::NonZeroUsize;

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
/// The Karplus–Strong loop runs it on the sample leaving its delay line;
/// the waveguide runs it at the bridge. One implementation, so that where
/// the two models are equivalent they do the same arithmetic in the same
/// order, and the equivalence test can be bit-exact.
#[derive(Clone, Debug)]
pub(crate) struct Bridge<S> {
    /// `ρ (1 − S)` and `ρ S`: the lowpass's taps with the loss folded in.
    tap_now: S,
    tap_previous: S,
    /// The previous input (`x[n − 1]`).
    previous_input: S,
    /// The allpass coefficient `C`, if tuned, and its state (last input
    /// and output).
    allpass: Option<S>,
    allpass_input: S,
    allpass_output: S,
    /// The dispersion cascade: each biquad's feedback coefficients
    /// `(a1, a2)` and its last two inputs and outputs, `dispersion_count`
    /// of them in use (fixed arrays: nothing allocates).
    dispersion_coefficients: [(S, S); MAX_BIQUADS],
    dispersion_count: usize,
    dispersion_inputs: [(S, S); MAX_BIQUADS],
    dispersion_outputs: [(S, S); MAX_BIQUADS],
    /// The pitch the loop plays, Hz.
    pitch: f64,
    /// A release coming in: the taps' per-sample factor, and the samples
    /// left (see [`damp`](Self::damp)).
    ramp: Option<(S, usize)>,
}

impl<S: Scalar> Bridge<S> {
    pub(crate) fn new(coefficients: &Coefficients) -> Self {
        let mut bridge = Self {
            tap_now: S::ZERO,
            tap_previous: S::ZERO,
            previous_input: S::ZERO,
            allpass: None,
            allpass_input: S::ZERO,
            allpass_output: S::ZERO,
            dispersion_coefficients: [(S::ZERO, S::ZERO); MAX_BIQUADS],
            dispersion_count: 0,
            dispersion_inputs: [(S::ZERO, S::ZERO); MAX_BIQUADS],
            dispersion_outputs: [(S::ZERO, S::ZERO); MAX_BIQUADS],
            pitch: 0.0,
            ramp: None,
        };
        bridge.apply(coefficients);
        bridge
    }

    pub(crate) fn apply(&mut self, coefficients: &Coefficients) {
        self.tap_now = S::from_f64(coefficients.rho * (1.0 - coefficients.stretch));
        self.tap_previous = S::from_f64(coefficients.rho * coefficients.stretch);
        self.allpass = coefficients.allpass.map(S::from_f64);
        self.dispersion_count = 0;
        if let Some(dispersion) = coefficients.dispersion {
            for (slot, (a1, a2)) in self
                .dispersion_coefficients
                .iter_mut()
                .zip(dispersion.coefficients())
            {
                *slot = (S::from_f64(a1), S::from_f64(a2));
                self.dispersion_count += 1;
            }
        }
        self.pitch = coefficients.pitch;
        self.ramp = None;
        self.clear();
    }

    pub(crate) fn clear(&mut self) {
        self.previous_input = S::ZERO;
        self.allpass_input = S::ZERO;
        self.allpass_output = S::ZERO;
        self.dispersion_inputs = [(S::ZERO, S::ZERO); MAX_BIQUADS];
        self.dispersion_outputs = [(S::ZERO, S::ZERO); MAX_BIQUADS];
    }

    /// The loop filter's next output for `input`.
    pub(crate) fn process(&mut self, input: S) -> S {
        if let Some((factor, samples_left)) = self.ramp.as_mut() {
            self.tap_now = self.tap_now * *factor;
            self.tap_previous = self.tap_previous * *factor;
            *samples_left -= 1;
            if *samples_left == 0 {
                self.ramp = None;
            }
        }
        let mut lowpassed = self.tap_now * input + self.tap_previous * self.previous_input;
        self.previous_input = input;
        // The dispersion cascade (none for an ideal string).
        // Each biquad: H = (a2 + a1 z⁻¹ + z⁻²) / (1 + a1 z⁻¹ + a2 z⁻²), in
        // direct form I.
        let biquads = self
            .dispersion_coefficients
            .iter()
            .zip(self.dispersion_inputs.iter_mut())
            .zip(self.dispersion_outputs.iter_mut());
        for ((&(a1, a2), inputs), outputs) in biquads.take(self.dispersion_count) {
            let out = a2 * lowpassed + a1 * inputs.0 + inputs.1 - a1 * outputs.0 - a2 * outputs.1;
            *inputs = (lowpassed, inputs.0);
            *outputs = (out, outputs.0);
            lowpassed = out;
        }
        match self.allpass {
            Some(coefficient) => {
                let output = coefficient * lowpassed + self.allpass_input
                    - coefficient * self.allpass_output;
                self.allpass_input = lowpassed;
                self.allpass_output = output;
                output
            }
            None => lowpassed,
        }
    }

    /// Adds a loss so the fundamental falls 60 dB in about
    /// `decay_time_60db` more seconds (the release); the pitch is
    /// unchanged. Ignored unless `decay_time_60db > 0`.
    ///
    /// The loss comes in over `ramp` samples, as a damper settles on a
    /// string. Applied in one sample it's a step in the reflected wave,
    /// and the piano sounds that wave's change: a click on every release.
    pub(crate) fn damp(&mut self, decay_time_60db: f64, ramp: NonZeroUsize) {
        // `decay_time_60db > 0` is false for NaN too.
        let positive = decay_time_60db > 0.0;
        if !positive {
            return;
        }
        let total_gain = libm::exp10(-3.0 / (self.pitch * decay_time_60db));
        // total_gain^(1/ramp) per sample: total_gain in all, after `ramp`
        // samples.
        let per_sample_factor =
            libm::pow(total_gain, 1.0 / math::convert::usize_to_f64(ramp.get()));
        self.ramp = Some((S::from_f64(per_sample_factor), ramp.get()));
    }

    pub(crate) const fn pitch(&self) -> f64 {
        self.pitch
    }
}
