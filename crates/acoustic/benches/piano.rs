//! `cargo bench -p acoustic --bench piano`: the piano's cost
//! (`docs/14-piano.md`, "Cost"): a render quantum with every voice a
//! three-string key, against the quantum's real time (2.67 ms at 48 kHz),
//! and the one-time design of all 88 keys.
#![expect(
    clippy::unwrap_used,
    reason = "bench setup: fixed keys that can't fail"
)]

use std::hint::black_box;
use std::time::Duration;

use acoustic::hammer::FORTISSIMO;
use acoustic::{Model, VOICES, Voices};
use criterion::{Criterion, criterion_group, criterion_main};

const FS: f64 = 48_000.0;
const QUANTUM: usize = 128;
/// Three-string keys (from A2 up), spread over the keyboard.
const FIRST_TRIO: u8 = 45;
const SPACING: u8 = 4;

fn piano(c: &mut Criterion) {
    let mut v = Voices::<f32>::new(FS, 1).unwrap();
    v.set_model(Model::Piano);
    for i in 0..u8::try_from(VOICES).unwrap() {
        assert!(v.strike(FIRST_TRIO + i * SPACING % 60, FORTISSIMO));
    }
    let mut out = vec![0.0_f32; QUANTUM];
    c.bench_function("piano_16_voices_x3_strings/128", |b| {
        b.iter(|| v.render(black_box(&mut out)));
    });
    c.bench_function("piano_design_88_keys", |b| {
        b.iter(|| {
            let mut v = Voices::<f32>::new(FS, 1).unwrap();
            v.set_model(black_box(Model::Piano));
            v
        });
    });
}

criterion_group! {
    name = group;
    config = Criterion::default()
        .warm_up_time(Duration::from_secs(1))
        .measurement_time(Duration::from_secs(3))
        .sample_size(10);
    targets = piano
}
criterion_main!(group);
