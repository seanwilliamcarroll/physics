use super::{Model, RELEASE_T60, VOICES, Voices};
use crate::hammer::{FORTISSIMO, PIANISSIMO, mezzo_forte};
use crate::measure::{cents, partial, pitch};
use crate::piano::frequency;
use crate::{Decay, Excitation, Voicing};
use math::convert::{f64_to_usize, usize_to_f64};

const FS: f64 = 48_000.0;
const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::T60(2.0),
    inharmonicity: 0.0,
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
    let blocks = f64_to_usize(FS * RELEASE_T60 * 1.5 / 128.0).unwrap();
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
        inharmonicity: 0.0,
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

/// A piano pool, the piano chosen (its keys designed).
fn piano() -> Voices<f64> {
    let mut v = pool();
    v.set_model(Model::Piano);
    v
}

fn render(v: &mut Voices<f64>, secs: f64) -> Vec<f64> {
    let mut out = vec![0.0; f64_to_usize(secs * FS).unwrap()];
    v.render(&mut out);
    out
}

/// Measured (A3.5): within 0.0027 cents (MIDI 84). The strings sit about
/// the note (±½, or −1, 0, +1 cent), so their sum's fundamental is the
/// note's. ~10x.
const PIANO_TUNE_TOL_CENTS: f64 = 0.03;
/// Periods in each DFT window, and the attack skipped, s.
const PERIODS: f64 = 16.0;
const ATTACK: f64 = 0.05;

#[test]
fn the_piano_plays_in_tune() {
    for key in [33_u8, 48, 60, 72, 84] {
        let mut v = piano();
        assert!(
            v.note_on(key, VOICING, Excitation::Noise),
            "note on plays the piano at mf"
        );
        let out = render(&mut v, ATTACK + 3.0 * PERIODS / frequency(key) + 0.1);
        let tail = &out[f64_to_usize(ATTACK * FS).unwrap()..];
        let f0 = frequency(key);
        let coarse = pitch(tail, FS, f0, 0.06).unwrap();
        let got = partial(tail, FS, coarse, PERIODS).unwrap();
        println!("MIDI {key}: {:+.4} cents", cents(got, f0));
        assert!(cents(got, f0).abs() < PIANO_TUNE_TOL_CENTS, "MIDI {key}");
        assert!(
            v.latest_detune().unwrap().abs() < 1e-9,
            "the middle string is in tune"
        );
    }
}

#[test]
fn harder_strikes_are_louder() {
    let rms = |velocity: f64| {
        let mut v = piano();
        assert!(v.strike(60, velocity));
        let out = render(&mut v, 0.5);
        let n = usize_to_f64(out.len());
        (out.iter().map(|x| x * x).sum::<f64>() / n).sqrt()
    };
    let levels = [rms(PIANISSIMO), rms(mezzo_forte()), rms(FORTISSIMO)];
    println!("C4 pp, mf, ff: {levels:?}");
    assert!(levels.windows(2).all(|w| w[1] > w[0]), "{levels:?}");
}

/// The stiffness toggle: off, C4's 10th partial is harmonic; on, it runs
/// sharp by what `B` says (`f_k = k F₀ √(1 + B k²)`: about 26 cents).
#[test]
fn the_stiffness_toggle_stretches_the_partials() {
    let key = 60;
    let f0 = frequency(key);
    let b = crate::inharmonicity(key);
    let tenth = |stiff: bool| {
        let mut v = piano();
        v.set_stiffness(stiff);
        assert!(v.strike(key, FORTISSIMO));
        let out = render(&mut v, 1.0);
        let tail = &out[f64_to_usize(ATTACK * FS).unwrap()..];
        let want = if stiff {
            10.0 * f0 / (1.0 + b).sqrt() * (1.0 + 100.0 * b).sqrt()
        } else {
            10.0 * f0
        };
        (
            cents(partial(tail, FS, want, PERIODS * 10.0).unwrap(), 10.0 * f0),
            cents(want, 10.0 * f0),
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
    let mut v = piano();
    assert!(v.strike(60, mezzo_forte()));
    let loud: f64 = render(&mut v, 0.01).iter().map(|x| x * x).sum();
    v.note_off(60);
    let _ = render(&mut v, RELEASE_T60 * 1.5);
    let quiet: f64 = render(&mut v, 0.01).iter().map(|x| x * x).sum();
    assert!(quiet < loud * 1e-6, "{quiet} vs {loud}");
    assert_eq!(v.sounding(), 0);
}

/// Measured (A3.5): the loudest, a ff cluster of seven treble keys, peaks
/// at 0.77 at the default gain (the attack's spike); a ff chord at 0.46.
#[test]
fn loud_piano_chords_stay_off_the_clamp() {
    for keys in [
        [36_u8, 48, 55, 60, 64, 67, 72],
        [21, 24, 28, 33, 36, 40, 43],
        [84, 88, 91, 96, 100, 103, 108],
    ] {
        let mut v = piano();
        for k in keys {
            assert!(v.strike(k, FORTISSIMO));
        }
        let out = render(&mut v, 1.0);
        let peak = out.iter().fold(0.0_f64, |m, x| m.max(x.abs()));
        println!("{keys:?} ff: peak {peak:.3}");
        assert_eq!(v.clipped(), 0, "{keys:?}: peak {peak}");
        assert!(peak < 0.9, "{keys:?}: {peak}");
    }
}

#[test]
fn off_the_keyboard_or_a_bad_velocity_is_refused() {
    let mut v = piano();
    assert!(!v.strike(20, mezzo_forte()) && !v.strike(109, mezzo_forte()));
    assert!(!v.strike(60, 0.0) && !v.strike(60, f64::NAN));
    assert_eq!(v.sounding(), 0);
}

/// The strike trace: the latest strike's hammer force from impact, its
/// contact inside it (C4 at mf: 1.9 ms), recorded without growing.
#[test]
fn the_latest_strike_is_traced() {
    let mut v = piano();
    assert_eq!(v.strike_trace(), &[] as &[f64]);
    assert!(v.strike(60, mezzo_forte()));
    let capacity = v.trace.capacity();
    let _ = render(&mut v, 0.05);
    let trace = v.strike_trace();
    assert_eq!(trace.len(), capacity, "full, and no longer");
    let contact = trace.iter().rposition(|&f| f > 0.0).unwrap() + 1;
    let ms = usize_to_f64(contact) / FS * 1e3;
    let peak = trace.iter().fold(0.0_f64, |m, &f| m.max(f));
    println!("C4 mf: contact {ms:.2} ms, peak {peak:.1} N");
    assert!((1.0..3.0).contains(&ms), "{ms}");
    assert!(trace.iter().skip(contact).all(|&f| f == 0.0));
    assert!(v.strike(48, mezzo_forte()));
    assert!(
        v.strike_trace().is_empty(),
        "a new strike starts a new trace"
    );
}
