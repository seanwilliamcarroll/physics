# Swarm lane experiments

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

Mean time; in brackets, the change against `lanes-16` at the same level.

## default (`RUSTFLAGS=''`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 465 µs | 457 µs (-2%) | 453 µs (-3%) |
| swarm_step/Brute/10000 | 45 ms | 45.3 ms (+1%) | 45.4 ms (+1%) |
| swarm_step/Sorted/1000 | 172 µs | 171 µs (-0%) | 171 µs (-1%) |
| swarm_step/Sorted/10000 | 1.77 ms | 1.77 ms (-0%) | 1.77 ms (-0%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 470 µs | 456 µs (-3%) | 455 µs (-3%) |
| swarm_step/Brute/10000 | 45.6 ms | 45.2 ms (-1%) | 45.3 ms (-1%) |
| swarm_step/Sorted/1000 | 171 µs | 169 µs (-1%) | 168 µs (-1%) |
| swarm_step/Sorted/10000 | 1.78 ms | 1.76 ms (-1%) | 1.77 ms (-1%) |

## wasm (`RUSTFLAGS=''`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 1.94 ms | 2.1 ms (+8%) | 2.09 ms (+8%) |
| swarm_step/Brute/10000 | 190 ms | 207 ms (+9%) | 208 ms (+9%) |
| swarm_step/Sorted/1000 | 486 µs | 543 µs (+12%) | 544 µs (+12%) |
| swarm_step/Sorted/10000 | 3.92 ms | 4.33 ms (+10%) | 4.32 ms (+10%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 598 µs | 494 µs (-17%) | 491 µs (-18%) |
| swarm_step/Brute/10000 | 56.9 ms | 47 ms (-17%) | 46.8 ms (-18%) |
| swarm_step/Sorted/1000 | 217 µs | 236 µs (+9%) | 235 µs (+8%) |
| swarm_step/Sorted/10000 | 2.2 ms | 2.43 ms (+11%) | 2.42 ms (+10%) |

## v8 (`RUSTFLAGS=''`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 1.9 ms | 1.83 ms (-3%) | 1.83 ms (-3%) |
| swarm_step/Brute/10000 | 187 ms | 185 ms (-1%) | 182 ms (-2%) |
| swarm_step/Sorted/1000 | 430 µs | 470 µs (+9%) | 471 µs (+10%) |
| swarm_step/Sorted/10000 | 3.41 ms | 3.81 ms (+12%) | 3.82 ms (+12%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | lanes-16 | grouped | grouped-4 |
|---|---|---|---|
| swarm_step/Brute/1000 | 507 µs | 497 µs (-2%) | 496 µs (-2%) |
| swarm_step/Brute/10000 | 49.5 ms | 49.3 ms (-0%) | 48.9 ms (-1%) |
| swarm_step/Sorted/1000 | 199 µs | 208 µs (+5%) | 208 µs (+5%) |
| swarm_step/Sorted/10000 | 2.04 ms | 2.12 ms (+4%) | 2.11 ms (+4%) |

## lanes-16, each level against default

| bench | default | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 465 µs (+0%) | 470 µs (+1%) | 1.94 ms (+316%) | 598 µs (+28%) | 1.9 ms (+307%) | 507 µs (+9%) |
| swarm_step/Brute/10000 | 45 ms (+0%) | 45.6 ms (+1%) | 190 ms (+323%) | 56.9 ms (+26%) | 187 ms (+315%) | 49.5 ms (+10%) |
| swarm_step/Sorted/1000 | 172 µs (+0%) | 171 µs (-1%) | 486 µs (+182%) | 217 µs (+26%) | 430 µs (+150%) | 199 µs (+16%) |
| swarm_step/Sorted/10000 | 1.77 ms (+0%) | 1.78 ms (+1%) | 3.92 ms (+121%) | 2.2 ms (+24%) | 3.41 ms (+92%) | 2.04 ms (+15%) |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--grouped--add_span-f32.s`: none
- `default--grouped--flock_step-f32.s`: fdiv s ×2
- `default--grouped-4--add_span-f32.s`: none
- `default--grouped-4--flock_step-f32.s`: fdiv s ×2
- `default--lanes-16--add_span-f32.s`: none
- `default--lanes-16--flock_step-f32.s`: fdiv s ×2
- `native--grouped--add_span-f32.s`: none
- `native--grouped--flock_step-f32.s`: fdiv s ×2
- `native--grouped-4--add_span-f32.s`: none
- `native--grouped-4--flock_step-f32.s`: fdiv s ×2
- `native--lanes-16--add_span-f32.s`: none
- `native--lanes-16--flock_step-f32.s`: fdiv s ×2
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
