//! Tuning and decay across the keyboard (`docs/12-acoustic-foundations.md`):
//! the allpass puts every key in tune, the integer loop doesn't (a known
//! failure, the page's toggle), and the decay control hits its target.
#![cfg(test)]

use acoustic::measure::{cents, partial, pitch, t60};
use acoustic::piano::frequency;
use acoustic::{Decay, KsString, Scalar, Voicing, Waveguide, inharmonicity};
use math::convert::{f64_to_usize, usize_to_f64};

const RATES: [f64; 2] = [44_100.0, 48_000.0];
/// The 88 keys: MIDI notes 21 (A0) to 108 (C8).
const KEYS: core::ops::RangeInclusive<u8> = 21..=108;
/// Samples skipped before measuring pitch (see `string/tests.rs`).
const ATTACK: usize = 2048;
/// Periods per DFT window when measuring the fundamental.
const PARTIAL_PERIODS: f64 = 16.0;
/// Every note's decay for the tuning sweep: long enough to measure.
const SWEEP_T60: f64 = 2.0;

/// The same noise as the unit tests' `crate::test_util::hash_noise` (an
/// integration test can't reach `cfg(test)` code).
fn hash_noise(index: usize) -> f64 {
    let hash = (index.wrapping_mul(2_654_435_761) >> 7) & 0xffff;
    usize_to_f64(hash) / 32768.0 - 1.0
}

/// Where the waveguide sweep plucks, from the bridge.
const PLUCK: f64 = 0.13;

/// Which string model renders: the loop, or the waveguide (read at its
/// default pickup). Tuning and decay are the loop's, so both must pass
/// the same tests (`docs/13-waveguide.md`).
#[derive(Copy, Clone, Debug)]
enum Model {
    Loop,
    Waveguide,
}

fn render<S: Scalar>(
    model: Model,
    sample_rate: f64,
    fundamental_hz: f64,
    voicing: Voicing,
    seconds: f64,
) -> Vec<f64> {
    let mut out = vec![S::ZERO; f64_to_usize(sample_rate * seconds).unwrap()];
    match model {
        Model::Loop => {
            let mut string = KsString::<S>::new(sample_rate, fundamental_hz, voicing).unwrap();
            string.pluck(|index, _| S::from_f64(hash_noise(index)));
            string.render(&mut out);
        }
        Model::Waveguide => {
            // A triangle, not noise: a pluck at rest from random values can
            // put almost nothing into the fundamental on a short string
            // (B7 at 44.1 kHz has 5 cells a rail), and the pitch measure
            // then locks onto a neighbor (−104 cents). The peak at 0.13 is
            // no small `1/n`, so every low harmonic sounds.
            let mut waveguide = Waveguide::<S>::new(sample_rate, fundamental_hz, voicing).unwrap();
            waveguide.pluck(|position| {
                S::from_f64(if position < PLUCK {
                    position / PLUCK
                } else {
                    (1.0 - position) / (1.0 - PLUCK)
                })
            });
            waveguide.render(&mut out);
        }
    }
    out.iter().map(|sample| sample.to_f64()).collect()
}

/// Every key's error in cents (MIDI, error), measured on the fundamental;
/// `stiff` gives each key the keyboard's `B` (`docs/14-piano.md`).
fn errors<S: Scalar>(model: Model, sample_rate: f64, tuned: bool, stiff: bool) -> Vec<(u8, f64)> {
    KEYS.map(|key| {
        let voicing = Voicing {
            tuned,
            decay: Decay::T60(SWEEP_T60),
            inharmonicity: if stiff { inharmonicity(key) } else { 0.0 },
        };
        let fundamental_hz = frequency(key);
        // The attack, then two DFT windows, with room to spare.
        let seconds =
            (usize_to_f64(ATTACK) / sample_rate + 2.5 * PARTIAL_PERIODS / fundamental_hz).max(0.5);
        let signal = render::<S>(model, sample_rate, fundamental_hz, voicing, seconds);
        let skip = f64_to_usize(4.0 * sample_rate / fundamental_hz)
            .unwrap()
            .max(ATTACK);
        let coarse = pitch(&signal[skip..], sample_rate, fundamental_hz, 0.06).unwrap();
        let measured = partial(&signal[skip..], sample_rate, coarse, PARTIAL_PERIODS).unwrap();
        (key, cents(measured, fundamental_hz))
    })
    .collect()
}

fn worst(errors: &[(u8, f64)]) -> (u8, f64) {
    errors
        .iter()
        .copied()
        .fold((0, 0.0), |worst, (key, error)| {
            if error.abs() > worst.1.abs() {
                (key, error)
            } else {
                worst
            }
        })
}

/// Measured: the worst key within 0.006 cents at both rates, in both
/// scalars. ~8x.
const TUNED_TOL_CENTS: f64 = 0.05;

/// A few cents is where most listeners start to hear a mistuning.
const AUDIBLE_CENTS: f64 = 3.0;

/// Every one of the 88 keys is in tune with the allpass.
fn tuned_keys_are_in_tune<S: Scalar>(model: Model, stiff: bool) {
    for sample_rate in RATES {
        let (key, error) = worst(&errors::<S>(model, sample_rate, true, stiff));
        println!(
            "{model:?} {} {sample_rate} Hz{}: tuned worst {error:+.4} cents (MIDI {key})",
            core::any::type_name::<S>(),
            if stiff { ", stiff" } else { "" }
        );
        assert!(
            error.abs() < TUNED_TOL_CENTS,
            "{sample_rate}: MIDI {key} {error} cents"
        );
    }
}

#[test]
fn tuned_keys_are_in_tune_f32() {
    tuned_keys_are_in_tune::<f32>(Model::Loop, false);
}

