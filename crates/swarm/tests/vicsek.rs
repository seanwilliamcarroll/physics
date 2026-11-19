//! The Vicsek system's tests (`docs/15-swarm.md`, "The Vicsek model"):
//! speed, the two limits of the noise, and the 0/0 count.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use core::f32::consts::TAU;

use swarm::{Particle, Vicsek, VicsekParams};

const PARTICLES: usize = 400;
const SIDE: f32 = 10.0;

#[test]
fn every_particle_moves_exactly_v_a_step() {
    let mut vicsek = Vicsek::new(PARTICLES, SIDE, VicsekParams::paper(2.0), 1).unwrap();
    for _ in 0..200 {
        let before: Vec<Particle> = vicsek.particles().collect();
        vicsek.step();
        for (old, new) in before.iter().zip(vicsek.particles()) {
            let minimum_image = |delta: f32| {
                if delta > SIDE / 2.0 {
                    delta - SIDE
                } else if delta < -SIDE / 2.0 {
                    delta + SIDE
                } else {
                    delta
                }
            };
            let distance = (minimum_image(new.x - old.x).powi(2)
                + minimum_image(new.y - old.y).powi(2))
            .sqrt();
            // f32 positions up to 10: an ulp is ~1e-6.
            assert!((distance - 0.03).abs() < 1e-5, "moved {distance}");
        }
    }
}

/// No noise, all aligned: they stay aligned. Measured: `v_a` exactly 1 for
/// 2,000 steps (identical unit vectors sum and normalize back exactly).
#[test]
fn without_noise_an_aligned_system_stays_aligned() {
    let start = Vicsek::new(PARTICLES, SIDE, VicsekParams::paper(0.0), 1).unwrap();
    let aligned: Vec<Particle> = start
        .particles()
        .map(|particle| Particle {
            cos: 1.0,
            sin: 0.0,
            ..particle
        })
        .collect();
    let mut vicsek = Vicsek::with_particles(SIDE, VicsekParams::paper(0.0), aligned, 1).unwrap();
    for _ in 0..2000 {
        vicsek.step();
        assert!(vicsek.order() > 1.0 - 1e-12, "v_a {}", vicsek.order());
    }
}

/// η = 2π: every heading uniformly random each step, so `v_a` is the
/// length of the mean of N random unit vectors, whose expectation is
/// √π / (2√N) (the sum's expected length is √(πN)/2): 0.0443 at N = 400,
/// not 1/√N = 0.05. Measured, steps 1,000–3,000, three seeds:
/// 0.0442–0.0449 (1.5%). Bound 10%.
#[test]
fn at_full_noise_order_is_that_of_random_headings() {
    let expected =
        core::f64::consts::PI.sqrt() / (2.0 * math::convert::usize_to_f64(PARTICLES).sqrt());
    for seed in [1, 2, 3] {
        let mut vicsek = Vicsek::new(PARTICLES, SIDE, VicsekParams::paper(TAU), seed).unwrap();
        let mut sum = 0.0;
        for step in 0..3000 {
            vicsek.step();
            if step >= 1000 {
                sum += vicsek.order();
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
        let mut vicsek = Vicsek::new(PARTICLES, SIDE, VicsekParams::paper(eta), seed).unwrap();
        for _ in 0..3000 {
            vicsek.step();
        }
        assert_eq!(vicsek.annihilations(), 0, "eta {eta}");
    }
}
