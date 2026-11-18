# Swarm mask experiments

```
host: MacBook-Air-5.local
arch: arm64
cpu: Apple M4
wasmtime 50.0.1
node v24.22.3, V8 13.6.233.17-node.63
rustc 1.99.1 (58cf8f9c3 2026-10-13)
binary: rustc
commit-hash: 58cf8f9c35b355199727627d07ae34a4e2846d67
commit-date: 2026-10-13
host: aarch64-apple-darwin
release: 1.99.1
LLVM version: 23.1.1
```

Mean time; in brackets, the change against `convert` at the same level.

## default (`RUSTFLAGS=''`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.25 ms | 1.09 ms (-13%) | 1.24 ms (-1%) | 1.02 ms (-18%) | 984 µs (-21%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.24 ms | 1.08 ms (-13%) | 1.24 ms (-0%) | 1.01 ms (-18%) | 973 µs (-22%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.28 ms | 1.1 ms (-14%) | 1.27 ms (-1%) | 1.11 ms (-14%) | 999 µs (-22%) |

## convert, each level against default

| bench | default | native | v8-simd128 |
|---|---|---|---|
| swarm_models/vicsek/4000 | 1.25 ms (+0%) | 1.24 ms (-1%) | 1.28 ms (+3%) |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--bits--step_grid-f32.s`: fdiv s ×1
- `default--bits--vicsek_step-f32.s`: fdiv s ×4, fsqrt s ×1
- `default--branch--step_grid-f32.s`: fdiv s ×1
- `default--branch--vicsek_step-f32.s`: fdiv s ×4, fsqrt s ×1
- `default--convert--step_grid-f32.s`: fdiv s ×1
- `default--convert--vicsek_step-f32.s`: fdiv s ×4, fsqrt s ×1
- `default--select--step_grid-f32.s`: fdiv s ×1
- `default--select--vicsek_step-f32.s`: fdiv s ×4, fsqrt s ×1
- `default--value--step_grid-f32.s`: fdiv s ×1
- `default--value--vicsek_step-f32.s`: fdiv s ×4, fsqrt s ×1
- `native--bits--step_grid-f32.s`: fdiv s ×1
- `native--bits--vicsek_step-f32.s`: fdiv s ×4, fsqrt s ×1
- `native--branch--step_grid-f32.s`: fdiv s ×1
- `native--branch--vicsek_step-f32.s`: fdiv s ×4, fsqrt s ×1
- `native--convert--step_grid-f32.s`: fdiv s ×1
- `native--convert--vicsek_step-f32.s`: fdiv s ×4, fsqrt s ×1
- `native--select--step_grid-f32.s`: fdiv s ×1
- `native--select--vicsek_step-f32.s`: fdiv s ×4, fsqrt s ×1
- `native--value--step_grid-f32.s`: fdiv s ×1
- `native--value--vicsek_step-f32.s`: fdiv s ×4, fsqrt s ×1
- `v8-simd128--bits--step_grid-f32.s`: f32.div ×1
- `v8-simd128--bits--vicsek_step-f32.s`: f32.div ×4, f32.sqrt ×1
- `v8-simd128--branch--step_grid-f32.s`: f32.div ×1
- `v8-simd128--branch--vicsek_step-f32.s`: f32.div ×4, f32.sqrt ×1
- `v8-simd128--convert--step_grid-f32.s`: f32.div ×1
- `v8-simd128--convert--vicsek_step-f32.s`: f32.div ×4, f32.sqrt ×1
- `v8-simd128--select--step_grid-f32.s`: f32.div ×1
- `v8-simd128--select--vicsek_step-f32.s`: f32.div ×4, f32.sqrt ×1
- `v8-simd128--value--step_grid-f32.s`: f32.div ×1
- `v8-simd128--value--vicsek_step-f32.s`: f32.div ×4, f32.sqrt ×1
