use super::{Model, RELEASE_DECAY_TIME_60DB, VOICES, Voices};
use crate::hammer::{FORTISSIMO, PIANISSIMO, mezzo_forte};
use crate::measure::{cents, partial, pitch};
use crate::piano::frequency;
use crate::{Decay, Excitation, Voicing};
use math::convert::{f64_to_usize, usize_to_f64};

const SAMPLE_RATE: f64 = 48_000.0;
const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::Time60Db(2.0),
    inharmonicity: 0.0,
};

fn pool() -> Voices<f64> {
    Voices::new(SAMPLE_RATE, 1).unwrap()
}

#[test]
fn a_note_past_the_pool_steals_the_oldest() {
    let mut voices = pool();
    for key in 60..60 + u8::try_from(VOICES).unwrap() {
        assert!(voices.note_on(key, VOICING, Excitation::Noise));
    }
    assert_eq!(voices.sounding(), VOICES);
    assert!(voices.note_on(80, VOICING, Excitation::Noise));
    let keys: Vec<_> = voices.keys().flatten().collect();
    assert!(!keys.contains(&60), "the oldest (60) was stolen: {keys:?}");
    assert!(keys.contains(&80));
}

#[test]
fn replaying_a_key_reuses_its_voice() {
    let mut voices = pool();
    voices.note_on(60, VOICING, Excitation::Noise);
    voices.note_on(60, VOICING, Excitation::Noise);
    assert_eq!(voices.sounding(), 1);
}

#[test]
fn note_off_fades_and_frees_the_voice() {
    let mut voices = pool();
    voices.note_on(69, VOICING, Excitation::Noise);
    let mut block = vec![0.0; 128];
    voices.render(&mut block);
    let loud = block.iter().map(|sample| sample * sample).sum::<f64>();
    voices.note_off(69);
    // Render the release time and a little: silent (80 dB down), freed.
    let blocks = f64_to_usize(SAMPLE_RATE * RELEASE_DECAY_TIME_60DB * 1.5 / 128.0).unwrap();
    for _ in 0..blocks {
        voices.render(&mut block);
    }
    let quiet = block.iter().map(|sample| sample * sample).sum::<f64>();
    assert!(quiet < loud * 1e-8, "{quiet} vs {loud}");
    assert_eq!(voices.sounding(), 0);
}

#[test]
fn keys_below_a0_are_refused_and_the_top_plays() {
    let mut voices = pool();
    assert!(
        !voices.note_on(20, VOICING, Excitation::Noise),
        "below A0: longer than the line"
    );
    assert_eq!(voices.sounding(), 0);
    // MIDI 127 is a 3.8-sample loop at 48 kHz: every key from A0 up plays.
    assert!(voices.note_on(127, VOICING, Excitation::Noise));
}

#[test]
fn latest_detune_is_zero_tuned_and_the_loop_error_untuned() {
    let mut voices = pool();
    assert_eq!(voices.latest_detune(), None);
    voices.note_on(108, VOICING, Excitation::Noise);
    assert!(
        voices.latest_detune().unwrap().abs() < 1e-9,
        "tuned: in tune by construction"
    );
    let integer = Voicing {
        tuned: false,
        decay: Decay::Time60Db(2.0),
        inharmonicity: 0.0,
    };
    voices.note_on(108, integer, Excitation::Noise);
    // C8, stretched (S ≈ 0.02): the Rust tuning test measured +71.1.
    let cents = voices.latest_detune().unwrap();
    assert!((cents - 71.1).abs() < 0.5, "{cents}");
}

#[test]
fn a_note_keeps_its_model_and_the_pickup_moves_live() {
    let mut voices = pool();
    voices.set_model(Model::Waveguide);
    voices.note_on(57, VOICING, Excitation::Triangle { peak: 0.2 });
    voices.set_model(Model::Loop);
    let mut shape = Vec::new();
    voices.latest_shape(&mut shape);
    // A3's 217-sample loop is odd: two rails of 108 cells plus the bridge's
    // extra sample.
    assert_eq!(shape.len(), 108, "still the waveguide");
    let mut near = vec![0.0; 256];
    let mut far = vec![0.0; 256];
    let mut other = voices.clone();
    voices.set_pickup(0.1);
    voices.render(&mut near);
    other.set_pickup(0.37);
    other.render(&mut far);
    assert!(
        near.iter()
            .zip(&far)
            .any(|(first, second)| (first - second).abs() > 1e-3),
        "the pickup moved"
    );
}

