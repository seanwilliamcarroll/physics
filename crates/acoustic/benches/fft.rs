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

const SIZES: [usize; 3] = [1024, 4096, 16384];

fn fft(criterion: &mut Criterion) {
    let mut group = criterion.benchmark_group("fft_f32");
    for size in SIZES {
        let fft = Fft::<f32>::new(size).unwrap();
        let (mut real, mut imaginary) = (vec![0.5_f32; size], vec![0.0_f32; size]);
        group.bench_with_input(BenchmarkId::from_parameter(size), &size, |bencher, _| {
            bencher.iter(|| black_box(fft.forward(black_box(&mut real), &mut imaginary)));
        });
    }
    group.finish();
    let mut spectrum = Spectrum::<f32>::new(4096).unwrap();
    let signal = vec![0.25_f32; 4096];
    criterion.bench_function("spectrum_f32/4096", |bencher| {
        bencher.iter(|| black_box(spectrum.analyze(black_box(&signal)).map(<[f32]>::len)));
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
