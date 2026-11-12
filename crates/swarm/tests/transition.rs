//! S2's transition (`docs/15-swarm.md`, S2; Vicsek et al. 1995, Fig.
//! 2a): `v_a` against η at the paper's density (ρ ≈ 4), measured as the
//! paper did (a transient, then a window's mean, several seeds). The full
//! sweep is `examples/vicsek_sweep.rs`; these are its pinned features.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::convert::{f64_to_f32, u64_to_f64};
use swarm::{Vicsek, VicsekParams};

/// Fig. 2a's (N, L) for N = 40, 100, 400.
const SIZES: [(usize, f32); 3] = [(40, 3.1), (100, 5.0), (400, 10.0)];
const SEEDS: u64 = 3;

/// Mean `v_a` over seeds 1..=SEEDS: 2,000 steps' transient, a 2,000-step
/// window (the example uses 3,000 + 3,000 and 5 seeds).
fn order(n: usize, l: f32, eta: f64) -> f64 {
    (1..=SEEDS)
        .map(|seed| {
            Vicsek::new(n, l, VicsekParams::paper(f64_to_f32(eta)), seed)
                .unwrap()
                .mean_order(2000, 2000)
        })
        .sum::<f64>()
        / u64_to_f64(SEEDS)
}

/// Where `v_a` crosses 0.5, by linear interpolation on a 0.25 grid from
/// η = 2.5 (every size is above 0.5 there).
fn crossing(n: usize, l: f32) -> f64 {
    let mut prev = (2.5, order(n, l, 2.5));
    for k in 1..=12 {
        let eta = 2.5 + f64::from(k) * 0.25;
        let v = order(n, l, eta);
        if v < 0.5 {
            return prev.0 + (prev.1 - 0.5) / (prev.1 - v) * (eta - prev.0);
        }
        prev = (eta, v);
    }
    f64::NAN
}

/// Low noise: every size ordered alike. Measured at η = 1: 0.957,
/// 0.953, 0.946 (N = 40, 100, 400). Bounds: within 0.93–0.97, spread
/// under 0.03.
#[test]
fn at_low_noise_every_size_is_ordered_alike() {
    let v: Vec<f64> = SIZES.iter().map(|&(n, l)| order(n, l, 1.0)).collect();
    for &x in &v {
        assert!((0.93..=0.97).contains(&x), "{v:?}");
    }
    let spread =
        v.iter().copied().fold(f64::MIN, f64::max) - v.iter().copied().fold(f64::MAX, f64::min);
    assert!(spread < 0.03, "{v:?}");
}

/// `v_a` falls as the noise rises (N = 100, every 0.5 to η = 5).
#[test]
fn order_falls_with_noise() {
    let v: Vec<f64> = (0..=10)
        .map(|k| order(100, 5.0, f64::from(k) * 0.5))
        .collect();
    for w in v.windows(2) {
        assert!(w[1] < w[0], "{v:?}");
    }
}

/// Fig. 2a's finite-size effect: past the transition, larger systems are
/// less ordered (their `v_a` heads to ~1/√N's scale), and the transition
/// sharpens and moves down with N, toward the paper's `η_c(∞)` = 2.9.
/// Measured (3 seeds): `v_a` at η = 4.5 is 0.312, 0.222, 0.123; `v_a`
/// crosses 0.5 at η = 3.69, 3.53, 3.28 (N = 40, 100, 400). Bounds: each
/// size below the last by 0.03 in `v_a` and 0.05 in η, every crossing in
/// 3.0–4.0.
#[test]
fn the_transition_sharpens_and_moves_down_with_size() {
    let past: Vec<f64> = SIZES.iter().map(|&(n, l)| order(n, l, 4.5)).collect();
    let cross: Vec<f64> = SIZES.iter().map(|&(n, l)| crossing(n, l)).collect();
    for w in past.windows(2) {
        assert!(w[1] < w[0] - 0.03, "v_a at 4.5: {past:?}");
    }
    for w in cross.windows(2) {
        assert!(w[1] < w[0] - 0.05, "crossings: {cross:?}");
    }
    assert!(
        cross.iter().all(|c| (3.0..=4.0).contains(c)),
        "crossings: {cross:?}"
    );
}