fn piano() -> Voices<f64> {
    let mut voices = pool();
    voices.set_model(Model::Piano);
    voices
}

fn render(voices: &mut Voices<f64>, seconds: f64) -> Vec<f64> {
    let mut out = vec![0.0; f64_to_usize(seconds * SAMPLE_RATE).unwrap()];
    voices.render(&mut out);
    out
}

/// Measured: within 0.0027 cents (MIDI 84). ~10x.
const PIANO_TUNE_TOL_CENTS: f64 = 0.03;
/// Periods in each DFT window, and the attack skipped, s.
const PERIODS: f64 = 16.0;
const ATTACK: f64 = 0.05;

#[test]
fn the_piano_plays_in_tune() {
    for key in [33_u8, 48, 60, 72, 84] {
        let mut voices = piano();
        assert!(
            voices.note_on(key, VOICING, Excitation::Noise),
            "note on plays the piano at mf"
        );
        let out = render(&mut voices, ATTACK + 3.0 * PERIODS / frequency(key) + 0.1);
        let tail = &out[f64_to_usize(ATTACK * SAMPLE_RATE).unwrap()..];
        let fundamental_hz = frequency(key);
        let coarse = pitch(tail, SAMPLE_RATE, fundamental_hz, 0.06).unwrap();
        let measured = partial(tail, SAMPLE_RATE, coarse, PERIODS).unwrap();
        println!("MIDI {key}: {:+.4} cents", cents(measured, fundamental_hz));
        assert!(
            cents(measured, fundamental_hz).abs() < PIANO_TUNE_TOL_CENTS,
            "MIDI {key}"
        );
        assert!(
            voices.latest_detune().unwrap().abs() < 1e-9,
            "the middle string is in tune"
        );
    }
}

#[test]
fn harder_strikes_are_louder() {
    let rms = |velocity: f64| {
        let mut voices = piano();
        assert!(voices.strike(60, velocity));
        let out = render(&mut voices, 0.5);
        let sample_count = usize_to_f64(out.len());
        (out.iter().map(|sample| sample * sample).sum::<f64>() / sample_count).sqrt()
    };
    let levels = [rms(PIANISSIMO), rms(mezzo_forte()), rms(FORTISSIMO)];
    println!("C4 pp, mf, ff: {levels:?}");
    assert!(
        levels.windows(2).all(|pair| pair[1] > pair[0]),
        "{levels:?}"
    );
}

/// C4's 10th partial runs sharp by `f_k = k F₀ √(1 + B k²)` (~26 cents).
#[test]
fn the_stiffness_toggle_stretches_the_partials() {
    let key = 60;
    let fundamental_hz = frequency(key);
    let inharmonicity = crate::inharmonicity(key);
    let tenth = |stiff: bool| {
        let mut voices = piano();
        voices.set_stiffness(stiff);
        assert!(voices.strike(key, FORTISSIMO));
        let out = render(&mut voices, 1.0);
        let tail = &out[f64_to_usize(ATTACK * SAMPLE_RATE).unwrap()..];
        let expected_hz = if stiff {
            10.0 * fundamental_hz / (1.0 + inharmonicity).sqrt()
                * (1.0 + 100.0 * inharmonicity).sqrt()
        } else {
            10.0 * fundamental_hz
        };
        (
            cents(
                partial(tail, SAMPLE_RATE, expected_hz, PERIODS * 10.0).unwrap(),
                10.0 * fundamental_hz,
            ),
            cents(expected_hz, 10.0 * fundamental_hz),
        )
    };
    let (off, _) = tenth(false);
    let (on, predicted) = tenth(true);
    println!(
        "C4's 10th partial: {off:+.2} cents stiffness off, {on:+.2} on (predicted {predicted:+.2})"
    );
    assert!(off.abs() < 0.5, "{off}");
    assert!((on - predicted).abs() < 0.5, "{on} vs {predicted}");
}

