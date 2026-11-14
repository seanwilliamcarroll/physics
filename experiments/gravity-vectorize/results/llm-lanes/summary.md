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

Time as criterion printed it (its point estimate; rebuilt from the run's log with `--from-log`); in brackets, the change against `base` at the same level.

## default (`RUSTFLAGS=''`)

| bench | base | c-lanes | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|
| pairwise_f32/16 | 202 ns | 257 ns (+27%) | 534 ns (+164%) | 512 ns (+153%) | 695 ns (+243%) | 1.24 µs (+511%) |
| pairwise_f32/128 | 13.1 µs | 5.9 µs (-55%) | 19.1 µs (+46%) | 10.4 µs (-20%) | 10.5 µs (-20%) | 15.1 µs (+15%) |
| pairwise_f32/1024 | 838 µs | 354 µs (-58%) | 1.12 ms (+33%) | 492 µs (-41%) | 392 µs (-53%) | 433 µs (-48%) |
| pairwise_f32/4096 | 13.4 ms | 5.67 ms (-58%) | 17.5 ms (+31%) | 7.49 ms (-44%) | 5.7 ms (-58%) | 5.94 ms (-56%) |
| pairwise_f64/16 | 278 ns | 337 ns (+21%) | 550 ns (+98%) | 581 ns (+109%) | 793 ns (+185%) | 1.33 µs (+377%) |
| pairwise_f64/128 | 18.2 µs | 11.6 µs (-36%) | 15.1 µs (-17%) | 14.1 µs (-23%) | 14.7 µs (-19%) | 19.5 µs (+7%) |
| pairwise_f64/1024 | 1.17 ms | 722 µs (-38%) | 810 µs (-31%) | 705 µs (-40%) | 662 µs (-43%) | 725 µs (-38%) |
| pairwise_f64/4096 | 18.7 ms | 11.5 ms (-39%) | 12.7 ms (-32%) | 10.9 ms (-42%) | 10.1 ms (-46%) | 10.8 ms (-42%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | base | c-lanes | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|
| pairwise_f32/16 | 199 ns | 323 ns (+63%) | 537 ns (+170%) | 563 ns (+183%) | 701 ns (+253%) | 1.2 µs (+503%) |
| pairwise_f32/128 | 12.8 µs | 4.15 µs (-68%) | 18 µs (+41%) | 11.9 µs (-7%) | 11.7 µs (-9%) | 13.7 µs (+7%) |
| pairwise_f32/1024 | 821 µs | 225 µs (-73%) | 1.03 ms (+26%) | 571 µs (-30%) | 469 µs (-43%) | 375 µs (-54%) |
| pairwise_f32/4096 | 13.2 ms | 3.8 ms (-71%) | 16.3 ms (+24%) | 8.84 ms (-33%) | 7.11 ms (-46%) | 5.18 ms (-61%) |
| pairwise_f64/16 | 276 ns | 300 ns (+9%) | 549 ns (+99%) | 614 ns (+123%) | 779 ns (+183%) | 1.2 µs (+337%) |
| pairwise_f64/128 | 18.1 µs | 7.33 µs (-60%) | 13.8 µs (-24%) | 14.7 µs (-19%) | 13.3 µs (-27%) | 15.9 µs (-12%) |
| pairwise_f64/1024 | 1.17 ms | 453 µs (-61%) | 715 µs (-39%) | 752 µs (-36%) | 580 µs (-50%) | 524 µs (-55%) |
| pairwise_f64/4096 | 18.7 ms | 7.51 ms (-60%) | 11.2 ms (-40%) | 11.6 ms (-38%) | 8.73 ms (-53%) | 7.4 ms (-60%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | base | c-lanes | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|
| pairwise_f32/16 | 198 ns | 324 ns (+64%) | 549 ns (+177%) | 546 ns (+175%) | 700 ns (+253%) | 1.13 µs (+471%) |
| pairwise_f32/128 | 12.8 µs | 3.65 µs (-71%) | 18.8 µs (+47%) | 10.9 µs (-14%) | 10.5 µs (-18%) | 12.5 µs (-2%) |
| pairwise_f32/1024 | 820 µs | 146 µs (-82%) | 1.08 ms (+32%) | 516 µs (-37%) | 420 µs (-49%) | 326 µs (-60%) |
| pairwise_f32/4096 | 13.2 ms | 2.63 ms (-80%) | 16.8 ms (+28%) | 7.86 ms (-40%) | 6.16 ms (-53%) | 4.32 ms (-67%) |
| pairwise_f64/16 | 277 ns | 464 ns (+67%) | 543 ns (+96%) | 576 ns (+108%) | 752 ns (+171%) | 1.18 µs (+325%) |
| pairwise_f64/128 | 18.3 µs | 5.47 µs (-70%) | 13.3 µs (-27%) | 13.2 µs (-28%) | 11.9 µs (-35%) | 13.8 µs (-25%) |
| pairwise_f64/1024 | 1.17 ms | 241 µs (-79%) | 682 µs (-42%) | 671 µs (-43%) | 496 µs (-58%) | 384 µs (-67%) |
| pairwise_f64/4096 | 18.8 ms | 4.05 ms (-78%) | 10.7 ms (-43%) | 10.6 ms (-43%) | 7.79 ms (-59%) | 5.39 ms (-71%) |

## wasm (`RUSTFLAGS=''`)

| bench | base | c-lanes | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|
| pairwise_f32/16 | 268 ns | 450 ns (+68%) | 665 ns (+148%) | 872 ns (+226%) | 1.19 µs (+345%) | 1.84 µs (+586%) |
| pairwise_f32/128 | 16.4 µs | 17.1 µs (+4%) | 18.1 µs (+10%) | 20.9 µs (+28%) | 25.5 µs (+55%) | 35.2 µs (+115%) |
| pairwise_f32/1024 | 1.05 ms | 999 µs (-5%) | 968 µs (-8%) | 1.07 ms (+2%) | 1.22 ms (+16%) | 1.52 ms (+45%) |
| pairwise_f32/4096 | 16.7 ms | 15.8 ms (-6%) | 15.2 ms (-9%) | 16.7 ms (-0%) | 18.8 ms (+12%) | 23.1 ms (+38%) |
| pairwise_f64/16 | 321 ns | 495 ns (+54%) | 719 ns (+124%) | 892 ns (+178%) | 1.35 µs (+319%) | 1.99 µs (+520%) |
| pairwise_f64/128 | 19.9 µs | 21.6 µs (+9%) | 21.7 µs (+9%) | 23.8 µs (+19%) | 28.9 µs (+45%) | 40.1 µs (+101%) |
| pairwise_f64/1024 | 1.27 ms | 1.31 ms (+3%) | 1.21 ms (-5%) | 1.26 ms (-1%) | 1.46 ms (+14%) | 1.88 ms (+48%) |
| pairwise_f64/4096 | 20.4 ms | 20.9 ms (+2%) | 19 ms (-7%) | 19.6 ms (-4%) | 22.3 ms (+9%) | 28.9 ms (+41%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | c-lanes | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|
| pairwise_f32/16 | 257 ns | 572 ns (+123%) | 598 ns (+133%) | 772 ns (+200%) | 1.1 µs (+330%) | 1.84 µs (+614%) |
| pairwise_f32/128 | 14.1 µs | 7.62 µs (-46%) | 12.3 µs (-13%) | 13.2 µs (-7%) | 13.4 µs (-5%) | 20.5 µs (+45%) |
| pairwise_f32/1024 | 888 µs | 402 µs (-55%) | 606 µs (-32%) | 592 µs (-33%) | 460 µs (-48%) | 568 µs (-36%) |
| pairwise_f32/4096 | 14.2 ms | 6.32 ms (-56%) | 9.39 ms (-34%) | 8.97 ms (-37%) | 6.76 ms (-52%) | 7.33 ms (-48%) |
| pairwise_f64/16 | 294 ns | 502 ns (+71%) | 680 ns (+131%) | 778 ns (+165%) | 1.1 µs (+274%) | 1.97 µs (+570%) |
| pairwise_f64/128 | 18.3 µs | 12.7 µs (-30%) | 15 µs (-18%) | 14.3 µs (-22%) | 17.1 µs (-7%) | 25.9 µs (+42%) |
| pairwise_f64/1024 | 1.17 ms | 737 µs (-37%) | 763 µs (-35%) | 662 µs (-43%) | 679 µs (-42%) | 892 µs (-24%) |
| pairwise_f64/4096 | 18.7 ms | 11.6 ms (-38%) | 11.8 ms (-37%) | 10.1 ms (-46%) | 10.1 ms (-46%) | 13.1 ms (-30%) |

## v8 (`RUSTFLAGS=''`)

| bench | base | c-lanes | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|
| pairwise_f32/16 | 278 ns | 388 ns (+40%) | 510 ns (+84%) | 700 ns (+152%) | 1.22 µs (+340%) | 2.02 µs (+627%) |
| pairwise_f32/128 | 16.7 µs | 15.9 µs (-5%) | 16.8 µs (+1%) | 19.6 µs (+17%) | 24.5 µs (+47%) | 33.8 µs (+102%) |
| pairwise_f32/1024 | 1.05 ms | 999 µs (-5%) | 940 µs (-11%) | 1.04 ms (-1%) | 1.17 ms (+12%) | 1.41 ms (+34%) |
| pairwise_f32/4096 | 16.8 ms | 16 ms (-5%) | 14.8 ms (-12%) | 16.3 ms (-3%) | 18.1 ms (+8%) | 21.5 ms (+27%) |
| pairwise_f64/16 | 322 ns | 441 ns (+37%) | 538 ns (+67%) | 744 ns (+131%) | 1.29 µs (+300%) | 2.11 µs (+557%) |
| pairwise_f64/128 | 20 µs | 20.5 µs (+2%) | 20.1 µs (+1%) | 22.4 µs (+12%) | 27.6 µs (+38%) | 39.5 µs (+97%) |
| pairwise_f64/1024 | 1.28 ms | 1.3 ms (+2%) | 1.19 ms (-7%) | 1.23 ms (-4%) | 1.36 ms (+6%) | 1.79 ms (+40%) |
| pairwise_f64/4096 | 20.4 ms | 20.8 ms (+2%) | 18.9 ms (-7%) | 19.3 ms (-5%) | 21.2 ms (+4%) | 27.3 ms (+34%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | c-lanes | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|
| pairwise_f32/16 | 226 ns | 318 ns (+41%) | 413 ns (+83%) | 577 ns (+155%) | 1.1 µs (+388%) | 1.95 µs (+763%) |
| pairwise_f32/128 | 21.6 µs | 6.86 µs (-68%) | 10.3 µs (-52%) | 11.3 µs (-48%) | 13.3 µs (-39%) | 20.3 µs (-6%) |
| pairwise_f32/1024 | 1.39 ms | 367 µs (-74%) | 579 µs (-58%) | 555 µs (-60%) | 441 µs (-68%) | 526 µs (-62%) |
| pairwise_f32/4096 | 22.3 ms | 5.86 ms (-74%) | 9.1 ms (-59%) | 8.61 ms (-61%) | 6.47 ms (-71%) | 7.26 ms (-67%) |
| pairwise_f64/16 | 296 ns | 384 ns (+30%) | 442 ns (+49%) | 594 ns (+101%) | 1.14 µs (+285%) | 2.11 µs (+613%) |
| pairwise_f64/128 | 18.3 µs | 12.3 µs (-33%) | 13 µs (-29%) | 12.8 µs (-30%) | 16.6 µs (-9%) | 27.2 µs (+49%) |
| pairwise_f64/1024 | 1.17 ms | 730 µs (-38%) | 745 µs (-36%) | 645 µs (-45%) | 662 µs (-44%) | 892 µs (-24%) |
| pairwise_f64/4096 | 18.7 ms | 11.6 ms (-38%) | 11.7 ms (-37%) | 9.97 ms (-47%) | 9.92 ms (-47%) | 12.8 ms (-32%) |

## base, each level against default

| bench | default | x86-64-v3 | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 202 ns (+0%) | 199 ns (-2%) | 198 ns (-2%) | 268 ns (+32%) | 257 ns (+27%) | 278 ns (+37%) | 226 ns (+12%) |
| pairwise_f32/128 | 13.1 µs (+0%) | 12.8 µs (-2%) | 12.8 µs (-2%) | 16.4 µs (+25%) | 14.1 µs (+8%) | 16.7 µs (+28%) | 21.6 µs (+65%) |
| pairwise_f32/1024 | 838 µs (+0%) | 821 µs (-2%) | 820 µs (-2%) | 1.05 ms (+25%) | 888 µs (+6%) | 1.05 ms (+26%) | 1.39 ms (+66%) |
| pairwise_f32/4096 | 13.4 ms (+0%) | 13.2 ms (-2%) | 13.2 ms (-2%) | 16.7 ms (+25%) | 14.2 ms (+6%) | 16.8 ms (+25%) | 22.3 ms (+66%) |
| pairwise_f64/16 | 278 ns (+0%) | 276 ns (-1%) | 277 ns (-0%) | 321 ns (+15%) | 294 ns (+6%) | 322 ns (+16%) | 296 ns (+6%) |
| pairwise_f64/128 | 18.2 µs (+0%) | 18.1 µs (-1%) | 18.3 µs (+0%) | 19.9 µs (+9%) | 18.3 µs (+0%) | 20 µs (+10%) | 18.3 µs (+0%) |
| pairwise_f64/1024 | 1.17 ms (+0%) | 1.17 ms (-0%) | 1.17 ms (+0%) | 1.27 ms (+9%) | 1.17 ms (-0%) | 1.28 ms (+9%) | 1.17 ms (+0%) |
| pairwise_f64/4096 | 18.7 ms (+0%) | 18.7 ms (-0%) | 18.8 ms (+0%) | 20.4 ms (+9%) | 18.7 ms (-0%) | 20.4 ms (+9%) | 18.7 ms (-0%) |

## perf

From `perf stat` over criterion's `--profile-time` run. GHz is
cycles / task-clock; per pair is criterion's mean time × GHz / pairs,
with pairs = n(n−1)/2. Backend stalls: cycles the core waited on
results or memory. Where each loop spends its cycles, instruction by
instruction: `perf/*.annotate.txt`.

| level | experiment | bench | GHz | IPC | cycles/pair | instr/pair | branch miss | backend stall |
|---|---|---|---|---|---|---|---|---|
| default | base | pairwise_f32/1024 | 5.50 | 4.41 | 8.80 | 38.8 | 0.1% | – |
| default | base | pairwise_f64/1024 | 5.53 | 3.24 | 12.38 | 40.2 | 0.1% | – |
| default | c-lanes | pairwise_f32/1024 | 5.50 | 3.75 | 3.72 | 13.9 | 1.4% | – |
| default | c-lanes | pairwise_f64/1024 | 5.54 | 3.21 | 7.63 | 24.5 | 1.2% | – |
| default | d-l16 | pairwise_f32/1024 | 5.54 | 3.32 | 4.58 | 15.2 | 0.5% | – |
| default | d-l16 | pairwise_f64/1024 | 5.54 | 3.18 | 7.67 | 24.4 | 0.5% | – |
| default | d-l2 | pairwise_f32/1024 | 5.50 | 3.12 | 11.73 | 36.6 | 0.5% | – |
| default | d-l2 | pairwise_f64/1024 | 5.54 | 2.66 | 8.57 | 22.8 | 0.5% | – |
| default | d-l4 | pairwise_f32/1024 | 5.54 | 2.95 | 5.21 | 15.4 | 0.8% | – |
| default | d-l4 | pairwise_f64/1024 | 5.54 | 2.62 | 7.45 | 19.5 | 0.7% | – |
| default | d-l8 | pairwise_f32/1024 | 5.54 | 3.28 | 4.15 | 13.6 | 0.8% | – |
| default | d-l8 | pairwise_f64/1024 | 5.54 | 3.06 | 7.00 | 21.4 | 0.8% | – |
| native | base | pairwise_f32/1024 | 5.51 | 3.70 | 8.63 | 31.9 | 0.1% | – |
| native | base | pairwise_f64/1024 | 5.54 | 2.67 | 12.40 | 33.1 | 0.1% | – |
| native | c-lanes | pairwise_f32/1024 | 5.48 | 2.41 | 1.53 | 3.7 | 0.1% | – |
| native | c-lanes | pairwise_f64/1024 | 5.45 | 2.37 | 2.51 | 5.9 | 0.8% | – |
| native | d-l16 | pairwise_f32/1024 | 5.54 | 2.63 | 3.45 | 9.1 | 0.2% | – |
| native | d-l16 | pairwise_f64/1024 | 5.54 | 2.18 | 4.05 | 8.9 | 0.4% | – |
| native | d-l2 | pairwise_f32/1024 | 5.54 | 3.25 | 11.41 | 37.1 | 0.1% | – |
| native | d-l2 | pairwise_f64/1024 | 5.54 | 2.30 | 7.21 | 16.6 | 0.7% | – |
| native | d-l4 | pairwise_f32/1024 | 5.54 | 2.67 | 5.46 | 14.6 | 0.6% | – |
| native | d-l4 | pairwise_f64/1024 | 5.54 | 2.13 | 7.09 | 15.1 | 0.6% | – |
| native | d-l8 | pairwise_f32/1024 | 5.54 | 2.55 | 4.44 | 11.3 | 0.5% | – |
| native | d-l8 | pairwise_f64/1024 | 5.54 | 2.09 | 5.24 | 11.0 | 0.5% | – |
| x86-64-v3 | base | pairwise_f32/1024 | 5.51 | 3.81 | 8.63 | 32.9 | 0.1% | – |
| x86-64-v3 | base | pairwise_f64/1024 | 5.54 | 2.77 | 12.34 | 34.1 | 0.1% | – |
| x86-64-v3 | c-lanes | pairwise_f32/1024 | 5.49 | 2.72 | 2.36 | 6.4 | 1.2% | – |
| x86-64-v3 | c-lanes | pairwise_f64/1024 | 5.54 | 2.44 | 4.79 | 11.7 | 1.6% | – |
| x86-64-v3 | d-l16 | pairwise_f32/1024 | 5.54 | 2.62 | 3.96 | 10.4 | 0.4% | – |
| x86-64-v3 | d-l16 | pairwise_f64/1024 | 5.54 | 2.63 | 5.54 | 14.6 | 0.5% | – |
| x86-64-v3 | d-l2 | pairwise_f32/1024 | 5.53 | 2.99 | 10.89 | 32.5 | 0.6% | – |
| x86-64-v3 | d-l2 | pairwise_f64/1024 | 5.54 | 2.27 | 7.56 | 17.2 | 0.5% | – |
| x86-64-v3 | d-l4 | pairwise_f32/1024 | 5.54 | 2.45 | 6.04 | 14.8 | 0.6% | – |
| x86-64-v3 | d-l4 | pairwise_f64/1024 | 5.54 | 2.04 | 7.95 | 16.2 | 0.9% | – |
| x86-64-v3 | d-l8 | pairwise_f32/1024 | 5.50 | 2.40 | 4.93 | 11.8 | 0.5% | – |
| x86-64-v3 | d-l8 | pairwise_f64/1024 | 5.54 | 2.23 | 6.13 | 13.7 | 0.6% | – |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--base--accumulate-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `default--base--accumulate-f64.s`: divpd xmm ×1, divsd ×2, sqrtsd ×1
- `default--c-lanes--accumulate-f32.s`: divss ×1
- `default--c-lanes--accumulate-f64.s`: divsd ×1
- `default--c-lanes--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--c-lanes--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--d-l16--accumulate-f32.s`: divss ×1
- `default--d-l16--accumulate-f64.s`: divsd ×1
- `default--d-l16--sweep-f32.s`: divps xmm ×5, divss ×1, sqrtps xmm ×5, sqrtss ×1
- `default--d-l16--sweep-f64.s`: divpd xmm ×8, divsd ×1, sqrtpd xmm ×8, sqrtsd ×1
- `default--d-l2--accumulate-f32.s`: divss ×1
- `default--d-l2--accumulate-f64.s`: divsd ×1
- `default--d-l2--sweep-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--d-l2--sweep-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--d-l4--accumulate-f32.s`: divss ×1
- `default--d-l4--accumulate-f64.s`: divsd ×1
- `default--d-l4--sweep-f32.s`: divps xmm ×2, divss ×3, sqrtps xmm ×2, sqrtss ×3
- `default--d-l4--sweep-f64.s`: divpd xmm ×2, divsd ×3, sqrtpd xmm ×2, sqrtsd ×3
- `default--d-l8--accumulate-f32.s`: divss ×1
- `default--d-l8--accumulate-f64.s`: divsd ×1
- `default--d-l8--sweep-f32.s`: divps xmm ×3, divss ×7, sqrtps xmm ×3, sqrtss ×7
- `default--d-l8--sweep-f64.s`: divpd xmm ×4, divsd ×7, sqrtpd xmm ×4, sqrtsd ×7
- `native--base--accumulate-f32.s`: divps xmm ×1, divps zmm ×1, divss ×10, sqrtss ×1
- `native--base--accumulate-f64.s`: divpd zmm ×1, divsd ×6, sqrtsd ×1
- `native--c-lanes--accumulate-f32.s`: divss ×1
- `native--c-lanes--accumulate-f64.s`: divsd ×1
- `native--c-lanes--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--c-lanes--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--d-l16--accumulate-f32.s`: divss ×1
- `native--d-l16--accumulate-f64.s`: divsd ×1
- `native--d-l16--sweep-f32.s`: divps xmm ×3, divps ymm ×1, divps zmm ×1, sqrtps xmm ×3, sqrtps ymm ×1, sqrtps zmm ×1
- `native--d-l16--sweep-f64.s`: divpd xmm ×2, divpd ymm ×1, divpd zmm ×2, sqrtpd xmm ×2, sqrtpd ymm ×1, sqrtpd zmm ×2
- `native--d-l2--accumulate-f32.s`: divss ×1
- `native--d-l2--accumulate-f64.s`: divsd ×1
- `native--d-l2--sweep-f32.s`: divss ×3, sqrtss ×3
- `native--d-l2--sweep-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `native--d-l4--accumulate-f32.s`: divss ×1
- `native--d-l4--accumulate-f64.s`: divsd ×1
- `native--d-l4--sweep-f32.s`: divps xmm ×3, sqrtps xmm ×3
- `native--d-l4--sweep-f64.s`: divpd xmm ×2, divpd ymm ×1, sqrtpd xmm ×2, sqrtpd ymm ×1
- `native--d-l8--accumulate-f32.s`: divss ×1
- `native--d-l8--accumulate-f64.s`: divsd ×1
- `native--d-l8--sweep-f32.s`: divps xmm ×3, divps ymm ×1, sqrtps xmm ×3, sqrtps ymm ×1
- `native--d-l8--sweep-f64.s`: divpd xmm ×2, divpd ymm ×1, divpd zmm ×1, sqrtpd xmm ×2, sqrtpd ymm ×1, sqrtpd zmm ×1
- `wasm--base--accumulate-f32.s`: f32.div ×2, f32.sqrt ×1
- `wasm--base--accumulate-f64.s`: f64.div ×2, f64.sqrt ×1
- `wasm--c-lanes--accumulate-f32.s`: f32.div ×1
- `wasm--c-lanes--accumulate-f64.s`: f64.div ×1
- `wasm--c-lanes--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--c-lanes--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--d-l16--accumulate-f32.s`: f32.div ×1
- `wasm--d-l16--accumulate-f64.s`: f64.div ×1
- `wasm--d-l16--sweep-f32.s`: f32.div ×17, f32.sqrt ×17
- `wasm--d-l16--sweep-f64.s`: f64.div ×17, f64.sqrt ×17
- `wasm--d-l2--accumulate-f32.s`: f32.div ×1
- `wasm--d-l2--accumulate-f64.s`: f64.div ×1
- `wasm--d-l2--sweep-f32.s`: f32.div ×3, f32.sqrt ×3
- `wasm--d-l2--sweep-f64.s`: f64.div ×3, f64.sqrt ×3
- `wasm--d-l4--accumulate-f32.s`: f32.div ×1
- `wasm--d-l4--accumulate-f64.s`: f64.div ×1
- `wasm--d-l4--sweep-f32.s`: f32.div ×7, f32.sqrt ×7
- `wasm--d-l4--sweep-f64.s`: f64.div ×7, f64.sqrt ×7
- `wasm--d-l8--accumulate-f32.s`: f32.div ×1
- `wasm--d-l8--accumulate-f64.s`: f64.div ×1
- `wasm--d-l8--sweep-f32.s`: f32.div ×15, f32.sqrt ×15
- `wasm--d-l8--sweep-f64.s`: f64.div ×15, f64.sqrt ×15
- `wasm-simd128--base--accumulate-f32.s`: f32.div ×2, f32.sqrt ×1, f32x4.div ×1
- `wasm-simd128--base--accumulate-f64.s`: f64.div ×2, f64.sqrt ×1
- `wasm-simd128--c-lanes--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--c-lanes--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--c-lanes--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--c-lanes--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--d-l16--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--d-l16--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--d-l16--sweep-f32.s`: f32.div ×3, f32.sqrt ×3, f32x4.div ×4, f32x4.sqrt ×4
- `wasm-simd128--d-l16--sweep-f64.s`: f64.div ×3, f64.sqrt ×3, f64x2.div ×7, f64x2.sqrt ×7
- `wasm-simd128--d-l2--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--d-l2--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--d-l2--sweep-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--d-l2--sweep-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--d-l4--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--d-l4--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--d-l4--sweep-f32.s`: f32.div ×3, f32.sqrt ×3, f32x4.div ×2, f32x4.sqrt ×2
- `wasm-simd128--d-l4--sweep-f64.s`: f64.div ×3, f64.sqrt ×3, f64x2.div ×2, f64x2.sqrt ×2
- `wasm-simd128--d-l8--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--d-l8--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--d-l8--sweep-f32.s`: f32.div ×7, f32.sqrt ×7, f32x4.div ×3, f32x4.sqrt ×3
- `wasm-simd128--d-l8--sweep-f64.s`: f64.div ×7, f64.sqrt ×7, f64x2.div ×4, f64x2.sqrt ×4
- `x86-64-v3--base--accumulate-f32.s`: divps ymm ×1, divss ×4, sqrtss ×1
- `x86-64-v3--base--accumulate-f64.s`: divpd ymm ×1, divsd ×4, sqrtsd ×1
- `x86-64-v3--c-lanes--accumulate-f32.s`: divss ×1
- `x86-64-v3--c-lanes--accumulate-f64.s`: divsd ×1
- `x86-64-v3--c-lanes--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--c-lanes--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--d-l16--accumulate-f32.s`: divss ×1
- `x86-64-v3--d-l16--accumulate-f64.s`: divsd ×1
- `x86-64-v3--d-l16--sweep-f32.s`: divps xmm ×3, divps ymm ×2, sqrtps xmm ×3, sqrtps ymm ×2
- `x86-64-v3--d-l16--sweep-f64.s`: divpd xmm ×2, divpd ymm ×4, sqrtpd xmm ×2, sqrtpd ymm ×4
- `x86-64-v3--d-l2--accumulate-f32.s`: divss ×1
- `x86-64-v3--d-l2--accumulate-f64.s`: divsd ×1
- `x86-64-v3--d-l2--sweep-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `x86-64-v3--d-l2--sweep-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `x86-64-v3--d-l4--accumulate-f32.s`: divss ×1
- `x86-64-v3--d-l4--accumulate-f64.s`: divsd ×1
- `x86-64-v3--d-l4--sweep-f32.s`: divps xmm ×3, sqrtps xmm ×3
- `x86-64-v3--d-l4--sweep-f64.s`: divpd xmm ×2, divpd ymm ×1, sqrtpd xmm ×2, sqrtpd ymm ×1
- `x86-64-v3--d-l8--accumulate-f32.s`: divss ×1
- `x86-64-v3--d-l8--accumulate-f64.s`: divsd ×1
- `x86-64-v3--d-l8--sweep-f32.s`: divps xmm ×3, divps ymm ×1, sqrtps xmm ×3, sqrtps ymm ×1
- `x86-64-v3--d-l8--sweep-f64.s`: divpd xmm ×2, divpd ymm ×2, sqrtpd xmm ×2, sqrtpd ymm ×2
