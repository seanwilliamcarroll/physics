//! Dispersion: the delay a stiff string's loop needs so its partials run
//! sharp (`docs/14-piano.md`, "Dispersion in the loop").
//!
//! A cascade of allpass biquads, each a pole pair `r e^{±jθ}`, designed
//! once per key by placement (Abel, Välimäki & Smith 2010) then refinement
//! (placement alone: 10–200 cents off; refined: under a cent). Deterministic:
//! `f64` with `libm`, stops decided by the numbers alone.

use core::f64::consts::{PI, TAU};
use math::convert::{clamped_index, usize_to_f64};

use crate::measure::CENTS_PER_OCTAVE;
use crate::voicing::phase_delay_lowpass;

/// The most biquads a cascade may have (the bridge's fixed state size).
pub(crate) const MAX_BIQUADS: usize = 16;

/// Partials designed for: the first `DESIGN_PARTIALS` below `BAND_LIMIT` of
/// the sample rate.
const DESIGN_PARTIALS: u32 = 30;
const BAND_LIMIT: f64 = 0.4;
const BAND_MARGIN: f64 = 1.05;

/// `adf.m`'s smoothing factor (its documented example value).
const BETA: f64 = 0.85;

/// Placement can yield very few poles for a weakly stiff note (C2 got 2:
/// 1.6 cents refined); start from at least this many.
const MIN_BIQUADS: usize = 4;

const RADIUS_RANGE: (f64, f64) = (0.05, 0.995);
const ANGLE_MARGIN: f64 = 1e-3;

/// A designed cascade: `count` pole pairs `(radius, angle)`.
#[derive(Copy, Clone, Debug, PartialEq)]
pub(crate) struct Dispersion {
    pub(crate) poles: [(f64, f64); MAX_BIQUADS],
    pub(crate) count: usize,
    pub(crate) partials: u32,
}

impl Dispersion {
    pub(crate) fn delay(&self, omega: f64) -> f64 {
        self.poles
            .iter()
            .take(self.count)
            .map(|&(radius, angle)| biquad_delay(radius, angle, omega))
            .sum()
    }

    /// Each biquad's feedback coefficients `(a1, a2) = (−2r cos θ, r²)`.
    pub(crate) fn coefficients(&self) -> impl Iterator<Item = (f64, f64)> + '_ {
        self.poles
            .iter()
            .take(self.count)
            .map(|&(radius, angle)| (-2.0 * radius * libm::cos(angle), radius * radius))
    }
}

/// The phase delay, samples, of the allpass with poles `r e^{±jθ}`: computed
/// per pole so the phase never wraps (each factor stays within ±π/2).
fn biquad_delay(radius: f64, angle: f64, omega: f64) -> f64 {
    Angles::new(angle, omega).delay(radius, omega)
}

#[cfg(test)]
fn biquad_delay_gradient(radius: f64, angle: f64, omega: f64) -> (f64, f64) {
    Angles::new(angle, omega).gradient(radius, omega)
}

/// `sin` and `cos` of `θ − ω` and `−θ − ω`, kept by the refinement so the
/// Jacobian reuses the residuals' trig (most of the design's cost).
#[derive(Clone, Copy)]
pub(crate) struct Angles {
    plus: (f64, f64),
    minus: (f64, f64),
}

impl Angles {
    fn new(angle: f64, omega: f64) -> Self {
        Self {
            plus: libm::sincos(angle - omega),
            minus: libm::sincos(-angle - omega),
        }
    }

    fn delay(self, radius: f64, omega: f64) -> f64 {
        let factor = |(sin, cos): (f64, f64)| libm::atan2(-radius * sin, 1.0 - radius * cos);
        (2.0 * omega + 2.0 * (factor(self.plus) + factor(self.minus))) / omega
    }

    /// The delay's derivatives in radius and `θ`, in closed form from the
    /// same `sin` and `cos` (each factor is `atan2(−r sin a, 1 − r cos a)`).
    fn gradient(self, radius: f64, omega: f64) -> (f64, f64) {
        let parts = |(sin, cos): (f64, f64)| {
            let q = 1.0 - 2.0 * radius * cos + radius * radius;
            (-sin / q, (radius * radius - radius * cos) / q)
        };
        let (d_radius_plus, d_angle_plus) = parts(self.plus);
        let (d_radius_minus, d_angle_minus) = parts(self.minus);
        // The second factor's angle is −θ: its derivative in θ changes sign.
        (
            2.0 * (d_radius_plus + d_radius_minus) / omega,
            2.0 * (d_angle_plus - d_angle_minus) / omega,
        )
    }
}

/// A partial to design for: its frequency (rad/sample), the extra delay it
/// needs over the fundamental, and the weight turning delay error to cents.
#[derive(Copy, Clone)]
struct Target {
    omega: f64,
    want: f64,
    weight: f64,
}

