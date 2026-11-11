//! S1's flock-level tests (`docs/15-swarm.md`, "What's tested, with
//! nothing conserved"): the speed band, how far boids stray, order
//! independence, and that alignment makes a flock.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use swarm::{Arena, Boid, Flock, Neighbours, Params};

const P: Params = Params::ECE4760;

fn arena() -> Arena {
    Arena::new(640.0, 480.0).unwrap()
}

#[test]
fn speeds_stay_in_the_band() {
    for seed in [1, 2, 3] {
        let mut f = Flock::new(300, arena(), P, seed).unwrap();
        for _ in 0..600 {
            f.step();
            for b in f.boids() {
                let s = (b.vx * b.vx + b.vy * b.vy).sqrt();
                // Scaled to the band's ends in f32: within a few ulps.
                assert!(
                    (3.0 * (1.0 - 1e-6)..=6.0 * (1.0 + 1e-6)).contains(&s),
                    "speed {s}"
                );
            }
        }
    }
}

/// The margin doesn't confine boids: alignment holds a boid's velocity
/// within `turn / matching` (4 px/step) of its neighbours', so a flock
/// turns as a body and its leaders overshoot. Measured over 2,000 steps
/// of 300 boids, four seeds: outside the arena 2–3.4% of boid-steps, at
/// most 330 px out (395 px for 2,000 boids at 1280 × 720; without
/// separation too). Bounds: 10% and 1,000 px, behavioural, not rounding:
/// they catch boids that leave and don't come back.
#[test]
fn boids_stray_past_the_edge_but_come_back() {
    for seed in [1, 2, 3, 4] {
        let mut f = Flock::new(300, arena(), P, seed).unwrap();
        let (mut outside, mut total, mut worst) = (0_u32, 0_u32, 0.0_f32);
        for _ in 0..2000 {
            f.step();
            for b in f.boids() {
                let out = (-b.x).max(b.x - 640.0).max(-b.y).max(b.y - 480.0);
                outside += u32::from(out > 0.0);
                total += 1;
                worst = worst.max(out);
            }
        }
        let share = f64::from(outside) / f64::from(total);
        assert!(
            share < 0.10,
            "seed {seed}: outside {share:.3} of boid-steps"
        );
        assert!(worst < 1000.0, "seed {seed}: {worst} px out");
    }
}

/// Reversing the storage order changes nothing but the order sums run
/// in. Measured: identical after one step (at the start few boids have
/// more than one neighbour, and two-term sums round the same either
/// way), 6.1e-5 px apart after 10 (the flock is chaotic: rounding
/// differences grow), 0.046 px after 50. Bound: 1e-3 px at 10 steps.
#[test]
fn storage_order_changes_only_rounding() {
    let f = Flock::new(300, arena(), P, 5).unwrap();
    let reversed: Vec<Boid> = f.boids().collect::<Vec<_>>().into_iter().rev().collect();
    let mut a = f.clone();
    let mut b = Flock::with_boids(arena(), P, reversed).unwrap();
    for _ in 0..10 {
        a.step();
        b.step();
    }
    let n = a.len();
    for i in 0..n {
        let (p, q) = (a.boid(i).unwrap(), b.boid(n - 1 - i).unwrap());
        let d = (p.x - q.x).abs().max((p.y - q.y).abs());
        assert!(d < 1e-3, "boid {i}: {d} px apart");
    }
}

/// Polarization (`Flock::polarization`) from random headings (~1/√n),
/// with and without alignment. Measured over steps 500–2,000, four seeds:
/// with ECE 4760's values the mean is 0.49–0.77 (peaks 0.87–0.99); with
/// matching off it's 0.03–0.08 (peaks ≤ 0.14). Alignment makes the flock.
/// Bounds: ≥ 0.3 with, ≤ 0.2 without; the start ≤ 0.15.
#[test]
fn alignment_makes_a_flock() {
    let mean_order = |p: Params, seed: u64| {
        let mut f = Flock::new(300, arena(), p, seed).unwrap();
        let start = f.polarization();
        let mut sum = 0.0;
        for k in 0..2000 {
            f.step();
            if k >= 500 {
                sum += f.polarization();
            }
        }
        (start, sum / 1500.0)
    };
    for seed in [1, 2, 3, 4] {
        let (start, with) = mean_order(P, seed);
        let (_, without) = mean_order(Params { matching: 0.0, ..P }, seed);
        assert!(start <= 0.15, "seed {seed}: random start at {start}");
        assert!(with >= 0.3, "seed {seed}: aligned flock at {with}");
        assert!(without <= 0.2, "seed {seed}: no alignment, yet {without}");
    }
}

/// The same neighbours, summed in another order. Measured, 1,000 boids
/// at 1280 × 720: 3.1e-5 px apart after a step (an f32 ulp at a few
/// hundred px), 6.1e-5 after 10, 0.99 after 50 (chaos). Bounds 1e-3 px
/// at 1 and 10 steps.
#[test]
fn grid_and_brute_force_agree_to_rounding() {
    let mut grid = Flock::new(1000, Arena::new(1280.0, 720.0).unwrap(), P, 9).unwrap();
    let mut brute = grid.clone();
    brute.set_neighbours(Neighbours::Brute);
    for steps in [1_u64, 10] {
        while grid.steps() < steps {
            grid.step();
            brute.step();
        }
        let worst = grid
            .boids()
            .zip(brute.boids())
            .map(|(a, b)| (a.x - b.x).abs().max((a.y - b.y).abs()))
            .fold(0.0_f32, f32::max);
        assert!(worst < 1e-3, "after {steps} steps: {worst} px apart");
    }
}
