//! String groups beat (`docs/14-piano.md`, "String groups"): uncoupled
//! strings `Δf` apart make the note's loudness swell and fade at `Δf`.
#![cfg(test)]

use acoustic::measure::amplitude;
use acoustic::piano::frequency;
use acoustic::unison::{DETUNE_CENTS, Unison};
use acoustic::{Decay, Voicing, inharmonicity};
use math::convert::{f64_to_usize, usize_to_f64};

const SAMPLE_RATE: f64 = 48_000.0;
/// Nearly lossless: the pair's beat takes 17 s, and a real decay over
/// several beats would swamp the envelope (with 30 s, the pair measured
/// 28 % slow).
const T60: f64 = 1000.0;
/// The envelope: the fundamental's amplitude in windows of this many
/// periods, every `HOP` s, after the attack `SKIP`.
const WINDOW_PERIODS: f64 = 16.0;
const HOP: f64 = 0.05;
const SKIP: f64 = 0.1;
const BEATS: f64 = 3.0;
/// The envelope's frequency is searched from `SEARCH.0` to `SEARCH.1` of
/// the expected beat, in this many steps.
const SEARCH: (f64, f64) = (0.5, 2.0);
const SEARCH_STEPS: u32 = 600;

fn beat_rate(key: u8, expected: f64) -> f64 {
    let voicing = Voicing {
        tuned: true,
        decay: Decay::Time60Db(T60),
        inharmonicity: inharmonicity(key),
    };
    let mut unison = Unison::<f64>::new(SAMPLE_RATE, key, voicing, 1.58).unwrap();
    let mut signal = vec![0.0; f64_to_usize((SKIP + BEATS / expected) * SAMPLE_RATE).unwrap()];
    unison.render(&mut signal);
    let key_hz = frequency(key);
    let (window, hop, skip) = (
        f64_to_usize(WINDOW_PERIODS * SAMPLE_RATE / key_hz).unwrap(),
        f64_to_usize(HOP * SAMPLE_RATE).unwrap(),
        f64_to_usize(SKIP * SAMPLE_RATE).unwrap(),
    );
    let envelope: Vec<f64> = (skip..signal.len() - window)
        .step_by(hop)
        .map(|start| amplitude(&signal[start..start + window], SAMPLE_RATE, key_hz))
        .collect();
    let mean = envelope.iter().sum::<f64>() / usize_to_f64(envelope.len());
    let strength = |frequency_hz: f64| {
        let (real, imaginary) = envelope.iter().enumerate().fold(
            (0.0, 0.0),
            |(real, imaginary), (index, &amplitude)| {
                let angle = core::f64::consts::TAU * frequency_hz * usize_to_f64(index) * HOP;
                (
                    real + (amplitude - mean) * angle.cos(),
                    imaginary - (amplitude - mean) * angle.sin(),
                )
            },
        );
        real * real + imaginary * imaginary
    };
    (0..=SEARCH_STEPS)
        .map(|step| {
            expected
                * (SEARCH.0 + (SEARCH.1 - SEARCH.0) * f64::from(step) / f64::from(SEARCH_STEPS))
        })
        .max_by(|&first, &second| strength(first).total_cmp(&strength(second)))
        .unwrap()
}

/// Measured: the pair +2.0 %, the trio +0.75 % (about the envelope's
/// resolution over three beats). ~2.5x.
const BEAT_TOL: f64 = 0.05;

#[test]
fn a_group_beats_at_its_detuning() {
    for key in [44_u8, 72] {
        let expected = frequency(key) * (2f64.powf(DETUNE_CENTS / 1200.0) - 1.0);
        let measured = beat_rate(key, expected);
        println!(
            "MIDI {key}: beats at {measured:.4} Hz, expected {expected:.4} ({:+.2}%)",
            100.0 * (measured / expected - 1.0)
        );
        assert!(
            (measured / expected - 1.0).abs() < BEAT_TOL,
            "MIDI {key}: {measured} vs {expected}"
        );
    }
}