/// The cascade using at most `max_delay` samples at the lowest partial.
/// `None` without stiffness (`inharmonicity ≤ 0` or NaN), or with fewer
/// than two partials in the band.
pub(crate) fn design(
    sample_rate: f64,
    lowest_partial_hz: f64,
    inharmonicity: f64,
    lowpass_stretch: f64,
    max_delay: f64,
) -> Option<Dispersion> {
    // `inharmonicity > 0` is false for NaN too.
    let stiff = inharmonicity > 0.0;
    if !stiff {
        return None;
    }
    let fundamental_hz = lowest_partial_hz / libm::sqrt(1.0 + inharmonicity);
    let omega_lowest = TAU * lowest_partial_hz / sample_rate;
    let partial_hz =
        |number: f64| number * fundamental_hz * libm::sqrt(1.0 + inharmonicity * number * number);
    let targets: Vec<Target> = (2..=DESIGN_PARTIALS)
        .map(f64::from)
        .take_while(|&number| partial_hz(number) < BAND_LIMIT * sample_rate)
        .map(|number| {
            let hz = partial_hz(number);
            let omega = TAU * hz / sample_rate;
            let want = number * sample_rate / hz
                - sample_rate / lowest_partial_hz
                - (phase_delay_lowpass(lowpass_stretch, omega)
                    - phase_delay_lowpass(lowpass_stretch, omega_lowest));
            Target {
                omega,
                want,
                weight: CENTS_PER_OCTAVE / core::f64::consts::LN_2 * hz / (number * sample_rate),
            }
        })
        .collect();
    let last = targets.last()?;
    let band_hz = (last.omega * sample_rate / TAU * BAND_MARGIN).min(BAND_LIMIT * sample_rate);
    let mut poles = place(sample_rate, fundamental_hz, inharmonicity, band_hz);
    pad(&mut poles, band_hz / sample_rate * TAU);
    let mut params: Vec<f64> = poles
        .iter()
        .flat_map(|&(radius, angle)| [radius, angle])
        .collect();
    refine::refine(&mut params, omega_lowest, &targets, refine::ITERATIONS);
    // Too much delay for a short loop: drop the highest poles and refit
    // until it fits (up to four rounds; short fits estimate, the last is full).
    let mut converged = true;
    loop {
        let delay = cascade_delay(&params, omega_lowest);
        let count = params.len() / 2;
        if delay <= max_delay || count <= 1 {
            if converged {
                break;
            }
            refine::refine(&mut params, omega_lowest, &targets, refine::ITERATIONS);
            converged = true;
            continue;
        }
        let per_biquad = delay / usize_to_f64(count);
        let fits = clamped_index(libm::floor(max_delay / per_biquad), count - 1).max(1);
        params.truncate(2 * fits);
        refine::refine(
            &mut params,
            omega_lowest,
            &targets,
            refine::ESTIMATE_ITERATIONS,
        );
        converged = false;
    }
    if cascade_delay(&params, omega_lowest) > max_delay {
        return None;
    }
    let mut dispersion = Dispersion {
        poles: [(0.0, 0.0); MAX_BIQUADS],
        count: 0,
        partials: u32::try_from(targets.len() + 1).unwrap_or(DESIGN_PARTIALS),
    };
    for (slot, &[radius, angle]) in dispersion.poles.iter_mut().zip(params.as_chunks::<2>().0) {
        *slot = (radius, angle);
        dispersion.count += 1;
    }
    Some(dispersion)
}

/// Abel, Välimäki & Smith's placement (CCRMA's `adf.m` in `f64`, with its
/// symbols): up to [`MAX_BIQUADS`] pole pairs `(radius, angle)` for a band
/// of `band_hz`.
fn place(
    sample_rate: f64,
    fundamental_hz: f64,
    inharmonicity: f64,
    band_hz: f64,
) -> Vec<(f64, f64)> {
    let tau0 = sample_rate / fundamental_hz;
    let stretch = |hz: f64| 1.0 + inharmonicity * (hz / fundamental_hz) * (hz / fundamental_hz);
    let pd0 = tau0 / libm::sqrt(stretch(band_hz));
    let mu0 = pd0 / stretch(band_hz);
    let phi0 = TAU * (band_hz / sample_rate) * pd0 - mu0 * TAU * band_hz / sample_rate;
    let biquad_count = clamped_index(libm::floor(phi0 / TAU), MAX_BIQUADS);
    let theta: Vec<f64> = (0..biquad_count)
        .map(|index| {
            let (index, count) = (usize_to_f64(index), usize_to_f64(biquad_count));
            let phase_k = PI * (2.0 * index + 1.0);
            let eta = index / (1.2 * count) * band_hz;
            let phase_delay_n = tau0 / libm::sqrt(stretch(eta));
            let group_delay_n = phase_delay_n / stretch(eta);
            let phase_n = TAU * (eta / sample_rate) * phase_delay_n;
            sample_rate / TAU * (phase_k - phase_n + (TAU / sample_rate) * eta * group_delay_n)
                / (group_delay_n - mu0)
        })
        .collect();
    let mut previous = theta.first().map_or(0.0, |first| -first);
    theta
        .iter()
        .map(|&current| {
            let delta = (current - previous) / 2.0;
            previous = current;
            let eta = (1.0 - BETA * libm::cos(delta * TAU / sample_rate)) / (1.0 - BETA);
            let alpha = libm::sqrt(eta * eta - 1.0) - eta;
            (
                (-alpha).clamp(RADIUS_RANGE.0, RADIUS_RANGE.1),
                (current * TAU / sample_rate).clamp(ANGLE_MARGIN, PI - ANGLE_MARGIN),
            )
        })
        .collect()
}

/// Pads `poles` to [`MIN_BIQUADS`], spread across the band (rad/sample).
fn pad(poles: &mut Vec<(f64, f64)>, band: f64) {
    let have = poles.len();
    for index in have..MIN_BIQUADS {
        let angle = (usize_to_f64(index) + 0.5) / usize_to_f64(MIN_BIQUADS) * band;
        poles.push((0.5, angle.clamp(ANGLE_MARGIN, PI - ANGLE_MARGIN)));
    }
}

fn cascade_delay(params: &[f64], omega: f64) -> f64 {
    params
        .as_chunks::<2>()
        .0
        .iter()
        .map(|&[radius, angle]| biquad_delay(radius, angle, omega))
        .sum()
}

mod refine;
#[cfg(test)]
mod tests;
