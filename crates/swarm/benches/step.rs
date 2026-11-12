//! One step's cost (`docs/15-swarm.md`, "What's measured"): brute force
//! against the grid as the flock grows, at the page's density (10k boids
//! in 2560 × 1440; the arena grows with n). Each flock is warmed up 300
//! steps first, so it's flocking, not uniform. `cargo bench -p swarm`.
// Bench setup unwraps sizes that can't fail; benches aren't test code,
// so the workspace's unwrap lint applies (docs/lint-policy.md).
#![expect(clippy::unwrap_used, reason = "bench setup: fixed, valid sizes")]

use criterion::{BenchmarkId, Criterion, Throughput, criterion_group, criterion_main};
use math::convert::{f64_to_f32, usize_to_f64};
use swarm::{
    AntParams, Arena, Colony, Flock, Neighbours, Params, Slime, SlimeParams, Vicsek, VicsekParams,
};

/// A warmed-up flock of `n` at the page's density.
fn flock(n: usize) -> Flock {
    let scale = f64_to_f32((usize_to_f64(n) / 10_000.0).sqrt());
    let arena = Arena::new(2560.0 * scale, 1440.0 * scale).unwrap();
    let mut f = Flock::new(n, arena, Params::ECE4760, 1).unwrap();
    for _ in 0..300 {
        f.step();
    }
    f
}

fn bench(c: &mut Criterion) {
    let mut group = c.benchmark_group("swarm_step");
    group.sample_size(10);
    for (how, sizes) in [
        (Neighbours::Brute, &[300_usize, 1_000, 3_000, 10_000][..]),
        (Neighbours::Grid, &[300, 1_000, 3_000, 10_000, 100_000][..]),
        (
            Neighbours::Sorted,
            &[300, 1_000, 3_000, 10_000, 100_000][..],
        ),
    ] {
        for &n in sizes {
            let mut f = flock(n);
            f.set_neighbours(how);
            group.throughput(Throughput::Elements(n as u64));
            group.bench_function(BenchmarkId::new(format!("{how:?}"), n), |b| {
                b.iter(|| f.step());
            });
        }
    }
    group.finish();
    models(c);
}

/// The other models' steps, each at its page's size (what
/// `examples/workload.rs` runs for a profiler): Vicsek on the grid, the
/// ants with food to find, Physarum.
fn models(c: &mut Criterion) {
    let mut group = c.benchmark_group("swarm_models");
    group.sample_size(20);
    let mut v = Vicsek::new(4_000, 31.6, VicsekParams::paper(2.0), 1).unwrap();
    // Warmed up: the cost follows the clustering, which takes a while.
    for _ in 0..500 {
        v.step();
    }
    group.bench_function("vicsek/4000", |b| b.iter(|| v.step()));
    let mut ants = Colony::new(200, 120, 500, (25.0, 60.0, 6.0), AntParams::DEFAULT, 1).unwrap();
    ants.paint_food(160.0, 60.0, 8.0, 50);
    group.bench_function("ants/200x120_500", |b| b.iter(|| ants.step()));
    let mut slime = Slime::new(512, 100_000, SlimeParams::DEFAULT, 1).unwrap();
    group.bench_function("physarum/512_100k", |b| b.iter(|| slime.step()));
    group.finish();
}

criterion_group!(benches, bench);
criterion_main!(benches);
