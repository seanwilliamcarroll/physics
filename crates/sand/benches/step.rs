//! One step's cost (`docs/11-falling-sand.md`, "Costs to measure"): a busy
//! grid and a settled one, chunks on and off, at the page's default size
//! and the stress size. `cargo bench -p sand`.
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
fn busy(w: usize, h: usize, fill: f64) -> Grid {
    let mut g = Grid::new(w, h, 1).unwrap();
    let mut rng = SplitMix64::new(7);
    for y in 0..h - 1 {
        for x in 0..w {
            let r = rng.next_unit_f64();
            if r < fill / 2.0 {
                g.set(x, y, Material::Sand);
            } else if r < fill {
                g.set(x, y, Material::Water);
            }
        }
    }
    for x in 0..w {
        g.set(x, h - 1, Material::Stone);
    }
    g
}

/// A sand layer at rest on a floor: nothing moves.
fn settled(w: usize, h: usize) -> Grid {
    let mut g = Grid::new(w, h, 1).unwrap();
    for y in h * 3 / 4..h {
        for x in 0..w {
            g.set(
                x,
                y,
                if y == h - 1 {
                    Material::Stone
                } else {
                    Material::Sand
                },
            );
        }
    }
    // Two steps: painting wakes chunks for this step and the next.
    g.step();
    g.step();
    g
}

fn bench(c: &mut Criterion) {
    let mut group = c.benchmark_group("sand_step");
    for (w, h) in [(640, 360), (1920, 1080)] {
        group.throughput(Throughput::Elements((w * h) as u64));
        for chunked in [true, false] {
            let label = format!("{w}x{h}_{}", if chunked { "chunks" } else { "full" });
            // Busy: the first step from the same random fill every time (it
            // settles as it runs, so a reused grid would drift toward still).
            let mut start = busy(w, h, 0.3);
            start.set_chunked(chunked);
            group.bench_with_input(BenchmarkId::new("busy", &label), &(), |b, ()| {
                b.iter_batched_ref(|| start.clone(), Grid::step, BatchSize::LargeInput);
            });
            let mut g = settled(w, h);
            g.set_chunked(chunked);
            if chunked {
                g.step();
                g.step();
            }
            group.bench_with_input(BenchmarkId::new("settled", &label), &(), |b, ()| {
                b.iter(|| g.step());
            });
        }
    }
    group.finish();
}

criterion_group!(benches, bench);
criterion_main!(benches);
