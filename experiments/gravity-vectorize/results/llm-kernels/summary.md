# Gravity experiments

```
host: llm
arch: x86_64
cpu: AMD Ryzen 7 9700X 8-Core Processor
simd: sse2 avx avx2 fma avx512f avx512dq avx512vl
wasmtime 50.0.1 (c307ec81d 2026-10-29)
node v24.22.3, V8 13.6.233.17-node.63
rustc 1.99.1 (58cf8f9c3 2026-10-13)
binary: rustc
commit-hash: 58cf8f9c35b355199727627d07ae34a4e2846d67
commit-date: 2026-10-13
host: x86_64-unknown-linux-gnu
release: 1.99.1
LLVM version: 23.1.1
```

Mean time; in brackets, the change against `two-pass-l16` at the same level.

## default (`RUSTFLAGS=''`)

| bench | default | two-pass-l16 |
|---|---|---|
| pairwise_f32/16 | 207 ns (-50%) | 413 ns |
| pairwise_f32/128 | 6.5 µs (+0%) | 6.5 µs |
| pairwise_f32/1024 | 302 µs (-1%) | 304 µs |
| pairwise_f32/4096 | 4.68 ms (+0%) | 4.68 ms |
| pairwise_f64/16 | 279 ns (-39%) | 458 ns |
| pairwise_f64/128 | 13.3 µs (+10%) | 12.1 µs |
| pairwise_f64/1024 | 656 µs (-5%) | 689 µs |
| pairwise_f64/4096 | 10 ms (-8%) | 10.9 ms |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | default | two-pass-l16 |
|---|---|---|
| pairwise_f32/16 | 197 ns (-63%) | 533 ns |
| pairwise_f32/128 | 5.41 µs (-1%) | 5.46 µs |
| pairwise_f32/1024 | 184 µs (+0%) | 184 µs |
| pairwise_f32/4096 | 2.79 ms (+0%) | 2.79 ms |
| pairwise_f64/16 | 275 ns (-44%) | 488 ns |
| pairwise_f64/128 | 8.83 µs (+5%) | 8.39 µs |
| pairwise_f64/1024 | 421 µs (-0%) | 423 µs |
| pairwise_f64/4096 | 6.69 ms (+0%) | 6.68 ms |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | default | two-pass-l16 |
|---|---|---|
| pairwise_f32/16 | 196 ns (-58%) | 467 ns |
| pairwise_f32/128 | 4.45 µs (+2%) | 4.38 µs |
| pairwise_f32/1024 | 96.7 µs (+1%) | 96.1 µs |
| pairwise_f32/4096 | 1.55 ms (-0%) | 1.56 ms |
| pairwise_f64/16 | 277 ns (-53%) | 587 ns |
| pairwise_f64/128 | 6.07 µs (+2%) | 5.96 µs |
| pairwise_f64/1024 | 201 µs (-2%) | 204 µs |
| pairwise_f64/4096 | 3.25 ms (-0%) | 3.26 ms |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | default | two-pass-l16 |
|---|---|---|
| pairwise_f32/16 | 341 ns (-26%) | 459 ns |
| pairwise_f32/128 | 6.89 µs (+1%) | 6.83 µs |
| pairwise_f32/1024 | 303 µs (+0%) | 302 µs |
| pairwise_f32/4096 | 4.71 ms (+0%) | 4.71 ms |
| pairwise_f64/16 | 300 ns (-53%) | 633 ns |
| pairwise_f64/128 | 10.7 µs (-20%) | 13.5 µs |
| pairwise_f64/1024 | 627 µs (-10%) | 698 µs |
| pairwise_f64/4096 | 9.93 ms (-9%) | 10.9 ms |

## two-pass-l16, each level against default

| bench | default | x86-64-v3 | native | v8-simd128 |
|---|---|---|---|---|
| pairwise_f32/16 | 413 ns (+0%) | 533 ns (+29%) | 467 ns (+13%) | 459 ns (+11%) |
| pairwise_f32/128 | 6.5 µs (+0%) | 5.46 µs (-16%) | 4.38 µs (-33%) | 6.83 µs (+5%) |
| pairwise_f32/1024 | 304 µs (+0%) | 184 µs (-39%) | 96.1 µs (-68%) | 302 µs (-1%) |
| pairwise_f32/4096 | 4.68 ms (+0%) | 2.79 ms (-40%) | 1.56 ms (-67%) | 4.71 ms (+1%) |
| pairwise_f64/16 | 458 ns (+0%) | 488 ns (+7%) | 587 ns (+28%) | 633 ns (+38%) |
| pairwise_f64/128 | 12.1 µs (+0%) | 8.39 µs (-31%) | 5.96 µs (-51%) | 13.5 µs (+11%) |
| pairwise_f64/1024 | 689 µs (+0%) | 423 µs (-39%) | 204 µs (-70%) | 698 µs (+1%) |
| pairwise_f64/4096 | 10.9 ms (+0%) | 6.68 ms (-39%) | 3.26 ms (-70%) | 10.9 ms (+0%) |
