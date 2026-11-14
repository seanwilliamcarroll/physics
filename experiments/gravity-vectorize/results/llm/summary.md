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

Mean time; in brackets, the change against `base` at the same level.

## default (`RUSTFLAGS=''`)

| bench | base | b-select | c-lanes | d-soa |
|---|---|---|---|---|
| pairwise_f32/16 | 203 ns | 198 ns (-2%) | 256 ns (+26%) | 414 ns (+104%) |
| pairwise_f32/128 | 13.1 µs | 12.8 µs (-2%) | 5.9 µs (-55%) | 9.64 µs (-26%) |
| pairwise_f32/1024 | 838 µs | 822 µs (-2%) | 354 µs (-58%) | 482 µs (-42%) |
| pairwise_f32/4096 | 13.4 ms | 13.2 ms (-2%) | 5.67 ms (-58%) | 7.46 ms (-44%) |
| pairwise_f64/16 | 279 ns | 277 ns (-1%) | 338 ns (+21%) | 445 ns (+59%) |
| pairwise_f64/128 | 18.2 µs | 18.2 µs (-0%) | 11.6 µs (-36%) | 13.1 µs (-28%) |
| pairwise_f64/1024 | 1.17 ms | 1.17 ms (+0%) | 722 µs (-38%) | 694 µs (-41%) |
| pairwise_f64/4096 | 18.7 ms | 18.7 ms (-0%) | 11.5 ms (-39%) | 10.9 ms (-42%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | base | b-select | c-lanes | d-soa |
|---|---|---|---|---|
| pairwise_f32/16 | 201 ns | 196 ns (-2%) | 319 ns (+59%) | 457 ns (+127%) |
| pairwise_f32/128 | 12.8 µs | 12.8 µs (-0%) | 4.16 µs (-67%) | 11.1 µs (-13%) |
| pairwise_f32/1024 | 821 µs | 820 µs (-0%) | 225 µs (-73%) | 563 µs (-31%) |
| pairwise_f32/4096 | 13.2 ms | 13.1 ms (-0%) | 3.81 ms (-71%) | 8.76 ms (-33%) |
| pairwise_f64/16 | 275 ns | 275 ns (-0%) | 296 ns (+8%) | 512 ns (+86%) |
| pairwise_f64/128 | 18.1 µs | 18.2 µs (+0%) | 7.3 µs (-60%) | 13.9 µs (-23%) |
| pairwise_f64/1024 | 1.17 ms | 1.17 ms (+0%) | 450 µs (-61%) | 757 µs (-35%) |
| pairwise_f64/4096 | 18.7 ms | 18.7 ms (+0%) | 7.43 ms (-60%) | 11.7 ms (-38%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | base | b-select | c-lanes | d-soa |
|---|---|---|---|---|
| pairwise_f32/16 | 199 ns | 150 ns (-25%) | 328 ns (+64%) | 446 ns (+124%) |
| pairwise_f32/128 | 12.8 µs | 8.36 µs (-35%) | 3.58 µs (-72%) | 10.2 µs (-21%) |
| pairwise_f32/1024 | 822 µs | 530 µs (-35%) | 145 µs (-82%) | 507 µs (-38%) |
| pairwise_f32/4096 | 13.1 ms | 8.48 ms (-35%) | 2.63 ms (-80%) | 7.79 ms (-41%) |
| pairwise_f64/16 | 277 ns | 181 ns (-34%) | 463 ns (+67%) | 491 ns (+77%) |
| pairwise_f64/128 | 18.3 µs | 10.8 µs (-41%) | 5.12 µs (-72%) | 12.5 µs (-31%) |
| pairwise_f64/1024 | 1.17 ms | 685 µs (-41%) | 240 µs (-80%) | 683 µs (-42%) |
| pairwise_f64/4096 | 18.7 ms | 11 ms (-41%) | 4.04 ms (-78%) | 10.6 ms (-44%) |

## wasm (`RUSTFLAGS=''`)

| bench | base | b-select | c-lanes | d-soa |
|---|---|---|---|---|
| pairwise_f32/16 | 264 ns | 270 ns (+2%) | 449 ns (+70%) | 608 ns (+130%) |
| pairwise_f32/128 | 16.4 µs | 16.7 µs (+2%) | 17.2 µs (+5%) | 18.7 µs (+14%) |
| pairwise_f32/1024 | 1.05 ms | 1.07 ms (+2%) | 998 µs (-5%) | 1.05 ms (+0%) |
| pairwise_f32/4096 | 16.8 ms | 17.1 ms (+2%) | 15.8 ms (-6%) | 16.6 ms (-1%) |
| pairwise_f64/16 | 326 ns | 322 ns (-1%) | 589 ns (+81%) | 673 ns (+107%) |
| pairwise_f64/128 | 19.9 µs | 20 µs (+1%) | 21.6 µs (+9%) | 21.9 µs (+10%) |
| pairwise_f64/1024 | 1.28 ms | 1.28 ms (+0%) | 1.31 ms (+2%) | 1.24 ms (-3%) |
| pairwise_f64/4096 | 20.4 ms | 20.5 ms (+1%) | 20.9 ms (+2%) | 19.5 ms (-4%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | b-select | c-lanes | d-soa |
|---|---|---|---|---|
| pairwise_f32/16 | 256 ns | 229 ns (-11%) | 482 ns (+88%) | 519 ns (+103%) |
| pairwise_f32/128 | 14.2 µs | 14 µs (-1%) | 7.62 µs (-46%) | 11.2 µs (-21%) |
| pairwise_f32/1024 | 889 µs | 891 µs (+0%) | 401 µs (-55%) | 578 µs (-35%) |
| pairwise_f32/4096 | 14.2 ms | 14.3 ms (+0%) | 6.34 ms (-55%) | 8.83 ms (-38%) |
| pairwise_f64/16 | 294 ns | 294 ns (-0%) | 552 ns (+88%) | 565 ns (+92%) |
| pairwise_f64/128 | 18.2 µs | 18.2 µs (+0%) | 12.8 µs (-30%) | 12.5 µs (-31%) |
| pairwise_f64/1024 | 1.17 ms | 1.17 ms (+0%) | 738 µs (-37%) | 643 µs (-45%) |
| pairwise_f64/4096 | 18.7 ms | 18.7 ms (+0%) | 11.7 ms (-38%) | 10 ms (-46%) |

## v8 (`RUSTFLAGS=''`)

| bench | base | b-select | c-lanes | d-soa |
|---|---|---|---|---|
| pairwise_f32/16 | 278 ns | 274 ns (-2%) | 385 ns (+38%) | 424 ns (+52%) |
| pairwise_f32/128 | 16.7 µs | 16.8 µs (+1%) | 16 µs (-4%) | 17 µs (+2%) |
| pairwise_f32/1024 | 1.05 ms | 1.07 ms (+1%) | 998 µs (-5%) | 1.02 ms (-3%) |
| pairwise_f32/4096 | 16.8 ms | 17 ms (+1%) | 16 ms (-5%) | 16.2 ms (-4%) |
| pairwise_f64/16 | 331 ns | 324 ns (-2%) | 440 ns (+33%) | 469 ns (+42%) |
| pairwise_f64/128 | 20 µs | 20.3 µs (+2%) | 20.5 µs (+3%) | 19.9 µs (-1%) |
| pairwise_f64/1024 | 1.27 ms | 1.31 ms (+2%) | 1.3 ms (+2%) | 1.21 ms (-5%) |
| pairwise_f64/4096 | 20.4 ms | 20.9 ms (+3%) | 20.8 ms (+2%) | 19.2 ms (-6%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | b-select | c-lanes | d-soa |
|---|---|---|---|---|
| pairwise_f32/16 | 227 ns | 210 ns (-8%) | 332 ns (+46%) | 322 ns (+42%) |
| pairwise_f32/128 | 21.6 µs | 12.8 µs (-41%) | 6.55 µs (-70%) | 9.15 µs (-58%) |
| pairwise_f32/1024 | 1.39 ms | 821 µs (-41%) | 366 µs (-74%) | 536 µs (-61%) |
| pairwise_f32/4096 | 22.2 ms | 13.1 ms (-41%) | 5.86 ms (-74%) | 8.54 ms (-62%) |
| pairwise_f64/16 | 296 ns | 294 ns (-1%) | 369 ns (+25%) | 334 ns (+13%) |
| pairwise_f64/128 | 18.2 µs | 18.3 µs (+0%) | 12 µs (-34%) | 10.6 µs (-42%) |
| pairwise_f64/1024 | 1.17 ms | 1.17 ms (+0%) | 732 µs (-37%) | 626 µs (-46%) |
| pairwise_f64/4096 | 18.7 ms | 18.8 ms (+0%) | 11.6 ms (-38%) | 9.9 ms (-47%) |

## base, each level against default

| bench | default | x86-64-v3 | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 203 ns (+0%) | 201 ns (-1%) | 199 ns (-2%) | 264 ns (+30%) | 256 ns (+26%) | 278 ns (+37%) | 227 ns (+12%) |
| pairwise_f32/128 | 13.1 µs (+0%) | 12.8 µs (-2%) | 12.8 µs (-2%) | 16.4 µs (+25%) | 14.2 µs (+8%) | 16.7 µs (+27%) | 21.6 µs (+65%) |
| pairwise_f32/1024 | 838 µs (+0%) | 821 µs (-2%) | 822 µs (-2%) | 1.05 ms (+25%) | 889 µs (+6%) | 1.05 ms (+26%) | 1.39 ms (+66%) |
| pairwise_f32/4096 | 13.4 ms (+0%) | 13.2 ms (-2%) | 13.1 ms (-2%) | 16.8 ms (+25%) | 14.2 ms (+6%) | 16.8 ms (+25%) | 22.2 ms (+66%) |
| pairwise_f64/16 | 279 ns (+0%) | 275 ns (-1%) | 277 ns (-1%) | 326 ns (+17%) | 294 ns (+5%) | 331 ns (+19%) | 296 ns (+6%) |
| pairwise_f64/128 | 18.2 µs (+0%) | 18.1 µs (-0%) | 18.3 µs (+0%) | 19.9 µs (+9%) | 18.2 µs (-0%) | 20 µs (+10%) | 18.2 µs (+0%) |
| pairwise_f64/1024 | 1.17 ms (+0%) | 1.17 ms (-0%) | 1.17 ms (+0%) | 1.28 ms (+9%) | 1.17 ms (-0%) | 1.27 ms (+9%) | 1.17 ms (-0%) |
| pairwise_f64/4096 | 18.7 ms (+0%) | 18.7 ms (-0%) | 18.7 ms (+0%) | 20.4 ms (+9%) | 18.7 ms (-0%) | 20.4 ms (+9%) | 18.7 ms (-0%) |

## perf

From `perf stat` over criterion's `--profile-time` run. GHz is
cycles / task-clock; per pair is criterion's mean time × GHz / pairs,
with pairs = n(n−1)/2. Backend stalls: cycles the core waited on
results or memory. Where each loop spends its cycles, instruction by
instruction: `perf/*.annotate.txt`.

| level | experiment | bench | GHz | IPC | cycles/pair | instr/pair | branch miss | backend stall |
|---|---|---|---|---|---|---|---|---|
| default | base | pairwise_f64/1024 | 5.54 | 3.24 | 12.37 | 40.1 | 0.1% | – |
| default | base | pairwise_f32/1024 | 5.54 | 4.41 | 8.86 | 39.1 | 0.1% | – |
| x86-64-v3 | base | pairwise_f64/1024 | 5.54 | 2.76 | 12.34 | 34.1 | 0.1% | – |
| x86-64-v3 | base | pairwise_f32/1024 | 5.54 | 3.81 | 8.68 | 33.1 | 0.1% | – |
| native | base | pairwise_f64/1024 | 5.54 | 2.67 | 12.38 | 33.1 | 0.1% | – |
| native | base | pairwise_f32/1024 | 5.54 | 3.70 | 8.69 | 32.1 | 0.1% | – |
| default | b-select | pairwise_f64/1024 | 5.54 | 2.59 | 12.37 | 32.1 | 0.1% | – |
| default | b-select | pairwise_f32/1024 | 5.54 | 3.69 | 8.69 | 32.1 | 0.1% | – |
| x86-64-v3 | b-select | pairwise_f64/1024 | 5.54 | 2.19 | 12.38 | 27.1 | 0.1% | – |
| x86-64-v3 | b-select | pairwise_f32/1024 | 5.54 | 3.13 | 8.67 | 27.1 | 0.1% | – |
| native | b-select | pairwise_f64/1024 | 5.54 | 2.23 | 7.25 | 16.1 | 0.5% | – |
| native | b-select | pairwise_f32/1024 | 5.51 | 2.61 | 5.58 | 14.6 | 0.5% | – |
| default | c-lanes | pairwise_f64/1024 | 5.54 | 3.21 | 7.63 | 24.5 | 1.2% | – |
| default | c-lanes | pairwise_f32/1024 | 5.54 | 3.75 | 3.74 | 14.0 | 1.4% | – |
| x86-64-v3 | c-lanes | pairwise_f64/1024 | 5.54 | 2.44 | 4.76 | 11.6 | 1.6% | – |
| x86-64-v3 | c-lanes | pairwise_f32/1024 | 5.54 | 2.72 | 2.38 | 6.5 | 1.1% | – |
| native | c-lanes | pairwise_f64/1024 | 5.46 | 2.36 | 2.50 | 5.9 | 0.8% | – |
| native | c-lanes | pairwise_f32/1024 | 5.54 | 2.43 | 1.54 | 3.7 | 0.1% | – |
| default | d-soa | pairwise_f64/1024 | 5.54 | 2.61 | 7.34 | 19.1 | 0.9% | – |
| default | d-soa | pairwise_f32/1024 | 5.54 | 2.85 | 5.10 | 14.5 | 0.9% | – |
| x86-64-v3 | d-soa | pairwise_f64/1024 | 5.54 | 2.01 | 8.01 | 16.1 | 0.7% | – |
| x86-64-v3 | d-soa | pairwise_f32/1024 | 5.54 | 2.43 | 5.96 | 14.5 | 0.7% | – |
| native | d-soa | pairwise_f64/1024 | 5.54 | 2.11 | 7.23 | 15.2 | 0.7% | – |
| native | d-soa | pairwise_f32/1024 | 5.54 | 2.59 | 5.36 | 13.9 | 0.7% | – |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--b-select--accumulate-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `default--b-select--accumulate-f64.s`: divpd xmm ×1, divsd ×2, sqrtsd ×1
- `default--base--accumulate-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `default--base--accumulate-f64.s`: divpd xmm ×1, divsd ×2, sqrtsd ×1
- `default--c-lanes--accumulate-f32.s`: divss ×1
- `default--c-lanes--accumulate-f64.s`: divsd ×1
- `default--c-lanes--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--c-lanes--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--d-soa--accumulate-f32.s`: divss ×1
- `default--d-soa--accumulate-f64.s`: divsd ×1
- `default--d-soa--sweep-f32.s`: divps xmm ×2, divss ×3, sqrtps xmm ×2, sqrtss ×3
- `default--d-soa--sweep-f64.s`: divpd xmm ×2, divsd ×3, sqrtpd xmm ×2, sqrtsd ×3
- `native--b-select--accumulate-f32.s`: divps xmm ×2, divps zmm ×1, divss ×10, sqrtps xmm ×1, sqrtss ×1
- `native--b-select--accumulate-f64.s`: divpd xmm ×1, divpd zmm ×1, divsd ×6, sqrtpd xmm ×1, sqrtsd ×1
- `native--base--accumulate-f32.s`: divps xmm ×1, divps zmm ×1, divss ×10, sqrtss ×1
- `native--base--accumulate-f64.s`: divpd zmm ×1, divsd ×6, sqrtsd ×1
- `native--c-lanes--accumulate-f32.s`: divss ×1
- `native--c-lanes--accumulate-f64.s`: divsd ×1
- `native--c-lanes--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--c-lanes--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--d-soa--accumulate-f32.s`: divss ×1
- `native--d-soa--accumulate-f64.s`: divsd ×1
- `native--d-soa--sweep-f32.s`: divps xmm ×3, sqrtps xmm ×3
- `native--d-soa--sweep-f64.s`: divpd xmm ×2, divpd ymm ×1, sqrtpd xmm ×2, sqrtpd ymm ×1
- `wasm--b-select--accumulate-f32.s`: f32.div ×2, f32.sqrt ×1
- `wasm--b-select--accumulate-f64.s`: f64.div ×2, f64.sqrt ×1
- `wasm--base--accumulate-f32.s`: f32.div ×2, f32.sqrt ×1
- `wasm--base--accumulate-f64.s`: f64.div ×2, f64.sqrt ×1
- `wasm--c-lanes--accumulate-f32.s`: f32.div ×1
- `wasm--c-lanes--accumulate-f64.s`: f64.div ×1
- `wasm--c-lanes--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--c-lanes--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--d-soa--accumulate-f32.s`: f32.div ×1
- `wasm--d-soa--accumulate-f64.s`: f64.div ×1
- `wasm--d-soa--sweep-f32.s`: f32.div ×7, f32.sqrt ×7
- `wasm--d-soa--sweep-f64.s`: f64.div ×7, f64.sqrt ×7
- `wasm-simd128--b-select--accumulate-f32.s`: f32.div ×2, f32.sqrt ×1, f32x4.div ×1
- `wasm-simd128--b-select--accumulate-f64.s`: f64.div ×2, f64.sqrt ×1
- `wasm-simd128--base--accumulate-f32.s`: f32.div ×2, f32.sqrt ×1, f32x4.div ×1
- `wasm-simd128--base--accumulate-f64.s`: f64.div ×2, f64.sqrt ×1
- `wasm-simd128--c-lanes--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--c-lanes--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--c-lanes--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--c-lanes--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--d-soa--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--d-soa--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--d-soa--sweep-f32.s`: f32.div ×3, f32.sqrt ×3, f32x4.div ×2, f32x4.sqrt ×2
- `wasm-simd128--d-soa--sweep-f64.s`: f64.div ×3, f64.sqrt ×3, f64x2.div ×2, f64x2.sqrt ×2
- `x86-64-v3--b-select--accumulate-f32.s`: divps ymm ×1, divss ×4, sqrtss ×1
- `x86-64-v3--b-select--accumulate-f64.s`: divpd ymm ×1, divsd ×4, sqrtsd ×1
- `x86-64-v3--base--accumulate-f32.s`: divps ymm ×1, divss ×4, sqrtss ×1
- `x86-64-v3--base--accumulate-f64.s`: divpd ymm ×1, divsd ×4, sqrtsd ×1
- `x86-64-v3--c-lanes--accumulate-f32.s`: divss ×1
- `x86-64-v3--c-lanes--accumulate-f64.s`: divsd ×1
- `x86-64-v3--c-lanes--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--c-lanes--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--d-soa--accumulate-f32.s`: divss ×1
- `x86-64-v3--d-soa--accumulate-f64.s`: divsd ×1
- `x86-64-v3--d-soa--sweep-f32.s`: divps xmm ×3, sqrtps xmm ×3
- `x86-64-v3--d-soa--sweep-f64.s`: divpd xmm ×2, divpd ymm ×1, sqrtpd xmm ×2, sqrtpd ymm ×1
