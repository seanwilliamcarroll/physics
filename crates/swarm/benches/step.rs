//! One step's cost (`docs/15-swarm.md`, "What's measured"): brute force
//! against the grid as the flock grows, at the page's density (10k boids
//! in 1280 × 720; the arena grows with n). Each flock is warmed up 300
//! steps first, so it's flocking, not uniform. `cargo bench -p swarm`.
// Bench setup unwraps sizes that can't fail; benches aren't test code,
// so the workspace's unwrap lint applies (docs/lint-policy.md).
#![expect(clippy::unwrap_used, reason = "bench setup: fixed, valid sizes")]

use criterion::{BenchmarkId, Criterion, Throughput, criterion_group, criterion_main};
use math::convert::{f64_to_f32, usize_to_f64};
use swarm::{Arena, Flock, Neighbours, Params};

/// A warmed-up flock of `n` at the page's density.
fn flock(n: usize) -> Flock {
    let scale = f64_to_f32((usize_to_f64(n) / 10_000.0).sqrt());
    let arena = Arena::new(1280.0 * scale, 720.0 * scale).unwrap();
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
}

criterion_group!(benches, bench);
criterion_main!(benches);
