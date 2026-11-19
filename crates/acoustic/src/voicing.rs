//! How a string is voiced at note on: its tuning and decay, turned into
//! the loop's coefficients (`docs/12-acoustic-foundations.md`, "Tuning"
//! and "Decay"): `f64` and `libm`, so they're bit-identical everywhere.

use core::f64::consts::PI;
use math::convert::f64_to_usize;

#[derive(Copy, Clone, Debug, PartialEq)]
pub enum Decay {
    /// A fixed loss `ρ ∈ (0, 1]` per trip with the classic average
    /// (`S = ½`): Karplus & Strong's original, high notes dying fast.
    Loss(f64),
    /// The fundamental's 60 dB decay time, seconds: `ρ` shortens it, stretching
    /// (`S < ½`) lengthens it (Jaffe & Smith 1983).
    T60(f64),
}

#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Voicing {
    /// Allpass fractional delay (exactly in tune), or the integer loop.
    pub tuned: bool,
    pub decay: Decay,
    /// The inharmonicity coefficient `B` (`docs/14-piano.md`): 0 is an ideal
    /// string; above, partial `k` runs at `k F₀ √(1 + B k²)`.
    pub inharmonicity: f64,
}

#[derive(Copy, Clone, Debug, PartialEq)]
pub(crate) struct Coefficients {
    pub(crate) n: usize,
    pub(crate) rho: f64,
    /// The lowpass `(1 − S) + S z⁻¹`'s `S`.
    pub(crate) stretch: f64,
    /// The allpass coefficient `C`, if tuned.
    pub(crate) allpass: Option<f64>,
    pub(crate) dispersion: Option<crate::dispersion::Dispersion>,
    pub(crate) pitch: f64,
}

/// The smallest fractional delay asked of the allpass, samples: as `Δ → 0`
/// its pole (at `z = −C`) nears the unit circle and rings.
const MIN_FRACTION: f64 = 0.1;

const MIN_DELAY: f64 = 2.0;

/// `T₆₀` is capped where stretching's `S` would fall below this (`S = 0`
/// is only a limit).
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
    /// design: `None` without stiffness, or for refused settings.
    pub(crate) fn design(
        self,
        sample_rate: f64,
        fundamental_hz: f64,
    ) -> Option<crate::dispersion::Dispersion> {
        self.coefficients(sample_rate, fundamental_hz)?.dispersion
    }

    /// As [`coefficients`](Self::coefficients), with the cascade from
    /// `design(stretch, room)`: the lowpass's `S`, and the most delay the
    /// cascade may take. A stored design skips its cost (milliseconds).
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
            // The loop's own pitch; the lowpass's delay for `S = ½` is
            // exactly ½ at every frequency.
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
