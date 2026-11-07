use super::{MAX_FRAMES, MAX_SAMPLE_RATE, SPECTRUM_SIZE, Synth};
use crate::abi::{EXCITATION_NOISE, EXCITATION_TRIANGLE, MODEL_LOOP, MODEL_PIANO, MODEL_WAVEGUIDE};
use math::convert::{f64_to_usize, usize_to_f64};

const FS: f64 = 48_000.0;

fn energy(s: &[f32]) -> f64 {
    s.iter().map(|&x| f64::from(x) * f64::from(x)).sum()
}

#[test]
fn silent_until_a_note_then_sounding() {
    let mut s = Synth::new(FS, 1).unwrap();
    assert_eq!(energy(s.render(128).unwrap()), 0.0);
    assert_eq!(s.snapshot(), &[] as &[f32]);
    assert!(s.note_on(69));
    assert!(energy(s.render(128).unwrap()) > 0.0);
    // A4 at 48 kHz: a 109-sample loop (48000 / 440 = 109.09).
    assert_eq!(
        s.snapshot().len(),
        108,
        "N = ⌊109.09 − ½ − 0.1⌋ (S = ½: A4 needs shortening): {}",
        s.snapshot().len()
    );
    assert_eq!(s.sounding(), 1);
}

#[test]
fn render_refuses_more_than_its_buffer() {
    let mut s = Synth::new(FS, 1).unwrap();
    assert!(s.render(MAX_FRAMES).is_some());
    assert!(s.render(MAX_FRAMES + 1).is_none());
}

#[test]
fn setters_refuse_bad_values() {
    let mut s = Synth::new(FS, 1).unwrap();
    assert!(!s.note_on(20), "below A0");
    assert!(!s.note_on(300), "not a MIDI key");
    assert!(!s.set_t60(0.0) && !s.set_t60(f64::INFINITY) && s.set_t60(1.0));
    assert!(!s.set_gain(1.5) && !s.set_gain(-0.1) && s.set_gain(0.5));
    assert!(!s.set_excitation(9, 0.5), "unknown code");
    assert!(
        !s.set_excitation(EXCITATION_TRIANGLE, 1.0),
        "peak at the end"
    );
    assert!(s.set_excitation(EXCITATION_TRIANGLE, 0.2));
    assert!(
        s.set_excitation(EXCITATION_NOISE, f64::NAN),
        "noise ignores the peak"
    );
    assert!(Synth::new(0.0, 1).is_none());
}

#[test]
fn the_sample_rate_is_capped() {
    assert!(
        Synth::new(MAX_SAMPLE_RATE, 1).is_some(),
        "the cap itself is fine"
    );
    for fs in [
        MAX_SAMPLE_RATE * 1.000_001,
        768_000.0,
        1e9,
        f64::MAX,
        f64::INFINITY,
        f64::NAN,
    ] {
        assert!(Synth::new(fs, 1).is_none(), "{fs} Hz");
    }
}

#[test]
fn the_spectrum_peaks_at_the_notes_harmonics() {
    // A4 on the waveguide, plucked at 1/2: odd harmonics only.
    let mut s = Synth::new(FS, 1).unwrap();
    assert!(s.set_model(MODEL_WAVEGUIDE));
    assert!(s.set_excitation(EXCITATION_TRIANGLE, 0.5));
    assert!(s.set_pickup(0.1));
    s.note_on(69);
    for _ in 0..(SPECTRUM_SIZE / 128) {
        s.render(128);
    }
    let db = s.spectrum().to_vec();
    assert_eq!(db.len(), SPECTRUM_SIZE / 2);
    // Bin k is k · 48000 / 4096 Hz: 440 Hz is bin 37.5, 880 Hz bin 75.
    let near = |hz: f64| -> f32 {
        let k = f64_to_usize((hz * usize_to_f64(SPECTRUM_SIZE) / FS).round()).unwrap();
        db[k - 2..=k + 2].iter().copied().fold(f32::MIN, f32::max)
    };
    let (first, second, third) = (near(440.0), near(880.0), near(1320.0));
    println!("harmonics 1-3: {first:.1} / {second:.1} / {third:.1} dB");
    assert!(
        first > second + 30.0,
        "the 2nd is missing: {first} vs {second}"
    );
    assert!(third > second + 20.0, "the 3rd isn't: {third} vs {second}");
}

#[test]
fn model_and_pickup_setters_refuse_bad_values() {
    let mut s = Synth::new(FS, 1).unwrap();
    assert!(s.set_model(MODEL_LOOP) && s.set_model(MODEL_WAVEGUIDE));
    assert!(!s.set_model(7));
    assert!(s.set_pickup(0.5) && !s.set_pickup(1.5) && !s.set_pickup(f64::NAN));
}

