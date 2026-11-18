# Boids Sorted's span edges

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

Mean time; in brackets, the change against `base` at the same level.

## default (`RUSTFLAGS=''`)

| bench | base | cell | span | tail | span-tail | all |
|---|---|---|---|---|---|---|
| swarm_step/Sorted/1000 | 81.9 µs | 81.3 µs (-1%) | 78.9 µs (-4%) | 121 µs (+48%) | 139 µs (+70%) | 88.6 µs (+8%) |
| swarm_step/Sorted/10000 | 1.07 ms | 1.03 ms (-4%) | 885 µs (-17%) | 982 µs (-8%) | 1.03 ms (-3%) | 1.07 ms (-0%) |
| swarm_step/Sorted/100000 | 15.1 ms | 14.9 ms (-1%) | 12.7 ms (-16%) | 12.9 ms (-15%) | 11.2 ms (-26%) | 11.1 ms (-27%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | base | cell | span | tail | span-tail | all |
|---|---|---|---|---|---|---|
| swarm_step/Sorted/1000 | 81.9 µs | 81.2 µs (-1%) | 80.3 µs (-2%) | 121 µs (+48%) | 103 µs (+25%) | 87.6 µs (+7%) |
| swarm_step/Sorted/10000 | 1.06 ms | 1.03 ms (-2%) | 881 µs (-16%) | 982 µs (-7%) | 2.63 ms (+149%) | 1.02 ms (-3%) |
| swarm_step/Sorted/100000 | 15.1 ms | 15 ms (-1%) | 12.7 ms (-16%) | 13 ms (-14%) | 14.4 ms (-5%) | 11.2 ms (-26%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | cell | span | tail | span-tail | all |
|---|---|---|---|---|---|---|
| swarm_step/Sorted/1000 | 117 µs | 116 µs (-1%) | 125 µs (+7%) | 181 µs (+55%) | 249 µs (+114%) | 167 µs (+43%) |
| swarm_step/Sorted/10000 | 1.61 ms | 1.61 ms (+0%) | 1.69 ms (+5%) | 1.88 ms (+17%) | 2.74 ms (+71%) | 1.86 ms (+16%) |
| swarm_step/Sorted/100000 | 20.3 ms | 20.4 ms (+1%) | 20.1 ms (-1%) | 18.7 ms (-8%) | 21.6 ms (+6%) | 23.3 ms (+14%) |

## base, each level against default

| bench | default | native | v8-simd128 |
|---|---|---|---|
| swarm_step/Sorted/1000 | 81.9 µs (+0%) | 81.9 µs (-0%) | 117 µs (+43%) |
| swarm_step/Sorted/10000 | 1.07 ms (+0%) | 1.06 ms (-1%) | 1.61 ms (+50%) |
| swarm_step/Sorted/100000 | 15.1 ms (+0%) | 15.1 ms (+0%) | 20.3 ms (+35%) |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--all--grid_fill-f32.s`: none
- `default--all--step_sorted-f32.s`: fdiv s ×1
- `default--base--grid_fill-f32.s`: none
- `default--base--step_sorted-f32.s`: fdiv s ×1
- `default--cell--grid_fill-f32.s`: none
- `default--cell--step_sorted-f32.s`: fdiv s ×1
- `default--span--grid_fill-f32.s`: none
- `default--span--step_sorted-f32.s`: fdiv s ×1
- `default--span-tail--grid_fill-f32.s`: none
- `default--span-tail--step_sorted-f32.s`: fdiv s ×1
- `default--tail--grid_fill-f32.s`: none
- `default--tail--step_sorted-f32.s`: fdiv s ×1
- `native--all--grid_fill-f32.s`: none
- `native--all--step_sorted-f32.s`: fdiv s ×1
- `native--base--grid_fill-f32.s`: none
- `native--base--step_sorted-f32.s`: fdiv s ×1
- `native--cell--grid_fill-f32.s`: none
- `native--cell--step_sorted-f32.s`: fdiv s ×1
- `native--span--grid_fill-f32.s`: none
- `native--span--step_sorted-f32.s`: fdiv s ×1
- `native--span-tail--grid_fill-f32.s`: none
- `native--span-tail--step_sorted-f32.s`: fdiv s ×1
- `native--tail--grid_fill-f32.s`: none
- `native--tail--step_sorted-f32.s`: fdiv s ×1
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
