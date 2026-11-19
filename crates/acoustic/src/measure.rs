//! Offline measurements of rendered audio: pitch and decay time
//! (`docs/12-acoustic-foundations.md`, "Measuring, offline, in Rust").
//! In `f64`, whatever scalar rendered the signal.

use math::convert::{f64_to_usize, usize_to_f64};
/// Cents in an octave: a cent is a hundredth of an equal-tempered
/// semitone.
pub const CENTS_PER_OCTAVE: f64 = 1200.0;

/// `1200 · log₂(frequency / target)`: how far `frequency` is from
/// `target`, in cents.
#[must_use]
pub fn cents(frequency: f64, target: f64) -> f64 {
    CENTS_PER_OCTAVE * (frequency / target).log2()
}

/// Lags shorter than this are refined over several periods: interpolating
/// one short period's autocorrelation peak is biased by a fraction of a
/// sample (−0.85 cents at a 12.5-sample period), and measuring `m` periods
/// at once divides that error by `m`.
const MIN_LAG: f64 = 512.0;

/// The refinement searches within this fraction of one period around `m`
/// coarse periods: under half, so it can't land on `m ± 1` periods.
const REFINE_HALF_WIDTH: f64 = 0.4;

/// The fundamental of `signal` (sampled at `sample_rate`), Hz, by
/// normalized autocorrelation, in two stages: the peak within `±search` (a
/// fraction, e.g. 0.06) of `expected_hz`'s period, then a refinement at `m`
/// periods (the fewest spanning 512 samples, `MIN_LAG`), searched within
/// less than half a period of `m` coarse periods so it can't pick a
/// neighboring multiple. Each peak is refined to a fraction of a sample by
/// parabolic interpolation.
///
/// `None` if the signal is too short for a window of twice the longest
/// lag, or silent. The caller skips the attack (pass `&signal[skip..]`).
#[must_use]
pub fn pitch(signal: &[f64], sample_rate: f64, expected_hz: f64, search: f64) -> Option<f64> {
    let period = sample_rate / expected_hz;
    let coarse = peak_lag(signal, period * (1.0 - search), period * (1.0 + search))?;
    let periods = (MIN_LAG / coarse).ceil().max(1.0);
    if periods <= 1.0 {
        // One period already spans MIN_LAG: refining would repeat it.
        return Some(sample_rate / coarse);
    }
    let half_width = REFINE_HALF_WIDTH * coarse;
    let lag = peak_lag(
        signal,
        periods * coarse - half_width,
        periods * coarse + half_width,
    )?;
    Some(periods * sample_rate / lag)
}

/// The lag in `[first_lag, last_lag]` samples with the largest normalized
/// autocorrelation, refined by a parabola through it and its neighbors.
fn peak_lag(signal: &[f64], first_lag: f64, last_lag: f64) -> Option<f64> {
    let (first_lag, last_lag) = (
        f64_to_usize(first_lag.floor().max(1.0))?,
        f64_to_usize(last_lag.ceil())?,
    );
    let window = signal.len().checked_sub(last_lag + 1)?.min(4 * last_lag);
    if window < 2 * last_lag {
        return None;
    }
    let correlation = |lag: usize| -> f64 {
        let (Some(head), Some(lagged)) = (signal.get(..window), signal.get(lag..lag + window))
        else {
            return 0.0;
        };
        let (mut cross, mut head_energy, mut lagged_energy) = (0.0, 0.0, 0.0);
        for (&x, &y) in head.iter().zip(lagged) {
            cross += x * y;
            head_energy += x * x;
            lagged_energy += y * y;
        }
        let norm = (head_energy * lagged_energy).sqrt();
        if norm > 0.0 { cross / norm } else { 0.0 }
    };
    let (best, peak) = (first_lag..=last_lag)
        .map(|lag| (lag, correlation(lag)))
        .fold((0, f64::NEG_INFINITY), |best, (lag, value)| {
            if value > best.1 { (lag, value) } else { best }
        });
    // Silence correlates 0 at every lag: no peak, so no period.
    if best == 0 || peak <= 0.0 {
        return None;
    }
    let (before, at, after) = (
        correlation(best - 1),
        correlation(best),
        correlation(best + 1),
    );
    let curve = before - 2.0 * at + after;
    let offset = if curve < 0.0 {
        0.5 * (before - after) / curve
    } else {
        0.0
    };
    Some(usize_to_f64(best) + offset)
}

