# Boids Sorted's span edges

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

Mean time; in brackets, the change against `base` at the same level.

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | all | table | all-8 | table-8 |
|---|---|---|---|---|---|
| swarm_step/Sorted/1000 | 119 µs | 158 µs (+33%) | 143 µs (+20%) | 133 µs (+12%) | 127 µs (+7%) |
| swarm_step/Sorted/10000 | 1.79 ms | 1.77 ms (-1%) | 1.63 ms (-9%) | 1.56 ms (-13%) | 1.49 ms (-17%) |
| swarm_step/Sorted/100000 | 20.1 ms | 20 ms (-0%) | 18.8 ms (-6%) | 17 ms (-15%) | 16.3 ms (-19%) |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `v8-simd128--all--grid_fill-f32.s`: none
- `v8-simd128--all--step_sorted-f32.s`: f32.div ×1
- `v8-simd128--all-8--grid_fill-f32.s`: none
- `v8-simd128--all-8--step_sorted-f32.s`: f32.div ×1
- `v8-simd128--base--grid_fill-f32.s`: none
- `v8-simd128--base--step_sorted-f32.s`: f32.div ×1
- `v8-simd128--table--grid_fill-f32.s`: none
- `v8-simd128--table--step_sorted-f32.s`: f32.div ×1
- `v8-simd128--table-8--grid_fill-f32.s`: none
- `v8-simd128--table-8--step_sorted-f32.s`: f32.div ×1
