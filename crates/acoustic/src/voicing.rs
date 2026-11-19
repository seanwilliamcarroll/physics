//! How a string is voiced at note on: its tuning and decay, turned into
//! the loop's coefficients (`docs/12-acoustic-foundations.md`, "Tuning"
//! and "Decay"). All in `f64`, once per note, with `libm` so the
//! coefficients are bit-identical on every platform.

use core::f64::consts::PI;
use math::convert::f64_to_usize;

/// How the string decays.
#[derive(Copy, Clone, Debug, PartialEq)]
pub enum Decay {
    /// A fixed loss `ρ ∈ (0, 1]` per trip round the loop, with the classic
    /// average (`S = ½`): Karplus & Strong's original, high notes dying
    /// fast.
    Loss(f64),
    /// The fundamental's 60 dB decay time, seconds: ρ shortens it where
    /// the classic loop rings too long, decay stretching (`S < ½`)
    /// lengthens it where it dies too fast (Jaffe & Smith 1983).
    T60(f64),
}

/// A string's tuning and decay.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Voicing {
    /// With the allpass fractional delay (exactly in tune at `f₀`), or the
    /// integer loop (the nearest `N`).
    pub tuned: bool,
    pub decay: Decay,
    /// The string's inharmonicity coefficient `B` (`docs/14-piano.md`): 0
    /// is A1/A2's ideal string; above, a dispersion cascade at the bridge
    /// makes partial `k` run at `k F₀ √(1 + B k²)`, the key's pitch being
    /// the lowest partial.
    pub inharmonicity: f64,
}

/// The loop's coefficients for one note.
#[derive(Copy, Clone, Debug, PartialEq)]
pub(crate) struct Coefficients {
    /// Delay line length, samples.
    pub(crate) n: usize,
    /// Loss per trip.
    pub(crate) rho: f64,
    /// The lowpass `(1 − S) + S z⁻¹`'s `S`.
    pub(crate) stretch: f64,
    /// The allpass coefficient `C`, if tuned.
    pub(crate) allpass: Option<f64>,
    /// The dispersion cascade, if the string is stiff.
    pub(crate) dispersion: Option<crate::dispersion::Dispersion>,
    /// The pitch the loop plays, Hz.
    pub(crate) pitch: f64,
}

/// The smallest fractional delay the allpass is asked for, samples: as
/// `Δ → 0`, `C → 1`, and its pole (at `z = −C`) nears the unit circle and
/// rings (Jaffe & Smith).
const MIN_FRACTION: f64 = 0.1;

/// The shortest loop, samples.
const MIN_DELAY: f64 = 2.0;

/// The longest decay asked of stretching: `S` can only reach 0 (no
/// lowpass, no loss) in the limit, so `T₆₀` is capped where `S` would
/// fall below this.
const MIN_STRETCH: f64 = 1e-3;

impl Voicing {
    /// The coefficients for pitch `fundamental_hz` at `sample_rate`, or
    /// `None` for invalid settings (non-positive or non-finite rates, `ρ`
    /// outside `(0, 1]`, `T₆₀ ≤ 0`, a loop under 2 samples).
    pub(crate) fn coefficients(
        self,
        sample_rate: f64,
        fundamental_hz: f64,
    ) -> Option<Coefficients> {
        let inharmonicity = self.inharmonicity;
        self.coefficients_designed(sample_rate, fundamental_hz, |stretch, room| {
            crate::dispersion::design(sample_rate, fundamental_hz, inharmonicity, stretch, room)
        })
    }

    /// The dispersion cascade [`coefficients`](Self::coefficients) would
    /// design for this note: what the piano designs once per key, at
    /// start (`docs/14-piano.md`). `None` without stiffness, or for
    /// settings `coefficients` refuses.
    pub(crate) fn design(
        self,
        sample_rate: f64,
        fundamental_hz: f64,
    ) -> Option<crate::dispersion::Dispersion> {
        self.coefficients(sample_rate, fundamental_hz)?.dispersion
    }

