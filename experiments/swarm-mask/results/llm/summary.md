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
| swarm_models/vicsek/4000 | 1.17 ms | 1.17 ms (+0%) | 1.17 ms (-0%) | 1.17 ms (-0%) | 1.17 ms (+0%) |
| swarm_step/Grid/1000 | 251 µs | 201 µs (-20%) | 201 µs (-20%) | 383 µs (+52%) | 334 µs (+33%) |
| swarm_step/Grid/10000 | 3.3 ms | 2.76 ms (-17%) | 2.75 ms (-17%) | 6 ms (+82%) | 4.96 ms (+50%) |
| swarm_step/Grid/100000 | 43.4 ms | 36.1 ms (-17%) | 36.3 ms (-16%) | 74.6 ms (+72%) | 61.5 ms (+42%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 943 µs | 950 µs (+1%) | 947 µs (+0%) | 942 µs (-0%) | 953 µs (+1%) |
| swarm_step/Grid/1000 | 259 µs | 240 µs (-7%) | 241 µs (-7%) | 400 µs (+55%) | 292 µs (+13%) |
| swarm_step/Grid/10000 | 3.41 ms | 3.2 ms (-6%) | 3.2 ms (-6%) | 5.99 ms (+75%) | 4.45 ms (+30%) |
| swarm_step/Grid/100000 | 45.4 ms | 42.7 ms (-6%) | 42.9 ms (-6%) | 74.9 ms (+65%) | 54 ms (+19%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 933 µs | 935 µs (+0%) | 928 µs (-1%) | 918 µs (-2%) | 930 µs (-0%) |
| swarm_step/Grid/1000 | 236 µs | 223 µs (-5%) | 223 µs (-5%) | 258 µs (+9%) | 271 µs (+15%) |
| swarm_step/Grid/10000 | 3.24 ms | 3.08 ms (-5%) | 3.07 ms (-5%) | 3.56 ms (+10%) | 4.32 ms (+33%) |
| swarm_step/Grid/100000 | 43.4 ms | 41.2 ms (-5%) | 41.2 ms (-5%) | 47.6 ms (+10%) | 52.6 ms (+21%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 2.25 ms | 2.39 ms (+6%) | 2.38 ms (+6%) | 2.39 ms (+6%) | 2.25 ms (-0%) |
| swarm_step/Grid/1000 | 262 µs | 396 µs (+51%) | 400 µs (+53%) | 412 µs (+57%) | 346 µs (+32%) |
| swarm_step/Grid/10000 | 3.19 ms | 5.02 ms (+57%) | 5.06 ms (+59%) | 5.42 ms (+70%) | 4.62 ms (+45%) |
| swarm_step/Grid/100000 | 42.4 ms | 64.9 ms (+53%) | 65.5 ms (+54%) | 70 ms (+65%) | 58.9 ms (+39%) |

## convert, each level against default

| bench | default | x86-64-v3 | native | v8-simd128 |
|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.17 ms (+0%) | 943 µs (-20%) | 933 µs (-20%) | 2.25 ms (+92%) |
| swarm_step/Grid/1000 | 251 µs (+0%) | 259 µs (+3%) | 236 µs (-6%) | 262 µs (+4%) |
| swarm_step/Grid/10000 | 3.3 ms (+0%) | 3.41 ms (+3%) | 3.24 ms (-2%) | 3.19 ms (-3%) |
| swarm_step/Grid/100000 | 43.4 ms (+0%) | 45.4 ms (+5%) | 43.4 ms (-0%) | 42.4 ms (-2%) |

## perf

From `perf stat` over criterion's `--profile-time` run. GHz is
cycles / task-clock; per pair (where the bench's size is a body count)
is criterion's mean time × GHz / pairs, with pairs = n(n−1)/2. Backend stalls: cycles the core waited on
results or memory. Where each loop spends its cycles, instruction by
instruction: `perf/*.annotate.txt`.

| level | experiment | bench | GHz | IPC | cycles/pair | instr/pair | branch miss | backend stall |
|---|---|---|---|---|---|---|---|---|
| default | convert | swarm_step/Grid/10000 | 5.54 | 5.74 | – | – | 1.3% | – |
| default | convert | swarm_models/vicsek/4000 | 5.54 | 4.11 | – | – | 1.0% | – |
| x86-64-v3 | convert | swarm_step/Grid/10000 | 5.54 | 5.27 | – | – | 1.4% | – |
| x86-64-v3 | convert | swarm_models/vicsek/4000 | 5.54 | 3.80 | – | – | 1.0% | – |
| native | convert | swarm_step/Grid/10000 | 5.54 | 4.91 | – | – | 1.3% | – |
| native | convert | swarm_models/vicsek/4000 | 5.53 | 3.84 | – | – | 1.0% | – |
| default | select | swarm_step/Grid/10000 | 5.54 | 6.13 | – | – | 0.9% | – |
| default | select | swarm_models/vicsek/4000 | 5.54 | 4.12 | – | – | 1.0% | – |
| x86-64-v3 | select | swarm_step/Grid/10000 | 5.54 | 5.44 | – | – | 1.3% | – |
| x86-64-v3 | select | swarm_models/vicsek/4000 | 5.54 | 4.08 | – | – | 1.0% | – |
| native | select | swarm_step/Grid/10000 | 5.54 | 4.93 | – | – | 1.2% | – |
| native | select | swarm_models/vicsek/4000 | 5.54 | 3.84 | – | – | 1.0% | – |
| default | bits | swarm_step/Grid/10000 | 5.54 | 6.15 | – | – | 0.9% | – |
| default | bits | swarm_models/vicsek/4000 | 5.54 | 4.12 | – | – | 1.0% | – |
| x86-64-v3 | bits | swarm_step/Grid/10000 | 5.54 | 5.44 | – | – | 1.3% | – |
| x86-64-v3 | bits | swarm_models/vicsek/4000 | 5.54 | 3.97 | – | – | 1.0% | – |
| native | bits | swarm_step/Grid/10000 | 5.54 | 4.93 | – | – | 1.2% | – |
| native | bits | swarm_models/vicsek/4000 | 5.54 | 3.84 | – | – | 1.0% | – |
| default | value | swarm_step/Grid/10000 | 5.54 | 3.61 | – | – | 3.2% | – |
| default | value | swarm_models/vicsek/4000 | 5.52 | 4.12 | – | – | 1.0% | – |
| x86-64-v3 | value | swarm_step/Grid/10000 | 5.54 | 3.44 | – | – | 4.1% | – |
| x86-64-v3 | value | swarm_models/vicsek/4000 | 5.51 | 3.91 | – | – | 1.0% | – |
| native | value | swarm_step/Grid/10000 | 5.53 | 4.57 | – | – | 1.3% | – |
| native | value | swarm_models/vicsek/4000 | 5.51 | 3.81 | – | – | 1.0% | – |
| default | branch | swarm_step/Grid/10000 | 5.54 | 3.06 | – | – | 3.4% | – |
| default | branch | swarm_models/vicsek/4000 | 5.51 | 3.98 | – | – | 1.0% | – |
| x86-64-v3 | branch | swarm_step/Grid/10000 | 5.53 | 2.89 | – | – | 3.6% | – |
| x86-64-v3 | branch | swarm_models/vicsek/4000 | 5.51 | 4.06 | – | – | 1.0% | – |
| native | branch | swarm_step/Grid/10000 | 5.54 | 2.66 | – | – | 3.6% | – |
| native | branch | swarm_models/vicsek/4000 | 5.51 | 3.69 | – | – | 1.0% | – |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--bits--step_grid-f32.s`: divss ×1
- `default--bits--vicsek_step-f32.s`: none
- `default--branch--step_grid-f32.s`: divss ×1
- `default--branch--vicsek_step-f32.s`: none
- `default--convert--step_grid-f32.s`: divss ×1
- `default--convert--vicsek_step-f32.s`: none
- `default--select--step_grid-f32.s`: divss ×1
- `default--select--vicsek_step-f32.s`: none
- `default--value--step_grid-f32.s`: divss ×1
- `default--value--vicsek_step-f32.s`: none
- `native--bits--step_grid-f32.s`: divss ×1
- `native--bits--vicsek_step-f32.s`: none
- `native--branch--step_grid-f32.s`: divss ×1
- `native--branch--vicsek_step-f32.s`: none
- `native--convert--step_grid-f32.s`: divss ×1
- `native--convert--vicsek_step-f32.s`: none
- `native--select--step_grid-f32.s`: divss ×1
- `native--select--vicsek_step-f32.s`: none
- `native--value--step_grid-f32.s`: divss ×1
- `native--value--vicsek_step-f32.s`: none
- `v8-simd128--bits--step_grid-f32.s`: f32.div ×1
- `v8-simd128--bits--vicsek_step-f32.s`: none
- `v8-simd128--branch--step_grid-f32.s`: f32.div ×1
- `v8-simd128--branch--vicsek_step-f32.s`: none
- `v8-simd128--convert--step_grid-f32.s`: f32.div ×1
- `v8-simd128--convert--vicsek_step-f32.s`: none
- `v8-simd128--select--step_grid-f32.s`: f32.div ×1
- `v8-simd128--select--vicsek_step-f32.s`: none
- `v8-simd128--value--step_grid-f32.s`: f32.div ×1
- `v8-simd128--value--vicsek_step-f32.s`: none
- `x86-64-v3--bits--step_grid-f32.s`: divss ×1
- `x86-64-v3--bits--vicsek_step-f32.s`: none
- `x86-64-v3--branch--step_grid-f32.s`: divss ×1
- `x86-64-v3--branch--vicsek_step-f32.s`: none
- `x86-64-v3--convert--step_grid-f32.s`: divss ×1
- `x86-64-v3--convert--vicsek_step-f32.s`: none
- `x86-64-v3--select--step_grid-f32.s`: divss ×1
- `x86-64-v3--select--vicsek_step-f32.s`: none
- `x86-64-v3--value--step_grid-f32.s`: divss ×1
- `x86-64-v3--value--vicsek_step-f32.s`: none
