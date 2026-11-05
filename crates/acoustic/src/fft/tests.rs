use core::f64::consts::TAU;
use math::convert::usize_to_f64;

use math::SplitMix64;

use super::{Fft, Spectrum};
use crate::Scalar;

/// The textbook O(n²) DFT, in f64: what the FFT must agree with.
fn naive_dft(x: &[f64]) -> (Vec<f64>, Vec<f64>) {
    let n = usize_to_f64(x.len());
    (0..x.len())
        .map(|k| {
            x.iter().enumerate().fold((0.0, 0.0), |(re, im), (t, &v)| {
                let a = -TAU * usize_to_f64(k * t) / n;
                (re + v * a.cos(), im + v * a.sin())
            })
        })
        .unzip()
}

fn agrees_with_the_naive_dft<S: Scalar>(tol: f64) {
    let mut rng = SplitMix64::new(3);
    for n in [2, 8, 64, 1024] {
        let x: Vec<f64> = (0..n).map(|_| rng.range(-1.0, 1.0)).collect();
        let (want_re, want_im) = naive_dft(&x);
        let fft = Fft::<S>::new(n).unwrap();
        let mut re: Vec<S> = x.iter().map(|&v| S::from_f64(v)).collect();
        let mut im = vec![S::ZERO; n];
        assert!(fft.forward(&mut re, &mut im));
        let worst = re
            .iter()
            .zip(&im)
            .zip(want_re.iter().zip(&want_im))
            .map(|((r, i), (wr, wi))| (r.to_f64() - wr).hypot(i.to_f64() - wi))
            .fold(0.0, f64::max);
        println!("{} n = {n}: worst {worst:e}", core::any::type_name::<S>());
        assert!(worst < tol, "n = {n}: {worst}");
    }
}

/// Measured (A2.2): worst 9.6e-12 (f64) and 5.7e-6 (f32) at n = 1024; much
/// of the f64 error is the naive DFT's own (`cos` of arguments up to
/// ~10⁶). ~10x.
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
    let n = 64;
    let fft = Fft::<f64>::new(n).unwrap();
    let mut re: Vec<f64> = (0..n)
        .map(|t| (TAU * 5.0 * usize_to_f64(t) / usize_to_f64(n)).cos())
        .collect();
    let mut im = vec![0.0; n];
    fft.forward(&mut re, &mut im);
    for (k, (r, i)) in re.iter().zip(&im).enumerate() {
        let mag = r.hypot(*i);
        let want = if k == 5 || k == n - 5 { 32.0 } else { 0.0 };
        assert!((mag - want).abs() < 1e-9, "bin {k}: {mag}");
    }
}

#[test]
fn only_powers_of_two_and_matching_buffers() {
    assert!(Fft::<f64>::new(0).is_none());
    assert!(Fft::<f64>::new(1).is_none());
    assert!(Fft::<f64>::new(48).is_none());
    let fft = Fft::<f64>::new(8).unwrap();
    let (mut re, mut im) = (vec![0.0; 8], vec![0.0; 4]);
    assert!(
        !fft.forward(&mut re, &mut im),
        "buffers of the wrong size are refused"
    );
}

#[test]
fn the_spectrum_finds_a_tone_in_db() {
    // A full-scale sine at bin 100 of 4096: its peak near 0 dB (Hann loses
    // 6 dB, the analyzer scales it back), and nowhere else near it.
    let n = 4096;
    let mut s = Spectrum::<f64>::new(n).unwrap();
    let x: Vec<f64> = (0..n)
        .map(|t| (TAU * 100.0 * usize_to_f64(t) / usize_to_f64(n)).sin())
        .collect();
    let db = s.analyze(&x).unwrap();
    assert_eq!(db.len(), n / 2);
    let (peak, level) = db
        .iter()
        .enumerate()
        .fold((0, f64::MIN), |m, (k, &v)| if v > m.1 { (k, v) } else { m });
    assert_eq!(peak, 100);
    assert!(level.abs() < 0.1, "{level} dB");
    assert!(
        db.get(200).is_some_and(|&v| v < -100.0),
        "far from the tone: silence"
    );
}
