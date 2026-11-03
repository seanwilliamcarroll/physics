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

use std::hint::black_box;
use std::time::Duration;

use criterion::{BenchmarkId, Criterion, criterion_group, criterion_main};
use engine::scenarios::{CLUSTER_SOFTENING, GRAVITATIONAL_CONSTANT, cluster, cluster_gravity};
use engine::{BarnesHut, Force, Integrator, Scalar, Softening, Vec2};

/// Body counts: O(n²) makes each ~8x step in N cost ~64x.
const SIZES: [usize; 3] = [16, 128, 1024];
/// Extra size for the force-only groups: where Barnes–Hut's O(n log n)
/// should clearly beat the pair loop (`docs/barnes-hut.md`, cost).
const LARGE_N: usize = 4096;
/// Barnes–Hut sizes: around and past the crossover with pairwise.
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

fn step<S: Scalar>(c: &mut Criterion, scalar: &str) {
    for (integrator, name) in INTEGRATORS {
        let mut group = c.benchmark_group(format!("step_{scalar}_{name}"));
        for n in SIZES {
            let mut w = cluster::<S>(n, SEED).unwrap();
            w.set_integrator(integrator);
            let dt = S::from_f64(DT);
            group.bench_with_input(BenchmarkId::from_parameter(n), &n, |b, _| {
                b.iter(|| w.step(black_box(dt)));
            });
        }
        group.finish();
    }
}

/// The force alone (no integration), to separate the O(n²) pair loop.
fn pairwise<S: Scalar>(c: &mut Criterion, scalar: &str) {
    let mut group = c.benchmark_group(format!("pairwise_{scalar}"));
    let gravity = cluster_gravity::<S>().unwrap();
    for n in SIZES.into_iter().chain([LARGE_N]) {
        let w = cluster::<S>(n, SEED).unwrap();
        let mut acc = vec![Vec2::ZERO; n];
        group.bench_with_input(BenchmarkId::from_parameter(n), &n, |b, _| {
            b.iter(|| {
                acc.fill(Vec2::ZERO);
                gravity.accumulate(black_box(&w.particles), &mut acc);
            });
        });
    }
    group.finish();
}

/// `BarnesHut::accumulate` (tree build and walk) on the same clusters as
/// [`pairwise`], per θ: the speedup and crossover in `docs/barnes-hut.md`.
fn barnes_hut<S: Scalar>(c: &mut Criterion, scalar: &str) {
    let mut group = c.benchmark_group(format!("barnes_hut_{scalar}"));
    let eps = Softening::new(S::from_f64(CLUSTER_SOFTENING)).unwrap();
    for theta in THETAS {
        let force =
            BarnesHut::new(S::from_f64(GRAVITATIONAL_CONSTANT), eps, S::from_f64(theta)).unwrap();
        for n in TREE_SIZES {
            let w = cluster::<S>(n, SEED).unwrap();
            let mut acc = vec![Vec2::ZERO; n];
            group.bench_with_input(BenchmarkId::new(format!("theta_{theta}"), n), &n, |b, _| {
                b.iter(|| {
                    acc.fill(Vec2::ZERO);
                    force.accumulate(black_box(&w.particles), &mut acc);
                });
            });
        }
    }
    group.finish();
}

/// What `PairwiseGravity::accumulate` does before its pair loop: collect
/// (position, mass, inverse mass) per body into a fresh Vec. M1 left open
/// whether that per-call allocation matters; this isolates it.
fn body_vec<S: Scalar>(c: &mut Criterion, scalar: &str) {
    let mut group = c.benchmark_group(format!("bodyvec_{scalar}"));
    for n in SIZES {
        let w = cluster::<S>(n, SEED).unwrap();
        let p = &w.particles;
        group.bench_with_input(BenchmarkId::from_parameter(n), &n, |b, _| {
            b.iter(|| {
                let bodies: Vec<(Vec2<S>, S, S)> = black_box(p)
                    .pos()
                    .iter()
                    .zip(p.inv_mass())
                    .map(|(&x, &iw)| (x, if iw == S::ZERO { S::ZERO } else { S::ONE / iw }, iw))
                    .collect();
                black_box(bodies)
            });
        });
    }
    group.finish();
}

fn benches(c: &mut Criterion) {
    step::<f32>(c, "f32");
    step::<f64>(c, "f64");
    pairwise::<f32>(c, "f32");
    pairwise::<f64>(c, "f64");
    barnes_hut::<f32>(c, "f32");
    barnes_hut::<f64>(c, "f64");
    body_vec::<f32>(c, "f32");
    body_vec::<f64>(c, "f64");
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
