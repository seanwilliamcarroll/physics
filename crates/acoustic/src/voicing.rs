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
    /// The coefficients for pitch `f0` Hz at sample rate `fs` Hz, or `None`
    /// for invalid settings (non-positive or non-finite rates, `ρ` outside
    /// `(0, 1]`, `T₆₀ ≤ 0`, a loop under 2 samples).
    pub(crate) fn coefficients(self, fs: f64, f0: f64) -> Option<Coefficients> {
        let b = self.inharmonicity;
        self.coefficients_designed(fs, f0, |stretch, room| {
            crate::dispersion::design(fs, f0, b, stretch, room)
        })
    }

    /// The dispersion cascade [`coefficients`](Self::coefficients) would
    /// design for this note: what the piano designs once per key, at
    /// start (`docs/14-piano.md`). `None` without stiffness, or for
    /// settings `coefficients` refuses.
    pub(crate) fn design(self, fs: f64, f0: f64) -> Option<crate::dispersion::Dispersion> {
        self.coefficients(fs, f0)?.dispersion
    }

    /// As [`coefficients`](Self::coefficients), with the dispersion
    /// cascade from `design(stretch, room)`: `stretch` is the lowpass's
    /// `S`, `room` the most delay it may take at `f₀`. A stored design
    /// skips the design's cost (milliseconds) at note on.
    pub(crate) fn coefficients_designed(
        self,
        fs: f64,
        f0: f64,
        design: impl FnOnce(f64, f64) -> Option<crate::dispersion::Dispersion>,
    ) -> Option<Coefficients> {
        let valid = fs > 0.0 && f0 > 0.0 && fs.is_finite() && f0.is_finite() && f0 < fs / 2.0;
        if !valid {
            return None;
        }
        let w = 2.0 * PI * f0 / fs; // the fundamental, rad/sample
        let (rho, stretch) = match self.decay {
            Decay::Loss(rho) => {
                let ok = rho > 0.0 && rho <= 1.0;
                ok.then_some((rho, 0.5))?
            }
            Decay::T60(t60) => decay_for(t60, f0, w)?,
        };
        let period = fs / f0;
        // The dispersion cascade gets at most half the loop, leaving the
        // delay line and the other filters room.
        let dispersion = design(stretch, period / 2.0);
        let lowpass = phase_delay_lowpass(stretch, w) + dispersion.map_or(0.0, |d| d.delay(w));
        let (n, allpass, pitch) = if self.tuned {
            let n = libm::floor(period - lowpass - MIN_FRACTION);
            let fraction = period - lowpass - n;
            (n, Some(allpass_coefficient(fraction, w)), f0)
        } else {
            let n = libm::round(period - lowpass);
            // The loop's own pitch: its phase delay at the new frequency,
            // which for `S = ½` is exactly ½ at every frequency.
            (n, None, fs / (n + lowpass))
        };
        if n < MIN_DELAY || !n.is_finite() {
            return None;
        }
        let n = f64_to_usize(n)?;
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

/// `(ρ, S)` for a target `T₆₀` at `f0` (`w` rad/sample): the loop's gain
/// per trip must be `g = 10^(−3 / (f₀ T₆₀))`. The classic average's gain
/// at `w` is `cos(w/2)`; below it, shorten with `ρ = g / cos(w/2)`; above
/// it, stretch: `(1 − S) + S z⁻¹` has gain `√(1 − 4 S (1 − S) sin²(w/2))`,
/// solved for `S < ½` with `ρ = 1`.
fn decay_for(t60: f64, f0: f64, w: f64) -> Option<(f64, f64)> {
    // `t60 > 0` is false for NaN too, so NaN is rejected here.
    let positive = t60 > 0.0;
    if !positive {
        return None;
    }
    let g = libm::exp10(-3.0 / (f0 * t60));
    let classic = libm::cos(w / 2.0);
    if g <= classic {
        return Some((g / classic, 0.5));
    }
    let sin_half = libm::sin(w / 2.0);
    let q = (1.0 - g * g) / (4.0 * sin_half * sin_half); // S (1 − S)
    let s = (1.0 - (1.0 - 4.0 * q).max(0.0).sqrt()) / 2.0;
    Some((1.0, s.max(MIN_STRETCH)))
}

/// The phase delay of `(1 − S) + S z⁻¹` at `w`, samples: exactly ½ at
/// every `w` for `S = ½`, about `S` at low frequencies otherwise.
pub(crate) fn phase_delay_lowpass(s: f64, w: f64) -> f64 {
    libm::atan2(s * libm::sin(w), 1.0 - s + s * libm::cos(w)) / w
}

/// The allpass `(C + z⁻¹) / (1 + C z⁻¹)` with phase delay exactly
/// `fraction` samples at `w`: `C = sin((1 − Δ) w/2) / sin((1 + Δ) w/2)`.
/// (Solving `τ(w) = 1 − (2/w) atan(C sin w / (1 + C cos w)) = Δ`; as
/// `w → 0` it's Jaffe & Smith's `(1 − Δ)/(1 + Δ)`.)
fn allpass_coefficient(fraction: f64, w: f64) -> f64 {
    libm::sin((1.0 - fraction) * w / 2.0) / libm::sin((1.0 + fraction) * w / 2.0)
}

#[cfg(test)]
mod tests;
