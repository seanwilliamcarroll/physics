//! Dispersion: the delay a stiff string's loop needs so its partials run
//! sharp (`docs/14-piano.md`, "Dispersion in the loop").
//!
//! A cascade of second-order allpasses, each a pole pair `r e^{±jθ}`:
//! unlike a first-order section (whose delay always peaks at DC), a
//! biquad can put its delay where the band needs it. Designed in two
//! steps, at most a few milliseconds per key, so the piano designs each
//! key's filter once when it starts, not at note on:
//!
//! 1. **Placement** (Abel, Välimäki & Smith 2010; CCRMA's `adf.m`): one
//!    biquad per 2π of the excess phase the string needs over a pure
//!    delay, its pole where that phase reaches π, 3π, 5π, …, its radius
//!    from the spacing to its neighbors.
//! 2. **Refinement** (ours): damped Gauss–Newton on every pole's angle and
//!    radius against what we measure, the partials' round-trip delays in
//!    cents. Placement knows where poles belong and how many; refinement
//!    removes its one-step approximations (in our port, placement alone
//!    left partials 10–200 cents off; refined, under a cent).
//!
//! All `f64` with `libm` and fixed iteration counts, so the design is
//! bit-identical on every platform.

use core::f64::consts::{PI, TAU};
use math::convert::{clamped_index, usize_to_f64};

use crate::measure::CENTS_PER_OCTAVE;
use crate::voicing::phase_delay_lowpass;

/// The most biquads a cascade may have (the bridge keeps state for this
/// many, so nothing allocates).
pub(crate) const MAX_BIQUADS: usize = 16;

/// Partials designed for: the first `DESIGN_PARTIALS`, those below
/// `BAND_LIMIT` of the sample rate.
const DESIGN_PARTIALS: u32 = 30;
const BAND_LIMIT: f64 = 0.4;
/// The design band reaches this far past the last partial.
const BAND_MARGIN: f64 = 1.05;

/// `adf.m`'s smoothing factor (its documented example value).
const BETA: f64 = 0.85;

/// Placement can yield very few poles for a weakly stiff note (C2 got 2,
/// and refined to only 1.6 cents); start from at least this many.
const MIN_BIQUADS: usize = 4;

/// The poles' allowed range: radius, and how near 0 or π an angle may go.
const RADIUS_RANGE: (f64, f64) = (0.05, 0.995);
const ANGLE_MARGIN: f64 = 1e-3;

/// A designed cascade: `count` pole pairs `(radius, angle)`.
#[derive(Copy, Clone, Debug, PartialEq)]
pub(crate) struct Dispersion {
    pub(crate) poles: [(f64, f64); MAX_BIQUADS],
    pub(crate) count: usize,
    /// How many partials it was designed for (the fundamental and up).
    pub(crate) partials: u32,
}

impl Dispersion {
    /// The whole cascade's phase delay at `w` rad/sample.
    pub(crate) fn delay(&self, w: f64) -> f64 {
        self.poles
            .iter()
            .take(self.count)
            .map(|&(r, th)| biquad_delay(r, th, w))
            .sum()
    }

    /// Each biquad's feedback coefficients `(a1, a2) = (−2r cos θ, r²)`.
    pub(crate) fn coefficients(&self) -> impl Iterator<Item = (f64, f64)> + '_ {
        self.poles
            .iter()
            .take(self.count)
            .map(|&(r, th)| (-2.0 * r * libm::cos(th), r * r))
    }
}

/// The phase delay of the allpass with poles `r e^{±jθ}` at `w`, samples:
/// its phase lag is `2w + 2[arg(1 − p e^{−jw}) + arg(1 − p* e^{−jw})]`,
/// computed per pole so it never wraps (each factor stays within ±π/2).
fn biquad_delay(r: f64, th: f64, w: f64) -> f64 {
    let factor =
        |angle: f64| libm::atan2(-r * libm::sin(angle - w), 1.0 - r * libm::cos(angle - w));
    (2.0 * w + 2.0 * (factor(th) + factor(-th))) / w
}

/// A partial to design for: its frequency (rad/sample), the extra delay it
/// needs over the fundamental, and the weight turning a delay error into
/// cents.
#[derive(Copy, Clone)]
struct Target {
    w: f64,
    want: f64,
    weight: f64,
}

