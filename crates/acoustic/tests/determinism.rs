//! Rendered audio is reproducible, and the same on every platform: a
//! golden hash of a short performance, checked natively and on wasm
//! (`cargo xtask test-wasm`), like the engine's scenes
//! (`docs/12-acoustic-foundations.md`, "Measuring").
#![cfg(test)]

use acoustic::{Decay, Excitation, Scalar, Voices, Voicing};

const FS: f64 = 48_000.0;
const BLOCK: usize = 128;
/// Blocks in the 1 s performance: 48000 / 128.
const BLOCKS: usize = 375;
const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::T60(1.5),
};

/// FNV-1a, 64-bit (as the engine's `test-support`): small, fixed, and
/// enough to notice any changed bit.
fn fnv1a(bytes: impl Iterator<Item = u8>) -> u64 {
    const OFFSET: u64 = 0xcbf2_9ce4_8422_2325;
    const PRIME: u64 = 0x0000_0100_0000_01b3;
    bytes.fold(OFFSET, |h, b| (h ^ u64::from(b)).wrapping_mul(PRIME))
}

/// A short performance, 1 s: a C major chord (noise), a triangle-plucked
/// melody note, a release, and a ninth note that steals a voice. Returns
/// the samples and how many were clipped.
fn perform<S: Scalar>() -> (Vec<S>, u64) {
    let mut v = Voices::<S>::new(FS, 7).unwrap();
    let mut out = Vec::new();
    let mut block = vec![S::ZERO; BLOCK];
    for b in 0..BLOCKS {
        match b {
            0 => {
                for key in [48, 52, 55, 60, 64, 67, 72] {
                    v.note_on(key, VOICING, Excitation::Noise);
                }
            }
            40 => {
                v.note_on(76, VOICING, Excitation::Triangle { peak: 0.1 });
            }
            100 => v.note_off(48),
            200 => {
                v.note_on(79, VOICING, Excitation::Noise);
            }
            _ => {}
        }
        v.render(&mut block);
        out.extend_from_slice(&block);
    }
    (out, v.clipped())
}

fn hash<S: Scalar>(samples: &[S]) -> u64 {
    fnv1a(
        samples
            .iter()
            .flat_map(|x| x.to_f64().to_bits().to_le_bytes()),
    )
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
const GOLDEN: (u64, u64) = (0x2611_bd3d_bdbe_f327, 0x399b_69e6_8d9d_eb67);

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
