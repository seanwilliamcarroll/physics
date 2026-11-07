use super::{amplitude, cents, partial, pitch, t60};
use core::f64::consts::TAU;
use math::convert::{f64_to_usize, usize_to_f64};

const FS: f64 = 48_000.0;

/// A sawtooth-ish tone: a few harmonics of `f0`, decaying by `decay_db`
/// per second.
fn tone(f0: f64, decay_db: f64, secs: f64) -> Vec<f64> {
    let n = f64_to_usize(FS * secs).unwrap();
    (0..n)
        .map(|i| {
            let t = usize_to_f64(i) / FS;
            let gain = 10f64.powf(-decay_db * t / 20.0);
            gain * (1..=4)
                .map(|k| (TAU * f0 * f64::from(k) * t).sin() / f64::from(k))
                .sum::<f64>()
        })
        .collect()
}

#[test]
fn cents_are_hundredths_of_a_semitone() {
    assert!((cents(440.0 * 2f64.powf(1.0 / 12.0), 440.0) - 100.0).abs() < 1e-9);
    assert!((cents(880.0, 440.0) - 1200.0).abs() < 1e-9);
}

#[test]
fn pitch_finds_a_tone_between_whole_samples() {
    // 48000 / 441.3 = 108.77 samples: not a whole number.
    for f0 in [27.5, 441.3, 2093.0] {
        let got = pitch(&tone(f0, 0.0, 1.0), FS, f0 * 1.03, 0.06).unwrap();
        let err = cents(got, f0);
        println!("{f0} Hz: measured {got:.4} ({err:+.4} cents)");
        assert!(err.abs() < 0.5, "{f0}: {err} cents");
    }
}

#[test]
fn t60_of_a_known_decay() {
    // 30 dB/s: T60 = 2 s.
    let got = t60(&tone(220.0, 30.0, 3.0), FS, 220.0, 16.0, 0.2, 2.5).unwrap();
    assert!((got - 2.0).abs() < 0.01, "{got}");
}

#[test]
fn amplitude_reads_a_sine_between_bins() {
    // 0.3 at 441.3 Hz plus 0.1 at its octave, 0.2 s.
    let n = f64_to_usize(0.2 * FS).unwrap();
    let x: Vec<f64> = (0..n)
        .map(|i| {
            let t = usize_to_f64(i) / FS;
            0.3 * (TAU * 441.3 * t).sin() + 0.1 * (TAU * 882.6 * t).sin()
        })
        .collect();
    assert!((amplitude(&x, FS, 441.3) - 0.3).abs() < 1e-3);
    assert!((amplitude(&x, FS, 882.6) - 0.1).abs() < 1e-3);
}

// From the full cargo-mutants run: what each measurement does with
// silence, a short signal, and the window it's told to look at.

#[test]
fn silence_has_no_pitch_or_partial() {
    // pitch() returned 504 Hz for silence (every lag correlated 0, so the
    // first lag searched won), though its doc promised None.
    let silence = vec![0.0; 48_000];
    assert_eq!(pitch(&silence, FS, 440.0, 0.06), None);
    assert_eq!(partial(&silence, FS, 440.0, 16.0), None);
    assert_eq!(t60(&silence, FS, 220.0, 16.0, 0.0, 1.0), None);
}

#[test]
fn a_lag_search_needs_two_windows_of_its_longest_lag() {
    // The window is `len − (hi + 1)` samples (so every lag fits), and must
    // hold two of the longest lag: `len ≥ 3 hi + 1`.
    const HI: usize = 115;
    let shortest = 3 * HI + 1;
    let x = tone(440.0, 0.0, 1.0);
    let hi = usize_to_f64(HI);
    assert!(super::peak_lag(&x[..shortest], 100.0, hi).is_some());
    assert_eq!(super::peak_lag(&x[..shortest - 1], 100.0, hi), None);
}

#[test]
fn t60_fits_only_the_window_it_is_given() {
    // 60 dB/s for the first second, then 30 dB/s: the window after 1.2 s
    // reads 2 s, the one before 0.8 s reads 1 s.
    let fast = tone(220.0, 60.0, 1.0);
    let level_at_1s = 10f64.powf(-60.0 / 20.0);
    let slow: Vec<f64> = tone(220.0, 30.0, 2.0)
        .iter()
        .map(|x| x * level_at_1s)
        .collect();
    let both: Vec<f64> = fast.iter().chain(&slow).copied().collect();
    let late = t60(&both, FS, 220.0, 16.0, 1.2, 2.8).unwrap();
    let early = t60(&both, FS, 220.0, 16.0, 0.1, 0.8).unwrap();
    assert!((late - 2.0).abs() < 0.02, "after the change: {late}");
    assert!((early - 1.0).abs() < 0.02, "before it: {early}");
}

#[test]
fn t60_skips_silent_windows_and_needs_two() {
    // 30 dB/s (T60 = 2 s) for 13 whole windows (16 periods of 220 Hz:
    // 3491 samples each), then exact silence: the silent windows (level
    // −∞ dB) are left out, so the fit still reads the decay.
    const WINDOW: usize = 3491;
    let mut x = tone(220.0, 30.0, 1.0)[..13 * WINDOW].to_vec();
    x.extend(core::iter::repeat_n(0.0, 13 * WINDOW));
    let got = t60(&x, FS, 220.0, 16.0, 0.1, 1.9).unwrap();
    assert!((got - 2.0).abs() < 0.02, "{got}");
    // A window is 72.7 ms: a span holding two window centers (36 and
    // 109 ms) measures, one holding one doesn't.
    let decay = tone(220.0, 30.0, 1.0);
    assert!(t60(&decay, FS, 220.0, 16.0, 0.0, 0.12).is_some());
    assert_eq!(t60(&decay, FS, 220.0, 16.0, 0.0, 0.05), None);
}