/// The frequency of `signal`'s component near `estimate_hz`, refined from
/// its phase: a Hann-windowed DFT at `estimate_hz` over `periods` periods,
/// in two consecutive windows; the phase advances `2π f H / sample_rate`
/// over the hop `H` (one window), so the difference from what the estimate
/// predicts gives the error. Unambiguous while the estimate is within
/// `sample_rate / (2H)` of the truth (`1 / (2 periods)` of a period: 3% at
/// 16 periods).
///
/// Measures one partial, not the waveform's repetition: when the partials
/// aren't exact multiples of the fundamental (a tuned, stretched string's
/// filters delay each frequency differently), the autocorrelation
/// ([`pitch`]) averages their drift, and this doesn't (−41 cents against
/// this one's fraction of a cent, at C8). `None` if `signal` is shorter
/// than two windows, or the component is silent.
#[must_use]
pub fn partial(signal: &[f64], sample_rate: f64, estimate_hz: f64, periods: f64) -> Option<f64> {
    let window = f64_to_usize((periods * sample_rate / estimate_hz).round())?;
    let first = dft_at(signal.get(..window)?, sample_rate, estimate_hz)?;
    let second = dft_at(signal.get(window..2 * window)?, sample_rate, estimate_hz)?;
    let hop = usize_to_f64(window);
    let tau = core::f64::consts::TAU;
    let predicted = tau * estimate_hz * hop / sample_rate;
    let advance = second.1.atan2(second.0) - first.1.atan2(first.0);
    // The measured advance, unwrapped to the turn nearest the prediction.
    let error = advance - predicted;
    let error = error - tau * (error / tau).round();
    Some(estimate_hz + error * sample_rate / (tau * hop))
}

/// The amplitude of `signal`'s component at `frequency` Hz: a
/// Hann-windowed DFT at exactly `frequency` (one bin, not the FFT's grid),
/// scaled so a sine of amplitude `a` reads `a`. The window should span
/// many periods of `frequency` and of its neighbors, so they don't leak in.
#[must_use]
pub fn amplitude(signal: &[f64], sample_rate: f64, frequency: f64) -> f64 {
    let length = usize_to_f64(signal.len());
    dft_at(signal, sample_rate, frequency).map_or(0.0, |(real, imaginary)| {
        real.hypot(imaginary) * 4.0 / length
    })
}

/// The Hann-windowed DFT of `chunk` at `frequency` Hz: `(real,
/// imaginary)`, or `None` if it's zero.
fn dft_at(chunk: &[f64], sample_rate: f64, frequency: f64) -> Option<(f64, f64)> {
    let length = usize_to_f64(chunk.len());
    let omega = core::f64::consts::TAU * frequency / sample_rate;
    let (mut real, mut imaginary) = (0.0, 0.0);
    for (index, &sample) in chunk.iter().enumerate() {
        let index = usize_to_f64(index);
        let hann = 0.5 - 0.5 * (core::f64::consts::TAU * index / length).cos();
        real += hann * sample * (omega * index).cos();
        imaginary -= hann * sample * (omega * index).sin();
    }
    (real != 0.0 || imaginary != 0.0).then_some((real, imaginary))
}

/// The 60 dB decay time of `signal`'s component at `fundamental_hz`, s.
///
/// The fundamental's amplitude per window (a Hann-windowed DFT at
/// `fundamental_hz`, one frequency bin, over `periods` periods), and a
/// least-squares line through its level in dB against time, from `start`
/// s to `end` s. Measuring one bin matters: a plucked string's higher
/// partials decay faster than its fundamental, so the total RMS falls
/// faster than the decay the loop formula predicts for the fundamental
/// (6.2 s of RMS decay against the fundamental's 7.6 s). `None` if fewer
/// than two windows fall in the span, or the level doesn't fall.
#[must_use]
pub fn t60(
    signal: &[f64],
    sample_rate: f64,
    fundamental_hz: f64,
    periods: f64,
    start: f64,
    end: f64,
) -> Option<f64> {
    let window = f64_to_usize((periods * sample_rate / fundamental_hz).round())?;
    if window < 2 {
        return None;
    }
    let window_length = usize_to_f64(window);
    let points: Vec<(f64, f64)> = signal
        .chunks_exact(window)
        .enumerate()
        .filter_map(|(window_index, chunk)| {
            let time = (usize_to_f64(window_index) + 0.5) * window_length / sample_rate;
            let (real, imaginary) =
                dft_at(chunk, sample_rate, fundamental_hz).unwrap_or((0.0, 0.0));
            let amplitude = (real * real + imaginary * imaginary).sqrt();
            (time >= start && time <= end && amplitude > 0.0)
                .then(|| (time, 20.0 * amplitude.log10()))
        })
        .collect();
    if points.len() < 2 {
        return None;
    }
    let count = usize_to_f64(points.len());
    let (time_sum, level_sum) = points
        .iter()
        .fold((0.0, 0.0), |(times, levels), &(time, level)| {
            (times + time, levels + level)
        });
    let (mean_time, mean_level) = (time_sum / count, level_sum / count);
    let (covariance, variance) =
        points
            .iter()
            .fold((0.0, 0.0), |(covariance, variance), &(time, level)| {
                (
                    covariance + (time - mean_time) * (level - mean_level),
                    variance + (time - mean_time) * (time - mean_time),
                )
            });
    let slope = covariance / variance; // dB per second
    (slope < 0.0).then(|| -60.0 / slope)
}

#[cfg(test)]
mod tests;
