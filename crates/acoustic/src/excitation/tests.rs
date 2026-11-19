use math::SplitMix64;
use math::convert::usize_to_f64;

use super::Excitation;
use crate::{Decay, KsString, Voicing};

const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::Loss(1.0),
    inharmonicity: 0.0,
};

fn excited(excitation: Excitation, seed: u64) -> Vec<f64> {
    let mut string = KsString::<f64>::new(48_000.0, 220.0, VOICING).unwrap();
    excitation.excite(&mut string, &mut SplitMix64::new(seed));
    string.samples().collect()
}

fn mean(values: &[f64]) -> f64 {
    let count = usize_to_f64(values.len());
    values.iter().sum::<f64>() / count
}

#[test]
fn noise_is_zero_mean_bounded_and_seeded() {
    let noise = excited(Excitation::Noise, 1);
    assert!(mean(&noise).abs() < 1e-15, "{}", mean(&noise));
    assert!(
        noise.iter().all(|sample| sample.abs() <= 2.0),
        "±1, shifted by the mean"
    );
    assert_eq!(
        noise,
        excited(Excitation::Noise, 1),
        "same seed, same pluck"
    );
    assert_ne!(noise, excited(Excitation::Noise, 2));
}

#[test]
fn the_triangle_peaks_where_asked() {
    let triangle = excited(Excitation::Triangle { peak: 0.25 }, 0);
    assert!(mean(&triangle).abs() < 1e-15);
    let (peak_slot, _) = triangle
        .iter()
        .enumerate()
        .fold((0, f64::MIN), |best, (slot, &value)| {
            if value > best.1 { (slot, value) } else { best }
        });
    let peak_position = usize_to_f64(peak_slot) / usize_to_f64(triangle.len());
    assert!((peak_position - 0.25).abs() < 0.01, "{peak_position}");
}

/// Both sides of the triangle are straight lines from 0 at the ends to 1
/// at the peak (before the mean is taken out, which shifts every sample
/// alike).
#[test]
fn the_triangle_falls_in_a_straight_line_to_the_far_end() {
    let triangle = excited(Excitation::Triangle { peak: 0.25 }, 0);
    let length = usize_to_f64(triangle.len());
    let shift = triangle[0];
    for (slot, &value) in triangle.iter().enumerate() {
        let x = usize_to_f64(slot) / length;
        let want = if x < 0.25 { x / 0.25 } else { (1.0 - x) / 0.75 };
        assert!(
            (value - shift - want).abs() < 1e-12,
            "sample {slot}: {}, not {want}",
            value - shift
        );
    }
}

#[test]
fn the_waveguide_triangle_falls_in_a_straight_line_too() {
    let mut waveguide = crate::Waveguide::<f64>::new(48_000.0, 220.0, VOICING).unwrap();
    Excitation::Triangle { peak: 0.25 }.excite_waveguide(&mut waveguide, &mut SplitMix64::new(0));
    for (cell, value) in waveguide.shape().enumerate() {
        let position = waveguide.position(cell);
        let want = if position < 0.25 {
            position / 0.25
        } else {
            (1.0 - position) / 0.75
        };
        assert!(
            (value - want).abs() < 1e-12,
            "cell {cell}: {value}, not {want}"
        );
    }
}

/// A pluck asked for at the very end is held back from it (`PEAK_MARGIN`),
/// so the shape still falls to the nut rather than rising all the way.
#[test]
fn a_pluck_at_the_end_still_falls_to_it() {
    let triangle = excited(Excitation::Triangle { peak: 1.0 }, 0);
    let top = triangle.iter().copied().fold(f64::MIN, f64::max);
    assert!(
        triangle[triangle.len() - 1] < top,
        "the last sample is the peak"
    );
    let mut waveguide = crate::Waveguide::<f64>::new(48_000.0, 220.0, VOICING).unwrap();
    Excitation::Triangle { peak: 1.0 }.excite_waveguide(&mut waveguide, &mut SplitMix64::new(0));
    let shape: Vec<f64> = waveguide.shape().collect();
    let top = shape.iter().copied().fold(f64::MIN, f64::max);
    assert!(
        shape[shape.len() - 1] < top,
        "the cell at the nut is the peak"
    );
}
