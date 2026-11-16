# Gravity experiments

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

Mean time; in brackets, the change against `plain` at the same level.

## default (`RUSTFLAGS=''`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 147 ns | 251 ns (+71%) | 226 ns (+54%) | 234 ns (+59%) | 305 ns (+108%) | 439 ns (+199%) | 238 ns (+62%) | 317 ns (+116%) | 234 ns (+59%) | 277 ns (+89%) | 405 ns (+176%) |
| pairwise_f32/128 | 8.64 µs | 9.63 µs (+11%) | 6.05 µs (-30%) | 5.04 µs (-42%) | 4.85 µs (-44%) | 5.67 µs (-34%) | 5.85 µs (-32%) | 14.4 µs (+67%) | 7.72 µs (-11%) | 8.29 µs (-4%) | 6.7 µs (-22%) |
| pairwise_f32/1024 | 549 µs | 787 µs (+43%) | 522 µs (-5%) | 339 µs (-38%) | 285 µs (-48%) | 268 µs (-51%) | 339 µs (-38%) | 883 µs (+61%) | 450 µs (-18%) | 498 µs (-9%) | 304 µs (-45%) |
| pairwise_f32/4096 | 8.77 ms | 13.4 ms (+53%) | 8.39 ms (-4%) | 5.86 ms (-33%) | 4.73 ms (-46%) | 4.28 ms (-51%) | 5.39 ms (-39%) | 14.1 ms (+61%) | 7.14 ms (-19%) | 7.91 ms (-10%) | 4.64 ms (-47%) |
| pairwise_f64/16 | 162 ns | 276 ns (+70%) | 260 ns (+60%) | 265 ns (+64%) | 280 ns (+73%) | 416 ns (+157%) | 254 ns (+57%) | 282 ns (+74%) | 336 ns (+107%) | 331 ns (+104%) | 449 ns (+177%) |
| pairwise_f64/128 | 8.59 µs | 13.1 µs (+52%) | 9.68 µs (+13%) | 8.77 µs (+2%) | 8.72 µs (+2%) | 9.56 µs (+11%) | 8.26 µs (-4%) | 10.4 µs (+21%) | 13 µs (+51%) | 10.9 µs (+27%) | 10.1 µs (+17%) |
| pairwise_f64/1024 | 542 µs | 1.02 ms (+89%) | 711 µs (+31%) | 583 µs (+8%) | 533 µs (-2%) | 520 µs (-4%) | 498 µs (-8%) | 624 µs (+15%) | 772 µs (+42%) | 624 µs (+15%) | 516 µs (-5%) |
| pairwise_f64/4096 | 8.72 ms | 17.3 ms (+99%) | 12.2 ms (+40%) | 9.91 ms (+14%) | 8.81 ms (+1%) | 8.61 ms (-1%) | 7.95 ms (-9%) | 10.3 ms (+18%) | 12.5 ms (+43%) | 10.1 ms (+16%) | 8.47 ms (-3%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 150 ns | 255 ns (+71%) | 227 ns (+52%) | 236 ns (+58%) | 258 ns (+73%) | 367 ns (+145%) | 241 ns (+61%) | 317 ns (+112%) | 237 ns (+58%) | 280 ns (+87%) | 406 ns (+171%) |
| pairwise_f32/128 | 8.66 µs | 9.63 µs (+11%) | 6.12 µs (-29%) | 5.06 µs (-42%) | 5.2 µs (-40%) | 5.58 µs (-36%) | 5.86 µs (-32%) | 14.4 µs (+66%) | 7.75 µs (-11%) | 8.3 µs (-4%) | 6.71 µs (-23%) |
| pairwise_f32/1024 | 550 µs | 787 µs (+43%) | 484 µs (-12%) | 339 µs (-38%) | 284 µs (-48%) | 269 µs (-51%) | 339 µs (-38%) | 902 µs (+64%) | 450 µs (-18%) | 498 µs (-10%) | 303 µs (-45%) |
| pairwise_f32/4096 | 8.78 ms | 13.3 ms (+52%) | 8.37 ms (-5%) | 5.88 ms (-33%) | 4.73 ms (-46%) | 4.27 ms (-51%) | 5.46 ms (-38%) | 14.4 ms (+64%) | 7.17 ms (-18%) | 7.91 ms (-10%) | 4.64 ms (-47%) |
| pairwise_f64/16 | 170 ns | 276 ns (+63%) | 259 ns (+53%) | 268 ns (+58%) | 281 ns (+66%) | 419 ns (+147%) | 254 ns (+50%) | 285 ns (+68%) | 341 ns (+101%) | 330 ns (+95%) | 449 ns (+165%) |
| pairwise_f64/128 | 8.58 µs | 13.1 µs (+52%) | 9.76 µs (+14%) | 8.71 µs (+1%) | 8.7 µs (+1%) | 9.6 µs (+12%) | 8.27 µs (-4%) | 10.4 µs (+21%) | 13 µs (+51%) | 10.9 µs (+27%) | 10.1 µs (+17%) |
| pairwise_f64/1024 | 542 µs | 1.02 ms (+88%) | 713 µs (+32%) | 582 µs (+7%) | 530 µs (-2%) | 523 µs (-4%) | 492 µs (-9%) | 624 µs (+15%) | 773 µs (+43%) | 623 µs (+15%) | 517 µs (-5%) |
| pairwise_f64/4096 | 8.73 ms | 17.6 ms (+101%) | 12.2 ms (+40%) | 9.83 ms (+13%) | 8.77 ms (+0%) | 8.64 ms (-1%) | 7.92 ms (-9%) | 10.1 ms (+16%) | 12.5 ms (+43%) | 10.2 ms (+17%) | 8.48 ms (-3%) |

## wasm (`RUSTFLAGS=''`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 209 ns | 412 ns (+97%) | 407 ns (+95%) | 412 ns (+97%) | 440 ns (+111%) | 623 ns (+198%) | 342 ns (+64%) | 380 ns (+81%) | 415 ns (+99%) | 560 ns (+168%) | 639 ns (+206%) |
| pairwise_f32/128 | 12.3 µs | 15.2 µs (+24%) | 14 µs (+14%) | 13.8 µs (+13%) | 14.2 µs (+16%) | 15.6 µs (+27%) | 12.9 µs (+5%) | 13 µs (+6%) | 13.6 µs (+11%) | 17.2 µs (+40%) | 23.5 µs (+91%) |
| pairwise_f32/1024 | 771 µs | 1.18 ms (+53%) | 964 µs (+25%) | 864 µs (+12%) | 835 µs (+8%) | 842 µs (+9%) | 787 µs (+2%) | 796 µs (+3%) | 814 µs (+6%) | 971 µs (+26%) | 1.37 ms (+78%) |
| pairwise_f32/4096 | 12.3 ms | 20 ms (+63%) | 16 ms (+30%) | 14.1 ms (+15%) | 13.2 ms (+7%) | 13.2 ms (+8%) | 12.5 ms (+2%) | 12.6 ms (+3%) | 13.1 ms (+7%) | 15.5 ms (+26%) | 21.8 ms (+77%) |
| pairwise_f64/16 | 219 ns | 418 ns (+91%) | 412 ns (+88%) | 419 ns (+92%) | 454 ns (+108%) | 676 ns (+209%) | 353 ns (+62%) | 370 ns (+69%) | 428 ns (+96%) | 576 ns (+164%) | 708 ns (+224%) |
| pairwise_f64/128 | 12.5 µs | 15.6 µs (+25%) | 14.5 µs (+16%) | 14.4 µs (+16%) | 14.7 µs (+18%) | 16.6 µs (+33%) | 13 µs (+4%) | 13 µs (+4%) | 13.8 µs (+11%) | 17.4 µs (+39%) | 24.5 µs (+97%) |
| pairwise_f64/1024 | 786 µs | 1.22 ms (+55%) | 998 µs (+27%) | 898 µs (+14%) | 869 µs (+11%) | 880 µs (+12%) | 798 µs (+1%) | 793 µs (+1%) | 822 µs (+5%) | 985 µs (+25%) | 1.41 ms (+79%) |
| pairwise_f64/4096 | 12.7 ms | 20.8 ms (+64%) | 16.7 ms (+32%) | 14.8 ms (+17%) | 14.1 ms (+11%) | 14.1 ms (+11%) | 12.8 ms (+1%) | 12.7 ms (+0%) | 13.4 ms (+6%) | 16.7 ms (+32%) | 22.5 ms (+78%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 197 ns | 353 ns (+79%) | 354 ns (+80%) | 360 ns (+83%) | 373 ns (+89%) | 464 ns (+135%) | 341 ns (+73%) | 325 ns (+65%) | 325 ns (+65%) | 378 ns (+92%) | 539 ns (+173%) |
| pairwise_f32/128 | 10.5 µs | 8.52 µs (-19%) | 6.59 µs (-38%) | 6.47 µs (-39%) | 5.74 µs (-46%) | 6.25 µs (-41%) | 12.8 µs (+21%) | 7.79 µs (-26%) | 7.55 µs (-28%) | 6.48 µs (-39%) | 8.94 µs (-15%) |
| pairwise_f32/1024 | 659 µs | 697 µs (+6%) | 453 µs (-31%) | 375 µs (-43%) | 304 µs (-54%) | 283 µs (-57%) | 786 µs (+19%) | 450 µs (-32%) | 436 µs (-34%) | 333 µs (-49%) | 383 µs (-42%) |
| pairwise_f32/4096 | 10.5 ms | 12.1 ms (+15%) | 7.98 ms (-24%) | 6.23 ms (-41%) | 4.97 ms (-53%) | 4.43 ms (-58%) | 12.5 ms (+19%) | 7.14 ms (-32%) | 6.95 ms (-34%) | 5.26 ms (-50%) | 6.02 ms (-43%) |
| pairwise_f64/16 | 177 ns | 373 ns (+111%) | 368 ns (+108%) | 382 ns (+116%) | 396 ns (+124%) | 629 ns (+256%) | 347 ns (+97%) | 324 ns (+83%) | 333 ns (+88%) | 405 ns (+129%) | 682 ns (+286%) |
| pairwise_f64/128 | 9.76 µs | 12.4 µs (+27%) | 10.2 µs (+4%) | 10.2 µs (+5%) | 10 µs (+3%) | 11.5 µs (+17%) | 13 µs (+33%) | 9.16 µs (-6%) | 8.43 µs (-14%) | 9.17 µs (-6%) | 15.2 µs (+56%) |
| pairwise_f64/1024 | 610 µs | 930 µs (+53%) | 681 µs (+12%) | 600 µs (-2%) | 544 µs (-11%) | 540 µs (-11%) | 797 µs (+31%) | 519 µs (-15%) | 456 µs (-25%) | 474 µs (-22%) | 726 µs (+19%) |
| pairwise_f64/4096 | 9.82 ms | 16.1 ms (+64%) | 11.9 ms (+21%) | 10.1 ms (+3%) | 9.05 ms (-8%) | 8.71 ms (-11%) | 12.8 ms (+30%) | 8.4 ms (-15%) | 7.36 ms (-25%) | 7.96 ms (-19%) | 11.7 ms (+19%) |

## v8 (`RUSTFLAGS=''`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 212 ns | 433 ns (+105%) | 438 ns (+107%) | 440 ns (+108%) | 469 ns (+121%) | 644 ns (+204%) | 370 ns (+75%) | 391 ns (+84%) | 438 ns (+107%) | 535 ns (+153%) | 697 ns (+229%) |
| pairwise_f32/128 | 12.4 µs | 15.8 µs (+28%) | 14.5 µs (+17%) | 14.3 µs (+16%) | 14.6 µs (+18%) | 15.9 µs (+29%) | 13.1 µs (+6%) | 12.7 µs (+3%) | 14.2 µs (+15%) | 17.7 µs (+43%) | 24.9 µs (+101%) |
| pairwise_f32/1024 | 782 µs | 1.21 ms (+55%) | 981 µs (+25%) | 872 µs (+11%) | 844 µs (+8%) | 854 µs (+9%) | 815 µs (+4%) | 762 µs (-3%) | 830 µs (+6%) | 1.02 ms (+30%) | 1.43 ms (+83%) |
| pairwise_f32/4096 | 12.5 ms | 20.6 ms (+65%) | 16.3 ms (+31%) | 14.2 ms (+14%) | 13.4 ms (+7%) | 13.4 ms (+8%) | 13 ms (+4%) | 12.1 ms (-3%) | 13.3 ms (+7%) | 16.3 ms (+31%) | 22.9 ms (+83%) |
| pairwise_f64/16 | 222 ns | 449 ns (+102%) | 450 ns (+103%) | 453 ns (+105%) | 477 ns (+115%) | 721 ns (+225%) | 379 ns (+71%) | 388 ns (+75%) | 446 ns (+101%) | 545 ns (+146%) | 730 ns (+229%) |
| pairwise_f64/128 | 12.6 µs | 16.1 µs (+28%) | 15 µs (+19%) | 14.8 µs (+17%) | 15 µs (+18%) | 17.4 µs (+37%) | 13.2 µs (+4%) | 12.9 µs (+2%) | 14.5 µs (+15%) | 18 µs (+43%) | 26.7 µs (+112%) |
| pairwise_f64/1024 | 794 µs | 1.24 ms (+56%) | 1.01 ms (+27%) | 900 µs (+13%) | 873 µs (+10%) | 891 µs (+12%) | 831 µs (+5%) | 777 µs (-2%) | 846 µs (+6%) | 1.04 ms (+31%) | 1.51 ms (+90%) |
| pairwise_f64/4096 | 12.8 ms | 21.2 ms (+66%) | 16.8 ms (+32%) | 14.8 ms (+16%) | 14.1 ms (+10%) | 14.3 ms (+12%) | 13.1 ms (+3%) | 12.5 ms (-2%) | 13.7 ms (+8%) | 16.8 ms (+32%) | 24 ms (+88%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 219 ns | 376 ns (+72%) | 360 ns (+65%) | 376 ns (+72%) | 390 ns (+78%) | 474 ns (+117%) | 362 ns (+66%) | 340 ns (+55%) | 332 ns (+52%) | 366 ns (+67%) | 563 ns (+157%) |
| pairwise_f32/128 | 10.6 µs | 8.69 µs (-18%) | 6.36 µs (-40%) | 6.21 µs (-41%) | 5.87 µs (-44%) | 6.4 µs (-39%) | 13 µs (+23%) | 8.94 µs (-15%) | 8 µs (-24%) | 6.88 µs (-35%) | 8.76 µs (-17%) |
| pairwise_f32/1024 | 661 µs | 710 µs (+7%) | 434 µs (-34%) | 360 µs (-46%) | 292 µs (-56%) | 286 µs (-57%) | 778 µs (+18%) | 517 µs (-22%) | 455 µs (-31%) | 350 µs (-47%) | 381 µs (-42%) |
| pairwise_f32/4096 | 10.6 ms | 12.4 ms (+17%) | 7.79 ms (-26%) | 6.05 ms (-43%) | 4.78 ms (-55%) | 4.33 ms (-59%) | 12.4 ms (+17%) | 8.23 ms (-22%) | 7.21 ms (-32%) | 5.43 ms (-49%) | 5.9 ms (-44%) |
| pairwise_f64/16 | 210 ns | 394 ns (+87%) | 385 ns (+83%) | 401 ns (+91%) | 418 ns (+99%) | 614 ns (+192%) | 372 ns (+77%) | 335 ns (+59%) | 344 ns (+63%) | 419 ns (+99%) | 719 ns (+242%) |
| pairwise_f64/128 | 10.5 µs | 11.7 µs (+10%) | 9.5 µs (-10%) | 9.43 µs (-11%) | 9.5 µs (-10%) | 11 µs (+5%) | 13.1 µs (+25%) | 9.25 µs (-12%) | 7.88 µs (-25%) | 8.75 µs (-17%) | 15.1 µs (+43%) |
| pairwise_f64/1024 | 662 µs | 924 µs (+40%) | 660 µs (-0%) | 577 µs (-13%) | 525 µs (-21%) | 518 µs (-22%) | 791 µs (+19%) | 539 µs (-19%) | 438 µs (-34%) | 460 µs (-30%) | 720 µs (+9%) |
| pairwise_f64/4096 | 10.6 ms | 16.4 ms (+54%) | 11.5 ms (+8%) | 9.77 ms (-8%) | 8.72 ms (-18%) | 8.3 ms (-22%) | 12.7 ms (+19%) | 8.77 ms (-18%) | 7.08 ms (-34%) | 7.45 ms (-30%) | 11.3 ms (+7%) |

## plain, each level against default

| bench | default | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|
| pairwise_f32/16 | 147 ns (+0%) | 150 ns (+2%) | 209 ns (+43%) | 197 ns (+34%) | 212 ns (+44%) | 219 ns (+49%) |
| pairwise_f32/128 | 8.64 µs (+0%) | 8.66 µs (+0%) | 12.3 µs (+42%) | 10.5 µs (+22%) | 12.4 µs (+43%) | 10.6 µs (+22%) |
| pairwise_f32/1024 | 549 µs (+0%) | 550 µs (+0%) | 771 µs (+40%) | 659 µs (+20%) | 782 µs (+42%) | 661 µs (+20%) |
| pairwise_f32/4096 | 8.77 ms (+0%) | 8.78 ms (+0%) | 12.3 ms (+40%) | 10.5 ms (+20%) | 12.5 ms (+42%) | 10.6 ms (+20%) |
| pairwise_f64/16 | 162 ns (+0%) | 170 ns (+5%) | 219 ns (+35%) | 177 ns (+9%) | 222 ns (+37%) | 210 ns (+30%) |
| pairwise_f64/128 | 8.59 µs (+0%) | 8.58 µs (-0%) | 12.5 µs (+45%) | 9.76 µs (+14%) | 12.6 µs (+47%) | 10.5 µs (+23%) |
| pairwise_f64/1024 | 542 µs (+0%) | 542 µs (-0%) | 786 µs (+45%) | 610 µs (+12%) | 794 µs (+47%) | 662 µs (+22%) |
| pairwise_f64/4096 | 8.72 ms (+0%) | 8.73 ms (+0%) | 12.7 ms (+45%) | 9.82 ms (+13%) | 12.8 ms (+46%) | 10.6 ms (+22%) |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--blocked-l1--accumulate-f32.s`: not found (inlined?)
- `default--blocked-l1--accumulate-f64.s`: not found (inlined?)
- `default--blocked-l1--sweep-f32.s`: fdiv s ×1, fdiv.4s ×2, fsqrt s ×1, fsqrt.4s ×2
- `default--blocked-l1--sweep-f64.s`: fdiv d ×1, fdiv.2d ×2, fsqrt d ×1, fsqrt.2d ×2
- `default--blocked-l16--accumulate-f32.s`: not found (inlined?)
- `default--blocked-l16--accumulate-f64.s`: not found (inlined?)
- `default--blocked-l16--sweep-f32.s`: fdiv s ×1, fdiv.4s ×3, fsqrt s ×1, fsqrt.4s ×3
- `default--blocked-l16--sweep-f64.s`: fdiv d ×1, fdiv.2d ×8, fsqrt d ×1, fsqrt.2d ×8
- `default--blocked-l2--accumulate-f32.s`: not found (inlined?)
- `default--blocked-l2--accumulate-f64.s`: not found (inlined?)
- `default--blocked-l2--sweep-f32.s`: fdiv s ×3, fsqrt s ×3
- `default--blocked-l2--sweep-f64.s`: fdiv d ×1, fdiv.2d ×5, fsqrt d ×1, fsqrt.2d ×5
- `default--blocked-l4--accumulate-f32.s`: not found (inlined?)
- `default--blocked-l4--accumulate-f64.s`: not found (inlined?)
- `default--blocked-l4--sweep-f32.s`: fdiv s ×3, fdiv.4s ×5, fsqrt s ×3, fsqrt.4s ×5
- `default--blocked-l4--sweep-f64.s`: fdiv d ×3, fdiv.2d ×6, fsqrt d ×3, fsqrt.2d ×6
- `default--blocked-l8--accumulate-f32.s`: not found (inlined?)
- `default--blocked-l8--accumulate-f64.s`: not found (inlined?)
- `default--blocked-l8--sweep-f32.s`: fdiv s ×7, fdiv.4s ×10, fsqrt s ×7, fsqrt.4s ×10
- `default--blocked-l8--sweep-f64.s`: fdiv d ×7, fdiv.2d ×12, fsqrt d ×7, fsqrt.2d ×12
- `default--plain--accumulate-f32.s`: not found (inlined?)
- `default--plain--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l1--accumulate-f32.s`: not found (inlined?)
- `default--two-pass-l1--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l1--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--two-pass-l1--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `default--two-pass-l16--accumulate-f32.s`: not found (inlined?)
- `default--two-pass-l16--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l16--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--two-pass-l16--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `default--two-pass-l2--accumulate-f32.s`: not found (inlined?)
- `default--two-pass-l2--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l2--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--two-pass-l2--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `default--two-pass-l4--accumulate-f32.s`: not found (inlined?)
- `default--two-pass-l4--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l4--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--two-pass-l4--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `default--two-pass-l8--accumulate-f32.s`: not found (inlined?)
- `default--two-pass-l8--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l8--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--two-pass-l8--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `native--blocked-l1--accumulate-f32.s`: not found (inlined?)
- `native--blocked-l1--accumulate-f64.s`: not found (inlined?)
- `native--blocked-l1--sweep-f32.s`: fdiv s ×1, fdiv.4s ×2, fsqrt s ×1, fsqrt.4s ×2
- `native--blocked-l1--sweep-f64.s`: fdiv d ×1, fdiv.2d ×2, fsqrt d ×1, fsqrt.2d ×2
- `native--blocked-l16--accumulate-f32.s`: not found (inlined?)
- `native--blocked-l16--accumulate-f64.s`: not found (inlined?)
- `native--blocked-l16--sweep-f32.s`: fdiv s ×1, fdiv.4s ×3, fsqrt s ×1, fsqrt.4s ×3
- `native--blocked-l16--sweep-f64.s`: fdiv d ×1, fdiv.2d ×8, fsqrt d ×1, fsqrt.2d ×8
- `native--blocked-l2--accumulate-f32.s`: not found (inlined?)
- `native--blocked-l2--accumulate-f64.s`: not found (inlined?)
- `native--blocked-l2--sweep-f32.s`: fdiv s ×3, fsqrt s ×3
- `native--blocked-l2--sweep-f64.s`: fdiv d ×1, fdiv.2d ×5, fsqrt d ×1, fsqrt.2d ×5
- `native--blocked-l4--accumulate-f32.s`: not found (inlined?)
- `native--blocked-l4--accumulate-f64.s`: not found (inlined?)
- `native--blocked-l4--sweep-f32.s`: fdiv s ×3, fdiv.4s ×5, fsqrt s ×3, fsqrt.4s ×5
- `native--blocked-l4--sweep-f64.s`: fdiv d ×3, fdiv.2d ×6, fsqrt d ×3, fsqrt.2d ×6
- `native--blocked-l8--accumulate-f32.s`: not found (inlined?)
- `native--blocked-l8--accumulate-f64.s`: not found (inlined?)
- `native--blocked-l8--sweep-f32.s`: fdiv s ×7, fdiv.4s ×10, fsqrt s ×7, fsqrt.4s ×10
- `native--blocked-l8--sweep-f64.s`: fdiv d ×7, fdiv.2d ×12, fsqrt d ×7, fsqrt.2d ×12
- `native--plain--accumulate-f32.s`: not found (inlined?)
- `native--plain--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l1--accumulate-f32.s`: not found (inlined?)
- `native--two-pass-l1--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l1--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--two-pass-l1--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `native--two-pass-l16--accumulate-f32.s`: not found (inlined?)
- `native--two-pass-l16--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l16--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--two-pass-l16--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `native--two-pass-l2--accumulate-f32.s`: not found (inlined?)
- `native--two-pass-l2--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l2--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--two-pass-l2--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `native--two-pass-l4--accumulate-f32.s`: not found (inlined?)
- `native--two-pass-l4--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l4--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--two-pass-l4--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `native--two-pass-l8--accumulate-f32.s`: not found (inlined?)
- `native--two-pass-l8--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l8--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--two-pass-l8--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `wasm--blocked-l1--accumulate-f32.s`: not found (inlined?)
- `wasm--blocked-l1--accumulate-f64.s`: not found (inlined?)
- `wasm--blocked-l1--sweep-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--blocked-l1--sweep-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--blocked-l16--accumulate-f32.s`: not found (inlined?)
- `wasm--blocked-l16--accumulate-f64.s`: not found (inlined?)
- `wasm--blocked-l16--sweep-f32.s`: f32.div ×17, f32.sqrt ×17
- `wasm--blocked-l16--sweep-f64.s`: f64.div ×17, f64.sqrt ×17
- `wasm--blocked-l2--accumulate-f32.s`: not found (inlined?)
- `wasm--blocked-l2--accumulate-f64.s`: not found (inlined?)
- `wasm--blocked-l2--sweep-f32.s`: f32.div ×3, f32.sqrt ×3
- `wasm--blocked-l2--sweep-f64.s`: f64.div ×3, f64.sqrt ×3
- `wasm--blocked-l4--accumulate-f32.s`: not found (inlined?)
- `wasm--blocked-l4--accumulate-f64.s`: not found (inlined?)
- `wasm--blocked-l4--sweep-f32.s`: f32.div ×7, f32.sqrt ×7
- `wasm--blocked-l4--sweep-f64.s`: f64.div ×7, f64.sqrt ×7
- `wasm--blocked-l8--accumulate-f32.s`: not found (inlined?)
- `wasm--blocked-l8--accumulate-f64.s`: not found (inlined?)
- `wasm--blocked-l8--sweep-f32.s`: f32.div ×15, f32.sqrt ×15
- `wasm--blocked-l8--sweep-f64.s`: f64.div ×15, f64.sqrt ×15
- `wasm--plain--accumulate-f32.s`: not found (inlined?)
- `wasm--plain--accumulate-f64.s`: not found (inlined?)
- `wasm--two-pass-l1--accumulate-f32.s`: not found (inlined?)
- `wasm--two-pass-l1--accumulate-f64.s`: not found (inlined?)
- `wasm--two-pass-l1--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--two-pass-l1--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--two-pass-l16--accumulate-f32.s`: not found (inlined?)
- `wasm--two-pass-l16--accumulate-f64.s`: not found (inlined?)
- `wasm--two-pass-l16--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--two-pass-l16--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--two-pass-l2--accumulate-f32.s`: not found (inlined?)
- `wasm--two-pass-l2--accumulate-f64.s`: not found (inlined?)
- `wasm--two-pass-l2--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--two-pass-l2--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--two-pass-l4--accumulate-f32.s`: not found (inlined?)
- `wasm--two-pass-l4--accumulate-f64.s`: not found (inlined?)
- `wasm--two-pass-l4--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--two-pass-l4--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--two-pass-l8--accumulate-f32.s`: not found (inlined?)
- `wasm--two-pass-l8--accumulate-f64.s`: not found (inlined?)
- `wasm--two-pass-l8--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--two-pass-l8--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm-simd128--blocked-l1--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--blocked-l1--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--blocked-l1--sweep-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm-simd128--blocked-l1--sweep-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm-simd128--blocked-l16--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--blocked-l16--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--blocked-l16--sweep-f32.s`: f32.div ×3, f32.sqrt ×3, f32x4.div ×4, f32x4.sqrt ×4
- `wasm-simd128--blocked-l16--sweep-f64.s`: f64.div ×3, f64.sqrt ×3, f64x2.div ×7, f64x2.sqrt ×7
- `wasm-simd128--blocked-l2--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--blocked-l2--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--blocked-l2--sweep-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--blocked-l2--sweep-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--blocked-l4--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--blocked-l4--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--blocked-l4--sweep-f32.s`: f32.div ×3, f32.sqrt ×3, f32x4.div ×2, f32x4.sqrt ×2
- `wasm-simd128--blocked-l4--sweep-f64.s`: f64.div ×3, f64.sqrt ×3, f64x2.div ×2, f64x2.sqrt ×2
- `wasm-simd128--blocked-l8--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--blocked-l8--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--blocked-l8--sweep-f32.s`: f32.div ×7, f32.sqrt ×7, f32x4.div ×3, f32x4.sqrt ×3
- `wasm-simd128--blocked-l8--sweep-f64.s`: f64.div ×7, f64.sqrt ×7, f64x2.div ×4, f64x2.sqrt ×4
- `wasm-simd128--plain--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--plain--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--two-pass-l1--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--two-pass-l1--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--two-pass-l1--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--two-pass-l1--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--two-pass-l16--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--two-pass-l16--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--two-pass-l16--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--two-pass-l16--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--two-pass-l2--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--two-pass-l2--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--two-pass-l2--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--two-pass-l2--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--two-pass-l4--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--two-pass-l4--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--two-pass-l4--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--two-pass-l4--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--two-pass-l8--accumulate-f32.s`: not found (inlined?)
- `wasm-simd128--two-pass-l8--accumulate-f64.s`: not found (inlined?)
- `wasm-simd128--two-pass-l8--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--two-pass-l8--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
