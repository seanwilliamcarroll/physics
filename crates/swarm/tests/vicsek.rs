//! S2's system-level tests (`docs/15-swarm.md`, S2): speed, the two
//! limits of the noise, and the 0/0 count.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use core::f32::consts::TAU;

use swarm::{Particle, Vicsek, VicsekParams};

const N: usize = 400;
const L: f32 = 10.0;

#[test]
fn every_particle_moves_exactly_v_a_step() {
    let mut v = Vicsek::new(N, L, VicsekParams::paper(2.0), 1).unwrap();
    for _ in 0..200 {
        let before: Vec<Particle> = v.particles().collect();
        v.step();
        for (a, b) in before.iter().zip(v.particles()) {
            let image = |d: f32| {
                if d > L / 2.0 {
                    d - L
                } else if d < -L / 2.0 {
                    d + L
                } else {
                    d
                }
            };
            let d = (image(b.x - a.x).powi(2) + image(b.y - a.y).powi(2)).sqrt();
            // f32 positions up to 10: an ulp is ~1e-6.
            assert!((d - 0.03).abs() < 1e-5, "moved {d}");
        }
    }
}

/// No noise, all aligned: they stay aligned. Measured: `v_a` exactly 1 for
/// 2,000 steps (identical unit vectors sum and normalize back exactly).
#[test]
fn without_noise_an_aligned_system_stays_aligned() {
    let start = Vicsek::new(N, L, VicsekParams::paper(0.0), 1).unwrap();
    let aligned: Vec<Particle> = start
        .particles()
        .map(|p| Particle {
            cos: 1.0,
            sin: 0.0,
            ..p
        })
        .collect();
    let mut v = Vicsek::with_particles(L, VicsekParams::paper(0.0), aligned, 1).unwrap();
    for _ in 0..2000 {
        v.step();
        assert!(v.order() > 1.0 - 1e-12, "v_a {}", v.order());
    }
}

/// η = 2π: every heading uniformly random each step, so `v_a` is the
/// length of the mean of N random unit vectors, whose expectation is
/// √π / (2√N) (the sum's expected length is √(πN)/2): 0.0443 at N = 400,
/// not 1/√N = 0.05. Measured, steps 1,000–3,000, three seeds:
/// 0.0442–0.0449 (1.5%). Bound 10%.
#[test]
fn at_full_noise_order_is_that_of_random_headings() {
    let expected = core::f64::consts::PI.sqrt() / (2.0 * math::convert::usize_to_f64(N).sqrt());
    for seed in [1, 2, 3] {
        let mut v = Vicsek::new(N, L, VicsekParams::paper(TAU), seed).unwrap();
        let mut sum = 0.0;
        for k in 0..3000 {
            v.step();
            if k >= 1000 {
                sum += v.order();
            }
        }
        let mean = sum / 2000.0;
        assert!(
            (mean / expected - 1.0).abs() < 0.10,
            "seed {seed}: {mean} vs {expected}"
        );
    }
}

/// Chen & Zhang's "direction annihilation" plots at up to ~20%; with
/// float headings an exact zero sum needs exact cancellation. Measured:
/// none in ~5 million neighbourhood averages (these runs, every η). The
/// constructed case is in the unit tests.
#[test]
fn exact_cancellation_doesnt_happen_in_practice() {
    for (eta, seed) in [(0.5_f32, 4), (2.0, 4), (4.0, 4), (TAU, 1)] {
        let mut v = Vicsek::new(N, L, VicsekParams::paper(eta), seed).unwrap();
        for _ in 0..3000 {
            v.step();
        }
        assert_eq!(v.annihilations(), 0, "eta {eta}");
    }
}
