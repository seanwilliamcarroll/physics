use core::f64::consts::TAU;

use super::{Dispersion, MAX_BIQUADS, biquad_delay, biquad_delay_gradient, design};
use crate::piano::{FIRST_KEY, LAST_KEY, frequency, voicing};
use crate::voicing::phase_delay_lowpass;

const FS: f64 = 48_000.0;

/// The worst partial error (cents) of a design for `f1`, `b` (stretch ½,
/// room unlimited).
fn worst_cents(f1: f64, b: f64) -> (usize, u32, f64) {
    let d = design(FS, f1, b, 0.5, 1e9).expect("a design");
    let worst = errors(&d, FS, f1, b, 0.5).into_iter().fold(0.0, f64::max);
    (d.count, d.partials, worst)
}

/// Each designed partial's error (cents, 2 and up, as magnitudes) for
/// design `d`, predicted from the filters' phase delays: partial k needs
/// `k fs / f_k` samples a round trip, `f_k = k F₀ √(1 + B k²)`, relative
/// to the fundamental's, with the loss lowpass's (stretch `s`) taken off.
fn errors(d: &Dispersion, fs: f64, f1: f64, b: f64, s: f64) -> Vec<f64> {
    let f0 = f1 / (1.0 + b).sqrt();
    let w1 = TAU * f1 / fs;
    (2..=d.partials)
        .map(|k| {
            let k = f64::from(k);
            let fk = k * f0 * (1.0 + b * k * k).sqrt();
            let wk = TAU * fk / fs;
            let want =
                k * fs / fk - fs / f1 - (phase_delay_lowpass(s, wk) - phase_delay_lowpass(s, w1));
            let got = d.delay(wk) - d.delay(w1);
            (1200.0 / core::f64::consts::LN_2 * (got - want) / (k * fs / fk)).abs()
        })
        .collect()
}

/// Key `key` as the piano designs it at `fs`: its design and each
/// partial's error, and the biquads it would have had with unlimited
/// room (more than it has: the loop's room limited it).
fn as_the_piano_designs(fs: f64, key: u8) -> (Dispersion, Vec<f64>, usize) {
    let v = voicing(key, true);
    let (f1, b) = (frequency(key), v.inharmonicity);
    let mut seen = None;
    let voiced = v.coefficients_designed(fs, f1, |s, room| {
        let d = design(fs, f1, b, s, room);
        seen = Some((s, d));
        d
    });
    assert!(voiced.is_some(), "{fs} Hz, MIDI {key}: no voice");
    let (s, d) = seen.expect("designed");
    let d = d.unwrap_or_else(|| panic!("{fs} Hz, MIDI {key}: no cascade"));
    let unlimited = design(fs, f1, b, s, 1e9).expect("a design").count;
    let errs = errors(&d, fs, f1, b, s);
    (d, errs, unlimited)
}

/// Every key's partials, at both rates, as the piano designs them
/// (2026-11-19, `docs/14-piano.md`): with the room it wants, the worst
/// partial 1.65 cents (the band's top partial on a few bass keys, where
/// a least-squares fit gives a little; key 92 at 48 kHz on partial 8).
/// ~1.2x.
const ALL_KEYS_TOL_CENTS: f64 = 2.0;

/// Where the loop's room (half the loop: more detunes the top keys'
/// fundamentals) left fewer biquads than wanted: 2.73 cents (keys
/// 98–100, partials 4–6, 7–16 kHz). Held to where mistuning starts to be
/// heard (`tests/tuning.rs`, `AUDIBLE_CENTS`).
const ROOM_LIMITED_TOL_CENTS: f64 = 3.0;

/// One biquad for three partials (MIDI 106 at 44.1 kHz, 107 at 48 kHz):
/// 10.9 cents, on partials at 8–16 kHz. A known gap (TASKS); ~1.1x.
const ONE_BIQUAD_TOL_CENTS: f64 = 12.0;

