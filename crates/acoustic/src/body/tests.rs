use core::f64::consts::TAU;
use math::convert::usize_to_f64;

use super::{Body, resonances};

const SAMPLE_RATE: f64 = 48_000.0;
/// Impulse response length: 2 s, long past the narrowest band's ring.
const LENGTH: usize = 96_000;

fn impulse_response<S: crate::Scalar>() -> Vec<f64> {
    let mut body = Body::<S>::new(SAMPLE_RATE).unwrap();
    (0..LENGTH)
        .map(|sample_number| {
            body.process(if sample_number == 0 { S::ONE } else { S::ZERO })
                .to_f64()
        })
        .collect()
}

/// `|H(f)|` from the impulse response.
fn gain(response: &[f64], frequency: f64) -> f64 {
    let omega = TAU * frequency / SAMPLE_RATE;
    let (real, imaginary) = response.iter().enumerate().fold(
        (0.0, 0.0),
        |(real, imaginary), (sample_number, &value)| {
            let angle = omega * usize_to_f64(sample_number);
            (real + value * angle.cos(), imaginary - value * angle.sin())
        },
    );
    (real * real + imaginary * imaginary).sqrt()
}

#[test]
fn the_response_peaks_at_the_resonances() {
    let response = impulse_response::<f64>();
    let frequencies = resonances();
    for (index, &frequency) in frequencies.iter().enumerate() {
        let peak = gain(&response, frequency);
        let below = if index == 0 {
            frequency / 2.0
        } else {
            (frequency * frequencies[index - 1]).sqrt()
        };
        let above = frequencies
            .get(index + 1)
            .map_or(frequency * 2.0, |&next| (frequency * next).sqrt());
        let (gain_below, gain_above) = (gain(&response, below), gain(&response, above));
        println!(
            "{frequency} Hz: {:.2} dB; between: {:.2} dB below, {:.2} dB above",
            20.0 * peak.log10(),
            20.0 * gain_below.log10(),
            20.0 * gain_above.log10()
        );
        assert!(
            peak > gain_below && peak > gain_above,
            "{frequency} Hz isn't a peak"
        );
    }
}

/// Far above the resonances only the direct sound is left.
#[test]
fn far_above_it_is_the_direct_sound() {
    let response = impulse_response::<f64>();
    let high_gain = gain(&response, 15_000.0);
    println!("15 kHz: {:.3} dB", 20.0 * high_gain.log10());
    assert!((high_gain - 1.0).abs() < 0.05, "{high_gain}");
}

/// Stable: the impulse response dies away (no energy from nowhere).
#[test]
fn the_ring_dies_away() {
    let response = impulse_response::<f64>();
    let total: f64 = response.iter().map(|value| value * value).sum();
    let tail: f64 = response[LENGTH / 2..]
        .iter()
        .map(|value| value * value)
        .sum();
    assert!(tail < 1e-12 * total, "{tail} of {total}");
}

#[test]
fn f32_rings_like_f64() {
    let (single, double) = (impulse_response::<f32>(), impulse_response::<f64>());
    let worst = single
        .iter()
        .zip(&double)
        .map(|(x, y)| (x - y).abs())
        .fold(0.0, f64::max);
    assert!(worst < 1e-5, "{worst}");
    assert!(Body::<f64>::new(1_000.0).is_none(), "2.2 kHz above Nyquist");
}
