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

| bench | base | all | table |
|---|---|---|---|
| swarm_step/Sorted/1000 | 99.1 µs | 96.5 µs (-3%) | 93.8 µs (-5%) |
| swarm_step/Sorted/10000 | 1.48 ms | 1.13 ms (-24%) | 1.1 ms (-26%) |
| swarm_step/Sorted/100000 | 17.3 ms | 12.4 ms (-28%) | 12.2 ms (-30%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | base | all | table |
|---|---|---|---|
| swarm_step/Sorted/1000 | 64.7 µs | 69.2 µs (+7%) | 57.7 µs (-11%) |
| swarm_step/Sorted/10000 | 1.01 ms | 769 µs (-24%) | 645 µs (-36%) |
| swarm_step/Sorted/100000 | 11.3 ms | 8.38 ms (-26%) | 7.12 ms (-37%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | base | all | table |
|---|---|---|---|
| swarm_step/Sorted/1000 | 58.5 µs | 59.4 µs (+2%) | 51.3 µs (-12%) |
| swarm_step/Sorted/10000 | 938 µs | 663 µs (-29%) | 578 µs (-38%) |
| swarm_step/Sorted/100000 | 10.3 ms | 7.2 ms (-30%) | 6.37 ms (-38%) |

## base, each level against default

| bench | default | x86-64-v3 | native |
|---|---|---|---|
| swarm_step/Sorted/1000 | 99.1 µs (+0%) | 64.7 µs (-35%) | 58.5 µs (-41%) |
| swarm_step/Sorted/10000 | 1.48 ms (+0%) | 1.01 ms (-31%) | 938 µs (-36%) |
| swarm_step/Sorted/100000 | 17.3 ms (+0%) | 11.3 ms (-35%) | 10.3 ms (-40%) |

## perf

From `perf stat` over criterion's `--profile-time` run. GHz is
cycles / task-clock; per pair (where the bench's size is a body count)
is criterion's mean time × GHz / pairs, with pairs = n(n−1)/2. Backend stalls: cycles the core waited on
results or memory. Where each loop spends its cycles, instruction by
instruction: `perf/*.annotate.txt`.

| level | experiment | bench | GHz | IPC | cycles/pair | instr/pair | branch miss | backend stall |
|---|---|---|---|---|---|---|---|---|
| default | base | swarm_step/Sorted/10000 | 5.54 | 4.09 | – | – | 3.1% | – |
| default | base | swarm_step/Sorted/100000 | 5.53 | 4.00 | – | – | 3.6% | – |
| x86-64-v3 | base | swarm_step/Sorted/10000 | 5.54 | 3.22 | – | – | 3.8% | – |
| x86-64-v3 | base | swarm_step/Sorted/100000 | 5.52 | 3.12 | – | – | 4.5% | – |
| native | base | swarm_step/Sorted/10000 | 5.54 | 3.01 | – | – | 3.6% | – |
| native | base | swarm_step/Sorted/100000 | 5.52 | 2.91 | – | – | 4.2% | – |
| default | all | swarm_step/Sorted/10000 | 5.54 | 5.19 | – | – | 0.3% | – |
| default | all | swarm_step/Sorted/100000 | 5.53 | 5.05 | – | – | 1.0% | – |
| x86-64-v3 | all | swarm_step/Sorted/10000 | 5.54 | 4.50 | – | – | 0.3% | – |
| x86-64-v3 | all | swarm_step/Sorted/100000 | 5.53 | 4.29 | – | – | 1.1% | – |
| native | all | swarm_step/Sorted/10000 | 5.54 | 3.92 | – | – | 0.3% | – |
| native | all | swarm_step/Sorted/100000 | 5.52 | 3.78 | – | – | 1.0% | – |
| default | table | swarm_step/Sorted/10000 | 5.54 | 5.07 | – | – | 0.3% | – |
| default | table | swarm_step/Sorted/100000 | 5.53 | 4.92 | – | – | 1.0% | – |
| x86-64-v3 | table | swarm_step/Sorted/10000 | 5.54 | 4.67 | – | – | 0.3% | – |
| x86-64-v3 | table | swarm_step/Sorted/100000 | 5.52 | 4.44 | – | – | 1.0% | – |
| native | table | swarm_step/Sorted/10000 | 5.54 | 4.19 | – | – | 0.2% | – |
| native | table | swarm_step/Sorted/100000 | 5.52 | 3.99 | – | – | 0.9% | – |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--all--grid_fill-f32.s`: none
- `default--all--step_sorted-f32.s`: divss ×1
- `default--base--grid_fill-f32.s`: none
- `default--base--step_sorted-f32.s`: divss ×1
- `default--table--grid_fill-f32.s`: none
- `default--table--step_sorted-f32.s`: divss ×1
- `native--all--grid_fill-f32.s`: none
- `native--all--step_sorted-f32.s`: divss ×1
- `native--base--grid_fill-f32.s`: none
- `native--base--step_sorted-f32.s`: divss ×1
- `native--table--grid_fill-f32.s`: none
- `native--table--step_sorted-f32.s`: divss ×1
- `x86-64-v3--all--grid_fill-f32.s`: none
- `x86-64-v3--all--step_sorted-f32.s`: divss ×1
- `x86-64-v3--base--grid_fill-f32.s`: none
- `x86-64-v3--base--step_sorted-f32.s`: divss ×1
- `x86-64-v3--table--grid_fill-f32.s`: none
- `x86-64-v3--table--step_sorted-f32.s`: divss ×1