#[test]
fn every_key_puts_its_partials_within_its_bound() {
    for fs in [44_100.0, 48_000.0] {
        for key in FIRST_KEY..=LAST_KEY {
            let (d, errs, unlimited) = as_the_piano_designs(fs, key);
            let worst = errs.iter().copied().fold(0.0, f64::max);
            let tol = if d.count == unlimited {
                ALL_KEYS_TOL_CENTS
            } else if d.count == 1 && errs.len() > 2 {
                ONE_BIQUAD_TOL_CENTS
            } else {
                ROOM_LIMITED_TOL_CENTS
            };
            assert!(
                worst < tol,
                "{fs} Hz, MIDI {key}: {} biquads ({unlimited} with room), worst {worst} cents",
                d.count
            );
        }
    }
}

/// Measured (A3.2, prototype then Rust): the placed-and-refined cascade
/// puts the first 30 partials within a fraction of a cent across the
/// keyboard. ~5x the worst measured.
const DESIGN_TOL_CENTS: f64 = 1.0;

#[test]
fn the_cascade_puts_partials_where_the_stiffness_says() {
    for (name, f1, b) in [
        ("A0", 27.5, 2.08e-4),
        ("C2", 65.41, 6.68e-5),
        ("C3", 130.81, 1.1e-4),
        ("C4", 261.63, 3.1e-4),
        ("A4", 440.0, 7.1e-4),
        ("C6", 1046.5, 2.85e-3),
    ] {
        let (count, partials, err) = worst_cents(f1, b);
        println!("{name}: {count} biquads, {partials} partials, worst {err:.3} cents");
        assert!(count <= MAX_BIQUADS);
        assert!(err < DESIGN_TOL_CENTS, "{name}: {err} cents");
    }
}

#[test]
fn no_stiffness_no_filter() {
    assert!(design(FS, 220.0, 0.0, 0.5, 1e9).is_none());
    assert!(design(FS, 220.0, f64::NAN, 0.5, 1e9).is_none());
}

#[test]
fn the_design_is_reproducible() {
    // The same inputs give the same bits (libm, a deterministic stop):
    // rendered audio is repeatable because of it.
    let a = design(FS, 261.63, 3.1e-4, 0.5, 1e9).unwrap();
    let b = design(FS, 261.63, 3.1e-4, 0.5, 1e9).unwrap();
    assert_eq!(a, b);
}

#[test]
fn a_short_loop_gets_a_smaller_filter() {
    // The cascade's delay at f₀ may use at most `max_delay` samples.
    let full = design(FS, 1046.5, 2.85e-3, 0.5, 1e9).unwrap();
    let w1 = TAU * 1046.5 / FS;
    let room = full.delay(w1) / 2.0;
    // Found by the full mutation run of 2026-11-12: this was an `if let`,
    // so a design that gave up passed too.
    let small = design(FS, 1046.5, 2.85e-3, 0.5, room).expect("a smaller filter fits");
    assert!(small.delay(w1) <= room, "{} > {room}", small.delay(w1));
    assert!(
        small.count < full.count,
        "{} biquads, not fewer than {}",
        small.count,
        full.count
    );
    assert_eq!(small.partials, full.partials, "the same targets");
}

/// The closed-form derivatives match central differences of the delay
/// itself, over the radii and angles the design uses and frequencies
/// across the band.
#[test]
fn the_delay_gradient_matches_central_differences() {
    let h = 1e-6;
    for r in [0.3, 0.7, 0.95, 0.995] {
        for th in [0.05, 0.4, 1.2, 2.5] {
            for w in [0.01, 0.2, 0.9, 2.0] {
                let (dr, dth) = biquad_delay_gradient(r, th, w);
                let num_r = (biquad_delay(r + h, th, w) - biquad_delay(r - h, th, w)) / (2.0 * h);
                let num_th = (biquad_delay(r, th + h, w) - biquad_delay(r, th - h, w)) / (2.0 * h);
                for (got, want, what) in [(dr, num_r, "r"), (dth, num_th, "θ")] {
                    let tol = 1e-5 * want.abs().max(1.0);
                    assert!(
                        (got - want).abs() <= tol,
                        "d/d{what} at r {r}, θ {th}, w {w}: {got} against {want}"
                    );
                }
            }
        }
    }
}
