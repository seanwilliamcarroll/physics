use super::{MAX_FRAMES, SPECTRUM_SIZE, Synth};
use crate::abi::{EXCITATION_NOISE, EXCITATION_TRIANGLE, MODEL_LOOP, MODEL_WAVEGUIDE};

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
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        clippy::cast_precision_loss,
        reason = "test bins"
    )]
    let near = |hz: f64| -> f32 {
        let k = (hz * SPECTRUM_SIZE as f64 / FS).round() as usize;
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
