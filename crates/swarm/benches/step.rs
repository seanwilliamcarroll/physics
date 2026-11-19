//! One step's cost (`docs/15-swarm.md`, "What's measured"): brute force
//! against the grid as the flock grows, at the page's density (10k boids
//! in 2560 × 1440; the arena grows with n). Each model is warmed up first,
//! so it's flocking, not uniform, and every iteration steps the same
//! warmed state (below). `cargo bench -p swarm`.
//!
//! Every case builds and warms what it measures lazily, inside its own
//! closure, so a filtered run (`cargo bench -- 'Brute/10000$'`, or
//! `cargo xtask profile`) pays only for that case.
#![expect(clippy::unwrap_used, reason = "bench setup: fixed, valid sizes")]

use criterion::{BatchSize, BenchmarkId, Criterion, Throughput, criterion_group, criterion_main};
use math::convert::{f64_to_f32, usize_to_f64};
use swarm::{
    AntParams, Arena, Colony, Flock, Neighbours, Params, Slime, SlimeParams, Vicsek, VicsekParams,
};

/// Every case times one step from the same warmed-up state, cloned per
/// iteration (`iter_batched_ref`): stepping one model on and on drifts
/// ±9–16% as flocks cluster, from a fixed state ±0.1%.
///
/// The warm-up runs Sorted, so a change to its sums' last bits shifts
/// small flocks' states (300 boids: 59.6 neighbours each to 83.7, 30–66%
/// slower with no slower code); read a small flock's jump against its
/// neighbour count.
const FLOCK_WARM_UP: usize = 1_000;
const VICSEK_WARM_UP: usize = 3_000;
const ANTS_WARM_UP: usize = 1_000;
const SLIME_WARM_UP: usize = 300;

fn flock(boid_count: usize) -> Flock {
    let scale = f64_to_f32((usize_to_f64(boid_count) / 10_000.0).sqrt());
    let arena = Arena::new(2560.0 * scale, 1440.0 * scale).unwrap();
    let mut flock = Flock::new(boid_count, arena, Params::ECE4760, 1).unwrap();
    for _ in 0..FLOCK_WARM_UP {
        flock.step();
    }
    flock
}

fn bench(criterion: &mut Criterion) {
    let mut group = criterion.benchmark_group("swarm_step");
    group.sample_size(10);
    for (method, sizes) in [
        (Neighbours::Brute, &[300_usize, 1_000, 3_000, 10_000][..]),
        (Neighbours::Grid, &[300, 1_000, 3_000, 10_000, 100_000][..]),
        (
            Neighbours::Sorted,
            &[300, 1_000, 3_000, 10_000, 100_000][..],
        ),
    ] {
        for &boid_count in sizes {
            let mut built: Option<Flock> = None;
            group.throughput(Throughput::Elements(boid_count as u64));
            group.bench_function(
                BenchmarkId::new(format!("{method:?}"), boid_count),
                |bencher| {
                    let warmed = built.get_or_insert_with(|| {
                        let mut fresh = flock(boid_count);
                        fresh.set_neighbours(method);
                        fresh
                    });
                    bencher.iter_batched_ref(|| warmed.clone(), Flock::step, BatchSize::LargeInput);
                },
            );
        }
    }
    group.finish();
    models(criterion);
}

/// The other models' steps, each at its page's size.
fn models(criterion: &mut Criterion) {
    let mut group = criterion.benchmark_group("swarm_models");
    group.sample_size(20);
    let mut vicsek: Option<Vicsek> = None;
    group.bench_function("vicsek/4000", |bencher| {
        let warmed = vicsek.get_or_insert_with(|| {
            let mut fresh = Vicsek::new(4_000, 31.6, VicsekParams::paper(2.0), 1).unwrap();
            for _ in 0..VICSEK_WARM_UP {
                fresh.step();
            }
            fresh
        });
        bencher.iter_batched_ref(|| warmed.clone(), Vicsek::step, BatchSize::LargeInput);
    });
    let mut colony: Option<Colony> = None;
    group.bench_function("ants/200x120_500", |bencher| {
        let warmed = colony.get_or_insert_with(|| {
            let mut fresh =
                Colony::new(200, 120, 500, (25.0, 60.0, 6.0), AntParams::DEFAULT, 1).unwrap();
            fresh.paint_food(160.0, 60.0, 8.0, 50);
            for _ in 0..ANTS_WARM_UP {
                fresh.step();
            }
            fresh
        });
        bencher.iter_batched_ref(|| warmed.clone(), Colony::step, BatchSize::LargeInput);
    });
    let mut slime: Option<Slime> = None;
    group.bench_function("physarum/512_100k", |bencher| {
        let warmed = slime.get_or_insert_with(|| {
            let mut fresh = Slime::new(512, 100_000, SlimeParams::DEFAULT, 1).unwrap();
            for _ in 0..SLIME_WARM_UP {
                fresh.step();
            }
            fresh
        });
        bencher.iter_batched_ref(|| warmed.clone(), Slime::step, BatchSize::LargeInput);
    });
    group.finish();
}

criterion_group!(benches, bench);
criterion_main!(benches);
