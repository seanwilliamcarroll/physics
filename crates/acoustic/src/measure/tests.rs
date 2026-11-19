use super::{amplitude, cents, partial, pitch, t60};
use core::f64::consts::TAU;
use math::convert::{f64_to_usize, usize_to_f64};

const SAMPLE_RATE: f64 = 48_000.0;

/// A sawtooth-ish tone: a few harmonics of `fundamental_hz`, decaying by
/// `decay_db` per second.
fn tone(fundamental_hz: f64, decay_db: f64, seconds: f64) -> Vec<f64> {
    let length = f64_to_usize(SAMPLE_RATE * seconds).unwrap();
    (0..length)
        .map(|sample_number| {
            let time = usize_to_f64(sample_number) / SAMPLE_RATE;
            let gain = 10f64.powf(-decay_db * time / 20.0);
            gain * (1..=4)
                .map(|harmonic| {
                    (TAU * fundamental_hz * f64::from(harmonic) * time).sin() / f64::from(harmonic)
                })
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
    for fundamental_hz in [27.5, 441.3, 2093.0] {
        let got = pitch(
            &tone(fundamental_hz, 0.0, 1.0),
            SAMPLE_RATE,
            fundamental_hz * 1.03,
            0.06,
        )
        .unwrap();
        let error = cents(got, fundamental_hz);
        println!("{fundamental_hz} Hz: measured {got:.4} ({error:+.4} cents)");
        assert!(error.abs() < 0.5, "{fundamental_hz}: {error} cents");
    }
}

#[test]
fn t60_of_a_known_decay() {
    // 30 dB/s: T60 = 2 s.
    let got = t60(&tone(220.0, 30.0, 3.0), SAMPLE_RATE, 220.0, 16.0, 0.2, 2.5).unwrap();
    assert!((got - 2.0).abs() < 0.01, "{got}");
}

#[test]
fn amplitude_reads_a_sine_between_bins() {
    // 0.3 at 441.3 Hz plus 0.1 at its octave, 0.2 s.
    let length = f64_to_usize(0.2 * SAMPLE_RATE).unwrap();
    let signal: Vec<f64> = (0..length)
        .map(|sample_number| {
            let time = usize_to_f64(sample_number) / SAMPLE_RATE;
            0.3 * (TAU * 441.3 * time).sin() + 0.1 * (TAU * 882.6 * time).sin()
        })
        .collect();
    assert!((amplitude(&signal, SAMPLE_RATE, 441.3) - 0.3).abs() < 1e-3);
    assert!((amplitude(&signal, SAMPLE_RATE, 882.6) - 0.1).abs() < 1e-3);
}

#[test]
fn silence_has_no_pitch_or_partial() {
    // Every lag correlates 0, so no lag may win.
    let silence = vec![0.0; 48_000];
    assert_eq!(pitch(&silence, SAMPLE_RATE, 440.0, 0.06), None);
    assert_eq!(partial(&silence, SAMPLE_RATE, 440.0, 16.0), None);
    assert_eq!(t60(&silence, SAMPLE_RATE, 220.0, 16.0, 0.0, 1.0), None);
}

#[test]
fn a_lag_search_needs_two_windows_of_its_longest_lag() {
    // The window is `len − (last_lag + 1)` samples (so every lag fits), and
    // must hold two of the longest lag: `len ≥ 3 last_lag + 1`.
    const LAST_LAG: usize = 115;
    let shortest = 3 * LAST_LAG + 1;
    let signal = tone(440.0, 0.0, 1.0);
    let last_lag = usize_to_f64(LAST_LAG);
    assert!(super::peak_lag(&signal[..shortest], 100.0, last_lag).is_some());
    assert_eq!(
        super::peak_lag(&signal[..shortest - 1], 100.0, last_lag),
        None
    );
}

#[test]
fn t60_fits_only_the_window_it_is_given() {
    // 60 dB/s for the first second, then 30 dB/s: the window after 1.2 s
    // reads 2 s, the one before 0.8 s reads 1 s.
    let fast = tone(220.0, 60.0, 1.0);
    let level_at_one_second = 10f64.powf(-60.0 / 20.0);
    let slow: Vec<f64> = tone(220.0, 30.0, 2.0)
        .iter()
        .map(|sample| sample * level_at_one_second)
        .collect();
    let both: Vec<f64> = fast.iter().chain(&slow).copied().collect();
    let late = t60(&both, SAMPLE_RATE, 220.0, 16.0, 1.2, 2.8).unwrap();
    let early = t60(&both, SAMPLE_RATE, 220.0, 16.0, 0.1, 0.8).unwrap();
    assert!((late - 2.0).abs() < 0.02, "after the change: {late}");
    assert!((early - 1.0).abs() < 0.02, "before it: {early}");
}

#[test]
fn t60_skips_silent_windows_and_needs_two() {
    // 30 dB/s (T60 = 2 s) for 13 whole windows (16 periods of 220 Hz:
    // 3491 samples each), then exact silence: the silent windows (level
    // −∞ dB) are left out, so the fit still reads the decay.
    const WINDOW: usize = 3491;
    let mut signal = tone(220.0, 30.0, 1.0)[..13 * WINDOW].to_vec();
    signal.extend(core::iter::repeat_n(0.0, 13 * WINDOW));
    let got = t60(&signal, SAMPLE_RATE, 220.0, 16.0, 0.1, 1.9).unwrap();
    assert!((got - 2.0).abs() < 0.02, "{got}");
    // A window is 72.7 ms: a span holding two window centers (36 and
    // 109 ms) measures, one holding one doesn't.
    let decay = tone(220.0, 30.0, 1.0);
    assert!(t60(&decay, SAMPLE_RATE, 220.0, 16.0, 0.0, 0.12).is_some());
    assert_eq!(t60(&decay, SAMPLE_RATE, 220.0, 16.0, 0.0, 0.05), None);
}

#[test]
fn t60_needs_a_window_of_two_samples() {
    // A frequency so high its window rounds to 0 or 1 sample: None, not a
    // zero-length chunking.
    let signal = tone(220.0, 30.0, 0.5);
    assert_eq!(
        t60(&signal, SAMPLE_RATE, 40.0 * SAMPLE_RATE, 16.0, 0.0, 0.4),
        None
    );
    assert_eq!(
        t60(&signal, SAMPLE_RATE, 16.0 * SAMPLE_RATE, 16.0, 0.0, 0.4),
        None
    );
}
