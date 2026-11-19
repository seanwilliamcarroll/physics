use crate::Scalar;
use crate::measure::{cents, decay_time_60db, pitch};
use crate::test_util::hash_noise;
use crate::{Decay, KsString, Voicing};
use math::convert::f64_to_usize;

const RATES: [f64; 2] = [44_100.0, 48_000.0];

/// Samples skipped before measuring pitch (~43 ms): four periods alone left
/// a 13.5-sample loop at −0.30 cents; with this, every note is within 0.09.
const ATTACK: usize = 2048;

fn render<S: Scalar>(
    sample_rate: f64,
    fundamental_hz: f64,
    loss: f64,
    seconds: f64,
) -> (KsString<S>, Vec<f64>) {
    let voicing = Voicing {
        tuned: false,
        decay: Decay::Loss(loss),
        inharmonicity: 0.0,
    };
    let mut string = KsString::<S>::new(sample_rate, fundamental_hz, voicing).unwrap();
    string.pluck(|slot, _| S::from_f64(hash_noise(slot)));
    let mut out = vec![S::ZERO; f64_to_usize(sample_rate * seconds).unwrap()];
    string.render(&mut out);
    (string, out.iter().map(|sample| sample.to_f64()).collect())
}

/// The integer loop plays `sample_rate / (N + ½)`: within 0.2 cents.
fn integer_loop_pitch_is_sample_rate_over_n_plus_half<S: Scalar>() {
    for sample_rate in RATES {
        for fundamental_hz in [55.0, 220.0, 880.0, 3520.0] {
            let (string, signal) = render::<S>(sample_rate, fundamental_hz, 1.0, 0.5);
            let want = string.pitch();
            let skip = f64_to_usize(4.0 * sample_rate / fundamental_hz)
                .unwrap()
                .max(ATTACK);
            let got = pitch(&signal[skip..], sample_rate, fundamental_hz, 0.06).unwrap();
            let error = cents(got, want);
            println!(
                "{} {sample_rate} Hz, {fundamental_hz} Hz: N = {}, loop {want:.3} Hz, measured {got:.3} ({error:+.3} cents; {:+.1} from {fundamental_hz})",
                core::any::type_name::<S>(),
                string.loop_length(),
                cents(want, fundamental_hz)
            );
            assert!(
                error.abs() < 0.2,
                "{sample_rate} {fundamental_hz}: {error} cents"
            );
        }
    }
}

#[test]
fn integer_loop_pitch_f32() {
    integer_loop_pitch_is_sample_rate_over_n_plus_half::<f32>();
}

#[test]
fn integer_loop_pitch_f64() {
    integer_loop_pitch_is_sample_rate_over_n_plus_half::<f64>();
}

/// T₆₀ matches `−3 / (f₀ log₁₀ g)` with `g = ρ |cos(π f₀ / sample_rate)|`.
fn t60_matches_the_loop_gain<S: Scalar>() {
    let sample_rate = 48_000.0;
    for (fundamental_hz, loss) in [(220.0, 0.996), (880.0, 1.0)] {
        let (string, signal) = render::<S>(sample_rate, fundamental_hz, loss, 3.0);
        let pitch = string.pitch();
        let gain = loss * (core::f64::consts::PI * pitch / sample_rate).cos();
        let want = -3.0 / (pitch * gain.log10());
        // The fundamental's decay, fit away from the attack and the end.
        let got = decay_time_60db(
            &signal,
            sample_rate,
            pitch,
            16.0,
            0.05 * want,
            (0.6 * want).min(2.9),
        )
        .unwrap();
        println!(
            "{} {fundamental_hz} Hz, ρ = {loss}: T60 {got:.4} s, predicted {want:.4} s",
            core::any::type_name::<S>()
        );
        assert!(
            (got - want).abs() < 0.03 * want,
            "{fundamental_hz}: {got} vs {want}"
        );
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
    inharmonicity: 0.0,
};

const fn loss(loss: f64) -> Voicing {
    Voicing {
        tuned: false,
        decay: Decay::Loss(loss),
        inharmonicity: 0.0,
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
        inharmonicity: 0.0,
    };
    assert!(
        KsString::<f64>::new(48_000.0, 20_000.0, tuned).is_none(),
        "tuned loop too short: N = ⌊2.4 − ½ − 0.1⌋ = 1"
    );
    let no_decay = Voicing {
        tuned: true,
        decay: Decay::Time60Db(0.0),
        inharmonicity: 0.0,
    };
    assert!(KsString::<f64>::new(48_000.0, 440.0, no_decay).is_none());
    assert!(KsString::<f64>::new(f64::NAN, 440.0, LOSSLESS).is_none());
}

#[test]
fn a_release_of_no_time_is_ignored() {
    // At 0 the loss would be total (10^−∞), so it's refused.
    let voicing = Voicing {
        tuned: true,
        decay: Decay::Time60Db(2.0),
        inharmonicity: 0.0,
    };
    let render = |damp: bool| {
        let mut string = KsString::<f64>::new(48_000.0, 220.0, voicing).unwrap();
        string.pluck(|slot, _| hash_noise(slot));
        if damp {
            string.damp(0.0, core::num::NonZeroUsize::MIN);
        }
        (0..2_000)
            .map(|_| string.next_sample())
            .collect::<Vec<f64>>()
    };
    assert_eq!(render(true), render(false));
}
