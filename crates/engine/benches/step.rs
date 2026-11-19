//! `cargo bench -p engine --bench step`: cost of a physics step as N grows
//! (`docs/04-testing.md`, benchmarks). Results recorded in that doc; the
//! wasm side is `cargo xtask bench-wasm`. Barnes–Hut vs pairwise:
//! `docs/barnes-hut.md`.
// Bench setup unwraps scenarios that can't fail; benches aren't test code,
// so the library lints would otherwise apply (docs/lint-policy.md).
#![expect(
    clippy::unwrap_used,
    reason = "bench setup: fixed scenarios that can't fail"
)]

use math::convert::{f64_to_usize, usize_to_f64};
use std::hint::black_box;
use std::time::Duration;

use criterion::{BenchmarkId, Criterion, criterion_group, criterion_main};
use engine::collision::candidate_pairs;
use engine::scenarios::{CLUSTER_SOFTENING, GRAVITATIONAL_CONSTANT, cluster, cluster_gravity};
use engine::{BarnesHut, Force, Integrator, OpeningAngle, Scalar, Softening, TimeStep, Vec2};

/// Body counts: O(n²) makes each ~8x step in N cost ~64x.
const SIZES: [usize; 3] = [16, 128, 1024];
/// Extra size for the force-only groups: where Barnes–Hut's O(n log n)
/// should clearly beat the pair loop (`docs/barnes-hut.md`, cost).
const LARGE_N: usize = 4096;
const TREE_SIZES: [usize; 3] = [128, 1024, LARGE_N];
/// Opening angles: 0.5 (a common accuracy choice, ~5% max force error
/// here) and 1.0 (Barnes & Hut's own, ~30%); `docs/barnes-hut.md`.
const THETAS: [f64; 2] = [0.5, 1.0];
const SEED: u64 = 1;
const DT: f64 = 1.0 / 60.0;
/// Integrators with distinct cost: explicit Euler costs the same as
/// symplectic Euler (one force pass); velocity Verlet does two.
const INTEGRATORS: [(Integrator, &str); 2] = [
    (Integrator::SymplecticEuler, "symplectic"),
    (Integrator::VelocityVerlet, "verlet"),
];

fn step<S: Scalar>(criterion: &mut Criterion, scalar: &str) {
    for (integrator, name) in INTEGRATORS {
        let mut group = criterion.benchmark_group(format!("step_{scalar}_{name}"));
        for body_count in SIZES {
            let mut world = cluster::<S>(body_count, SEED).unwrap();
            world.set_integrator(integrator);
            let time_step = TimeStep::new(S::from_f64(DT)).unwrap();
            group.bench_with_input(
                BenchmarkId::from_parameter(body_count),
                &body_count,
                |bencher, _| {
                    bencher.iter(|| world.step(black_box(time_step)));
                },
            );
        }
        group.finish();
    }
}

fn pairwise<S: Scalar>(criterion: &mut Criterion, scalar: &str) {
    let mut group = criterion.benchmark_group(format!("pairwise_{scalar}"));
    let gravity = cluster_gravity::<S>().unwrap();
    for body_count in SIZES.into_iter().chain([LARGE_N]) {
        let world = cluster::<S>(body_count, SEED).unwrap();
        let mut accelerations = vec![Vec2::ZERO; body_count];
        group.bench_with_input(
            BenchmarkId::from_parameter(body_count),
            &body_count,
            |bencher, _| {
                bencher.iter(|| {
                    accelerations.fill(Vec2::ZERO);
                    gravity.accumulate(black_box(world.particles()), &mut accelerations);
                });
            },
        );
    }
    group.finish();
}

/// `BarnesHut::accumulate` (tree build and walk) on the same clusters as
/// [`pairwise`], per θ: the speedup and crossover in `docs/barnes-hut.md`.
fn barnes_hut<S: Scalar>(criterion: &mut Criterion, scalar: &str) {
    let mut group = criterion.benchmark_group(format!("barnes_hut_{scalar}"));
    let softening = Softening::new(S::from_f64(CLUSTER_SOFTENING)).unwrap();
    for theta in THETAS {
        let opening_angle = OpeningAngle::new(S::from_f64(theta)).unwrap();
        let force = BarnesHut::new(
            S::from_f64(GRAVITATIONAL_CONSTANT),
            softening,
            opening_angle,
        );
        for body_count in TREE_SIZES {
            let world = cluster::<S>(body_count, SEED).unwrap();
            let mut accelerations = vec![Vec2::ZERO; body_count];
            group.bench_with_input(
                BenchmarkId::new(format!("theta_{theta}"), body_count),
                &body_count,
                |bencher, _| {
                    bencher.iter(|| {
                        accelerations.fill(Vec2::ZERO);
                        force.accumulate(black_box(world.particles()), &mut accelerations);
                    });
                },
            );
        }
    }
    group.finish();
}

