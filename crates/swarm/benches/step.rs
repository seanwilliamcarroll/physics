//! One step's cost (`docs/15-swarm.md`, "What's measured"): brute force
//! against the grid as the flock grows, at the page's density (10k boids
//! in 2560 × 1440; the arena grows with n). Each model is warmed up first,
//! so it's flocking, not uniform, and every iteration steps the same
//! warmed state (below). `cargo bench -p swarm`.
//!
//! Every case builds what it measures lazily, inside its own closure, the
//! first time criterion runs it: criterion runs a case's closure only when
//! the filter matches, so a filtered run (`cargo bench -- 'Brute/10000$'`,
//! or `cargo xtask profile`) builds and warms only that case. Built up
//! front, a filtered profile was mostly other cases' set-up.
// Bench setup unwraps sizes that can't fail; benches aren't test code,
// so the workspace's unwrap lint applies (docs/lint-policy.md).
#![expect(clippy::unwrap_used, reason = "bench setup: fixed, valid sizes")]

use criterion::{BatchSize, BenchmarkId, Criterion, Throughput, criterion_group, criterion_main};
use math::convert::{f64_to_f32, usize_to_f64};
use swarm::{
    AntParams, Arena, Colony, Flock, Neighbours, Params, Slime, SlimeParams, Vicsek, VicsekParams,
};

/// Every case times one step from the same warmed-up state: a clone of it
/// per iteration (`iter_batched_ref`; the clone isn't timed). Stepping one
/// model on and on, as these did until 2026-11-17, timed a moving target
/// (the flocks keep clustering, so a step's cost drifts): ±9–16% on both
/// machines where everything else was ±1%. Fixed, ±0.1%. The warm-ups
/// pick a developed state, affordable to reach (the M4, a step at 10k
/// after 300 / 1,000 / 3,000 / 10,000 steps: Grid 3.6 / 4.4 / 5.4 / 4.9
/// ms; Vicsek's keeps climbing, 0.6 to 1.5 ms; the ants settle by 1,000;
/// Physarum stays within 10%).
const FLOCK_WARM_UP: usize = 1_000;
const VICSEK_WARM_UP: usize = 3_000;
const ANTS_WARM_UP: usize = 1_000;
const SLIME_WARM_UP: usize = 300;

/// A warmed-up flock of `n` at the page's density.
fn flock(n: usize) -> Flock {
    let scale = f64_to_f32((usize_to_f64(n) / 10_000.0).sqrt());
    let arena = Arena::new(2560.0 * scale, 1440.0 * scale).unwrap();
    let mut f = Flock::new(n, arena, Params::ECE4760, 1).unwrap();
    for _ in 0..FLOCK_WARM_UP {
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
            let mut built: Option<Flock> = None;
            group.throughput(Throughput::Elements(n as u64));
            group.bench_function(BenchmarkId::new(format!("{how:?}"), n), |b| {
                let f = built.get_or_insert_with(|| {
                    let mut f = flock(n);
                    f.set_neighbours(how);
                    f
                });
                b.iter_batched_ref(|| f.clone(), Flock::step, BatchSize::LargeInput);
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
    let mut vicsek: Option<Vicsek> = None;
    group.bench_function("vicsek/4000", |b| {
        let v = vicsek.get_or_insert_with(|| {
            let mut v = Vicsek::new(4_000, 31.6, VicsekParams::paper(2.0), 1).unwrap();
            // Warmed up: the cost follows the clustering, which takes a while.
            for _ in 0..VICSEK_WARM_UP {
                v.step();
            }
            v
        });
        b.iter_batched_ref(|| v.clone(), Vicsek::step, BatchSize::LargeInput);
    });
    let mut colony: Option<Colony> = None;
    group.bench_function("ants/200x120_500", |b| {
        let ants = colony.get_or_insert_with(|| {
            let mut ants =
                Colony::new(200, 120, 500, (25.0, 60.0, 6.0), AntParams::DEFAULT, 1).unwrap();
            ants.paint_food(160.0, 60.0, 8.0, 50);
            for _ in 0..ANTS_WARM_UP {
                ants.step();
            }
            ants
        });
        b.iter_batched_ref(|| ants.clone(), Colony::step, BatchSize::LargeInput);
    });
    let mut slime: Option<Slime> = None;
    group.bench_function("physarum/512_100k", |b| {
        let s = slime.get_or_insert_with(|| {
            let mut s = Slime::new(512, 100_000, SlimeParams::DEFAULT, 1).unwrap();
            for _ in 0..SLIME_WARM_UP {
                s.step();
            }
            s
        });
        b.iter_batched_ref(|| s.clone(), Slime::step, BatchSize::LargeInput);
    });
    group.finish();
}

criterion_group!(benches, bench);
criterion_main!(benches);
