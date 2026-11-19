//! Rendered audio is reproducible: a short performance renders the same
//! samples, bit for bit, every time (`docs/12-acoustic-foundations.md`,
//! "Measuring").
#![cfg(test)]

use acoustic::{Decay, Excitation, Model, Scalar, Voices, Voicing, inharmonicity};
use math::convert::usize_to_f64;

const SAMPLE_RATE: f64 = 48_000.0;
const BLOCK: usize = 128;
const BLOCKS: usize = 375;
const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::T60(1.5),
    inharmonicity: 0.0,
};

fn perform<S: Scalar>() -> (Vec<S>, u64) {
    perform_with::<S>(Model::Loop)
}

fn perform_with<S: Scalar>(model: Model) -> (Vec<S>, u64) {
    perform_voiced::<S>(model, |_| VOICING)
}

fn perform_voiced<S: Scalar>(model: Model, voicing: impl Fn(u8) -> Voicing) -> (Vec<S>, u64) {
    let mut voices = Voices::<S>::new(SAMPLE_RATE, 7).unwrap();
    voices.set_model(model);
    let mut out = Vec::new();
    let mut block = vec![S::ZERO; BLOCK];
    for block_number in 0..BLOCKS {
        match block_number {
            0 => {
                for key in [48, 52, 55, 60, 64, 67, 72] {
                    voices.note_on(key, voicing(key), Excitation::Noise);
                }
            }
            40 => {
                voices.note_on(76, voicing(76), Excitation::Triangle { peak: 0.1 });
            }
            100 => voices.note_off(48),
            200 => {
                voices.note_on(79, voicing(79), Excitation::Noise);
            }
            _ => {}
        }
        voices.render(&mut block);
        out.extend_from_slice(&block);
    }
    (out, voices.clipped())
}

fn bits<S: Scalar>(samples: &[S]) -> Vec<u64> {
    samples
        .iter()
        .map(|sample| sample.to_f64().to_bits())
        .collect()
}

#[test]
fn a_performance_is_repeatable() {
    assert_eq!(bits(&perform::<f32>().0), bits(&perform::<f32>().0));
    assert_eq!(bits(&perform::<f64>().0), bits(&perform::<f64>().0));
}

/// Measured: a seven-note chord at the default gain (¼) peaks at 0.824, so
/// nothing reaches the ±1 clamp.
#[test]
fn a_chord_at_the_default_gain_is_not_clipped() {
    let (samples, clipped) = perform::<f64>();
    let peak = samples
        .iter()
        .fold(0.0_f64, |peak, sample| peak.max(sample.abs()));
    assert_eq!(clipped, 0, "peak {peak}");
    assert!(peak < 0.9, "{peak}");
}

#[test]
fn the_waveguide_performance_is_repeatable_and_unclipped() {
    assert_eq!(
        bits(&perform_with::<f32>(Model::Waveguide).0),
        bits(&perform_with::<f32>(Model::Waveguide).0)
    );
    let (first, clipped) = perform_with::<f64>(Model::Waveguide);
    assert_eq!(clipped, 0, "the waveguide performance doesn't clip");
    assert_eq!(bits(&first), bits(&perform_with::<f64>(Model::Waveguide).0));
}

#[test]
fn the_stiff_performance_is_repeatable_and_differs() {
    let stiff = |key| Voicing {
        inharmonicity: inharmonicity(key),
        ..VOICING
    };
    let once = bits(&perform_voiced::<f64>(Model::Waveguide, stiff).0);
    assert_eq!(
        once,
        bits(&perform_voiced::<f64>(Model::Waveguide, stiff).0)
    );
    assert_eq!(
        bits(&perform_voiced::<f32>(Model::Waveguide, stiff).0),
        bits(&perform_voiced::<f32>(Model::Waveguide, stiff).0)
    );
    assert_ne!(
        once,
        bits(&perform_with::<f64>(Model::Waveguide).0),
        "stiffness changes the sound"
    );
}

fn perform_piano<S: Scalar>() -> (Vec<S>, u64) {
    let mut voices = Voices::<S>::new(SAMPLE_RATE, 7).unwrap();
    voices.set_model(Model::Piano);
    let mut out = Vec::new();
    let mut block = vec![S::ZERO; BLOCK];
    for block_number in 0..BLOCKS {
        match block_number {
            0 => {
                for (index, key) in [48_u8, 52, 55, 60, 64, 67, 72].into_iter().enumerate() {
                    let velocity = 0.5 + 0.6 * usize_to_f64(index);
                    assert!(voices.strike(key, velocity));
                }
            }
            40 => assert!(voices.strike(76, acoustic::hammer::FORTISSIMO)),
            100 => voices.note_off(48),
            200 => assert!(voices.strike(79, acoustic::hammer::PIANISSIMO)),
            _ => {}
        }
        voices.render(&mut block);
        out.extend_from_slice(&block);
    }
    (out, voices.clipped())
}

#[test]
fn the_piano_performance_is_repeatable_and_unclipped() {
    let (f64_samples, clipped) = perform_piano::<f64>();
    assert_eq!(clipped, 0, "the piano performance doesn't clip");
    assert_eq!(bits(&f64_samples), bits(&perform_piano::<f64>().0));
    assert_eq!(
        bits(&perform_piano::<f32>().0),
        bits(&perform_piano::<f32>().0)
    );
}
