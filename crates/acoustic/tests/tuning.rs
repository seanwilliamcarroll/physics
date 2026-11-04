//! Tuning and decay across the keyboard (`docs/12-acoustic-foundations.md`):
//! the allpass puts every key in tune, the integer loop doesn't (a known
//! failure, the page's toggle), and the decay control hits its target.
#![cfg(test)]

use acoustic::measure::{cents, partial, pitch, t60};
use acoustic::{Decay, KsString, Scalar, Voicing, Waveguide};

const RATES: [f64; 2] = [44_100.0, 48_000.0];
/// The 88 keys: MIDI notes 21 (A0) to 108 (C8).
const KEYS: core::ops::RangeInclusive<u8> = 21..=108;
/// Samples skipped before measuring pitch (see `string/tests.rs`).
const ATTACK: usize = 2048;
/// Periods per DFT window when measuring the fundamental.
const PARTIAL_PERIODS: f64 = 16.0;
/// Every note's decay for the tuning sweep: long enough to measure.
const SWEEP_T60: f64 = 2.0;

/// Equal temperament, A4 = 440 Hz.
fn frequency(midi: u8) -> f64 {
    440.0 * 2f64.powf((f64::from(midi) - 69.0) / 12.0)
}

#[expect(clippy::cast_precision_loss, reason = "a 16-bit value, exact")]
fn hash_noise(i: usize) -> f64 {
    let h = (i.wrapping_mul(2_654_435_761) >> 7) & 0xffff;
    h as f64 / 32768.0 - 1.0
}

/// Which string model renders: A1's loop, or A2's waveguide (read at its
/// default pickup). Tuning and decay are the loop's, so both must pass
/// the same tests (`docs/13-waveguide.md`).
#[derive(Copy, Clone, Debug)]
enum Model {
    Loop,
    Waveguide,
}

fn render<S: Scalar>(model: Model, fs: f64, f0: f64, voicing: Voicing, secs: f64) -> Vec<f64> {
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "test lengths"
    )]
    let mut out = vec![S::ZERO; (fs * secs) as usize];
    match model {
        Model::Loop => {
            let mut s = KsString::<S>::new(fs, f0, voicing).unwrap();
            s.pluck(|i, _| S::from_f64(hash_noise(i)));
            s.render(&mut out);
        }
        Model::Waveguide => {
            let mut s = Waveguide::<S>::new(fs, f0, voicing).unwrap();
            let mut i = 0;
            s.pluck(|_| {
                i += 1;
                S::from_f64(hash_noise(i))
            });
            s.render(&mut out);
        }
    }
    out.iter().map(|x| x.to_f64()).collect()
}

/// Every key's error in cents (MIDI, error), measured on the fundamental.
fn errors<S: Scalar>(model: Model, fs: f64, tuned: bool) -> Vec<(u8, f64)> {
    let voicing = Voicing {
        tuned,
        decay: Decay::T60(SWEEP_T60),
    };
    KEYS.map(|key| {
        let f0 = frequency(key);
        // The attack, then two DFT windows, with room to spare.
        #[expect(clippy::cast_precision_loss, reason = "ATTACK is small")]
        let secs = (ATTACK as f64 / fs + 2.5 * PARTIAL_PERIODS / f0).max(0.5);
        let sig = render::<S>(model, fs, f0, voicing, secs);
        #[expect(
            clippy::cast_possible_truncation,
            clippy::cast_sign_loss,
            reason = "test lengths"
        )]
        let skip = ((4.0 * fs / f0) as usize).max(ATTACK);
        let coarse = pitch(&sig[skip..], fs, f0, 0.06).unwrap();
        let got = partial(&sig[skip..], fs, coarse, PARTIAL_PERIODS).unwrap();
        (key, cents(got, f0))
    })
    .collect()
}

fn worst(errors: &[(u8, f64)]) -> (u8, f64) {
    errors.iter().copied().fold(
        (0, 0.0),
        |m, (k, e)| if e.abs() > m.1.abs() { (k, e) } else { m },
    )
}