/// What `PairwiseGravity::accumulate` does before its pair loop: collect
/// (position, mass, inverse mass) per body into a fresh Vec. Isolates
/// whether that per-call allocation matters.
fn body_vec<S: Scalar>(criterion: &mut Criterion, scalar: &str) {
    let mut group = criterion.benchmark_group(format!("bodyvec_{scalar}"));
    for body_count in SIZES {
        let world = cluster::<S>(body_count, SEED).unwrap();
        let particles = world.particles();
        group.bench_with_input(
            BenchmarkId::from_parameter(body_count),
            &body_count,
            |bencher, _| {
                bencher.iter(|| {
                    let bodies: Vec<(Vec2<S>, S, S)> = black_box(particles)
                        .positions()
                        .iter()
                        .zip(particles.inverse_mass())
                        .map(|(&position, &inverse_mass)| {
                            (
                                position,
                                if inverse_mass == S::ZERO {
                                    S::ZERO
                                } else {
                                    S::ONE / inverse_mass
                                },
                                inverse_mass,
                            )
                        })
                        .collect();
                    black_box(bodies)
                });
            },
        );
    }
    group.finish();
}

/// Broadphase circles: radius 5 cm, centers on a square lattice 12 cm
/// apart, each nudged by up to 2 cm, so neighbors nearly touch (a full
/// box). Constant density: the cost should grow like N log N (the sort).
const BALL_RADIUS: f64 = 0.05;
const BALL_SPACING: f64 = 0.12;
const BALL_JITTER: f64 = 0.02;

fn broadphase(criterion: &mut Criterion) {
    let mut group = criterion.benchmark_group("broadphase_f64");
    for circle_count in TREE_SIZES {
        let side = f64_to_usize(usize_to_f64(circle_count).sqrt().ceil()).unwrap();
        let positions: Vec<Vec2<f64>> = (0..circle_count)
            .map(|index| {
                let (column, row) = (index % side, index / side);
                let jitter = |seed: usize| {
                    BALL_JITTER
                        * (f64::from(u32::try_from(seed * 7919 % 101).unwrap()) / 100.0 - 0.5)
                };
                let (x, y) = (
                    usize_to_f64(column) * BALL_SPACING + jitter(index),
                    usize_to_f64(row) * BALL_SPACING + jitter(index + 1),
                );
                Vec2::new(x, y)
            })
            .collect();
        let radii = vec![BALL_RADIUS; circle_count];
        let mut pairs = Vec::new();
        group.bench_with_input(
            BenchmarkId::from_parameter(circle_count),
            &circle_count,
            |bencher, _| {
                bencher.iter(|| {
                    candidate_pairs(black_box(&positions), &radii, 2.0 * BALL_RADIUS, &mut pairs);
                    black_box(pairs.len())
                });
            },
        );
    }
    group.finish();
}

fn benches(criterion: &mut Criterion) {
    broadphase(criterion);
    step::<f32>(criterion, "f32");
    step::<f64>(criterion, "f64");
    pairwise::<f32>(criterion, "f32");
    pairwise::<f64>(criterion, "f64");
    barnes_hut::<f32>(criterion, "f32");
    barnes_hut::<f64>(criterion, "f64");
    body_vec::<f32>(criterion, "f32");
    body_vec::<f64>(criterion, "f64");
}

criterion_group! {
    name = group;
    // Shorter than criterion's defaults (3 s warm-up, 5 s measurement):
    // the whole suite in about a minute, with stable enough numbers.
    config = Criterion::default()
        .warm_up_time(Duration::from_secs(1))
        .measurement_time(Duration::from_secs(2));
    targets = benches
}
criterion_main!(group);
