//! Rendered audio is reproducible, and the same on every platform: a
//! golden hash of a short performance, checked natively and on wasm
//! (`cargo xtask test-wasm`), like the engine's scenes
//! (`docs/12-acoustic-foundations.md`, "Measuring").
#![cfg(test)]

use acoustic::{Decay, Excitation, Model, Scalar, Voices, Voicing, inharmonicity};
use math::Fnv1a;
use math::convert::usize_to_f64;

const FS: f64 = 48_000.0;
const BLOCK: usize = 128;
/// Blocks in the 1 s performance: 48000 / 128.
const BLOCKS: usize = 375;
const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::T60(1.5),
    inharmonicity: 0.0,
};

/// A short performance, 1 s: a seven-note chord (noise), a
/// triangle-plucked melody note, a release, and one more note. Returns
/// the samples and how many were clipped.
fn perform<S: Scalar>() -> (Vec<S>, u64) {
    perform_with::<S>(Model::Loop)
}

/// The same performance played by `model`.
fn perform_with<S: Scalar>(model: Model) -> (Vec<S>, u64) {
    perform_voiced::<S>(model, |_| VOICING)
}

/// The same performance, each key voiced by `voicing`.
fn perform_voiced<S: Scalar>(model: Model, voicing: impl Fn(u8) -> Voicing) -> (Vec<S>, u64) {
    let mut v = Voices::<S>::new(FS, 7).unwrap();
    v.set_model(model);
    let mut out = Vec::new();
    let mut block = vec![S::ZERO; BLOCK];
    for b in 0..BLOCKS {
        match b {
            0 => {
                for key in [48, 52, 55, 60, 64, 67, 72] {
                    v.note_on(key, voicing(key), Excitation::Noise);
                }
            }
            40 => {
                v.note_on(76, voicing(76), Excitation::Triangle { peak: 0.1 });
            }
            100 => v.note_off(48),
            200 => {
                v.note_on(79, voicing(79), Excitation::Noise);
            }
            _ => {}
        }
        v.render(&mut block);
        out.extend_from_slice(&block);
    }
    (out, v.clipped())
}

/// FNV-1a (`math`) of every sample's `f64` bits, little-endian.
fn hash<S: Scalar>(samples: &[S]) -> u64 {
    let mut h = Fnv1a::new();
    for x in samples {
        h.write(&x.to_f64().to_bits().to_le_bytes());
    }
    h.finish()
}

#[test]
fn a_performance_is_repeatable() {
    assert_eq!(hash(&perform::<f32>().0), hash(&perform::<f32>().0));
    assert_eq!(hash(&perform::<f64>().0), hash(&perform::<f64>().0));
}

/// Golden hashes of [`perform`]'s samples (each as `f64` bits): (f32,
/// f64). Recorded on aarch64-apple-darwin, Rust 1.99.1; `test-wasm` checks
/// the same values on wasm32-wasip1. The note-on coefficients use `libm`,
/// so they're the same bits everywhere (`docs/00-scope.md`). If a change
/// is intended, paste the new values from the failure message.
const GOLDEN: (u64, u64) = (0x1aff_3f30_7adf_8fe0, 0xe420_bd73_51ea_7069);

#[test]
fn golden_hashes_are_unchanged() {
    let got = (hash(&perform::<f32>().0), hash(&perform::<f64>().0));
    assert_eq!(
        got, GOLDEN,
        "golden hashes changed: (f32, f64) = ({:#018x}, {:#018x})",
        got.0, got.1
    );
}

/// Measured (A1.4): a seven-note chord at the default gain (¼) peaks at
/// 0.824, so nothing reaches the ±1 clamp.
#[test]
fn a_chord_at_the_default_gain_is_not_clipped() {
    let (samples, clipped) = perform::<f64>();
    let peak = samples.iter().fold(0.0_f64, |m, x| m.max(x.abs()));
    assert_eq!(clipped, 0, "peak {peak}");
    assert!(peak < 0.9, "{peak}");
}

/// Golden hashes of the performance played by A2's waveguide (pickup at
/// the default): (f32, f64), native and on wasm.
const WAVEGUIDE_GOLDEN: (u64, u64) = (0x19c6_5466_98f4_6cb4, 0xf5b5_643b_342c_dc00);

#[test]
fn waveguide_performance_golden_hashes_are_unchanged() {
    let got = (
        hash(&perform_with::<f32>(Model::Waveguide).0),
        hash(&perform_with::<f64>(Model::Waveguide).0),
    );
    let (_, clipped) = perform_with::<f64>(Model::Waveguide);
    assert_eq!(clipped, 0, "the waveguide performance doesn't clip");
    assert_eq!(
        got, WAVEGUIDE_GOLDEN,
        "golden hashes changed: ({:#018x}, {:#018x})",
        got.0, got.1
    );
}

/// Golden hashes of the waveguide performance with each key's stiffness
/// (`docs/14-piano.md`): the dispersion design (placement, refinement) is
/// `libm` and fixed iteration counts, so the same bits on wasm.
const STIFF_GOLDEN: (u64, u64) = (0x25dc_d66f_b509_26c1, 0x3dcb_5844_3023_7a24);

#[test]
fn stiff_performance_golden_hashes_are_unchanged() {
    let stiff = |key| Voicing {
        inharmonicity: inharmonicity(key),
        ..VOICING
    };
    let got = (
        hash(&perform_voiced::<f32>(Model::Waveguide, stiff).0),
        hash(&perform_voiced::<f64>(Model::Waveguide, stiff).0),
    );
    assert_ne!(got, WAVEGUIDE_GOLDEN, "stiffness changes the sound");
    assert_eq!(
        got, STIFF_GOLDEN,
        "golden hashes changed: ({:#018x}, {:#018x})",
        got.0, got.1
    );
}

/// The piano's performance: the chord struck at mixed velocities, a
/// melody note ff, a release, one more note pp; through the body.
fn perform_piano<S: Scalar>() -> (Vec<S>, u64) {
    let mut v = Voices::<S>::new(FS, 7).unwrap();
    v.set_model(Model::Piano);
    let mut out = Vec::new();
    let mut block = vec![S::ZERO; BLOCK];
    for b in 0..BLOCKS {
        match b {
            0 => {
                for (i, key) in [48_u8, 52, 55, 60, 64, 67, 72].into_iter().enumerate() {
                    let velocity = 0.5 + 0.6 * usize_to_f64(i);
                    assert!(v.strike(key, velocity));
                }
            }
            40 => assert!(v.strike(76, acoustic::hammer::FORTISSIMO)),
            100 => v.note_off(48),
            200 => assert!(v.strike(79, acoustic::hammer::PIANISSIMO)),
            _ => {}
        }
        v.render(&mut block);
        out.extend_from_slice(&block);
    }
    (out, v.clipped())
}

/// Golden hashes of [`perform_piano`]: (f32, f64), native and on wasm. The
/// designs and the hammers are `f64` with `libm`, so the same bits.
const PIANO_GOLDEN: (u64, u64) = (0x3c7d_44d6_a276_fca4, 0xdf7e_6a8e_785a_e0b4);

#[test]
fn piano_performance_golden_hashes_are_unchanged() {
    let (f64_samples, clipped) = perform_piano::<f64>();
    assert_eq!(clipped, 0, "the piano performance doesn't clip");
    let got = (hash(&perform_piano::<f32>().0), hash(&f64_samples));
    assert_eq!(
        got, PIANO_GOLDEN,
        "golden hashes changed: ({:#018x}, {:#018x})",
        got.0, got.1
    );
}
