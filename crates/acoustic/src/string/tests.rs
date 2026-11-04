use super::{Decay, KsString, Voicing};
use crate::Scalar;
use crate::measure::{cents, pitch, t60};

const RATES: [f64; 2] = [44_100.0, 48_000.0];

/// Samples skipped before measuring pitch (~43 ms): at least four periods,
/// and long enough that a high note's fast-dying partials are gone. With
/// four periods only, a 13.5-sample loop measured −0.30 cents (the
/// waveform still changing shape across the window); with this, every
/// note measured within 0.09 cents.
const ATTACK: usize = 2048;

/// A deterministic "noise" for tests: a fixed integer hash, zero-mean
/// enough for a pluck (section 4 brings the real excitations).
#[expect(clippy::cast_precision_loss, reason = "a 16-bit value, exact")]
fn hash_noise(i: usize) -> f64 {
    let h = (i.wrapping_mul(2_654_435_761) >> 7) & 0xffff;
    h as f64 / 32768.0 - 1.0
}

fn render<S: Scalar>(fs: f64, f0: f64, rho: f64, secs: f64) -> (KsString<S>, Vec<f64>) {
    let voicing = Voicing {
        tuned: false,
        decay: Decay::Loss(rho),
    };
    let mut s = KsString::<S>::new(fs, f0, voicing).unwrap();
    s.pluck(|i, _| S::from_f64(hash_noise(i)));
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "test lengths"
    )]
    let mut out = vec![S::ZERO; (fs * secs) as usize];
    s.render(&mut out);
    (s, out.iter().map(|x| x.to_f64()).collect())
}

/// The integer loop plays `fs / (N + ½)` exactly: measured within a
/// small fraction of a cent, for notes across the keyboard, both rates.
fn integer_loop_pitch_is_fs_over_n_plus_half<S: Scalar>() {
    for fs in RATES {
        for f0 in [55.0, 220.0, 880.0, 3520.0] {
            let (s, sig) = render::<S>(fs, f0, 1.0, 0.5);
            let want = s.pitch();
            #[expect(
                clippy::cast_possible_truncation,
                clippy::cast_sign_loss,
                reason = "test lengths"
            )]
            let skip = ((4.0 * fs / f0) as usize).max(ATTACK);
            let got = pitch(&sig[skip..], fs, f0, 0.06).unwrap();
            let err = cents(got, want);
            println!(
                "{} {fs} Hz, {f0} Hz: N = {}, loop {want:.3} Hz, measured {got:.3} ({err:+.3} cents; {:+.1} from {f0})",
                core::any::type_name::<S>(),
                s.delay(),
                cents(want, f0)
            );
            assert!(err.abs() < 0.2, "{fs} {f0}: {err} cents");
        }
    }
}

#[test]
fn integer_loop_pitch_f32() {
    integer_loop_pitch_is_fs_over_n_plus_half::<f32>();
}

#[test]
fn integer_loop_pitch_f64() {
    integer_loop_pitch_is_fs_over_n_plus_half::<f64>();
}

/// T₆₀ matches `−3 / (f₀ log₁₀ g)` with `g = ρ |cos(π f₀ / fs)|`.
fn t60_matches_the_loop_gain<S: Scalar>() {
    let fs = 48_000.0;
    for (f0, rho) in [(220.0, 0.996), (880.0, 1.0)] {
        let (s, sig) = render::<S>(fs, f0, rho, 3.0);
        let f = s.pitch();
        let g = rho * (core::f64::consts::PI * f / fs).cos();
        let want = -3.0 / (f * g.log10());
        // The fundamental's decay, fit away from the attack and the end.
        let got = t60(&sig, fs, f, 16.0, 0.05 * want, (0.6 * want).min(2.9)).unwrap();
        println!(
            "{} {f0} Hz, ρ = {rho}: T60 {got:.4} s, predicted {want:.4} s",
            core::any::type_name::<S>()
        );
        assert!((got - want).abs() < 0.03 * want, "{f0}: {got} vs {want}");
    }
}

#[test]
fn t60_f32() {
    t60_matches_the_loop_gain::<f32>();
}

#[test]
fn t60_f64() {
    t60_matches_the_loop_gain::<f64>();
}

const LOSSLESS: Voicing = Voicing {
    tuned: false,
    decay: Decay::Loss(1.0),
};

const fn loss(rho: f64) -> Voicing {
    Voicing {
        tuned: false,
        decay: Decay::Loss(rho),
    }
}

#[test]
fn bad_settings_are_refused() {
    assert!(KsString::<f64>::new(48_000.0, 0.0, LOSSLESS).is_none());
    assert!(KsString::<f64>::new(48_000.0, 440.0, loss(1.01)).is_none());
    assert!(KsString::<f64>::new(48_000.0, 440.0, loss(0.0)).is_none());
    assert!(
        KsString::<f64>::new(48_000.0, 24_000.0, LOSSLESS).is_none(),
        "at Nyquist"
    );
    let tuned = Voicing {
        tuned: true,
        decay: Decay::Loss(1.0),
    };
    assert!(
        KsString::<f64>::new(48_000.0, 20_000.0, tuned).is_none(),
        "tuned loop too short: N = ⌊2.4 − ½ − 0.1⌋ = 1"
    );
    let no_decay = Voicing {
        tuned: true,
        decay: Decay::T60(0.0),
    };
    assert!(KsString::<f64>::new(48_000.0, 440.0, no_decay).is_none());
    assert!(KsString::<f64>::new(f64::NAN, 440.0, LOSSLESS).is_none());
}
