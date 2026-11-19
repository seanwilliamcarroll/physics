//! [`Excitation`]: what fills a string's delay line at note on
//! (`docs/12-acoustic-foundations.md`, "Excitation").

use math::SplitMix64;
use math::convert::usize_to_f64;

use crate::{KsString, Scalar, Waveguide};

/// The shape a pluck leaves in the loop.
#[derive(Copy, Clone, Debug, PartialEq)]
pub enum Excitation {
    /// Uniform noise in ±1 (Karplus & Strong's): every partial excited.
    Noise,
    /// A triangle rising to 1 at `peak` (a fraction of the line) and back
    /// to 0; partials fall as `1/k²`. Peaks outside `(0, 1)` are clamped in.
    Triangle { peak: f64 },
}

/// The triangle's peak stays this far inside the ends, so both sides slope.
const PEAK_MARGIN: f64 = 0.01;

impl Excitation {
    /// Fills the delay line (noise from `rng`), then removes the mean: the
    /// loop passes DC at full gain.
    pub(crate) fn excite<S: Scalar>(self, string: &mut KsString<S>, rng: &mut SplitMix64) {
        match self {
            Self::Noise => string.pluck(|_, _| S::from_f64(rng.range(-1.0, 1.0))),
            Self::Triangle { peak } => {
                let peak = peak.clamp(PEAK_MARGIN, 1.0 - PEAK_MARGIN);
                string.pluck(|slot, loop_length| {
                    let x = usize_to_f64(slot) / usize_to_f64(loop_length);
                    let height = if x < peak {
                        x / peak
                    } else {
                        (1.0 - x) / (1.0 - peak)
                    };
                    S::from_f64(height)
                });
            }
        }
        string.remove_mean();
    }

    /// Plucks a [`Waveguide`] at rest, `peak` measured from the bridge
    /// (`docs/13-waveguide.md`, "Plucking at a point"). No mean to remove.
    pub(crate) fn excite_waveguide<S: Scalar>(
        self,
        string: &mut Waveguide<S>,
        rng: &mut SplitMix64,
    ) {
        match self {
            Self::Noise => string.pluck(|_| S::from_f64(rng.range(-1.0, 1.0))),
            Self::Triangle { peak } => {
                let peak = peak.clamp(PEAK_MARGIN, 1.0 - PEAK_MARGIN);
                string.pluck(|position| {
                    S::from_f64(if position < peak {
                        position / peak
                    } else {
                        (1.0 - position) / (1.0 - peak)
                    })
                });
            }
        }
    }
}

#[cfg(test)]
mod tests;