#[test]
fn a_released_piano_note_fades_and_frees() {
    let mut voices = piano();
    assert!(voices.strike(60, mezzo_forte()));
    let loud: f64 = render(&mut voices, 0.01)
        .iter()
        .map(|sample| sample * sample)
        .sum();
    voices.note_off(60);
    let _ = render(&mut voices, RELEASE_DECAY_TIME_60DB * 1.5);
    let quiet: f64 = render(&mut voices, 0.01)
        .iter()
        .map(|sample| sample * sample)
        .sum();
    assert!(quiet < loud * 1e-6, "{quiet} vs {loud}");
    assert_eq!(voices.sounding(), 0);
}

/// Measured: the loudest, a ff cluster of seven treble keys, peaks at 0.77
/// at the default gain; a ff chord at 0.46.
#[test]
fn loud_piano_chords_stay_off_the_clamp() {
    for keys in [
        [36_u8, 48, 55, 60, 64, 67, 72],
        [21, 24, 28, 33, 36, 40, 43],
        [84, 88, 91, 96, 100, 103, 108],
    ] {
        let mut voices = piano();
        for key in keys {
            assert!(voices.strike(key, FORTISSIMO));
        }
        let out = render(&mut voices, 1.0);
        let peak = out
            .iter()
            .fold(0.0_f64, |peak, sample| peak.max(sample.abs()));
        println!("{keys:?} ff: peak {peak:.3}");
        assert_eq!(voices.clipped(), 0, "{keys:?}: peak {peak}");
        assert!(peak < 0.9, "{keys:?}: {peak}");
    }
}

#[test]
fn off_the_keyboard_or_a_bad_velocity_is_refused() {
    let mut voices = piano();
    assert!(!voices.strike(20, mezzo_forte()) && !voices.strike(109, mezzo_forte()));
    assert!(!voices.strike(60, 0.0) && !voices.strike(60, f64::NAN));
    assert_eq!(voices.sounding(), 0);
}

/// C4 at mf: contact 1.9 ms, recorded without growing.
#[test]
fn the_latest_strike_is_traced() {
    let mut voices = piano();
    assert_eq!(voices.strike_trace(), &[] as &[f64]);
    assert!(voices.strike(60, mezzo_forte()));
    let capacity = voices.trace.capacity();
    let _ = render(&mut voices, 0.05);
    let trace = voices.strike_trace();
    assert_eq!(trace.len(), capacity, "full, and no longer");
    let contact = trace.iter().rposition(|&force| force > 0.0).unwrap() + 1;
    let contact_ms = usize_to_f64(contact) / SAMPLE_RATE * 1e3;
    let peak = trace.iter().fold(0.0_f64, |peak, &force| peak.max(force));
    println!("C4 mf: contact {contact_ms:.2} ms, peak {peak:.1} N");
    assert!((1.0..3.0).contains(&contact_ms), "{contact_ms}");
    assert!(trace.iter().skip(contact).all(|&force| force == 0.0));
    assert!(voices.strike(48, mezzo_forte()));
    assert!(
        voices.strike_trace().is_empty(),
        "a new strike starts a new trace"
    );
}

#[test]
fn stealing_takes_the_oldest_even_after_a_replay() {
    // Replaying 60 makes it the newest, so the oldest is 61.
    let mut voices = pool();
    for key in 60..60 + u8::try_from(VOICES).unwrap() {
        assert!(voices.note_on(key, VOICING, Excitation::Noise));
    }
    assert!(voices.note_on(60, VOICING, Excitation::Noise));
    assert!(voices.note_on(80, VOICING, Excitation::Noise));
    let keys: Vec<_> = voices.keys().flatten().collect();
    assert!(keys.contains(&60) && keys.contains(&80), "{keys:?}");
    assert!(!keys.contains(&61), "the oldest (61) was stolen: {keys:?}");
}

/// Twelve noise plucks at a time, rendered for 4096 samples at `gain`.
fn chord(gain: f64) -> (Vec<f64>, u64) {
    let mut voices = pool();
    voices.set_gain(gain);
    for key in 60..72 {
        assert!(voices.note_on(key, VOICING, Excitation::Noise));
    }
    let mut out = vec![0.0; 4096];
    voices.render(&mut out);
    (out, voices.clipped())
}

