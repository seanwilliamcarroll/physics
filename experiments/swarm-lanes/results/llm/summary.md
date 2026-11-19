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

Mean time; in brackets, the change against `lanes-8` at the same level.

## default (`RUSTFLAGS=''`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 1.43 ms (+182%) | 1.57 ms (+211%) | 1.46 ms (+189%) | 506 µs | 504 µs (-0%) | 448 µs (-11%) |
| swarm_step/Brute/10000 | 142 ms (+191%) | 156 ms (+220%) | 132 ms (+171%) | 48.7 ms | 48 ms (-2%) | 43.4 ms (-11%) |
| swarm_step/Sorted/1000 | 291 µs (+105%) | 303 µs (+113%) | 283 µs (+99%) | 142 µs | 189 µs (+33%) | 125 µs (-12%) |
| swarm_step/Sorted/10000 | 3.11 ms (+72%) | 2.8 ms (+54%) | 2.58 ms (+42%) | 1.81 ms | 1.93 ms (+7%) | 1.3 ms (-28%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 1.42 ms (+508%) | 1.46 ms (+524%) | 1.24 ms (+431%) | 233 µs | 275 µs (+18%) | 228 µs (-2%) |
| swarm_step/Brute/10000 | 141 ms (+558%) | 144 ms (+575%) | 123 ms (+473%) | 21.4 ms | 24.9 ms (+16%) | 21.4 ms (-0%) |
| swarm_step/Sorted/1000 | 277 µs (+165%) | 284 µs (+172%) | 256 µs (+145%) | 104 µs | 146 µs (+39%) | 93 µs (-11%) |
| swarm_step/Sorted/10000 | 2.97 ms (+167%) | 2.67 ms (+140%) | 2.38 ms (+114%) | 1.11 ms | 1.49 ms (+34%) | 930 µs (-16%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 1.38 ms (+537%) | 1.31 ms (+509%) | 1.27 ms (+488%) | 216 µs | 160 µs (-26%) | 152 µs (-30%) |
| swarm_step/Brute/10000 | 136 ms (+590%) | 130 ms (+560%) | 126 ms (+536%) | 19.8 ms | 13.1 ms (-34%) | 13 ms (-34%) |
| swarm_step/Sorted/1000 | 273 µs (+179%) | 274 µs (+180%) | 255 µs (+161%) | 97.9 µs | 129 µs (+32%) | 82.6 µs (-16%) |
| swarm_step/Sorted/10000 | 2.93 ms (+182%) | 2.63 ms (+153%) | 2.37 ms (+128%) | 1.04 ms | 1.35 ms (+30%) | 839 µs (-19%) |

## wasm (`RUSTFLAGS=''`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 2.61 ms (-13%) | 2.66 ms (-11%) | 2.96 ms (-1%) | 3 ms | 2.92 ms (-3%) | 2.61 ms (-13%) |
| swarm_step/Brute/10000 | 219 ms (-9%) | 207 ms (-14%) | 237 ms (-1%) | 240 ms | 203 ms (-15%) | 220 ms (-9%) |
| swarm_step/Sorted/1000 | 632 µs (+10%) | 692 µs (+21%) | 685 µs (+20%) | 573 µs | 817 µs (+43%) | 623 µs (+9%) |
| swarm_step/Sorted/10000 | 5.99 ms (-20%) | 5.82 ms (-22%) | 6.41 ms (-15%) | 7.51 ms | 6.45 ms (-14%) | 5.95 ms (-21%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 2.14 ms (+4%) | 2.22 ms (+8%) | 1.72 ms (-16%) | 2.06 ms | 576 µs (-72%) | 563 µs (-73%) |
| swarm_step/Brute/10000 | 135 ms (-18%) | 169 ms (+3%) | 115 ms (-30%) | 165 ms | 53.2 ms (-68%) | 54.7 ms (-67%) |
| swarm_step/Sorted/1000 | 557 µs (+30%) | 617 µs (+44%) | 487 µs (+14%) | 428 µs | 235 µs (-45%) | 142 µs (-67%) |
| swarm_step/Sorted/10000 | 5.41 ms (-4%) | 5.23 ms (-7%) | 4.6 ms (-19%) | 5.65 ms | 2.39 ms (-58%) | 1.5 ms (-73%) |

## v8 (`RUSTFLAGS=''`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 2.56 ms (+7%) | 2.25 ms (-6%) | 2.32 ms (-3%) | 2.4 ms | 2.62 ms (+9%) | 2.57 ms (+7%) |
| swarm_step/Brute/10000 | 219 ms (+18%) | 169 ms (-10%) | 176 ms (-6%) | 187 ms | 202 ms (+8%) | 220 ms (+18%) |
| swarm_step/Sorted/1000 | 598 µs (+20%) | 614 µs (+23%) | 590 µs (+19%) | 498 µs | 687 µs (+38%) | 593 µs (+19%) |
| swarm_step/Sorted/10000 | 5.71 ms (-11%) | 5.18 ms (-20%) | 5.66 ms (-12%) | 6.45 ms | 5.12 ms (-21%) | 5.72 ms (-11%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | lanes-1 | lanes-2 | lanes-4 | lanes-8 | lanes-16 | algebraic |
|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 2.08 ms (+13%) | 2.15 ms (+17%) | 1.76 ms (-4%) | 1.84 ms | 517 µs (-72%) | 562 µs (-69%) |
| swarm_step/Brute/10000 | 131 ms (-5%) | 166 ms (+21%) | 129 ms (-6%) | 137 ms | 49.1 ms (-64%) | 55.7 ms (-59%) |
| swarm_step/Sorted/1000 | 536 µs (+22%) | 595 µs (+36%) | 493 µs (+13%) | 438 µs | 195 µs (-55%) | 136 µs (-69%) |
| swarm_step/Sorted/10000 | 5.19 ms (-9%) | 5 ms (-13%) | 4.62 ms (-19%) | 5.73 ms | 2.01 ms (-65%) | 1.46 ms (-75%) |

## lanes-8, each level against default

| bench | default | x86-64-v3 | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|---|
| swarm_step/Brute/1000 | 506 µs (+0%) | 233 µs (-54%) | 216 µs (-57%) | 3 ms (+493%) | 2.06 ms (+307%) | 2.4 ms (+374%) | 1.84 ms (+263%) |
| swarm_step/Brute/10000 | 48.7 ms (+0%) | 21.4 ms (-56%) | 19.8 ms (-59%) | 240 ms (+394%) | 165 ms (+238%) | 187 ms (+283%) | 137 ms (+181%) |
| swarm_step/Sorted/1000 | 142 µs (+0%) | 104 µs (-26%) | 97.9 µs (-31%) | 573 µs (+303%) | 428 µs (+201%) | 498 µs (+250%) | 438 µs (+208%) |
| swarm_step/Sorted/10000 | 1.81 ms (+0%) | 1.11 ms (-39%) | 1.04 ms (-43%) | 7.51 ms (+314%) | 5.65 ms (+212%) | 6.45 ms (+256%) | 5.73 ms (+216%) |

## perf

From `perf stat` over criterion's `--profile-time` run. GHz is
cycles / task-clock; per pair (where the bench's size is a body count)
is criterion's mean time × GHz / pairs, with pairs = n(n−1)/2. Backend stalls: cycles the core waited on
results or memory.

| level | experiment | bench | GHz | IPC | cycles/pair | instr/pair | branch miss | backend stall |
|---|---|---|---|---|---|---|---|---|
| default | lanes-1 | swarm_step/Brute/10000 | 5.54 | 4.93 | – | – | 0.2% | – |
| default | lanes-1 | swarm_step/Sorted/10000 | 5.54 | 4.81 | – | – | 0.7% | – |
| x86-64-v3 | lanes-1 | swarm_step/Brute/10000 | 5.54 | 3.72 | – | – | 0.2% | – |
| x86-64-v3 | lanes-1 | swarm_step/Sorted/10000 | 5.54 | 3.78 | – | – | 0.8% | – |
| native | lanes-1 | swarm_step/Brute/10000 | 5.54 | 3.63 | – | – | 0.4% | – |
| native | lanes-1 | swarm_step/Sorted/10000 | 5.51 | 3.64 | – | – | 1.0% | – |
| default | lanes-2 | swarm_step/Brute/10000 | 5.54 | 4.19 | – | – | 0.6% | – |
| default | lanes-2 | swarm_step/Sorted/10000 | 5.54 | 4.83 | – | – | 1.2% | – |
| x86-64-v3 | lanes-2 | swarm_step/Brute/10000 | 5.54 | 4.46 | – | – | 0.6% | – |
| x86-64-v3 | lanes-2 | swarm_step/Sorted/10000 | 5.54 | 4.21 | – | – | 1.6% | – |
| native | lanes-2 | swarm_step/Brute/10000 | 5.54 | 3.27 | – | – | 0.5% | – |
| native | lanes-2 | swarm_step/Sorted/10000 | 5.54 | 3.67 | – | – | 1.5% | – |
| default | lanes-4 | swarm_step/Brute/10000 | 5.54 | 4.44 | – | – | 1.2% | – |
| default | lanes-4 | swarm_step/Sorted/10000 | 5.52 | 4.37 | – | – | 2.0% | – |
| x86-64-v3 | lanes-4 | swarm_step/Brute/10000 | 5.54 | 4.16 | – | – | 1.2% | – |
| x86-64-v3 | lanes-4 | swarm_step/Sorted/10000 | 5.54 | 4.14 | – | – | 2.6% | – |
| native | lanes-4 | swarm_step/Brute/10000 | 5.54 | 2.92 | – | – | 1.2% | – |
| native | lanes-4 | swarm_step/Sorted/10000 | 5.53 | 3.19 | – | – | 2.4% | – |
| default | lanes-8 | swarm_step/Brute/10000 | 5.54 | 4.87 | – | – | 1.2% | – |
| default | lanes-8 | swarm_step/Sorted/10000 | 5.53 | 4.26 | – | – | 2.8% | – |
| x86-64-v3 | lanes-8 | swarm_step/Brute/10000 | 5.54 | 3.55 | – | – | 0.7% | – |
| x86-64-v3 | lanes-8 | swarm_step/Sorted/10000 | 5.54 | 3.21 | – | – | 3.3% | – |
| native | lanes-8 | swarm_step/Brute/10000 | 5.54 | 3.29 | – | – | 0.7% | – |
| native | lanes-8 | swarm_step/Sorted/10000 | 5.54 | 3.18 | – | – | 3.1% | – |
| default | lanes-16 | swarm_step/Brute/10000 | 5.54 | 4.77 | – | – | 2.6% | – |
| default | lanes-16 | swarm_step/Sorted/10000 | 5.54 | 3.60 | – | – | 4.4% | – |
| x86-64-v3 | lanes-16 | swarm_step/Brute/10000 | 5.54 | 3.87 | – | – | 2.1% | – |
| x86-64-v3 | lanes-16 | swarm_step/Sorted/10000 | 5.54 | 2.91 | – | – | 5.2% | – |
| native | lanes-16 | swarm_step/Brute/10000 | 5.53 | 2.84 | – | – | 1.3% | – |
| native | lanes-16 | swarm_step/Sorted/10000 | 5.54 | 2.50 | – | – | 5.4% | – |
| default | algebraic | swarm_step/Brute/10000 | 5.54 | 4.25 | – | – | 0.3% | – |
| default | algebraic | swarm_step/Sorted/10000 | 5.52 | 4.31 | – | – | 0.9% | – |
| x86-64-v3 | algebraic | swarm_step/Brute/10000 | 5.54 | 3.61 | – | – | 0.4% | – |
| x86-64-v3 | algebraic | swarm_step/Sorted/10000 | 5.54 | 3.99 | – | – | 1.5% | – |
| native | algebraic | swarm_step/Brute/10000 | 5.53 | 2.90 | – | – | 0.5% | – |
| native | algebraic | swarm_step/Sorted/10000 | 5.54 | 3.22 | – | – | 1.3% | – |
