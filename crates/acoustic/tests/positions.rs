//! Where you pluck and where you listen decide which harmonics exist
//! (`docs/13-waveguide.md`): harmonic `k` sounds as
//! `sin(kπβ) sin(kπp) / k²`, so a pluck or a pickup at `1/n` of the
//! string leaves out every `n`th.
#![cfg(test)]

use acoustic::measure::{amplitude, partial};
use acoustic::{Decay, Scalar, Voicing, Waveguide};
use math::convert::f64_to_usize;

const SAMPLE_RATE: f64 = 48_000.0;
const FUNDAMENTAL_HZ: f64 = 220.0;
const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::T60(10.0),
    inharmonicity: 0.0,
};
const SKIP_SECONDS: f64 = 0.02;
const WINDOW_SECONDS: f64 = 0.1;

fn triangle(beta: f64) -> impl Fn(f64) -> f64 {
    move |position| {
        if position < beta {
            position / beta
        } else {
            (1.0 - position) / (1.0 - beta)
        }
    }
}

fn harmonics<S: Scalar>(beta: f64, pickup: f64, count: u32) -> Vec<f64> {
    let mut waveguide = Waveguide::<S>::new(SAMPLE_RATE, FUNDAMENTAL_HZ, VOICING).unwrap();
    let shape = triangle(beta);
    waveguide.pluck(|position| S::from_f64(shape(position)));
    waveguide.set_pickup(pickup);
    let (skip, window) = (
        f64_to_usize(SKIP_SECONDS * SAMPLE_RATE).unwrap(),
        f64_to_usize(WINDOW_SECONDS * SAMPLE_RATE).unwrap(),
    );
    let mut out = vec![S::ZERO; skip + window];
    waveguide.render(&mut out);
    let signal: Vec<f64> = out
        .get(skip..)
        .unwrap()
        .iter()
        .map(|sample| sample.to_f64())
        .collect();
    (1..=count)
        .map(|number| {
            let guess_hz = FUNDAMENTAL_HZ * f64::from(number);
            let partial_hz = partial(&signal, SAMPLE_RATE, guess_hz, 8.0 * f64::from(number))
                .unwrap_or(guess_hz);
            amplitude(&signal, SAMPLE_RATE, partial_hz)
        })
        .collect()
}

fn db(amplitude: f64) -> f64 {
    20.0 * amplitude.max(1e-12).log10()
}

/// Measured (positions on the effective length): moving the pluck onto
/// `1/n` drops harmonic `n` by 45–46 dB against `1/n ± 0.05`, the pickup
/// by 50–51 dB, to about −73 dB under the fundamental (`n` = 2–5). (On the
/// bare `M` cells the nulls only reached −40 dB: `13-waveguide.md`.)
const MIN_DROP_DB: f64 = 30.0;
/// How far `1/n ± ` to compare against.
const OFF: f64 = 0.05;

fn slider_drops_the_nth_harmonic<S: Scalar>() {
    for n in [2_u32, 3, 4, 5] {
        let nth = |beta: f64, pickup: f64| db(harmonics::<S>(beta, pickup, n)[(n - 1) as usize]);
        let at = 1.0 / f64::from(n);
        let pluck = nth(at + OFF, 0.1).max(nth(at - OFF, 0.1)) - nth(at, 0.1);
        let pickup = nth(0.1, at + OFF).max(nth(0.1, at - OFF)) - nth(0.1, at);
        println!(
            "{} n = {n}: pluck drop {pluck:.1} dB, pickup drop {pickup:.1} dB",
            core::any::type_name::<S>()
        );
        assert!(pluck > MIN_DROP_DB, "pluck at 1/{n}: {pluck} dB");
        assert!(pickup > MIN_DROP_DB, "pickup at 1/{n}: {pickup} dB");
    }
}

#[test]
fn plucking_or_listening_at_1_over_n_removes_the_nth_harmonic_f64() {
    slider_drops_the_nth_harmonic::<f64>();
}

#[test]
fn plucking_or_listening_at_1_over_n_removes_the_nth_harmonic_f32() {
    slider_drops_the_nth_harmonic::<f32>();
}

/// Measured: harmonics 2–4 and 6 within 0.5 dB of
/// `sin(kπβ) sin(kπp) / k²` (relative to the fundamental; the rest is the
/// bridge taking a little more from the higher ones), and harmonic 5,
/// which β = 0.2 nulls, at −60 dB. ~3x.
const SHAPE_TOL_DB: f64 = 1.5;
const NULL_DB: f64 = -50.0;

fn harmonics_follow_the_prediction<S: Scalar>() {
    let (beta, pickup) = (0.2, 0.1);
    let measured = harmonics::<S>(beta, pickup, 6);
    let predict = |number: u32| {
        let number = f64::from(number);
        let pi = core::f64::consts::PI;
        ((number * pi * beta).sin() * (number * pi * pickup).sin() / (number * number)).abs()
    };
    for number in [2_u32, 3, 4, 6] {
        let got = db(measured[(number - 1) as usize] / measured[0]);
        let want = db(predict(number) / predict(1));
        println!(
            "{} harmonic {number}: {got:.2} dB, predicted {want:.2}",
            core::any::type_name::<S>()
        );
        assert!(
            (got - want).abs() < SHAPE_TOL_DB,
            "harmonic {number}: {got} vs {want}"
        );
    }
    let fifth = db(measured[4] / measured[0]);
    assert!(fifth < NULL_DB, "β = 0.2 nulls the 5th: {fifth} dB");
}

#[test]
fn harmonics_follow_the_prediction_f64() {
    harmonics_follow_the_prediction::<f64>();
}

#[test]
fn harmonics_follow_the_prediction_f32() {
    harmonics_follow_the_prediction::<f32>();
}

fn waveguide_bits<S: Scalar>() -> Vec<u64> {
    let mut all = Vec::new();
    for fundamental_hz in [110.0, 261.63, 659.26] {
        let mut waveguide = Waveguide::<S>::new(SAMPLE_RATE, fundamental_hz, VOICING).unwrap();
        let shape = triangle(0.2);
        waveguide.pluck(|position| S::from_f64(shape(position)));
        let mut out = vec![S::ZERO; 24_000];
        waveguide.render(&mut out);
        all.extend(out);
    }
    all.iter().map(|sample| sample.to_f64().to_bits()).collect()
}

#[test]
fn a_waveguide_run_is_repeatable() {
    assert!(
        waveguide_bits::<f32>() == waveguide_bits::<f32>(),
        "f32 runs differ"
    );
    assert!(
        waveguide_bits::<f64>() == waveguide_bits::<f64>(),
        "f64 runs differ"
    );
}
