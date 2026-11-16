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

Mean time; in brackets, the change against `lanes-8` at the same level.

## default (`RUSTFLAGS=''`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 1.11 ms (+142%) | 1.19 ms (+158%) | 1.25 ms (+173%) | 460 µs | 462 µs (+1%) | 357 µs (-22%) |
| swarm_step/Brute/10000 | 111 ms (+150%) | 119 ms (+168%) | 121 ms (+172%) | 44.5 ms | 44.8 ms (+1%) | 34.5 ms (-22%) |
| swarm_step/Sorted/1000 | 225 µs (+79%) | 239 µs (+90%) | 267 µs (+113%) | 125 µs | 168 µs (+34%) | 93.3 µs (-26%) |
| swarm_step/Sorted/10000 | 2.47 ms (+71%) | 2.32 ms (+61%) | 2.34 ms (+62%) | 1.45 ms | 1.74 ms (+20%) | 1 ms (-30%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 1.13 ms (+149%) | 1.18 ms (+160%) | 1.22 ms (+169%) | 453 µs | 461 µs (+2%) | 355 µs (-22%) |
| swarm_step/Brute/10000 | 112 ms (+156%) | 117 ms (+169%) | 121 ms (+177%) | 43.6 ms | 44.7 ms (+2%) | 34.5 ms (-21%) |
| swarm_step/Sorted/1000 | 226 µs (+82%) | 236 µs (+90%) | 252 µs (+103%) | 124 µs | 169 µs (+36%) | 93.6 µs (-25%) |
| swarm_step/Sorted/10000 | 2.49 ms (+75%) | 2.31 ms (+62%) | 2.33 ms (+64%) | 1.42 ms | 1.73 ms (+22%) | 1.01 ms (-29%) |

## wasm (`RUSTFLAGS=''`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 1.72 ms (-39%) | 1.71 ms (-40%) | 2.16 ms (-24%) | 2.83 ms | 1.91 ms (-32%) | 1.69 ms (-40%) |
| swarm_step/Brute/10000 | 171 ms (-40%) | 170 ms (-40%) | 210 ms (-26%) | 284 ms | 188 ms (-34%) | 169 ms (-41%) |
| swarm_step/Sorted/1000 | 339 µs (-13%) | 332 µs (-15%) | 419 µs (+7%) | 391 µs | 476 µs (+22%) | 334 µs (-14%) |
| swarm_step/Sorted/10000 | 3.69 ms (-32%) | 3.09 ms (-43%) | 3.65 ms (-33%) | 5.44 ms | 3.84 ms (-30%) | 3.64 ms (-33%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 1.62 ms (+4%) | 1.66 ms (+6%) | 1.18 ms (-25%) | 1.56 ms | 597 µs (-62%) | 489 µs (-69%) |
| swarm_step/Brute/10000 | 162 ms (+4%) | 165 ms (+6%) | 116 ms (-25%) | 155 ms | 56.6 ms (-64%) | 47.1 ms (-70%) |
| swarm_step/Sorted/1000 | 325 µs (+24%) | 323 µs (+23%) | 250 µs (-5%) | 262 µs | 215 µs (-18%) | 126 µs (-52%) |
| swarm_step/Sorted/10000 | 3.55 ms (-20%) | 3.01 ms (-32%) | 2.36 ms (-47%) | 4.44 ms | 2.19 ms (-51%) | 1.34 ms (-70%) |

## v8 (`RUSTFLAGS=''`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 1.72 ms (-24%) | 1.69 ms (-25%) | 1.84 ms (-18%) | 2.25 ms | 1.87 ms (-17%) | 1.7 ms (-25%) |
| swarm_step/Brute/10000 | 175 ms (-21%) | 168 ms (-24%) | 183 ms (-17%) | 220 ms | 185 ms (-16%) | 169 ms (-23%) |
| swarm_step/Sorted/1000 | 337 µs (-3%) | 327 µs (-6%) | 360 µs (+3%) | 349 µs | 424 µs (+22%) | 328 µs (-6%) |
| swarm_step/Sorted/10000 | 3.62 ms (-22%) | 3.06 ms (-34%) | 3.44 ms (-25%) | 4.61 ms | 3.38 ms (-27%) | 3.63 ms (-21%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 1.61 ms (-1%) | 2.03 ms (+25%) | 1.71 ms (+5%) | 1.62 ms | 503 µs (-69%) | 473 µs (-71%) |
| swarm_step/Brute/10000 | 160 ms (-1%) | 202 ms (+26%) | 169 ms (+5%) | 161 ms | 47.9 ms (-70%) | 45.9 ms (-71%) |
| swarm_step/Sorted/1000 | 313 µs (+22%) | 385 µs (+50%) | 338 µs (+31%) | 257 µs | 196 µs (-24%) | 121 µs (-53%) |
| swarm_step/Sorted/10000 | 3.39 ms (-24%) | 3.59 ms (-20%) | 3.16 ms (-29%) | 4.47 ms | 2.02 ms (-55%) | 1.28 ms (-71%) |

## lanes-8, each level against default

| bench | default | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 460 µs (+0%) | 453 µs (-1%) | 2.83 ms (+516%) | 1.56 ms (+240%) | 2.25 ms (+389%) | 1.62 ms (+253%) |
| swarm_step/Brute/10000 | 44.5 ms (+0%) | 43.6 ms (-2%) | 284 ms (+539%) | 155 ms (+250%) | 220 ms (+396%) | 161 ms (+262%) |
| swarm_step/Sorted/1000 | 125 µs (+0%) | 124 µs (-1%) | 391 µs (+211%) | 262 µs (+109%) | 349 µs (+178%) | 257 µs (+105%) |
| swarm_step/Sorted/10000 | 1.45 ms (+0%) | 1.42 ms (-1%) | 5.44 ms (+277%) | 4.44 ms (+207%) | 4.61 ms (+219%) | 4.47 ms (+209%) |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--algebraic--add_span-f32.s`: not found (inlined?)
- `default--algebraic--flock_step-f32.s`: fdiv s ×2
- `default--lanes-1--add_span-f32.s`: not found (inlined?)
- `default--lanes-1--flock_step-f32.s`: fdiv s ×2
- `default--lanes-16--add_span-f32.s`: none
- `default--lanes-16--flock_step-f32.s`: fdiv s ×2
- `default--lanes-2--add_span-f32.s`: not found (inlined?)
- `default--lanes-2--flock_step-f32.s`: fdiv s ×2
- `default--lanes-4--add_span-f32.s`: none
- `default--lanes-4--flock_step-f32.s`: fdiv s ×2
- `default--lanes-8--add_span-f32.s`: none
- `default--lanes-8--flock_step-f32.s`: fdiv s ×2
- `native--algebraic--add_span-f32.s`: not found (inlined?)
- `native--algebraic--flock_step-f32.s`: fdiv s ×2
- `native--lanes-1--add_span-f32.s`: not found (inlined?)
- `native--lanes-1--flock_step-f32.s`: fdiv s ×2
- `native--lanes-16--add_span-f32.s`: none
- `native--lanes-16--flock_step-f32.s`: fdiv s ×2
- `native--lanes-2--add_span-f32.s`: not found (inlined?)
- `native--lanes-2--flock_step-f32.s`: fdiv s ×2
- `native--lanes-4--add_span-f32.s`: none
- `native--lanes-4--flock_step-f32.s`: fdiv s ×2
- `native--lanes-8--add_span-f32.s`: none
- `native--lanes-8--flock_step-f32.s`: fdiv s ×2
- `wasm--algebraic--add_span-f32.s`: not found (inlined?)
- `wasm--algebraic--flock_step-f32.s`: f32.div ×2
- `wasm--lanes-1--add_span-f32.s`: not found (inlined?)
- `wasm--lanes-1--flock_step-f32.s`: f32.div ×2
- `wasm--lanes-16--add_span-f32.s`: none
- `wasm--lanes-16--flock_step-f32.s`: f32.div ×2
- `wasm--lanes-2--add_span-f32.s`: none
- `wasm--lanes-2--flock_step-f32.s`: f32.div ×2
- `wasm--lanes-4--add_span-f32.s`: none
- `wasm--lanes-4--flock_step-f32.s`: f32.div ×2
- `wasm--lanes-8--add_span-f32.s`: none
- `wasm--lanes-8--flock_step-f32.s`: f32.div ×2
- `wasm-simd128--algebraic--add_span-f32.s`: not found (inlined?)
- `wasm-simd128--algebraic--flock_step-f32.s`: f32.div ×2
- `wasm-simd128--lanes-1--add_span-f32.s`: not found (inlined?)
- `wasm-simd128--lanes-1--flock_step-f32.s`: f32.div ×2
- `wasm-simd128--lanes-16--add_span-f32.s`: none
- `wasm-simd128--lanes-16--flock_step-f32.s`: f32.div ×2
- `wasm-simd128--lanes-2--add_span-f32.s`: none
- `wasm-simd128--lanes-2--flock_step-f32.s`: f32.div ×2
- `wasm-simd128--lanes-4--add_span-f32.s`: none
- `wasm-simd128--lanes-4--flock_step-f32.s`: f32.div ×2
- `wasm-simd128--lanes-8--add_span-f32.s`: none
- `wasm-simd128--lanes-8--flock_step-f32.s`: f32.div ×2
