use super::{cents, pitch, t60};
use core::f64::consts::TAU;

const FS: f64 = 48_000.0;

/// A sawtooth-ish tone: a few harmonics of `f0`, decaying by `decay_db`
/// per second.
fn tone(f0: f64, decay_db: f64, secs: f64) -> Vec<f64> {
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "test lengths"
    )]
    let n = (FS * secs) as usize;
    (0..n)
        .map(|i| {
            #[expect(clippy::cast_precision_loss, reason = "test indices")]
            let t = i as f64 / FS;
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
