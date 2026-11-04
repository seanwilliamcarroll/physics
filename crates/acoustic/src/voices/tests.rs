use super::{Model, RELEASE_T60, VOICES, Voices};
use crate::{Decay, Excitation, Voicing};

const FS: f64 = 48_000.0;
const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::T60(2.0),
};

fn pool() -> Voices<f64> {
    Voices::new(FS, 1).unwrap()
}

#[test]
fn a_note_past_the_pool_steals_the_oldest() {
    let mut v = pool();
    for key in 60..60 + u8::try_from(VOICES).unwrap() {
        assert!(v.note_on(key, VOICING, Excitation::Noise));
    }
    assert_eq!(v.sounding(), VOICES);
    assert!(v.note_on(80, VOICING, Excitation::Noise));
    let keys: Vec<_> = v.keys().flatten().collect();
    assert!(!keys.contains(&60), "the oldest (60) was stolen: {keys:?}");
    assert!(keys.contains(&80));
}

#[test]
fn replaying_a_key_reuses_its_voice() {
    let mut v = pool();
    v.note_on(60, VOICING, Excitation::Noise);
    v.note_on(60, VOICING, Excitation::Noise);
    assert_eq!(v.sounding(), 1);
}

#[test]
fn note_off_fades_and_frees_the_voice() {
    let mut v = pool();
    v.note_on(69, VOICING, Excitation::Noise);
    let mut block = vec![0.0; 128];
    v.render(&mut block);
    let loud = block.iter().map(|x| x * x).sum::<f64>();
    v.note_off(69);
    // Render the release time and a little: silent (80 dB down), freed.
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "test lengths"
    )]
    let blocks = (FS * RELEASE_T60 * 1.5 / 128.0) as usize;
    for _ in 0..blocks {
        v.render(&mut block);
    }
    let quiet = block.iter().map(|x| x * x).sum::<f64>();
    assert!(quiet < loud * 1e-8, "{quiet} vs {loud}");
    assert_eq!(v.sounding(), 0);
}

#[test]
fn keys_below_a0_are_refused_and_the_top_plays() {
    let mut v = pool();
    assert!(
        !v.note_on(20, VOICING, Excitation::Noise),
        "below A0: longer than the line"
    );
    assert_eq!(v.sounding(), 0);
    // MIDI 127 (G9, 12.5 kHz) is a 3.8-sample loop at 48 kHz: N = 3 plus
    // the allpass. Every MIDI key from A0 up is playable.
    assert!(v.note_on(127, VOICING, Excitation::Noise));
}

#[test]
fn latest_detune_is_zero_tuned_and_the_loop_error_untuned() {
    let mut v = pool();
    assert_eq!(v.latest_detune(), None);
    v.note_on(108, VOICING, Excitation::Noise);
    assert!(
        v.latest_detune().unwrap().abs() < 1e-9,
        "tuned: in tune by construction"
    );
    let integer = Voicing {
        tuned: false,
        decay: Decay::T60(2.0),
    };
    v.note_on(108, integer, Excitation::Noise);
    // C8, stretched (S ≈ 0.02): the Rust tuning test measured +71.1.
    let cents = v.latest_detune().unwrap();
    assert!((cents - 71.1).abs() < 0.5, "{cents}");
}

#[test]
fn a_note_keeps_its_model_and_the_pickup_moves_live() {
    let mut v = pool();
    v.set_model(Model::Waveguide);
    v.note_on(57, VOICING, Excitation::Triangle { peak: 0.2 });
    v.set_model(Model::Loop);
    let mut shape = Vec::new();
    v.latest_shape(&mut shape);
    // A3 at 48 kHz, tuned: a 217-sample loop (⌊218.18 − ½ − 0.1⌋), odd, so
    // two rails of 108 cells and the bridge's extra sample (the loop's own
    // line would be 217 long).
    assert_eq!(shape.len(), 108, "still the waveguide");
    // Moving the pickup changes the sound of the ringing note.
    let mut a = vec![0.0; 256];
    let mut b = vec![0.0; 256];
    let mut w = v.clone();
    v.set_pickup(0.1);
    v.render(&mut a);
    w.set_pickup(0.37);
    w.render(&mut b);
    assert!(
        a.iter().zip(&b).any(|(x, y)| (x - y).abs() > 1e-3),
        "the pickup moved"
    );
}
