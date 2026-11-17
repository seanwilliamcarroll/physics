//! Each demo's `render()`: clearing its RGBA buffer and drawing the model
//! into it, as the page does every frame (`docs/15-swarm.md`). The cases
//! are `cargo xtask bench-wasm`'s (`xtask/bench_modules.mjs`), so the
//! native and the Node numbers compare: 10k boids in 2560 × 1440 drawn at
//! half scale (1280 × 720), the ants' 200 × 120 world at 3 pixels a cell,
//! Physarum's 512², and Vicsek's N = 4000 at the page's 720-pixel view.
//! Each model is warmed up as there; `render` doesn't change the model,
//! so every iteration draws the same state. `cargo bench -p swarm-view`.
//!
//! Each case builds what it measures lazily, inside its own closure (as
//! `swarm`'s step bench): a filtered run builds only what it measures.
// Bench setup unwraps sizes that can't fail; benches aren't test code,
// so the workspace's unwrap lint applies (docs/lint-policy.md).
#![expect(clippy::unwrap_used, reason = "bench setup: fixed, valid sizes")]

use std::hint::black_box;

use criterion::{Criterion, criterion_group, criterion_main};
use swarm_view::abi;
use swarm_view::ant_demo::AntDemo;
use swarm_view::demo::SwarmDemo;
use swarm_view::slime_demo::SlimeDemo;
use swarm_view::vicsek_demo::VicsekDemo;

/// One frame at 60 Hz, as bench-wasm advances (a hair over, so each call
/// takes exactly one step).
const FRAME: f64 = 1.0 / 60.0 + 1e-9;

fn bench(c: &mut Criterion) {
    let mut group = c.benchmark_group("swarm_render");

    let mut boids: Option<SwarmDemo> = None;
    group.bench_function("boids/10000", |b| {
        let d = boids.get_or_insert_with(|| {
            let mut d = SwarmDemo::new(10_000, 2560, 1440, 2, 1).unwrap();
            for _ in 0..300 {
                d.advance(FRAME);
            }
            d
        });
        b.iter(|| black_box(d.render().len()));
    });

    let mut vicsek: Option<VicsekDemo> = None;
    group.bench_function("vicsek/4000", |b| {
        let d = vicsek.get_or_insert_with(|| VicsekDemo::new(4000, 31.6, 2.0, 720, 1).unwrap());
        b.iter(|| black_box(d.render().len()));
    });

    let mut ants: Option<AntDemo> = None;
    group.bench_function("ants/500", |b| {
        let d = ants.get_or_insert_with(|| {
            let mut d = AntDemo::new(200, 120, 500, 3, 1).unwrap();
            d.paint(abi::TOOL_FOOD, 160.0, 60.0, 8.0, 50).unwrap();
            for _ in 0..300 {
                d.advance(FRAME);
            }
            d
        });
        b.iter(|| black_box(d.render().len()));
    });

    let mut slime: Option<SlimeDemo> = None;
    group.bench_function("physarum/100000", |b| {
        let d = slime.get_or_insert_with(|| {
            let mut d = SlimeDemo::new(512, 100_000, 1, 1).unwrap();
            for _ in 0..50 {
                d.advance(FRAME);
            }
            d
        });
        b.iter(|| black_box(d.render().len()));
    });

    group.finish();
}

criterion_group!(benches, bench);
criterion_main!(benches);