#[test]
fn the_gain_scales_the_output() {
    // Nothing clips, so halving the gain halves every sample exactly.
    let (sixteenth, clipped_sixteenth) = chord(0.0625);
    let (thirty_second, clipped_thirty_second) = chord(0.031_25);
    assert_eq!((clipped_sixteenth, clipped_thirty_second), (0, 0));
    assert!(sixteenth.iter().any(|&sample| sample != 0.0));
    assert!(
        sixteenth
            .iter()
            .zip(&thirty_second)
            .all(|(louder, quieter)| quieter.to_bits() == (louder / 2.0).to_bits())
    );
}

#[test]
fn the_clamp_holds_both_signs_and_counts_what_it_clips() {
    let (out, clipped) = chord(1.0);
    assert!(out.iter().all(|sample| sample.abs() <= 1.0));
    assert!(out.contains(&1.0) && out.contains(&-1.0), "clips both ways");
    let at_the_rail = out
        .iter()
        .filter(|sample| sample.abs().to_bits() == 1.0_f64.to_bits())
        .count();
    assert_eq!(usize::try_from(clipped).unwrap(), at_the_rail);
}

#[test]
fn the_piano_reads_its_strings_mean_detune() {
    let mut voices = piano();
    assert!(voices.strike(60, mezzo_forte()));
    let cents = voices.latest_detune().unwrap();
    assert!(cents.abs() < 1.0, "{cents} cents");
}

#[test]
fn choosing_the_piano_designs_its_keys_and_nothing_else_does() {
    let mut voices = pool();
    voices.set_model(Model::Loop);
    voices.set_model(Model::Waveguide);
    assert!(voices.designs.is_none());
    voices.set_model(Model::Piano);
    assert!(
        voices.designs.is_some(),
        "designed on selection, not at the first strike"
    );
}

/// Largest sample-to-sample step in the 10 ms after note off over that in
/// the 10 ms before.
fn release_step_ratio(model: Model, key: u8) -> f64 {
    const BLOCK: usize = 128;
    let mut voices = pool();
    voices.set_model(model);
    if model == Model::Piano {
        assert!(voices.strike(key, mezzo_forte()));
    } else {
        assert!(voices.note_on(key, VOICING, Excitation::Noise));
    }
    let note_off_block = f64_to_usize(0.25 * SAMPLE_RATE).unwrap() / BLOCK;
    let mut out = Vec::new();
    for block_number in 0..note_off_block + 8 {
        if block_number == note_off_block {
            voices.note_off(key);
        }
        let mut block = vec![0.0; BLOCK];
        voices.render(&mut block);
        out.extend(block);
    }
    let note_off_sample = note_off_block * BLOCK;
    let window = f64_to_usize(0.01 * SAMPLE_RATE).unwrap();
    let largest_step = |first: usize, end: usize| {
        (first..end)
            .map(|sample| (out[sample] - out[sample - 1]).abs())
            .fold(0.0, f64::max)
    };
    largest_step(note_off_sample, note_off_sample + window)
        / largest_step(note_off_sample - window, note_off_sample)
}

#[test]
fn releasing_a_note_doesnt_click() {
    // A damper applied in one sample (a 23 % drop at C4) was a step about
    // seven times the note's own; it now comes in over RELEASE_RAMP.
    for model in [Model::Loop, Model::Waveguide, Model::Piano] {
        for key in [33_u8, 60, 84] {
            let ratio = release_step_ratio(model, key);
            assert!(
                ratio < 1.1,
                "{model:?}, MIDI {key}: a step {ratio:.2}× the note's own at release"
            );
        }
    }
}

#[test]
fn a_refused_strike_leaves_the_ringing_note_alone() {
    // A refused strike leaves the output bit-identical to an undisturbed run.
    let run = |refused: bool| {
        let mut voices = piano();
        assert!(voices.strike(67, 0.1));
        let mut out = render(&mut voices, 0.01);
        if refused {
            assert!(!voices.strike(67, 1e300));
        }
        out.extend(render(&mut voices, 0.05));
        out.iter()
            .map(|sample| sample.to_bits())
            .collect::<Vec<_>>()
    };
    assert_eq!(run(true), run(false));
}
