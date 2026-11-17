# Swarm lane experiments

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

Mean time; in brackets, the change against `lanes-16` at the same level.

## default (`RUSTFLAGS=''`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 519 µs | 534 µs (+3%) | 539 µs (+4%) |
| swarm_step/Brute/10000 | 49.2 ms | 54.5 ms (+11%) | 54.6 ms (+11%) |
| swarm_step/Sorted/1000 | 186 µs | 199 µs (+7%) | 208 µs (+12%) |
| swarm_step/Sorted/10000 | 1.91 ms | 2.02 ms (+6%) | 2.11 ms (+10%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 261 µs | 242 µs (-7%) | 508 µs (+94%) |
| swarm_step/Brute/10000 | 23.6 ms | 21.7 ms (-8%) | 54 ms (+129%) |
| swarm_step/Sorted/1000 | 143 µs | 141 µs (-2%) | 171 µs (+19%) |
| swarm_step/Sorted/10000 | 1.47 ms | 1.45 ms (-2%) | 1.75 ms (+19%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 160 µs | 158 µs (-1%) | 412 µs (+158%) |
| swarm_step/Brute/10000 | 13.1 ms | 13.1 ms (+0%) | 38.8 ms (+196%) |
| swarm_step/Sorted/1000 | 130 µs | 129 µs (-1%) | 170 µs (+31%) |
| swarm_step/Sorted/10000 | 1.35 ms | 1.34 ms (-1%) | 1.76 ms (+30%) |

## wasm (`RUSTFLAGS=''`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 2.71 ms | 3.11 ms (+15%) | 3.11 ms (+15%) |
| swarm_step/Brute/10000 | 200 ms | 236 ms (+18%) | 236 ms (+18%) |
| swarm_step/Sorted/1000 | 766 µs | 883 µs (+15%) | 885 µs (+16%) |
| swarm_step/Sorted/10000 | 5.81 ms | 7.01 ms (+21%) | 6.88 ms (+18%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 575 µs | 590 µs (+3%) | 590 µs (+3%) |
| swarm_step/Brute/10000 | 53.2 ms | 54.8 ms (+3%) | 54.8 ms (+3%) |
| swarm_step/Sorted/1000 | 233 µs | 248 µs (+6%) | 248 µs (+6%) |
| swarm_step/Sorted/10000 | 2.38 ms | 2.53 ms (+6%) | 2.53 ms (+6%) |

## v8 (`RUSTFLAGS=''`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 2.63 ms | 2.46 ms (-7%) | 2.45 ms (-7%) |
| swarm_step/Brute/10000 | 202 ms | 175 ms (-13%) | 176 ms (-13%) |
| swarm_step/Sorted/1000 | 681 µs | 760 µs (+12%) | 759 µs (+11%) |
| swarm_step/Sorted/10000 | 5.07 ms | 5.7 ms (+12%) | 5.69 ms (+12%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 522 µs | 552 µs (+6%) | 555 µs (+6%) |
| swarm_step/Brute/10000 | 49.1 ms | 55.4 ms (+13%) | 54.8 ms (+12%) |
| swarm_step/Sorted/1000 | 195 µs | 214 µs (+10%) | 216 µs (+11%) |
| swarm_step/Sorted/10000 | 2 ms | 2.17 ms (+8%) | 2.19 ms (+10%) |

## lanes-16, each level against default

| bench | default | x86-64-v3 | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 519 µs (+0%) | 261 µs (-50%) | 160 µs (-69%) | 2.71 ms (+422%) | 575 µs (+11%) | 2.63 ms (+407%) | 522 µs (+1%) |
| swarm_step/Brute/10000 | 49.2 ms (+0%) | 23.6 ms (-52%) | 13.1 ms (-73%) | 200 ms (+307%) | 53.2 ms (+8%) | 202 ms (+311%) | 49.1 ms (-0%) |
| swarm_step/Sorted/1000 | 186 µs (+0%) | 143 µs (-23%) | 130 µs (-30%) | 766 µs (+312%) | 233 µs (+25%) | 681 µs (+266%) | 195 µs (+4%) |
| swarm_step/Sorted/10000 | 1.91 ms (+0%) | 1.47 ms (-23%) | 1.35 ms (-29%) | 5.81 ms (+204%) | 2.38 ms (+25%) | 5.07 ms (+166%) | 2 ms (+5%) |

## perf

From `perf stat` over criterion's `--profile-time` run. GHz is
cycles / task-clock; per pair (where the bench's size is a body count)
is criterion's mean time × GHz / pairs, with pairs = n(n−1)/2. Backend stalls: cycles the core waited on
results or memory. Where each loop spends its cycles, instruction by
instruction: `perf/*.annotate.txt`.

| level | experiment | bench | GHz | IPC | cycles/pair | instr/pair | branch miss | backend stall |
|---|---|---|---|---|---|---|---|---|
| default | lanes-16 | swarm_step/Brute/10000 | 5.54 | 4.80 | – | – | 2.6% | – |
| default | lanes-16 | swarm_step/Sorted/10000 | 5.54 | 3.63 | – | – | 3.9% | – |
| x86-64-v3 | lanes-16 | swarm_step/Brute/10000 | 5.52 | 3.94 | – | – | 2.0% | – |
| x86-64-v3 | lanes-16 | swarm_step/Sorted/10000 | 5.54 | 2.83 | – | – | 5.1% | – |
| native | lanes-16 | swarm_step/Brute/10000 | 5.52 | 2.84 | – | – | 1.3% | – |
| native | lanes-16 | swarm_step/Sorted/10000 | 5.54 | 2.50 | – | – | 5.4% | – |
| default | grouped | swarm_step/Brute/10000 | 5.54 | 3.68 | – | – | 1.2% | – |
| default | grouped | swarm_step/Sorted/10000 | 5.54 | 3.62 | – | – | 3.1% | – |
| x86-64-v3 | grouped | swarm_step/Brute/10000 | 5.53 | 3.90 | – | – | 1.1% | – |
| x86-64-v3 | grouped | swarm_step/Sorted/10000 | 5.54 | 2.85 | – | – | 4.9% | – |
| native | grouped | swarm_step/Brute/10000 | 5.52 | 2.84 | – | – | 1.3% | – |
| native | grouped | swarm_step/Sorted/10000 | 5.54 | 2.44 | – | – | 5.4% | – |
| default | grouped-4 | swarm_step/Brute/10000 | 5.54 | 3.68 | – | – | 1.2% | – |
| default | grouped-4 | swarm_step/Sorted/10000 | 5.54 | 3.52 | – | – | 3.1% | – |
| x86-64-v3 | grouped-4 | swarm_step/Brute/10000 | 5.54 | 3.08 | – | – | 1.3% | – |
| x86-64-v3 | grouped-4 | swarm_step/Sorted/10000 | 5.54 | 3.37 | – | – | 3.8% | – |
| native | grouped-4 | swarm_step/Brute/10000 | 5.54 | 3.33 | – | – | 1.1% | – |
| native | grouped-4 | swarm_step/Sorted/10000 | 5.54 | 3.15 | – | – | 4.1% | – |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--grouped--add_span-f32.s`: none
- `default--grouped--flock_step-f32.s`: divss ×2
- `default--grouped-4--add_span-f32.s`: none
- `default--grouped-4--flock_step-f32.s`: divss ×2
- `default--lanes-16--add_span-f32.s`: none
- `default--lanes-16--flock_step-f32.s`: divss ×2
- `native--grouped--add_span-f32.s`: none
- `native--grouped--flock_step-f32.s`: divss ×2
- `native--grouped-4--add_span-f32.s`: none
- `native--grouped-4--flock_step-f32.s`: divss ×2
- `native--lanes-16--add_span-f32.s`: none
- `native--lanes-16--flock_step-f32.s`: divss ×2
- `wasm--grouped--add_span-f32.s`: none
- `wasm--grouped--flock_step-f32.s`: f32.div ×2
- `wasm--grouped-4--add_span-f32.s`: none
- `wasm--grouped-4--flock_step-f32.s`: f32.div ×2
- `wasm--lanes-16--add_span-f32.s`: none
- `wasm--lanes-16--flock_step-f32.s`: f32.div ×2
- `wasm-simd128--grouped--add_span-f32.s`: none
- `wasm-simd128--grouped--flock_step-f32.s`: f32.div ×2
- `wasm-simd128--grouped-4--add_span-f32.s`: none
- `wasm-simd128--grouped-4--flock_step-f32.s`: f32.div ×2
- `wasm-simd128--lanes-16--add_span-f32.s`: none
- `wasm-simd128--lanes-16--flock_step-f32.s`: f32.div ×2
- `x86-64-v3--grouped--add_span-f32.s`: none
- `x86-64-v3--grouped--flock_step-f32.s`: divss ×2
- `x86-64-v3--grouped-4--add_span-f32.s`: none
- `x86-64-v3--grouped-4--flock_step-f32.s`: divss ×2
- `x86-64-v3--lanes-16--add_span-f32.s`: none
- `x86-64-v3--lanes-16--flock_step-f32.s`: divss ×2
