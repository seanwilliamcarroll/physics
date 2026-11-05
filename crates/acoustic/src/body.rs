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
pub const RESONANCE_COUNT: usize = RESONANCES.len();

/// The resonances' frequencies, Hz.
#[must_use]
pub fn resonances() -> [f64; RESONANCE_COUNT] {
    RESONANCES.map(|(f, _, _)| f)
}

/// A biquad's coefficients `(b0, a1, a2)` (`b1 = 0`, `b2 = −b0`) and its
/// last two inputs and outputs.
#[derive(Copy, Clone, Debug)]
struct Bandpass<S> {
    b0: S,
    a1: S,
    a2: S,
    gain: S,
    x: (S, S),
    y: (S, S),
}

/// The body's filter.
#[derive(Clone, Debug)]
pub struct Body<S> {
    bands: [Bandpass<S>; RESONANCE_COUNT],
}

impl<S: Scalar> Body<S> {
    /// The body at `fs` Hz; `None` if a resonance isn't below Nyquist.
    #[must_use]
    pub fn new(fs: f64) -> Option<Self> {
        let usable = fs > 0.0 && RESONANCES.iter().all(|&(f, _, _)| f < 0.5 * fs);
        if !usable {
            return None;
        }
        // Constant 0 dB peak (Bristow-Johnson's cookbook): the band's gain
        // at its center is `gain`.
        let bands = RESONANCES.map(|(f, q, gain)| {
            let w = TAU * f / fs;
            let alpha = libm::sin(w) / (2.0 * q);
            let a0 = 1.0 + alpha;
            Bandpass {
                b0: S::from_f64(alpha / a0),
                a1: S::from_f64(-2.0 * libm::cos(w) / a0),
                a2: S::from_f64((1.0 - alpha) / a0),
                gain: S::from_f64(gain),
                x: (S::ZERO, S::ZERO),
                y: (S::ZERO, S::ZERO),
            }
        });
        Some(Self { bands })
    }

    /// The next output for input `x`: the direct sound and each band.
    pub fn process(&mut self, x: S) -> S {
        let mut out = x;
        for b in &mut self.bands {
            let y = b.b0 * (x - b.x.1) - b.a1 * b.y.0 - b.a2 * b.y.1;
            b.x = (x, b.x.0);
            b.y = (y, b.y.0);
            out += b.gain * y;
        }
        out
    }

    /// Clears the filters' memory.
    pub fn clear(&mut self) {
        for b in &mut self.bands {
            b.x = (S::ZERO, S::ZERO);
            b.y = (S::ZERO, S::ZERO);
        }
    }
}

#[cfg(test)]
mod tests;
