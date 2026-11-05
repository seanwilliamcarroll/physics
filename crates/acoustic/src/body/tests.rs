use core::f64::consts::TAU;

use super::{Body, resonances};

const FS: f64 = 48_000.0;
/// Impulse response length: 2 s, long past the narrowest band's ring.
const LENGTH: usize = 96_000;

fn impulse_response<S: crate::Scalar>() -> Vec<f64> {
    let mut b = Body::<S>::new(FS).unwrap();
    (0..LENGTH)
        .map(|n| b.process(if n == 0 { S::ONE } else { S::ZERO }).to_f64())
        .collect()
}

/// `|H(f)|` from the impulse response.
fn gain(h: &[f64], f: f64) -> f64 {
    let w = TAU * f / FS;
    let (re, im) = h.iter().enumerate().fold((0.0, 0.0), |(re, im), (n, &x)| {
        #[expect(clippy::cast_precision_loss, reason = "small counts")]
        let a = w * n as f64;
        (re + x * a.cos(), im - x * a.sin())
    });
    (re * re + im * im).sqrt()
}

#[test]
fn the_response_peaks_at_the_resonances() {
    let h = impulse_response::<f64>();
    let f = resonances();
    for (i, &fi) in f.iter().enumerate() {
        let peak = gain(&h, fi);
        let below = if i == 0 {
            fi / 2.0
        } else {
            (fi * f[i - 1]).sqrt()
        };
        let above = f.get(i + 1).map_or(fi * 2.0, |&g| (fi * g).sqrt());
        let (lo, hi) = (gain(&h, below), gain(&h, above));
        println!(
            "{fi} Hz: {:.2} dB; between: {:.2} dB below, {:.2} dB above",
            20.0 * peak.log10(),
            20.0 * lo.log10(),
            20.0 * hi.log10()
        );
        assert!(peak > lo && peak > hi, "{fi} Hz isn't a peak");
    }
}

/// Far above the resonances only the direct sound is left.
#[test]
fn far_above_it_is_the_direct_sound() {
    let h = impulse_response::<f64>();
    let g = gain(&h, 15_000.0);
    println!("15 kHz: {:.3} dB", 20.0 * g.log10());
    assert!((g - 1.0).abs() < 0.05, "{g}");
}

/// Stable: the impulse response dies away (no energy from nowhere).
#[test]
fn the_ring_dies_away() {
    let h = impulse_response::<f64>();
    let total: f64 = h.iter().map(|x| x * x).sum();
    let tail: f64 = h[LENGTH / 2..].iter().map(|x| x * x).sum();
    assert!(tail < 1e-12 * total, "{tail} of {total}");
}

#[test]
fn f32_rings_like_f64() {
    let (a, b) = (impulse_response::<f32>(), impulse_response::<f64>());
    let worst = a
        .iter()
        .zip(&b)
        .map(|(x, y)| (x - y).abs())
        .fold(0.0, f64::max);
    assert!(worst < 1e-5, "{worst}");
    assert!(Body::<f64>::new(1_000.0).is_none(), "2.2 kHz above Nyquist");
}
