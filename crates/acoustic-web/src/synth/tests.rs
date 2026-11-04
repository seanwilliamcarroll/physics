use super::{MAX_FRAMES, Synth};
use crate::abi::{EXCITATION_NOISE, EXCITATION_TRIANGLE};

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
