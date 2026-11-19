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

## default (`RUSTFLAGS=''`)

| bench | base | cell | span | tail | span-tail | all |
|---|---|---|---|---|---|---|
| swarm_step/Sorted/1000 | 98.7 µs | 89.6 µs (-9%) | 99.6 µs (+1%) | 140 µs (+42%) | 110 µs (+11%) | 99.8 µs (+1%) |
| swarm_step/Sorted/10000 | 1.47 ms | 1.38 ms (-6%) | 1.3 ms (-11%) | 1.15 ms (-22%) | 1.27 ms (-14%) | 1.16 ms (-21%) |
| swarm_step/Sorted/100000 | 17.3 ms | 16.4 ms (-5%) | 14.8 ms (-14%) | 15.1 ms (-12%) | 13.8 ms (-20%) | 12.7 ms (-26%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | base | cell | span | tail | span-tail | all |
|---|---|---|---|---|---|---|
| swarm_step/Sorted/1000 | 64.5 µs | 63.9 µs (-1%) | 57.8 µs (-10%) | 86.3 µs (+34%) | 63.3 µs (-2%) | 62.3 µs (-4%) |
| swarm_step/Sorted/10000 | 1.01 ms | 1.01 ms (-0%) | 846 µs (-17%) | 724 µs (-29%) | 707 µs (-30%) | 695 µs (-31%) |
| swarm_step/Sorted/100000 | 11.3 ms | 11.3 ms (+0%) | 9.28 ms (-18%) | 9.13 ms (-19%) | 7.82 ms (-31%) | 7.67 ms (-32%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | base | cell | span | tail | span-tail | all |
|---|---|---|---|---|---|---|
| swarm_step/Sorted/1000 | 58.4 µs | 57.7 µs (-1%) | 51.5 µs (-12%) | 73.2 µs (+25%) | 51.3 µs (-12%) | 50.9 µs (-13%) |
| swarm_step/Sorted/10000 | 942 µs | 931 µs (-1%) | 776 µs (-18%) | 609 µs (-35%) | 577 µs (-39%) | 572 µs (-39%) |
| swarm_step/Sorted/100000 | 10.3 ms | 10.3 ms (-0%) | 8.61 ms (-16%) | 7.8 ms (-24%) | 6.4 ms (-38%) | 6.34 ms (-38%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | cell | span | tail | span-tail | all |
|---|---|---|---|---|---|---|
| swarm_step/Sorted/1000 | 119 µs | 118 µs (-1%) | 123 µs (+3%) | 178 µs (+49%) | 149 µs (+25%) | 160 µs (+34%) |
| swarm_step/Sorted/10000 | 1.79 ms | 1.79 ms (-0%) | 1.78 ms (-1%) | 1.87 ms (+4%) | 1.71 ms (-4%) | 1.83 ms (+2%) |
| swarm_step/Sorted/100000 | 20.1 ms | 20 ms (-1%) | 19.6 ms (-2%) | 18.7 ms (-7%) | 19.2 ms (-4%) | 20.9 ms (+4%) |

## base, each level against default

| bench | default | x86-64-v3 | native | v8-simd128 |
|---|---|---|---|---|
| swarm_step/Sorted/1000 | 98.7 µs (+0%) | 64.5 µs (-35%) | 58.4 µs (-41%) | 119 µs (+21%) |
| swarm_step/Sorted/10000 | 1.47 ms (+0%) | 1.01 ms (-31%) | 942 µs (-36%) | 1.79 ms (+22%) |
| swarm_step/Sorted/100000 | 17.3 ms (+0%) | 11.3 ms (-34%) | 10.3 ms (-40%) | 20.1 ms (+16%) |

## perf

From `perf stat` over criterion's `--profile-time` run. GHz is
cycles / task-clock; per pair (where the bench's size is a body count)
is criterion's mean time × GHz / pairs, with pairs = n(n−1)/2. Backend stalls: cycles the core waited on
results or memory. Where each loop spends its cycles, instruction by
instruction: `perf/*.annotate.txt`.

| level | experiment | bench | GHz | IPC | cycles/pair | instr/pair | branch miss | backend stall |
|---|---|---|---|---|---|---|---|---|
| default | base | swarm_step/Sorted/10000 | 5.54 | 4.10 | – | – | 3.1% | – |
| x86-64-v3 | base | swarm_step/Sorted/10000 | 5.54 | 3.24 | – | – | 3.8% | – |
| native | base | swarm_step/Sorted/10000 | 5.54 | 2.99 | – | – | 3.6% | – |
| default | cell | swarm_step/Sorted/10000 | 5.54 | 4.13 | – | – | 4.0% | – |
| x86-64-v3 | cell | swarm_step/Sorted/10000 | 5.54 | 3.24 | – | – | 3.8% | – |
| native | cell | swarm_step/Sorted/10000 | 5.54 | 3.01 | – | – | 3.5% | – |
| default | span | swarm_step/Sorted/10000 | 5.54 | 4.07 | – | – | 3.1% | – |
| x86-64-v3 | span | swarm_step/Sorted/10000 | 5.54 | 3.38 | – | – | 3.9% | – |
| native | span | swarm_step/Sorted/10000 | 5.54 | 3.06 | – | – | 3.6% | – |
| default | tail | swarm_step/Sorted/10000 | 5.54 | 4.75 | – | – | 0.3% | – |
| x86-64-v3 | tail | swarm_step/Sorted/10000 | 5.54 | 4.22 | – | – | 0.3% | – |
| native | tail | swarm_step/Sorted/10000 | 5.54 | 4.12 | – | – | 0.2% | – |
| default | span-tail | swarm_step/Sorted/10000 | 5.54 | 4.92 | – | – | 0.3% | – |
| x86-64-v3 | span-tail | swarm_step/Sorted/10000 | 5.54 | 4.58 | – | – | 0.3% | – |
| native | span-tail | swarm_step/Sorted/10000 | 5.53 | 4.18 | – | – | 0.2% | – |
| default | all | swarm_step/Sorted/10000 | 5.54 | 4.85 | – | – | 0.4% | – |
| x86-64-v3 | all | swarm_step/Sorted/10000 | 5.54 | 4.59 | – | – | 0.3% | – |
| native | all | swarm_step/Sorted/10000 | 5.54 | 4.20 | – | – | 0.2% | – |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--all--grid_fill-f32.s`: none
- `default--all--step_sorted-f32.s`: divss ×1
- `default--base--grid_fill-f32.s`: none
- `default--base--step_sorted-f32.s`: divss ×1
- `default--cell--grid_fill-f32.s`: none
- `default--cell--step_sorted-f32.s`: divss ×1
- `default--span--grid_fill-f32.s`: none
- `default--span--step_sorted-f32.s`: divss ×1
- `default--span-tail--grid_fill-f32.s`: none
- `default--span-tail--step_sorted-f32.s`: divss ×1
- `default--tail--grid_fill-f32.s`: none
- `default--tail--step_sorted-f32.s`: divss ×1
- `native--all--grid_fill-f32.s`: none
- `native--all--step_sorted-f32.s`: divss ×1
- `native--base--grid_fill-f32.s`: none
- `native--base--step_sorted-f32.s`: divss ×1
- `native--cell--grid_fill-f32.s`: none
- `native--cell--step_sorted-f32.s`: divss ×1
- `native--span--grid_fill-f32.s`: none
- `native--span--step_sorted-f32.s`: divss ×1
- `native--span-tail--grid_fill-f32.s`: none
- `native--span-tail--step_sorted-f32.s`: divss ×1
- `native--tail--grid_fill-f32.s`: none
- `native--tail--step_sorted-f32.s`: divss ×1
- `v8-simd128--all--grid_fill-f32.s`: none
- `v8-simd128--all--step_sorted-f32.s`: f32.div ×1
- `v8-simd128--base--grid_fill-f32.s`: none
- `v8-simd128--base--step_sorted-f32.s`: f32.div ×1
- `v8-simd128--cell--grid_fill-f32.s`: none
- `v8-simd128--cell--step_sorted-f32.s`: f32.div ×1
- `v8-simd128--span--grid_fill-f32.s`: none
- `v8-simd128--span--step_sorted-f32.s`: f32.div ×1
- `v8-simd128--span-tail--grid_fill-f32.s`: none
- `v8-simd128--span-tail--step_sorted-f32.s`: f32.div ×1
- `v8-simd128--tail--grid_fill-f32.s`: none
- `v8-simd128--tail--step_sorted-f32.s`: f32.div ×1
- `x86-64-v3--all--grid_fill-f32.s`: none
- `x86-64-v3--all--step_sorted-f32.s`: divss ×1
- `x86-64-v3--base--grid_fill-f32.s`: none
- `x86-64-v3--base--step_sorted-f32.s`: divss ×1
- `x86-64-v3--cell--grid_fill-f32.s`: none
- `x86-64-v3--cell--step_sorted-f32.s`: divss ×1
- `x86-64-v3--span--grid_fill-f32.s`: none
- `x86-64-v3--span--step_sorted-f32.s`: divss ×1
- `x86-64-v3--span-tail--grid_fill-f32.s`: none
- `x86-64-v3--span-tail--step_sorted-f32.s`: divss ×1
- `x86-64-v3--tail--grid_fill-f32.s`: none
- `x86-64-v3--tail--step_sorted-f32.s`: divss ×1
