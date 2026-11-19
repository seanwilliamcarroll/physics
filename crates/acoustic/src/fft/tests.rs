use core::f64::consts::TAU;
use math::convert::usize_to_f64;

use math::SplitMix64;

use super::{Fft, Spectrum};
use crate::Scalar;

/// The textbook O(n²) DFT, in f64: what the FFT must agree with.
fn naive_dft(signal: &[f64]) -> (Vec<f64>, Vec<f64>) {
    let size = usize_to_f64(signal.len());
    (0..signal.len())
        .map(|bin| {
            signal
                .iter()
                .enumerate()
                .fold((0.0, 0.0), |(real, imaginary), (time, &value)| {
                    let angle = -TAU * usize_to_f64(bin * time) / size;
                    (real + value * angle.cos(), imaginary + value * angle.sin())
                })
        })
        .unzip()
}

fn agrees_with_the_naive_dft<S: Scalar>(tolerance: f64) {
    let mut rng = SplitMix64::new(3);
    for size in [2, 8, 64, 1024] {
        let signal: Vec<f64> = (0..size).map(|_| rng.range(-1.0, 1.0)).collect();
        let (want_real, want_imaginary) = naive_dft(&signal);
        let fft = Fft::<S>::new(size).unwrap();
        let mut real: Vec<S> = signal.iter().map(|&value| S::from_f64(value)).collect();
        let mut imaginary = vec![S::ZERO; size];
        assert!(fft.forward(&mut real, &mut imaginary));
        let worst = real
            .iter()
            .zip(&imaginary)
            .zip(want_real.iter().zip(&want_imaginary))
            .map(|((real, imaginary), (want_real, want_imaginary))| {
                (real.to_f64() - want_real).hypot(imaginary.to_f64() - want_imaginary)
            })
            .fold(0.0, f64::max);
        println!(
            "{} n = {size}: worst {worst:e}",
            core::any::type_name::<S>()
        );
        assert!(worst < tolerance, "n = {size}: {worst}");
    }
}

/// Measured: worst 9.6e-12 (f64) and 5.7e-6 (f32) at n = 1024; much of the
/// f64 error is the naive DFT's own (`cos` of arguments up to ~10⁶). ~10x.
#[test]
fn agrees_with_the_naive_dft_f64() {
    agrees_with_the_naive_dft::<f64>(1e-10);
}

#[test]
fn agrees_with_the_naive_dft_f32() {
    agrees_with_the_naive_dft::<f32>(1e-4);
}

#[test]
fn a_tone_lands_in_its_bin() {
    // 5 cycles over 64 samples: all the energy in bins 5 and 64 − 5.
    let size = 64;
    let fft = Fft::<f64>::new(size).unwrap();
    let mut real: Vec<f64> = (0..size)
        .map(|time| (TAU * 5.0 * usize_to_f64(time) / usize_to_f64(size)).cos())
        .collect();
    let mut imaginary = vec![0.0; size];
    fft.forward(&mut real, &mut imaginary);
    for (bin, (real, imaginary)) in real.iter().zip(&imaginary).enumerate() {
        let magnitude = real.hypot(*imaginary);
        let want = if bin == 5 || bin == size - 5 {
            32.0
        } else {
            0.0
        };
        assert!((magnitude - want).abs() < 1e-9, "bin {bin}: {magnitude}");
    }
}

#[test]
fn only_powers_of_two_and_matching_buffers() {
    assert!(Fft::<f64>::new(0).is_none());
    assert!(Fft::<f64>::new(1).is_none());
    assert!(Fft::<f64>::new(48).is_none());
    let fft = Fft::<f64>::new(8).unwrap();
    let (mut real, mut imaginary) = (vec![0.0; 8], vec![0.0; 4]);
    assert!(
        !fft.forward(&mut real, &mut imaginary),
        "buffers of the wrong size are refused"
    );
}

#[test]
fn the_spectrum_finds_a_tone_in_db() {
    // A full-scale sine at bin 100 of 4096: its peak near 0 dB (Hann loses
    // 6 dB, the analyzer scales it back), and nowhere else near it.
    let size = 4096;
    let mut spectrum = Spectrum::<f64>::new(size).unwrap();
    let signal: Vec<f64> = (0..size)
        .map(|time| (TAU * 100.0 * usize_to_f64(time) / usize_to_f64(size)).sin())
        .collect();
    let levels = spectrum.analyze(&signal).unwrap();
    assert_eq!(levels.len(), size / 2);
    let (peak_bin, peak_level) =
        levels
            .iter()
            .enumerate()
            .fold((0, f64::MIN), |best, (bin, &level)| {
                if level > best.1 { (bin, level) } else { best }
            });
    assert_eq!(peak_bin, 100);
    assert!(peak_level.abs() < 0.1, "{peak_level} dB");
    assert!(
        levels.get(200).is_some_and(|&level| level < -100.0),
        "far from the tone: silence"
    );
}

#[test]
fn an_fft_is_never_empty() {
    assert!(!Fft::<f64>::new(8).unwrap().is_empty());
}

#[test]
fn the_spectrum_reads_a_sine_in_db_and_silence_at_the_floor() {
    const SIZE: usize = 1024;
    let mut spectrum = Spectrum::<f64>::new(SIZE).unwrap();
    assert!(
        spectrum.last().iter().all(|&level| level == 0.0),
        "zeros before the first analysis"
    );
    // Silence: every bin at the floor, not −∞.
    let floor = spectrum.analyze(&[0.0; SIZE]).unwrap().to_vec();
    assert!(floor.iter().all(|&level| level == super::FLOOR_DB));
    // A sine (its energy in the imaginary part) of amplitude 0.5 exactly
    // on bin 64: 20 log10(0.5) = −6.02 dB there.
    let sine: Vec<f64> = (0..SIZE)
        .map(|time| 0.5 * (TAU * 64.0 * usize_to_f64(time) / usize_to_f64(SIZE)).sin())
        .collect();
    let sine_levels = spectrum.analyze(&sine).unwrap().to_vec();
    assert!(
        (sine_levels[64] - 20.0 * 0.5_f64.log10()).abs() < 0.01,
        "{} dB",
        sine_levels[64]
    );
    assert_eq!(
        spectrum.last(),
        &sine_levels[..],
        "last is the latest analysis"
    );
    // A cosine puts its energy in the real part: 0.25 on bin 32 reads
    // 20 log10(0.25) = −12.04 dB.
    let cosine: Vec<f64> = (0..SIZE)
        .map(|time| 0.25 * (TAU * 32.0 * usize_to_f64(time) / usize_to_f64(SIZE)).cos())
        .collect();
    let cosine_levels = spectrum.analyze(&cosine).unwrap().to_vec();
    assert!(
        (cosine_levels[32] - 20.0 * 0.25_f64.log10()).abs() < 0.01,
        "{} dB",
        cosine_levels[32]
    );
}

/// A bin with nothing in it is the floor, not log(0).
#[test]
fn silence_is_the_floor_in_every_bin() {
    let mut spectrum = Spectrum::<f64>::new(256).unwrap();
    let levels = spectrum.analyze(&[0.0; 256]).unwrap();
    assert!(
        levels.iter().all(|&level| level == super::FLOOR_DB),
        "{:?}",
        &levels[..4]
    );
}
