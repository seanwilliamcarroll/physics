//! Where you pluck and where you listen decide which harmonics exist
//! (`docs/13-waveguide.md`): harmonic `k` sounds as
//! `sin(kπβ) sin(kπp) / k²`, so a pluck or a pickup at `1/n` of the
//! string leaves out every `n`th.
#![cfg(test)]

use acoustic::measure::{amplitude, partial};
use acoustic::{Decay, Scalar, Voicing, Waveguide};
use math::Fnv1a;

const FS: f64 = 48_000.0;
/// 220 Hz: a 218-sample loop, 109 cells a rail.
const F0: f64 = 220.0;
/// A long decay, so the first harmonics are measured before they fade.
const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::T60(10.0),
    inharmonicity: 0.0,
};
/// Skip the first periods, then measure over this long (many periods of
/// every harmonic measured).
const SKIP_S: f64 = 0.02;
const WINDOW_S: f64 = 0.1;

/// A triangle peaked at `beta` (from the bridge), unit height.
fn triangle(beta: f64) -> impl Fn(f64) -> f64 {
    move |s| {
        if s < beta {
            s / beta
        } else {
            (1.0 - s) / (1.0 - beta)
        }
    }
}

/// The amplitudes of harmonics 1..=`count`, plucked at `beta` and heard
/// at `pickup`.
fn harmonics<S: Scalar>(beta: f64, pickup: f64, count: u32) -> Vec<f64> {
    let mut wg = Waveguide::<S>::new(FS, F0, VOICING).unwrap();
    let shape = triangle(beta);
    wg.pluck(|s| S::from_f64(shape(s)));
    wg.set_pickup(pickup);
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "test lengths"
    )]
    let (skip, len) = ((SKIP_S * FS) as usize, (WINDOW_S * FS) as usize);
    let mut out = vec![S::ZERO; skip + len];
    wg.render(&mut out);
    let sig: Vec<f64> = out
        .get(skip..)
        .unwrap()
        .iter()
        .map(|x| x.to_f64())
        .collect();
    (1..=count)
        .map(|k| {
            let guess = F0 * f64::from(k);
            // The partial's own frequency (the bridge filters stretch it a
            // hair), then its amplitude there.
            // Its window spans 8 periods of the *fundamental*, so
            // neighbors 220 Hz away fall outside the Hann main lobe.
            let f = partial(&sig, FS, guess, 8.0 * f64::from(k)).unwrap_or(guess);
            amplitude(&sig, FS, f)
        })
        .collect()
}

fn db(x: f64) -> f64 {
    20.0 * x.max(1e-12).log10()
}

/// Measured (A2.4, positions on the effective length): moving the pluck
/// onto `1/n` drops harmonic `n` by 45–46 dB against `1/n ± 0.05`, the
/// pickup by 50–51 dB, to about −73 dB under the fundamental (`n` = 2–5).
/// (On the bare `M` cells the nulls only reached −40 dB: `13-waveguide.md`.)
const MIN_DROP_DB: f64 = 30.0;
/// How far `1/n ± ` to compare against.
const OFF: f64 = 0.05;

fn slider_drops_the_nth_harmonic<S: Scalar>() {
    for n in [2_u32, 3, 4, 5] {
        let nth = |beta: f64, p: f64| db(harmonics::<S>(beta, p, n)[(n - 1) as usize]);
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

/// Measured (A2.4): harmonics 2–4 and 6 within 0.5 dB of
/// `sin(kπβ) sin(kπp) / k²` (relative to the fundamental; the rest is the
/// bridge taking a little more from the higher ones), and harmonic 5,
/// which β = 0.2 nulls, at −60 dB. ~3x.
const SHAPE_TOL_DB: f64 = 1.5;
const NULL_DB: f64 = -50.0;

fn harmonics_follow_the_prediction<S: Scalar>() {
    let (beta, p) = (0.2, 0.1);
    let h = harmonics::<S>(beta, p, 6);
    let predict = |k: u32| {
        let k = f64::from(k);
        let pi = core::f64::consts::PI;
        ((k * pi * beta).sin() * (k * pi * p).sin() / (k * k)).abs()
    };
    for k in [2_u32, 3, 4, 6] {
        let got = db(h[(k - 1) as usize] / h[0]);
        let want = db(predict(k) / predict(1));
        println!(
            "{} harmonic {k}: {got:.2} dB, predicted {want:.2}",
            core::any::type_name::<S>()
        );
        assert!(
            (got - want).abs() < SHAPE_TOL_DB,
            "harmonic {k}: {got} vs {want}"
        );
    }
    let fifth = db(h[4] / h[0]);
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

/// Half a second of three waveguide notes (plucked at 0.2, heard at 0.1),
/// hashed: the same bits native and on wasm (`cargo xtask test-wasm`).
fn waveguide_hash<S: Scalar>() -> u64 {
    let mut all = Vec::new();
    for f0 in [110.0, 261.63, 659.26] {
        let mut wg = Waveguide::<S>::new(FS, f0, VOICING).unwrap();
        let shape = triangle(0.2);
        wg.pluck(|s| S::from_f64(shape(s)));
        let mut out = vec![S::ZERO; 24_000];
        wg.render(&mut out);
        all.extend(out);
    }
    let mut h = Fnv1a::new();
    for x in &all {
        h.write(&x.to_f64().to_bits().to_le_bytes());
    }
    h.finish()
}

/// (f32, f64), recorded on aarch64-apple-darwin, Rust 1.99.1. If a change
/// is intended, paste the new values from the failure message.
const GOLDEN: (u64, u64) = (0x330b_ebac_bfc8_e2ce, 0x48cb_0298_d8e2_e40e);

#[test]
fn waveguide_golden_hashes_are_unchanged() {
    let got = (waveguide_hash::<f32>(), waveguide_hash::<f64>());
    assert_eq!(
        got, GOLDEN,
        "golden hashes changed: ({:#018x}, {:#018x})",
        got.0, got.1
    );
}
