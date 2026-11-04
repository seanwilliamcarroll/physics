use math::SplitMix64;

use super::Excitation;
use crate::{Decay, KsString, Voicing};

const VOICING: Voicing = Voicing {
    tuned: true,
    decay: Decay::Loss(1.0),
};

fn excited(e: Excitation, seed: u64) -> Vec<f64> {
    let mut s = KsString::<f64>::new(48_000.0, 220.0, VOICING).unwrap();
    e.excite(&mut s, &mut SplitMix64::new(seed));
    s.samples().collect()
}

fn mean(v: &[f64]) -> f64 {
    #[expect(clippy::cast_precision_loss, reason = "test lengths")]
    let n = v.len() as f64;
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
    #[expect(clippy::cast_precision_loss, reason = "test lengths")]
    let where_ = at as f64 / t.len() as f64;
    assert!((where_ - 0.25).abs() < 0.01, "{where_}");
}