    /// As [`coefficients`](Self::coefficients), with the dispersion
    /// cascade from `design(stretch, room)`: `stretch` is the lowpass's
    /// `S`, `room` the most delay it may take at the fundamental. A stored
    /// design skips the design's cost (milliseconds) at note on.
    pub(crate) fn coefficients_designed(
        self,
        sample_rate: f64,
        fundamental_hz: f64,
        design: impl FnOnce(f64, f64) -> Option<crate::dispersion::Dispersion>,
    ) -> Option<Coefficients> {
        let valid = sample_rate > 0.0
            && fundamental_hz > 0.0
            && sample_rate.is_finite()
            && fundamental_hz.is_finite()
            && fundamental_hz < sample_rate / 2.0;
        if !valid {
            return None;
        }
        let omega = 2.0 * PI * fundamental_hz / sample_rate; // rad/sample
        let (rho, stretch) = match self.decay {
            Decay::Loss(rho) => {
                let ok = rho > 0.0 && rho <= 1.0;
                ok.then_some((rho, 0.5))?
            }
            Decay::T60(decay_time_60db) => decay_for(decay_time_60db, fundamental_hz, omega)?,
        };
        let period = sample_rate / fundamental_hz;
        // The dispersion cascade gets at most half the loop, leaving the
        // delay line and the other filters room.
        let dispersion = design(stretch, period / 2.0);
        let lowpass = phase_delay_lowpass(stretch, omega)
            + dispersion.map_or(0.0, |cascade| cascade.delay(omega));
        let (length, allpass, pitch) = if self.tuned {
            let length = libm::floor(period - lowpass - MIN_FRACTION);
            let fraction = period - lowpass - length;
            (
                length,
                Some(allpass_coefficient(fraction, omega)),
                fundamental_hz,
            )
        } else {
            let length = libm::round(period - lowpass);
            // The loop's own pitch: its phase delay at the new frequency,
            // which for `S = ½` is exactly ½ at every frequency.
            (length, None, sample_rate / (length + lowpass))
        };
        if length < MIN_DELAY || !length.is_finite() {
            return None;
        }
        let n = f64_to_usize(length)?;
        Some(Coefficients {
            n,
            rho,
            stretch,
            allpass,
            dispersion,
            pitch,
        })
    }
}

/// `(ρ, S)` for a target `T₆₀` at `fundamental_hz` (`omega` rad/sample):
/// the loop's gain per trip must be `g = 10^(−3 / (f₀ T₆₀))`. The classic
/// average's gain at `omega` is `cos(ω/2)`; below it, shorten with
/// `ρ = g / cos(ω/2)`; above it, stretch: `(1 − S) + S z⁻¹` has gain
/// `√(1 − 4 S (1 − S) sin²(ω/2))`, solved for `S < ½` with `ρ = 1`.
fn decay_for(decay_time_60db: f64, fundamental_hz: f64, omega: f64) -> Option<(f64, f64)> {
    // `> 0.0` is false for NaN too, so NaN is rejected here.
    let positive = decay_time_60db > 0.0;
    if !positive {
        return None;
    }
    let gain_per_trip = libm::exp10(-3.0 / (fundamental_hz * decay_time_60db));
    let classic = libm::cos(omega / 2.0);
    if gain_per_trip <= classic {
        return Some((gain_per_trip / classic, 0.5));
    }
    let sin_half = libm::sin(omega / 2.0);
    // S (1 − S)
    let product = (1.0 - gain_per_trip * gain_per_trip) / (4.0 * sin_half * sin_half);
    let stretch = (1.0 - (1.0 - 4.0 * product).max(0.0).sqrt()) / 2.0;
    Some((1.0, stretch.max(MIN_STRETCH)))
}

/// The phase delay of `(1 − S) + S z⁻¹` at `omega`, samples: exactly ½ at
/// every `omega` for `S = ½`, about `S` at low frequencies otherwise.
pub(crate) fn phase_delay_lowpass(stretch: f64, omega: f64) -> f64 {
    libm::atan2(
        stretch * libm::sin(omega),
        1.0 - stretch + stretch * libm::cos(omega),
    ) / omega
}

/// The allpass `(C + z⁻¹) / (1 + C z⁻¹)` with phase delay exactly
/// `fraction` samples at `omega`: `C = sin((1 − Δ) ω/2) / sin((1 + Δ) ω/2)`
/// (Jaffe & Smith's `(1 − Δ)/(1 + Δ)` as `ω → 0`).
fn allpass_coefficient(fraction: f64, omega: f64) -> f64 {
    libm::sin((1.0 - fraction) * omega / 2.0) / libm::sin((1.0 + fraction) * omega / 2.0)
}

#[cfg(test)]
mod tests;