#[test]
fn tuned_keys_are_in_tune_f64() {
    tuned_keys_are_in_tune::<f64>(Model::Loop, false);
}

#[test]
fn waveguide_keys_are_in_tune_f32() {
    tuned_keys_are_in_tune::<f32>(Model::Waveguide, false);
}

#[test]
fn waveguide_keys_are_in_tune_f64() {
    tuned_keys_are_in_tune::<f64>(Model::Waveguide, false);
}

/// Stiffness on (`docs/14-piano.md`): the dispersion cascade's delay at
/// `f₀` is in the tuning budget, so the fundamental stays in tune.
#[test]
fn stiff_keys_are_in_tune_f32() {
    tuned_keys_are_in_tune::<f32>(Model::Waveguide, true);
}

#[test]
fn stiff_keys_are_in_tune_f64() {
    tuned_keys_are_in_tune::<f64>(Model::Waveguide, true);
}

/// Measured: the worst partial 0.20 cents (C2's 12th, which runs 8 cents
/// sharp; A4's runs 84). ~5x.
const STRETCH_TOL_CENTS: f64 = 1.0;
/// Partials measured per key, from the 2nd.
const STRETCH_PARTIALS: u32 = 12;
/// The DFT window, in fundamental periods: neighbors are `f₀` apart.
const STRETCH_PERIODS: f64 = 16.0;

/// A stiff string's partials, rendered and measured one by one, sit at
/// `k F₀ √(1 + B k²)`: sharp of `k f₀` by what the stiffness says.
#[test]
fn stiff_partials_run_sharp() {
    let sample_rate = 48_000.0;
    for key in [21_u8, 36, 48, 60, 69] {
        let (key_hz, inharmonicity) = (frequency(key), inharmonicity(key));
        let voicing = Voicing {
            tuned: true,
            decay: Decay::T60(4.0),
            inharmonicity,
        };
        let ideal_hz = key_hz / (1.0 + inharmonicity).sqrt();
        let seconds = 0.1 + 2.5 * STRETCH_PERIODS / key_hz;
        let signal = render::<f64>(Model::Waveguide, sample_rate, key_hz, voicing, seconds);
        let skip = f64_to_usize(0.1 * sample_rate).unwrap();
        let mut worst = 0.0_f64;
        for partial_number in 2..=STRETCH_PARTIALS {
            let number = f64::from(partial_number);
            let expected_hz = number * ideal_hz * (1.0 + inharmonicity * number * number).sqrt();
            let measured_hz = partial(
                &signal[skip..],
                sample_rate,
                expected_hz,
                STRETCH_PERIODS * number,
            )
            .unwrap();
            let error = cents(measured_hz, expected_hz);
            if partial_number == 2 || partial_number == STRETCH_PARTIALS {
                println!(
                    "MIDI {key} partial {number}: {:+.2} cents sharp of k·f1, error {error:+.3}",
                    cents(expected_hz, number * key_hz)
                );
            }
            worst = if error.abs() > worst.abs() {
                error
            } else {
                worst
            };
        }
        println!("MIDI {key} (B = {inharmonicity:.2e}): worst partial {worst:+.3} cents");
        assert!(worst.abs() < STRETCH_TOL_CENTS, "MIDI {key}: {worst}");
    }
}

/// Known failure, kept as a demo (the page's toggle): the integer loop
/// can only play `fs / (N + ½)`. Measured: worst −75.5 cents at C8
/// (44.1 kHz) and +71.1 (48 kHz), as `12` predicts (half a sample of an
/// 11.5-sample loop); the printout counts the keys audibly off.
#[test]
fn integer_loop_is_out_of_tune_at_the_top() {
    for sample_rate in RATES {
        let all_errors = errors::<f64>(Model::Loop, sample_rate, false, false);
        let (key, error) = worst(&all_errors);
        let audible: Vec<u8> = all_errors
            .iter()
            .filter(|(_, error)| error.abs() > AUDIBLE_CENTS)
            .map(|&(key, _)| key)
            .collect();
        println!(
            "{sample_rate} Hz: integer loop worst {error:+.1} cents (MIDI {key}); {} keys off by more than {AUDIBLE_CENTS} cents, the lowest MIDI {:?}",
            audible.len(),
            audible.first()
        );
        assert!(
            error.abs() > 50.0,
            "{sample_rate}: expected the top to be far off, got {error}"
        );
    }
}

/// Measured: within 0.1% at every key tried (the worst at 3.5 kHz,
/// stretched). ~10x.
const DECAY_TOL: f64 = 0.01;

/// The fundamental's measured T₆₀ against the target, for notes that need
/// shortening (low) and stretching (high).
fn decay<S: Scalar>(model: Model) {
    let sample_rate = 48_000.0;
    for key in [33_u8, 57, 81, 96, 105] {
        for target in [0.5, 2.0] {
            let fundamental_hz = frequency(key);
            let voicing = Voicing {
                tuned: true,
                decay: Decay::T60(target),
                inharmonicity: 0.0,
            };
            let signal = render::<S>(model, sample_rate, fundamental_hz, voicing, target);
            // Windows of ~40 ms (at least 4 periods): several in the span.
            let periods = (0.04 * fundamental_hz).max(4.0).round();
            let measured = t60(
                &signal,
                sample_rate,
                fundamental_hz,
                periods,
                0.05 * target,
                0.7 * target,
            )
            .unwrap();
            println!(
                "{model:?} {} MIDI {key} ({fundamental_hz:.1} Hz) target {target} s: {measured:.4} s ({:+.2}%)",
                core::any::type_name::<S>(),
                100.0 * (measured / target - 1.0)
            );
            assert!(
                (measured / target - 1.0).abs() < DECAY_TOL,
                "MIDI {key} {target}: {measured}"
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
