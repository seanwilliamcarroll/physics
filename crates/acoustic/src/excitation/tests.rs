use math::SplitMix64;
use math::convert::usize_to_f64;

use super::Excitation;
use crate::{Decay, KsString, Voicing};

const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::Loss(1.0),
    inharmonicity: 0.0,
};

fn excited(e: Excitation, seed: u64) -> Vec<f64> {
    let mut s = KsString::<f64>::new(48_000.0, 220.0, VOICING).unwrap();
    e.excite(&mut s, &mut SplitMix64::new(seed));
    s.samples().collect()
}

fn mean(v: &[f64]) -> f64 {
    let n = usize_to_f64(v.len());
    v.iter().sum::<f64>() / n
}

#[test]
fn noise_is_zero_mean_bounded_and_seeded() {
    let a = excited(Excitation::Noise, 1);
    assert!(mean(&a).abs() < 1e-15, "{}", mean(&a));
    assert!(a.iter().all(|x| x.abs() <= 2.0), "±1, shifted by the mean");
    assert_eq!(a, excited(Excitation::Noise, 1), "same seed, same pluck");
    assert_ne!(a, excited(Excitation::Noise, 2));
}

#[test]
fn the_triangle_peaks_where_asked() {
    let t = excited(Excitation::Triangle { peak: 0.25 }, 0);
    assert!(mean(&t).abs() < 1e-15);
    let (at, _) = t
        .iter()
        .enumerate()
        .fold((0, f64::MIN), |m, (i, &v)| if v > m.1 { (i, v) } else { m });
    let where_ = usize_to_f64(at) / usize_to_f64(t.len());
    assert!((where_ - 0.25).abs() < 0.01, "{where_}");
}

/// From the full mutation run of 2026-11-12: only where the triangle
/// peaks was checked, not the falling side's slope. Both sides are
/// straight lines from 0 at the ends to 1 at the peak (before the mean
/// is taken out, which shifts every sample alike).
#[test]
fn the_triangle_falls_in_a_straight_line_to_the_far_end() {
    let t = excited(Excitation::Triangle { peak: 0.25 }, 0);
    let n = usize_to_f64(t.len());
    let shift = t[0];
    for (i, &y) in t.iter().enumerate() {
        let x = usize_to_f64(i) / n;
        let want = if x < 0.25 { x / 0.25 } else { (1.0 - x) / 0.75 };
        assert!(
            (y - shift - want).abs() < 1e-12,
            "sample {i}: {}, not {want}",
            y - shift
        );
    }
}

#[test]
fn the_waveguide_triangle_falls_in_a_straight_line_too() {
    let mut wg = crate::Waveguide::<f64>::new(48_000.0, 220.0, VOICING).unwrap();
    Excitation::Triangle { peak: 0.25 }.excite_waveguide(&mut wg, &mut SplitMix64::new(0));
    for (c, y) in wg.shape().enumerate() {
        let s = wg.position(c);
        let want = if s < 0.25 { s / 0.25 } else { (1.0 - s) / 0.75 };
        assert!((y - want).abs() < 1e-12, "cell {c}: {y}, not {want}");
    }
}

/// From the full mutation run of 2026-11-12: a pluck asked for at the
/// very end is held back from it (`PEAK_MARGIN`), so the shape still falls
/// to the nut rather than rising all the way.
#[test]
fn a_pluck_at_the_end_still_falls_to_it() {
    let t = excited(Excitation::Triangle { peak: 1.0 }, 0);
    let top = t.iter().copied().fold(f64::MIN, f64::max);
    assert!(t[t.len() - 1] < top, "the last sample is the peak");
    let mut wg = crate::Waveguide::<f64>::new(48_000.0, 220.0, VOICING).unwrap();
    Excitation::Triangle { peak: 1.0 }.excite_waveguide(&mut wg, &mut SplitMix64::new(0));
    let shape: Vec<f64> = wg.shape().collect();
    let top = shape.iter().copied().fold(f64::MIN, f64::max);
    assert!(
        shape[shape.len() - 1] < top,
        "the cell at the nut is the peak"
    );
}