/// Energy of the next `blocks` quanta.
fn level(s: &mut Synth, blocks: usize) -> f64 {
    (0..blocks).map(|_| energy(s.render(128).unwrap())).sum()
}

#[test]
fn the_piano_strikes_louder_when_harder() {
    let mut levels = Vec::new();
    for velocity in [0.5, 1.58, 5.0] {
        let mut s = Synth::new(FS, 1).unwrap();
        assert!(s.set_model(MODEL_PIANO));
        assert!(s.note_on_velocity(60, velocity));
        assert_eq!(s.sounding(), 1);
        levels.push(level(&mut s, 64));
    }
    println!("C4 pp, mf, ff energy: {levels:?}");
    assert!(levels.windows(2).all(|w| w[1] > w[0]), "{levels:?}");
    assert_eq!(levels.len(), 3);
}

#[test]
fn piano_strikes_refuse_bad_keys_and_velocities() {
    let mut s = Synth::new(FS, 1).unwrap();
    assert!(s.set_model(MODEL_PIANO));
    assert!(!s.note_on_velocity(20, 1.0), "below A0");
    assert!(!s.note_on_velocity(300, 1.0), "not a key");
    assert!(!s.note_on_velocity(60, 0.0) && !s.note_on_velocity(60, f64::INFINITY));
    assert!(s.note_on(60), "a plain note on is an mf strike");
    assert_eq!(s.sounding(), 1);
    s.set_stiffness(false);
    assert!(s.note_on_velocity(62, 1.0));
}

// Each control changes what the synth does: cargo-mutants found that
// `note_off`, `set_tuned` and `set_stiffness` could each be replaced by
// nothing, and `sounding`, `latest_cents` and `clipped` by a constant,
// with every test still passing.

#[test]
fn note_off_releases_the_note() {
    let mut held = Synth::new(FS, 1).unwrap();
    let mut released = Synth::new(FS, 1).unwrap();
    for s in [&mut held, &mut released] {
        assert!(s.set_t60(5.0));
        assert!(s.note_on(57));
        level(s, 8);
    }
    released.note_off(57);
    released.note_off(300); // not a key: nothing to release
    // Past the release's first 43 ms (its damper comes in over 10 ms), a
    // released note is over 20 dB under a held one.
    level(&mut held, 16);
    level(&mut released, 16);
    let (h, r) = (level(&mut held, 48), level(&mut released, 48));
    assert!(r < 0.01 * h, "released {r:e}, held {h:e}");
}

#[test]
fn sounding_counts_the_voices() {
    let mut s = Synth::new(FS, 1).unwrap();
    assert_eq!(s.sounding(), 0);
    assert!(s.note_on(60) && s.note_on(64));
    assert_eq!(s.sounding(), 2);
}

#[test]
fn tuned_notes_hit_their_pitch_and_integer_loops_miss_it() {
    let mut s = Synth::new(FS, 1).unwrap();
    assert_eq!(s.latest_cents(), 0.0, "before any note");
    assert!(s.note_on(69));
    let tuned = s.latest_cents();
    s.set_tuned(false);
    assert!(s.note_on(69));
    let integer = s.latest_cents();
    // A4's 109.09-sample period rounded to a whole loop: several cents off.
    assert!(tuned.abs() < 0.01, "tuned: {tuned} cents");
    assert!(
        integer.abs() > 1.0 && integer.abs() < 50.0,
        "integer loop: {integer} cents"
    );
}

#[test]
fn stiffness_changes_the_piano_strike() {
    let render = |stiff: bool| {
        let mut s = Synth::new(FS, 1).unwrap();
        assert!(s.set_model(MODEL_PIANO));
        s.set_stiffness(stiff);
        assert!(s.note_on_velocity(36, 1.58));
        (0..16)
            .flat_map(|_| s.render(128).unwrap().to_vec())
            .collect::<Vec<f32>>()
    };
    assert_ne!(
        render(true),
        render(false),
        "stiff and ideal strings sound alike"
    );
}

#[test]
fn a_loud_chord_clips_and_is_counted() {
    let mut s = Synth::new(FS, 1).unwrap();
    assert_eq!(s.clipped(), 0);
    assert!(s.set_gain(1.0));
    for key in 60..72 {
        assert!(s.note_on(key));
    }
    level(&mut s, 8);
    assert!(s.clipped() > 0);
}

#[test]
fn a_triangle_peak_must_be_inside_the_line() {
    let mut s = Synth::new(FS, 1).unwrap();
    assert!(!s.set_excitation(EXCITATION_TRIANGLE, 0.0), "at the start");
    assert!(s.set_excitation(EXCITATION_TRIANGLE, f64::MIN_POSITIVE));
}
