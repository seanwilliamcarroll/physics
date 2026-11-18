# Swarm mask experiments

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

Mean time; in brackets, the change against `convert` at the same level.

## default (`RUSTFLAGS=''`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.28 ms | 1.48 ms (+16%) | 1.28 ms (-0%) | 1.3 ms (+2%) | 1.17 ms (-8%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.2 ms | 1.1 ms (-8%) | 1.2 ms (+0%) | 1.22 ms (+2%) | 932 µs (-22%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.21 ms | 1.06 ms (-12%) | 1.21 ms (-0%) | 1.13 ms (-7%) | 954 µs (-21%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 2.86 ms | 3.04 ms (+6%) | 2.9 ms (+1%) | 2.91 ms (+2%) | 2.29 ms (-20%) |

## convert, each level against default

| bench | default | x86-64-v3 | native | v8-simd128 |
|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.28 ms (+0%) | 1.2 ms (-6%) | 1.21 ms (-5%) | 2.86 ms (+124%) |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--bits--step_grid-f32.s`: divss ×1
- `default--bits--vicsek_step-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `default--branch--step_grid-f32.s`: divss ×1
- `default--branch--vicsek_step-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `default--convert--step_grid-f32.s`: divss ×1
- `default--convert--vicsek_step-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `default--select--step_grid-f32.s`: divss ×1
- `default--select--vicsek_step-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `default--value--step_grid-f32.s`: divss ×1
- `default--value--vicsek_step-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `native--bits--step_grid-f32.s`: divss ×1
- `native--bits--vicsek_step-f32.s`: divss ×4, sqrtss ×1
- `native--branch--step_grid-f32.s`: divss ×1
- `native--branch--vicsek_step-f32.s`: divss ×4, sqrtss ×1
- `native--convert--step_grid-f32.s`: divss ×1
- `native--convert--vicsek_step-f32.s`: divss ×4, sqrtss ×1
- `native--select--step_grid-f32.s`: divss ×1
- `native--select--vicsek_step-f32.s`: divss ×4, sqrtss ×1
- `native--value--step_grid-f32.s`: divss ×1
- `native--value--vicsek_step-f32.s`: divss ×4, sqrtss ×1
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
- `x86-64-v3--bits--step_grid-f32.s`: divss ×1
- `x86-64-v3--bits--vicsek_step-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `x86-64-v3--branch--step_grid-f32.s`: divss ×1
- `x86-64-v3--branch--vicsek_step-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `x86-64-v3--convert--step_grid-f32.s`: divss ×1
- `x86-64-v3--convert--vicsek_step-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `x86-64-v3--select--step_grid-f32.s`: divss ×1
- `x86-64-v3--select--vicsek_step-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `x86-64-v3--value--step_grid-f32.s`: divss ×1
- `x86-64-v3--value--vicsek_step-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
