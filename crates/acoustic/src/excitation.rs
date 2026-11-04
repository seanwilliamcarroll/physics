//! [`Excitation`]: what fills a string's delay line at note on
//! (`docs/12-acoustic-foundations.md`, "Excitation").

use math::SplitMix64;

use crate::{KsString, Scalar, Waveguide};

/// The shape a pluck leaves in the loop.
#[derive(Copy, Clone, Debug, PartialEq)]
pub enum Excitation {
    /// Uniform noise in ±1 (Karplus & Strong's): bright, every partial
    /// excited.
    Noise,
    /// A triangle rising to 1 at `peak` (a fraction of the line, 0 to 1)
    /// and back to 0: the Piano Gloves hit. Rounder than noise (its
    /// partials fall as `1/k²`). Peaks outside `(0, 1)` are clamped in.
    Triangle { peak: f64 },
}

/// The triangle's peak is kept this far inside the line's ends, so both
/// sides of the triangle have a slope.
const PEAK_MARGIN: f64 = 0.01;

impl Excitation {
    /// Fills `string`'s delay line with this shape (noise drawn from
    /// `rng`), then removes the mean: the loop passes DC at full gain, so
    /// an offset would linger.
    pub fn excite<S: Scalar>(self, string: &mut KsString<S>, rng: &mut SplitMix64) {
        match self {
            Self::Noise => string.pluck(|_, _| S::from_f64(rng.range(-1.0, 1.0))),
            Self::Triangle { peak } => {
                let peak = peak.clamp(PEAK_MARGIN, 1.0 - PEAK_MARGIN);
                string.pluck(|i, n| {
                    #[expect(
                        clippy::cast_precision_loss,
                        reason = "line lengths are far below 2^53"
                    )]
                    let x = i as f64 / n as f64;
                    let y = if x < peak {
                        x / peak
                    } else {
                        (1.0 - x) / (1.0 - peak)
                    };
                    S::from_f64(y)
                });
            }
        }
        string.remove_mean();
    }

    /// Plucks a [`Waveguide`] with this shape, at rest: noise is random
    /// displacement in ±1 (each cell once), the triangle peaks at `peak`
    /// along the string from the bridge (`docs/13-waveguide.md`, "Plucking
    /// at a point"). No mean to remove: the loop's content cancels.
    pub fn excite_waveguide<S: Scalar>(self, string: &mut Waveguide<S>, rng: &mut SplitMix64) {
        match self {
            Self::Noise => string.pluck(|_| S::from_f64(rng.range(-1.0, 1.0))),
            Self::Triangle { peak } => {
                let peak = peak.clamp(PEAK_MARGIN, 1.0 - PEAK_MARGIN);
                string.pluck(|s| {
                    S::from_f64(if s < peak {
                        s / peak
                    } else {
                        (1.0 - s) / (1.0 - peak)
                    })
                });
            }
        }
    }
}

#[cfg(test)]
mod tests;