/// The cascade for a string whose lowest partial is `f1` Hz at `fs` Hz,
/// with inharmonicity `b` and the loop's lowpass stretch `s`, using at most
/// `max_delay` samples at `f1`. `None` without stiffness (`b ≤ 0` or NaN),
/// or with fewer than two partials in the band.
pub(crate) fn design(fs: f64, f1: f64, b: f64, s: f64, max_delay: f64) -> Option<Dispersion> {
    // `b > 0` is false for NaN too.
    let stiff = b > 0.0;
    if !stiff {
        return None;
    }
    let f0 = f1 / libm::sqrt(1.0 + b);
    let w1 = TAU * f1 / fs;
    let partial = |k: f64| k * f0 * libm::sqrt(1.0 + b * k * k);
    let targets: Vec<Target> = (2..=DESIGN_PARTIALS)
        .map(f64::from)
        .take_while(|&k| partial(k) < BAND_LIMIT * fs)
        .map(|k| {
            let fk = partial(k);
            let w = TAU * fk / fs;
            let want =
                k * fs / fk - fs / f1 - (phase_delay_lowpass(s, w) - phase_delay_lowpass(s, w1));
            Target {
                w,
                want,
                weight: CENTS_PER_OCTAVE / core::f64::consts::LN_2 * fk / (k * fs),
            }
        })
        .collect();
    let last = targets.last()?;
    let df = (last.w * fs / TAU * BAND_MARGIN).min(BAND_LIMIT * fs);
    let mut poles = place(fs, f0, b, df);
    pad(&mut poles, df / fs * TAU);
    let mut params: Vec<f64> = poles.iter().flat_map(|&(r, th)| [r, th]).collect();
    refine::refine(&mut params, w1, &targets);
    // Too much delay at f₀ for this loop (a short treble loop): keep the
    // count that fits at this design's delay per biquad, drop the highest
    // poles, refine again; repeat (rarely needed) until it fits.
    loop {
        let delay = cascade_delay(&params, w1);
        let count = params.len() / 2;
        if delay <= max_delay || count <= 1 {
            break;
        }
        let per_biquad = delay / usize_to_f64(count);
        let fits = clamped_index(libm::floor(max_delay / per_biquad), count - 1).max(1);
        params.truncate(2 * fits);
        refine::refine(&mut params, w1, &targets);
    }
    if cascade_delay(&params, w1) > max_delay {
        return None;
    }
    let mut d = Dispersion {
        poles: [(0.0, 0.0); MAX_BIQUADS],
        count: 0,
        partials: u32::try_from(targets.len() + 1).unwrap_or(DESIGN_PARTIALS),
    };
    for (slot, &[r, th]) in d.poles.iter_mut().zip(params.as_chunks::<2>().0) {
        *slot = (r, th);
        d.count += 1;
    }
    Some(d)
}

/// Abel, Välimäki & Smith's placement (`adf.m`, verbatim in `f64`): up to
/// [`MAX_BIQUADS`] pole pairs `(radius, angle)` for a band of `df` Hz.
fn place(fs: f64, f0: f64, b: f64, df: f64) -> Vec<(f64, f64)> {
    let tau0 = fs / f0;
    let stretch = |f: f64| 1.0 + b * (f / f0) * (f / f0);
    let pd0 = tau0 / libm::sqrt(stretch(df));
    let mu0 = pd0 / stretch(df);
    let phi0 = TAU * (df / fs) * pd0 - mu0 * TAU * df / fs;
    let nap = clamped_index(libm::floor(phi0 / TAU), MAX_BIQUADS);
    let theta: Vec<f64> = (0..nap)
        .map(|k| {
            let (kf, n) = (usize_to_f64(k), usize_to_f64(nap));
            let phik = PI * (2.0 * kf + 1.0);
            let eta = kf / (1.2 * n) * df;
            let pdn = tau0 / libm::sqrt(stretch(eta));
            let taun = pdn / stretch(eta);
            let phin = TAU * (eta / fs) * pdn;
            fs / TAU * (phik - phin + (TAU / fs) * eta * taun) / (taun - mu0)
        })
        .collect();
    let mut prev = theta.first().map_or(0.0, |t| -t);
    theta
        .iter()
        .map(|&t| {
            let delta = (t - prev) / 2.0;
            prev = t;
            let eta = (1.0 - BETA * libm::cos(delta * TAU / fs)) / (1.0 - BETA);
            let alpha = libm::sqrt(eta * eta - 1.0) - eta;
            (
                (-alpha).clamp(RADIUS_RANGE.0, RADIUS_RANGE.1),
                (t * TAU / fs).clamp(ANGLE_MARGIN, PI - ANGLE_MARGIN),
            )
        })
        .collect()
}

/// Brings `poles` up to [`MIN_BIQUADS`] with poles spread across the band
/// (`band` rad/sample), for the refinement to place.
fn pad(poles: &mut Vec<(f64, f64)>, band: f64) {
    let have = poles.len();
    for i in have..MIN_BIQUADS {
        let at = (usize_to_f64(i) + 0.5) / usize_to_f64(MIN_BIQUADS) * band;
        poles.push((0.5, at.clamp(ANGLE_MARGIN, PI - ANGLE_MARGIN)));
    }
}

fn cascade_delay(params: &[f64], w: f64) -> f64 {
    params
        .as_chunks::<2>()
        .0
        .iter()
        .map(|&[r, th]| biquad_delay(r, th, w))
        .sum()
}

mod refine;
#[cfg(test)]
mod tests;
