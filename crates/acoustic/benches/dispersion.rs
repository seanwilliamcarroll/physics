//! `cargo bench -p acoustic --bench dispersion`: a stiff string's setup
//! cost (`docs/14-piano.md`, "Dispersion in the loop"). `Waveguide::new`
//! designs the dispersion cascade (placement, then refinement): too slow
//! for a note on, so the piano designs each key once, at start.
#![expect(
    clippy::unwrap_used,
    reason = "bench setup: fixed keys that can't fail"
)]

use std::hint::black_box;
use std::time::Duration;

use acoustic::{Decay, Voicing, Waveguide, inharmonicity};
use criterion::{BenchmarkId, Criterion, criterion_group, criterion_main};

const FS: f64 = 48_000.0;
/// A0, C2, C4, A4, C6: the bass's many partials to the treble's few.
const KEYS: [u8; 5] = [21, 36, 60, 69, 84];

fn design(c: &mut Criterion) {
    let mut group = c.benchmark_group("stiff_waveguide_new");
    for key in KEYS {
        let f0 = 440.0 * 2f64.powf((f64::from(key) - 69.0) / 12.0);
        let voicing = Voicing {
            tuned: true,
            decay: Decay::T60(4.0),
            inharmonicity: inharmonicity(key),
        };
        group.bench_with_input(BenchmarkId::from_parameter(key), &key, |b, _| {
            b.iter(|| black_box(Waveguide::<f32>::new(FS, black_box(f0), voicing).unwrap()));
        });
    }
    group.finish();
}

criterion_group! {
    name = group;
    config = Criterion::default()
        .warm_up_time(Duration::from_secs(1))
        .measurement_time(Duration::from_secs(3))
        .sample_size(20);
    targets = design
}
criterion_main!(group);
