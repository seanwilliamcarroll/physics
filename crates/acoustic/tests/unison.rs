//! String groups beat (`docs/14-piano.md`, "String groups"): uncoupled
//! strings `Δf` apart make the note's loudness swell and fade at `Δf`.
#![cfg(test)]

use acoustic::measure::amplitude;
use acoustic::unison::{DETUNE_CENTS, Unison};
use acoustic::{Decay, Voicing, inharmonicity};

const FS: f64 = 48_000.0;
/// Nearly lossless: the pair's beat takes 17 s, and a real decay over
/// several beats would swamp the envelope (with 30 s, the pair measured
/// 28 % slow).
const T60: f64 = 1000.0;
/// The envelope: the fundamental's amplitude in windows of this many
/// periods, every `HOP` s, after the attack `SKIP`.
const WINDOW_PERIODS: f64 = 16.0;
const HOP: f64 = 0.05;
const SKIP: f64 = 0.1;
/// Beat periods rendered.
const BEATS: f64 = 3.0;
/// The envelope's frequency is searched from `SEARCH.0` to `SEARCH.1` of
/// the expected beat, in this many steps.
const SEARCH: (f64, f64) = (0.5, 2.0);
const SEARCH_STEPS: u32 = 600;

fn frequency(midi: u8) -> f64 {
    440.0 * 2f64.powf((f64::from(midi) - 69.0) / 12.0)
}

/// The rate the group's envelope swells and fades at, Hz: the strongest
/// frequency of the fundamental's amplitude over time.
fn beat_rate(key: u8, expected: f64) -> f64 {
    let voicing = Voicing {
        tuned: true,
        decay: Decay::T60(T60),
        inharmonicity: inharmonicity(key),
    };
    let mut u = Unison::<f64>::new(FS, key, voicing, 1.58).unwrap();
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "test lengths"
    )]
    let mut signal = vec![0.0; ((SKIP + BEATS / expected) * FS) as usize];
    u.render(&mut signal);
    let f1 = frequency(key);
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "test lengths"
    )]
    let (window, hop, skip) = (
        (WINDOW_PERIODS * FS / f1) as usize,
        (HOP * FS) as usize,
        (SKIP * FS) as usize,
    );
    let envelope: Vec<f64> = (skip..signal.len() - window)
        .step_by(hop)
        .map(|i| amplitude(&signal[i..i + window], FS, f1))
        .collect();
    #[expect(clippy::cast_precision_loss, reason = "window counts are small")]
    let mean = envelope.iter().sum::<f64>() / envelope.len() as f64;
    let strength = |f: f64| {
        let (re, im) = envelope
            .iter()
            .enumerate()
            .fold((0.0, 0.0), |(re, im), (n, &e)| {
                #[expect(clippy::cast_precision_loss, reason = "window counts are small")]
                let a = core::f64::consts::TAU * f * n as f64 * HOP;
                (re + (e - mean) * a.cos(), im - (e - mean) * a.sin())
            });
        re * re + im * im
    };
    (0..=SEARCH_STEPS)
        .map(|i| {
            expected * (SEARCH.0 + (SEARCH.1 - SEARCH.0) * f64::from(i) / f64::from(SEARCH_STEPS))
        })
        .max_by(|&a, &b| strength(a).total_cmp(&strength(b)))
        .unwrap()
}

/// Measured (A3.4): the pair +2.0 %, the trio +0.75 % (about the
/// envelope's resolution over three beats). ~2.5x.
const BEAT_TOL: f64 = 0.05;

/// A pair (G♯2) and a trio (C5) beat at their neighbors' detuning, `Δf =
/// f (2^(c / 1200) − 1)`: for three strings evenly spread, the envelope
/// `|1 + 2 cos(2π Δf t)|` repeats at `Δf` too.
#[test]
fn a_group_beats_at_its_detuning() {
    for key in [44_u8, 72] {
        let expected = frequency(key) * (2f64.powf(DETUNE_CENTS / 1200.0) - 1.0);
        let got = beat_rate(key, expected);
        println!(
            "MIDI {key}: beats at {got:.4} Hz, expected {expected:.4} ({:+.2}%)",
            100.0 * (got / expected - 1.0)
        );
        assert!(
            (got / expected - 1.0).abs() < BEAT_TOL,
            "MIDI {key}: {got} vs {expected}"
        );
    }
}
