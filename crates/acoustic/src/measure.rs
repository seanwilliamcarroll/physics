//! Offline measurements of rendered audio: pitch and decay time
//! (`docs/12-acoustic-foundations.md`, "Measuring, offline, in Rust").
//! In `f64`, whatever scalar rendered the signal.

use math::convert::{f64_to_usize, usize_to_f64};
/// Cents in an octave: a cent is a hundredth of an equal-tempered
/// semitone.
pub const CENTS_PER_OCTAVE: f64 = 1200.0;

/// `1200 · log₂(f / target)`: how far `f` is from `target`, in cents.
#[must_use]
pub fn cents(f: f64, target: f64) -> f64 {
    CENTS_PER_OCTAVE * (f / target).log2()
}

/// Lags shorter than this are refined over several periods: interpolating
/// one short period's autocorrelation peak is biased by a fraction of a
/// sample (−0.85 cents at a 12.5-sample period), and measuring `m` periods
/// at once divides that error by `m`.
const MIN_LAG: f64 = 512.0;

/// The refinement searches within this fraction of one period around `m`
/// coarse periods: under half, so it can't land on `m ± 1` periods.
const REFINE_HALF_WIDTH: f64 = 0.4;

/// The fundamental of `signal` (sampled at `fs` Hz), Hz, by normalized
/// autocorrelation, in two stages: the peak within `±search` (a fraction,
/// e.g. 0.06) of `expected` Hz's period, then a refinement at `m` periods
/// (the fewest spanning 512 samples, `MIN_LAG`), searched within less than
/// half a period of `m` coarse periods so it can't pick a neighboring
/// multiple. Each peak is refined to a fraction of a sample by parabolic
/// interpolation.
///
/// `None` if the signal is too short for a window of twice the longest
/// lag, or silent. The caller skips the attack (pass `&signal[skip..]`).
#[must_use]
pub fn pitch(signal: &[f64], fs: f64, expected: f64, search: f64) -> Option<f64> {
    let period = fs / expected;
    let coarse = peak_lag(signal, period * (1.0 - search), period * (1.0 + search))?;
    let m = (MIN_LAG / coarse).ceil().max(1.0);
    if m <= 1.0 {
        // One period already spans MIN_LAG: refining would repeat it.
        return Some(fs / coarse);
    }
    let half = REFINE_HALF_WIDTH * coarse;
    let lag = peak_lag(signal, m * coarse - half, m * coarse + half)?;
    Some(m * fs / lag)
}

/// The lag in `[lo, hi]` samples with the largest normalized
/// autocorrelation, refined by a parabola through it and its neighbors.
fn peak_lag(signal: &[f64], lo: f64, hi: f64) -> Option<f64> {
    let (lo, hi) = (f64_to_usize(lo.floor().max(1.0))?, f64_to_usize(hi.ceil())?);
    let window = signal.len().checked_sub(hi + 1)?.min(4 * hi);
    if window < 2 * hi {
        return None;
    }
    let r = |lag: usize| -> f64 {
        let (Some(a), Some(b)) = (signal.get(..window), signal.get(lag..lag + window)) else {
            return 0.0;
        };
        let (mut ab, mut aa, mut bb) = (0.0, 0.0, 0.0);
        for (&x, &y) in a.iter().zip(b) {
            ab += x * y;
            aa += x * x;
            bb += y * y;
        }
        let norm = (aa * bb).sqrt();
        if norm > 0.0 { ab / norm } else { 0.0 }
    };
    let (best, peak) =
        (lo..=hi)
            .map(|lag| (lag, r(lag)))
            .fold(
                (0, f64::NEG_INFINITY),
                |m, (l, v)| if v > m.1 { (l, v) } else { m },
            );
    // Silence correlates 0 at every lag: no peak, so no period (the first
    // lag searched used to win).
    if best == 0 || peak <= 0.0 {
        return None;
    }
    let (rm, r0, rp) = (r(best - 1), r(best), r(best + 1));
    let curve = rm - 2.0 * r0 + rp;
    let offset = if curve < 0.0 {
        0.5 * (rm - rp) / curve
    } else {
        0.0
    };
    Some(usize_to_f64(best) + offset)
}

