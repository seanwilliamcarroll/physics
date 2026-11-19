//! One step's cost: a busy grid and a settled one, chunks on and off, at
//! the page's default size and the stress size. `cargo bench -p sand`.
// Bench setup unwraps grid sizes that can't fail; benches aren't test code,
// so the workspace's unwrap lint applies (docs/lint-policy.md).
#![expect(
    clippy::unwrap_used,
    reason = "bench setup: fixed grid sizes well within MAX_CELLS"
)]

use criterion::{BatchSize, BenchmarkId, Criterion, Throughput, criterion_group, criterion_main};
use math::SplitMix64;
use sand::{Grid, Material};

/// A grid with a stone floor and `fill` of the rest sand or water, at
/// random: busy (most of it falling) until it settles.
fn busy(width: usize, height: usize, fill: f64) -> Grid {
    let mut grid = Grid::new(width, height, 1).unwrap();
    let mut rng = SplitMix64::new(7);
    for y in 0..height - 1 {
        for x in 0..width {
            let roll = rng.next_unit_f64();
            if roll < fill / 2.0 {
                grid.set(x, y, Material::Sand);
            } else if roll < fill {
                grid.set(x, y, Material::Water);
            }
        }
    }
    for x in 0..width {
        grid.set(x, height - 1, Material::Stone);
    }
    grid
}

fn settled(width: usize, height: usize) -> Grid {
    let mut grid = Grid::new(width, height, 1).unwrap();
    for y in height * 3 / 4..height {
        for x in 0..width {
            let material = if y == height - 1 {
                Material::Stone
            } else {
                Material::Sand
            };
            grid.set(x, y, material);
        }
    }
    // Two steps: painting wakes chunks for this step and the next.
    grid.step();
    grid.step();
    grid
}

fn bench(criterion: &mut Criterion) {
    let mut group = criterion.benchmark_group("sand_step");
    for (width, height) in [(640, 360), (1920, 1080)] {
        group.throughput(Throughput::Elements((width * height) as u64));
        for chunked in [true, false] {
            let label = format!(
                "{width}x{height}_{}",
                if chunked { "chunks" } else { "full" }
            );
            // Busy: the first step from the same random fill every time (it
            // settles as it runs, so a reused grid would drift toward still).
            let mut start = busy(width, height, 0.3);
            start.set_chunked(chunked);
            group.bench_with_input(BenchmarkId::new("busy", &label), &(), |bencher, ()| {
                bencher.iter_batched_ref(|| start.clone(), Grid::step, BatchSize::LargeInput);
            });
            let mut still = settled(width, height);
            still.set_chunked(chunked);
            if chunked {
                still.step();
                still.step();
            }
            group.bench_with_input(BenchmarkId::new("settled", &label), &(), |bencher, ()| {
                bencher.iter(|| still.step());
            });
        }
    }
    group.finish();
}

criterion_group!(benches, bench);
criterion_main!(benches);
