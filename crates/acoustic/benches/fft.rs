//! `cargo bench -p acoustic --bench fft`: the spectrum's cost
//! (`docs/13-waveguide.md`): one 4096-point analysis per page snapshot.
#![expect(
    clippy::unwrap_used,
    reason = "bench setup: fixed sizes that can't fail"
)]

use std::hint::black_box;
use std::time::Duration;

use acoustic::fft::{Fft, Spectrum};
use criterion::{BenchmarkId, Criterion, criterion_group, criterion_main};

/// The page's size, and one each side.
const SIZES: [usize; 3] = [1024, 4096, 16384];

fn fft(c: &mut Criterion) {
    let mut group = c.benchmark_group("fft_f32");
    for n in SIZES {
        let fft = Fft::<f32>::new(n).unwrap();
        let (mut re, mut im) = (vec![0.5_f32; n], vec![0.0_f32; n]);
        group.bench_with_input(BenchmarkId::from_parameter(n), &n, |b, _| {
            b.iter(|| black_box(fft.forward(black_box(&mut re), &mut im)));
        });
    }
    group.finish();
    let mut spectrum = Spectrum::<f32>::new(4096).unwrap();
    let signal = vec![0.25_f32; 4096];
    c.bench_function("spectrum_f32/4096", |b| {
        b.iter(|| black_box(spectrum.analyze(black_box(&signal)).map(<[f32]>::len)));
    });
}

criterion_group! {
    name = group;
    config = Criterion::default()
        .warm_up_time(Duration::from_secs(1))
        .measurement_time(Duration::from_secs(2));
    targets = fft
}
criterion_main!(group);
