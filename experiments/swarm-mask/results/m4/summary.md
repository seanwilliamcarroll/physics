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
| swarm_models/vicsek/4000 | 975 µs | 982 µs (+1%) | 989 µs (+1%) | 979 µs (+0%) | 982 µs (+1%) |
| swarm_step/Grid/1000 | 204 µs | 199 µs (-2%) | 199 µs (-2%) | 203 µs (-0%) | 190 µs (-7%) |
| swarm_step/Grid/10000 | 2.74 ms | 2.68 ms (-2%) | 2.68 ms (-2%) | 2.72 ms (-1%) | 4.46 ms (+63%) |
| swarm_step/Grid/100000 | 36.4 ms | 35.7 ms (-2%) | 35.7 ms (-2%) | 36.3 ms (-0%) | 54.9 ms (+51%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 970 µs | 984 µs (+1%) | 985 µs (+2%) | 981 µs (+1%) | 970 µs (+0%) |
| swarm_step/Grid/1000 | 213 µs | 199 µs (-7%) | 199 µs (-7%) | 203 µs (-5%) | 240 µs (+12%) |
| swarm_step/Grid/10000 | 2.86 ms | 2.67 ms (-7%) | 2.68 ms (-6%) | 2.72 ms (-5%) | 4.45 ms (+55%) |
| swarm_step/Grid/100000 | 37.7 ms | 35.7 ms (-5%) | 35.7 ms (-5%) | 36.2 ms (-4%) | 55.4 ms (+47%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 988 µs | 979 µs (-1%) | 985 µs (-0%) | 987 µs (-0%) | 980 µs (-1%) |
| swarm_step/Grid/1000 | 240 µs | 224 µs (-7%) | 224 µs (-7%) | 248 µs (+3%) | 323 µs (+35%) |
| swarm_step/Grid/10000 | 3.05 ms | 2.82 ms (-8%) | 2.82 ms (-8%) | 3.08 ms (+1%) | 4.81 ms (+58%) |
| swarm_step/Grid/100000 | 40.8 ms | 37.7 ms (-7%) | 37.7 ms (-7%) | 41.4 ms (+1%) | 62.5 ms (+53%) |

## convert, each level against default

| bench | default | native | v8-simd128 |
|---|---|---|---|
| swarm_models/vicsek/4000 | 975 µs (+0%) | 970 µs (-1%) | 988 µs (+1%) |
| swarm_step/Grid/1000 | 204 µs (+0%) | 213 µs (+5%) | 240 µs (+18%) |
| swarm_step/Grid/10000 | 2.74 ms (+0%) | 2.86 ms (+4%) | 3.05 ms (+11%) |
| swarm_step/Grid/100000 | 36.4 ms (+0%) | 37.7 ms (+3%) | 40.8 ms (+12%) |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--bits--step_grid-f32.s`: fdiv s ×1
- `default--bits--vicsek_step-f32.s`: none
- `default--branch--step_grid-f32.s`: fdiv s ×1
- `default--branch--vicsek_step-f32.s`: none
- `default--convert--step_grid-f32.s`: fdiv s ×1
- `default--convert--vicsek_step-f32.s`: none
- `default--select--step_grid-f32.s`: fdiv s ×1
- `default--select--vicsek_step-f32.s`: none
- `default--value--step_grid-f32.s`: fdiv s ×1
- `default--value--vicsek_step-f32.s`: none
- `native--bits--step_grid-f32.s`: fdiv s ×1
- `native--bits--vicsek_step-f32.s`: none
- `native--branch--step_grid-f32.s`: fdiv s ×1
- `native--branch--vicsek_step-f32.s`: none
- `native--convert--step_grid-f32.s`: fdiv s ×1
- `native--convert--vicsek_step-f32.s`: none
- `native--select--step_grid-f32.s`: fdiv s ×1
- `native--select--vicsek_step-f32.s`: none
- `native--value--step_grid-f32.s`: fdiv s ×1
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
