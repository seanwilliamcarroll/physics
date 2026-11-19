//! [`Body`]: the instrument's body, as a few fixed resonances on the
//! strings' bridge force (`docs/14-piano.md`, "The body"): the direct
//! sound plus parallel bandpass biquads. Soundboard-like coloring, **our
//! choice** of frequencies, Q and gains, not a measured soundboard.

use core::f64::consts::TAU;

use crate::Scalar;

/// The resonances: (frequency Hz, Q, gain), **our choice**: a soundboard's
/// lowest modes sit near 50–100 Hz and get denser upward; a few broad
/// peaks across the range stand in for them.
const RESONANCES: [(f64, f64, f64); 5] = [
    (90.0, 4.0, 1.0),
    (200.0, 5.0, 0.8),
    (450.0, 6.0, 0.6),
    (1000.0, 6.0, 0.4),
    (2200.0, 4.0, 0.3),
];
pub(crate) const RESONANCE_COUNT: usize = RESONANCES.len();

#[cfg(test)]
#[must_use]
pub(crate) fn resonances() -> [f64; RESONANCE_COUNT] {
    RESONANCES.map(|(frequency, _, _)| frequency)
}

/// A biquad's coefficients `(b0, a1, a2)` (`b1 = 0`, `b2 = −b0`) and its
/// last two inputs and outputs.
#[derive(Copy, Clone, Debug)]
struct Bandpass<S> {
    b0: S,
    a1: S,
    a2: S,
    gain: S,
    inputs: (S, S),
    outputs: (S, S),
}

#[derive(Clone, Debug)]
pub(crate) struct Body<S> {
    bands: [Bandpass<S>; RESONANCE_COUNT],
}

impl<S: Scalar> Body<S> {
    /// The body at `sample_rate`; `None` if a resonance isn't below
    /// Nyquist.
    #[must_use]
    pub(crate) fn new(sample_rate: f64) -> Option<Self> {
        let usable =
            sample_rate > 0.0 && RESONANCES.iter().all(|&(hz, _, _)| hz < 0.5 * sample_rate);
        if !usable {
            return None;
        }
        // Constant 0 dB peak (Bristow-Johnson's cookbook): the band's gain
        // at its center is `gain`.
        let bands = RESONANCES.map(|(hz, quality, gain)| {
            let omega = TAU * hz / sample_rate;
            let alpha = libm::sin(omega) / (2.0 * quality);
            let a0 = 1.0 + alpha;
            Bandpass {
                b0: S::from_f64(alpha / a0),
                a1: S::from_f64(-2.0 * libm::cos(omega) / a0),
                a2: S::from_f64((1.0 - alpha) / a0),
                gain: S::from_f64(gain),
                inputs: (S::ZERO, S::ZERO),
                outputs: (S::ZERO, S::ZERO),
            }
        });
        Some(Self { bands })
    }

    /// The next output for `input`: the direct sound and each band.
    pub(crate) fn process(&mut self, input: S) -> S {
        let mut sum = input;
        for band in &mut self.bands {
            let output = band.b0 * (input - band.inputs.1)
                - band.a1 * band.outputs.0
                - band.a2 * band.outputs.1;
            band.inputs = (input, band.inputs.0);
            band.outputs = (output, band.outputs.0);
            sum += band.gain * output;
        }
        sum
    }
}

#[cfg(test)]
mod tests;
