use super::{amplitude, cents, pitch, t60};
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