/// Measured (A1.3): the worst key within 0.006 cents at both rates, in
/// both scalars. ~8x.
const TUNED_TOL_CENTS: f64 = 0.05;

/// A few cents is where most listeners start to hear a mistuning.
const AUDIBLE_CENTS: f64 = 3.0;

/// Every one of the 88 keys is in tune with the allpass.
fn tuned_keys_are_in_tune<S: Scalar>(model: Model) {
    for fs in RATES {
        let (key, err) = worst(&errors::<S>(model, fs, true));
        println!(
            "{model:?} {} {fs} Hz: tuned worst {err:+.4} cents (MIDI {key})",
            core::any::type_name::<S>()
        );
        assert!(err.abs() < TUNED_TOL_CENTS, "{fs}: MIDI {key} {err} cents");
    }
}

#[test]
fn tuned_keys_are_in_tune_f32() {
    tuned_keys_are_in_tune::<f32>(Model::Loop);
}

#[test]
fn tuned_keys_are_in_tune_f64() {
    tuned_keys_are_in_tune::<f64>(Model::Loop);
}

#[test]
fn waveguide_keys_are_in_tune_f32() {
    tuned_keys_are_in_tune::<f32>(Model::Waveguide);
}

#[test]
fn waveguide_keys_are_in_tune_f64() {
    tuned_keys_are_in_tune::<f64>(Model::Waveguide);
}

/// Known failure, kept as a demo (the page's toggle): the integer loop
/// can only play `fs / (N + ½)`. Measured (A1.3): worst −75.5 cents at C8
/// (44.1 kHz) and +71.1 (48 kHz), as `12` predicts (half a sample of an
/// 11.5-sample loop); the printout counts the keys audibly off.
#[test]
fn integer_loop_is_out_of_tune_at_the_top() {
    for fs in RATES {
        let errs = errors::<f64>(Model::Loop, fs, false);
        let (key, err) = worst(&errs);
        let audible: Vec<u8> = errs
            .iter()
            .filter(|(_, e)| e.abs() > AUDIBLE_CENTS)
            .map(|&(k, _)| k)
            .collect();
        println!(
            "{fs} Hz: integer loop worst {err:+.1} cents (MIDI {key}); {} keys off by more than {AUDIBLE_CENTS} cents, the lowest MIDI {:?}",
            audible.len(),
            audible.first()
        );
        assert!(
            err.abs() > 50.0,
            "{fs}: expected the top to be far off, got {err}"
        );
    }
}

/// Measured (A1.3): within 0.1% at every key tried (the worst at 3.5 kHz,
/// stretched). ~10x.
const DECAY_TOL: f64 = 0.01;

/// The fundamental's measured T₆₀ against the target, for notes that need
/// shortening (low) and stretching (high).
fn decay<S: Scalar>(model: Model) {
    let fs = 48_000.0;
    for key in [33_u8, 57, 81, 96, 105] {
        for target in [0.5, 2.0] {
            let f0 = frequency(key);
            let voicing = Voicing {
                tuned: true,
                decay: Decay::T60(target),
            };
            let sig = render::<S>(model, fs, f0, voicing, target);
            // Windows of ~40 ms (at least 4 periods): several in the span.
            let periods = (0.04 * f0).max(4.0).round();
            let got = t60(&sig, fs, f0, periods, 0.05 * target, 0.7 * target).unwrap();
            println!(
                "{model:?} {} MIDI {key} ({f0:.1} Hz) target {target} s: {got:.4} s ({:+.2}%)",
                core::any::type_name::<S>(),
                100.0 * (got / target - 1.0)
            );
            assert!(
                (got / target - 1.0).abs() < DECAY_TOL,
                "MIDI {key} {target}: {got}"
            );
        }
    }
}

#[test]
fn decay_f32() {
    decay::<f32>(Model::Loop);
}

#[test]
fn decay_f64() {
    decay::<f64>(Model::Loop);
}

#[test]
fn waveguide_decay_f32() {
    decay::<f32>(Model::Waveguide);
}

#[test]
fn waveguide_decay_f64() {
    decay::<f64>(Model::Waveguide);
}