/// The frequency of `signal`'s component near `estimate` Hz, refined from
/// its phase: a Hann-windowed DFT at `estimate` over `periods` periods,
/// in two consecutive windows; the phase advances `2π f H / fs` over the
/// hop `H` (one window), so the difference from what `estimate` predicts
/// gives the error. Unambiguous while `estimate` is within `fs / (2H)` of
/// the truth (`1 / (2 periods)` of a period: 3% at 16 periods).
///
/// Measures one partial, not the waveform's repetition: when the partials
/// aren't exact multiples of the fundamental (a tuned, stretched string's
/// filters delay each frequency differently), the autocorrelation
/// ([`pitch`]) averages their drift, and this doesn't (A1.3: −41 cents
/// against this one's fraction of a cent, at C8). `None` if `signal` is
/// shorter than two windows, or the component is silent.
#[must_use]
pub fn partial(signal: &[f64], fs: f64, estimate: f64, periods: f64) -> Option<f64> {
    let window = f64_to_usize((periods * fs / estimate).round())?;
    let first = bin(signal.get(..window)?, fs, estimate)?;
    let second = bin(signal.get(window..2 * window)?, fs, estimate)?;
    let hop = usize_to_f64(window);
    let tau = core::f64::consts::TAU;
    let predicted = tau * estimate * hop / fs;
    let advance = second.1.atan2(second.0) - first.1.atan2(first.0);
    // The measured advance, unwrapped to the turn nearest the prediction.
    let error = advance - predicted;
    let error = error - tau * (error / tau).round();
    Some(estimate + error * fs / (tau * hop))
}

/// The amplitude of `signal`'s component at `f` Hz: a Hann-windowed DFT
/// at exactly `f` (one bin, not the FFT's grid), scaled so a sine of
/// amplitude `a` reads `a`. The window should span many periods of `f`
/// and of its neighbors, so they don't leak in.
#[must_use]
pub fn amplitude(signal: &[f64], fs: f64, f: f64) -> f64 {
    let n = usize_to_f64(signal.len());
    bin(signal, fs, f).map_or(0.0, |(re, im)| re.hypot(im) * 4.0 / n)
}

/// The Hann-windowed DFT of `chunk` at `f` Hz: `(re, im)`, or `None` if
/// it's zero.
fn bin(chunk: &[f64], fs: f64, f: f64) -> Option<(f64, f64)> {
    let w = usize_to_f64(chunk.len());
    let omega = core::f64::consts::TAU * f / fs;
    let (mut re, mut im) = (0.0, 0.0);
    for (i, &x) in chunk.iter().enumerate() {
        let i = usize_to_f64(i);
        let hann = 0.5 - 0.5 * (core::f64::consts::TAU * i / w).cos();
        re += hann * x * (omega * i).cos();
        im -= hann * x * (omega * i).sin();
    }
    (re != 0.0 || im != 0.0).then_some((re, im))
}

/// The 60 dB decay time of `signal`'s component at `f0` Hz, s.
///
/// The fundamental's amplitude per window (a Hann-windowed DFT at `f0`,
/// one frequency bin, over `periods` periods), and a least-squares line
/// through its level in dB against time, from `start` s to `end` s.
/// Measuring one bin matters: a plucked string's higher partials decay
/// faster than its fundamental, so the total RMS falls faster than the
/// decay the loop formula predicts for `f0` (A1.2: 6.2 s of RMS decay
/// against the fundamental's 7.6 s). `None` if fewer than two windows fall
/// in the span, or the level doesn't fall.
#[must_use]
pub fn t60(signal: &[f64], fs: f64, f0: f64, periods: f64, start: f64, end: f64) -> Option<f64> {
    let window = f64_to_usize((periods * fs / f0).round())?;
    if window < 2 {
        return None;
    }
    let w = usize_to_f64(window);
    let points: Vec<(f64, f64)> = signal
        .chunks_exact(window)
        .enumerate()
        .filter_map(|(k, chunk)| {
            let t = (usize_to_f64(k) + 0.5) * w / fs;
            let (re, im) = bin(chunk, fs, f0).unwrap_or((0.0, 0.0));
            let amp = (re * re + im * im).sqrt();
            (t >= start && t <= end && amp > 0.0).then(|| (t, 20.0 * amp.log10()))
        })
        .collect();
    if points.len() < 2 {
        return None;
    }
    let n = usize_to_f64(points.len());
    let (st, sl) = points
        .iter()
        .fold((0.0, 0.0), |(a, b), &(t, l)| (a + t, b + l));
    let (mt, ml) = (st / n, sl / n);
    let (num, den) = points.iter().fold((0.0, 0.0), |(a, b), &(t, l)| {
        (a + (t - mt) * (l - ml), b + (t - mt) * (t - mt))
    });
    let slope = num / den; // dB per second
    (slope < 0.0).then(|| -60.0 / slope)
}

#[cfg(test)]
mod tests;
