//! The Vicsek transition (`docs/15-swarm.md`, "Measuring the transition";
//! Vicsek et al. 1995, Fig. 2a): `v_a` against η at the paper's density
//! (ρ ≈ 4), measured as the paper did (a transient, then a window's mean,
//! several seeds). The full sweep is `examples/vicsek_sweep.rs`; these are
//! its pinned features.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::convert::{f64_to_f32, u64_to_f64};
use swarm::{Vicsek, VicsekParams};

/// Fig. 2a's (N, L) for N = 40, 100, 400.
const SIZES: [(usize, f32); 3] = [(40, 3.1), (100, 5.0), (400, 10.0)];
const SEEDS: u64 = 3;

/// Mean `v_a` over seeds 1..=SEEDS: 2,000 steps' transient, a 2,000-step
/// window (the example uses 3,000 + 3,000 and 5 seeds).
fn order(particle_count: usize, side: f32, eta: f64) -> f64 {
    (1..=SEEDS)
        .map(|seed| {
            Vicsek::new(
                particle_count,
                side,
                VicsekParams::paper(f64_to_f32(eta)),
                seed,
            )
            .unwrap()
            .mean_order(2000, 2000)
        })
        .sum::<f64>()
        / u64_to_f64(SEEDS)
}

/// Where `v_a` crosses 0.5, by linear interpolation on a 0.25 grid from
/// η = 2.5 (every size is above 0.5 there).
fn crossing(particle_count: usize, side: f32) -> f64 {
    let mut previous = (2.5, order(particle_count, side, 2.5));
    for step in 1..=12 {
        let eta = 2.5 + f64::from(step) * 0.25;
        let order_here = order(particle_count, side, eta);
        if order_here < 0.5 {
            return previous.0
                + (previous.1 - 0.5) / (previous.1 - order_here) * (eta - previous.0);
        }
        previous = (eta, order_here);
    }
    f64::NAN
}

/// Low noise: every size ordered alike. Measured at η = 1: 0.957,
/// 0.953, 0.946 (N = 40, 100, 400). Bounds: within 0.93–0.97, spread
/// under 0.03.
#[test]
fn at_low_noise_every_size_is_ordered_alike() {
    let orders: Vec<f64> = SIZES
        .iter()
        .map(|&(count, side)| order(count, side, 1.0))
        .collect();
    for &order in &orders {
        assert!((0.93..=0.97).contains(&order), "{orders:?}");
    }
    let spread = orders.iter().copied().fold(f64::MIN, f64::max)
        - orders.iter().copied().fold(f64::MAX, f64::min);
    assert!(spread < 0.03, "{orders:?}");
}

/// `v_a` falls as the noise rises (N = 100, every 0.5 to η = 5).
#[test]
fn order_falls_with_noise() {
    let orders: Vec<f64> = (0..=10)
        .map(|step| order(100, 5.0, f64::from(step) * 0.5))
        .collect();
    for pair in orders.windows(2) {
        assert!(pair[1] < pair[0], "{orders:?}");
    }
}

/// Fig. 2a's finite-size effect: past the transition, larger systems are
/// less ordered (their `v_a` heads to ~1/√N's scale), and the transition
/// sharpens and moves down with N, toward the paper's `η_c(∞)` = 2.9.
/// Measured (3 seeds): `v_a` at η = 4.5 is 0.312, 0.222, 0.123; `v_a`
/// crosses 0.5 at η = 3.69, 3.53, 3.28 (N = 40, 100, 400). Bounds: each
/// size below the last by 0.03 in `v_a` and 0.05 in η, every crossing in
/// 3.0–4.0.
///
/// In the slow tier: about 6 s in a test build, but 58 s under the
/// nightly's coverage build, half its two-minute limit.
#[test]
#[ignore = "slow: cargo xtask slow"]
fn slow_the_transition_sharpens_and_moves_down_with_size() {
    let past_transition: Vec<f64> = SIZES
        .iter()
        .map(|&(count, side)| order(count, side, 4.5))
        .collect();
    let crossings: Vec<f64> = SIZES
        .iter()
        .map(|&(count, side)| crossing(count, side))
        .collect();
    for pair in past_transition.windows(2) {
        assert!(pair[1] < pair[0] - 0.03, "v_a at 4.5: {past_transition:?}");
    }
    for pair in crossings.windows(2) {
        assert!(pair[1] < pair[0] - 0.05, "crossings: {crossings:?}");
    }
    assert!(
        crossings.iter().all(|c| (3.0..=4.0).contains(c)),
        "crossings: {crossings:?}"
    );
}
