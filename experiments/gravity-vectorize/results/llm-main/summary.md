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

Mean time; in brackets, the change against `plain` at the same level.

## default (`RUSTFLAGS=''`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 204 ns | 253 ns (+24%) | 264 ns (+29%) | 259 ns (+27%) | 292 ns (+43%) | 415 ns (+103%) | 299 ns (+47%) | 491 ns (+141%) | 425 ns (+108%) | 433 ns (+112%) | 432 ns (+112%) |
| pairwise_f32/128 | 13.1 µs | 7.72 µs (-41%) | 6.08 µs (-54%) | 5.9 µs (-55%) | 5.99 µs (-54%) | 6.44 µs (-51%) | 14.7 µs (+12%) | 18.7 µs (+43%) | 9.79 µs (-25%) | 8.86 µs (-32%) | 9.61 µs (-27%) |
| pairwise_f32/1024 | 838 µs | 613 µs (-27%) | 426 µs (-49%) | 354 µs (-58%) | 327 µs (-61%) | 304 µs (-64%) | 908 µs (+8%) | 1.11 ms (+32%) | 484 µs (-42%) | 375 µs (-55%) | 389 µs (-54%) |
| pairwise_f32/4096 | 13.4 ms | 10.1 ms (-25%) | 7.08 ms (-47%) | 5.67 ms (-58%) | 5.07 ms (-62%) | 4.68 ms (-65%) | 14.5 ms (+8%) | 17.6 ms (+31%) | 7.48 ms (-44%) | 5.65 ms (-58%) | 5.78 ms (-57%) |
| pairwise_f64/16 | 278 ns | 324 ns (+16%) | 325 ns (+17%) | 342 ns (+23%) | 360 ns (+30%) | 460 ns (+66%) | 349 ns (+26%) | 444 ns (+59%) | 466 ns (+67%) | 504 ns (+81%) | 467 ns (+68%) |
| pairwise_f64/128 | 18.2 µs | 13 µs (-29%) | 11.5 µs (-37%) | 11.6 µs (-36%) | 11.5 µs (-37%) | 12.2 µs (-33%) | 18.7 µs (+2%) | 14.3 µs (-22%) | 13 µs (-29%) | 13.3 µs (-27%) | 14.2 µs (-22%) |
| pairwise_f64/1024 | 1.17 ms | 972 µs (-17%) | 788 µs (-33%) | 721 µs (-38%) | 693 µs (-41%) | 689 µs (-41%) | 1.18 ms (+1%) | 805 µs (-31%) | 695 µs (-41%) | 653 µs (-44%) | 690 µs (-41%) |
| pairwise_f64/4096 | 18.7 ms | 15.9 ms (-15%) | 12.9 ms (-31%) | 11.5 ms (-39%) | 10.9 ms (-42%) | 10.9 ms (-42%) | 18.8 ms (+0%) | 12.7 ms (-32%) | 10.9 ms (-42%) | 10.1 ms (-46%) | 10.7 ms (-43%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 202 ns | 307 ns (+52%) | 324 ns (+60%) | 319 ns (+58%) | 487 ns (+141%) | 526 ns (+160%) | 292 ns (+45%) | 493 ns (+144%) | 422 ns (+109%) | 437 ns (+116%) | 444 ns (+120%) |
| pairwise_f32/128 | 12.8 µs | 6.5 µs (-49%) | 4.74 µs (-63%) | 4.13 µs (-68%) | 5.07 µs (-60%) | 5.4 µs (-58%) | 14.6 µs (+14%) | 17.8 µs (+39%) | 9.68 µs (-24%) | 9.06 µs (-29%) | 8.98 µs (-30%) |
| pairwise_f32/1024 | 822 µs | 502 µs (-39%) | 316 µs (-62%) | 225 µs (-73%) | 192 µs (-77%) | 184 µs (-78%) | 910 µs (+11%) | 1.04 ms (+26%) | 476 µs (-42%) | 391 µs (-52%) | 347 µs (-58%) |
| pairwise_f32/4096 | 13.2 ms | 8.34 ms (-37%) | 5.32 ms (-60%) | 3.81 ms (-71%) | 3.1 ms (-76%) | 2.79 ms (-79%) | 14.5 ms (+10%) | 16.4 ms (+25%) | 7.46 ms (-43%) | 6.03 ms (-54%) | 5.2 ms (-61%) |
| pairwise_f64/16 | 276 ns | 299 ns (+8%) | 310 ns (+12%) | 300 ns (+9%) | 466 ns (+69%) | 482 ns (+75%) | 346 ns (+25%) | 456 ns (+65%) | 447 ns (+62%) | 445 ns (+61%) | 458 ns (+66%) |
| pairwise_f64/128 | 18.1 µs | 9.42 µs (-48%) | 7.76 µs (-57%) | 7.29 µs (-60%) | 8.1 µs (-55%) | 8.33 µs (-54%) | 18.7 µs (+3%) | 12.8 µs (-29%) | 12.2 µs (-33%) | 9.65 µs (-47%) | 11.1 µs (-39%) |
| pairwise_f64/1024 | 1.17 ms | 727 µs (-38%) | 540 µs (-54%) | 451 µs (-61%) | 427 µs (-63%) | 423 µs (-64%) | 1.18 ms (+1%) | 706 µs (-40%) | 650 µs (-44%) | 479 µs (-59%) | 473 µs (-59%) |
| pairwise_f64/4096 | 18.7 ms | 11.9 ms (-36%) | 8.93 ms (-52%) | 7.42 ms (-60%) | 6.78 ms (-64%) | 6.67 ms (-64%) | 18.8 ms (+1%) | 11 ms (-41%) | 10.2 ms (-46%) | 7.41 ms (-60%) | 7.26 ms (-61%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 200 ns | 244 ns (+22%) | 235 ns (+17%) | 325 ns (+62%) | 420 ns (+110%) | 464 ns (+132%) | 288 ns (+44%) | 495 ns (+148%) | 404 ns (+102%) | 399 ns (+100%) | 483 ns (+141%) |
| pairwise_f32/128 | 12.8 µs | 5.5 µs (-57%) | 3.74 µs (-71%) | 3.89 µs (-70%) | 4.15 µs (-68%) | 4.44 µs (-65%) | 14.4 µs (+13%) | 18.5 µs (+45%) | 9.12 µs (-29%) | 8.1 µs (-37%) | 8.11 µs (-37%) |
| pairwise_f32/1024 | 821 µs | 423 µs (-48%) | 234 µs (-71%) | 145 µs (-82%) | 107 µs (-87%) | 96.3 µs (-88%) | 895 µs (+9%) | 1.07 ms (+31%) | 446 µs (-46%) | 359 µs (-56%) | 286 µs (-65%) |
| pairwise_f32/4096 | 13.1 ms | 7.17 ms (-45%) | 4.13 ms (-69%) | 2.64 ms (-80%) | 1.89 ms (-86%) | 1.58 ms (-88%) | 14.3 ms (+9%) | 17 ms (+29%) | 6.9 ms (-48%) | 5.46 ms (-58%) | 4.18 ms (-68%) |
| pairwise_f64/16 | 278 ns | 393 ns (+41%) | 407 ns (+46%) | 478 ns (+72%) | 542 ns (+95%) | 586 ns (+111%) | 346 ns (+24%) | 427 ns (+54%) | 436 ns (+57%) | 423 ns (+52%) | 521 ns (+88%) |
| pairwise_f64/128 | 18.3 µs | 6.75 µs (-63%) | 5.07 µs (-72%) | 5.18 µs (-72%) | 5.64 µs (-69%) | 5.91 µs (-68%) | 18.6 µs (+2%) | 12.4 µs (-32%) | 11.6 µs (-36%) | 8.92 µs (-51%) | 8.62 µs (-53%) |
| pairwise_f64/1024 | 1.17 ms | 512 µs (-56%) | 326 µs (-72%) | 240 µs (-79%) | 207 µs (-82%) | 203 µs (-83%) | 1.17 ms (+0%) | 670 µs (-43%) | 624 µs (-47%) | 455 µs (-61%) | 343 µs (-71%) |
| pairwise_f64/4096 | 18.8 ms | 8.54 ms (-54%) | 5.51 ms (-71%) | 4.03 ms (-79%) | 3.32 ms (-82%) | 3.2 ms (-83%) | 18.8 ms (+0%) | 10.6 ms (-44%) | 9.95 ms (-47%) | 7.42 ms (-60%) | 5.24 ms (-72%) |

## wasm (`RUSTFLAGS=''`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 273 ns | 474 ns (+74%) | 446 ns (+64%) | 500 ns (+83%) | 472 ns (+73%) | 597 ns (+119%) | 379 ns (+39%) | 456 ns (+67%) | 465 ns (+70%) | 510 ns (+87%) | 546 ns (+100%) |
| pairwise_f32/128 | 16.6 µs | 18.6 µs (+12%) | 17.4 µs (+5%) | 17.2 µs (+3%) | 17 µs (+2%) | 19.7 µs (+18%) | 15.5 µs (-7%) | 16.5 µs (-1%) | 18.1 µs (+9%) | 20.7 µs (+25%) | 25.7 µs (+54%) |
| pairwise_f32/1024 | 1.06 ms | 1.23 ms (+17%) | 1.06 ms (+0%) | 1.01 ms (-5%) | 986 µs (-7%) | 1.13 ms (+7%) | 933 µs (-12%) | 957 µs (-10%) | 1.09 ms (+3%) | 1.25 ms (+18%) | 1.53 ms (+44%) |
| pairwise_f32/4096 | 16.9 ms | 19.9 ms (+18%) | 16.9 ms (+0%) | 15.9 ms (-6%) | 15.5 ms (-8%) | 17.8 ms (+5%) | 14.8 ms (-12%) | 15.1 ms (-10%) | 17.1 ms (+1%) | 19.8 ms (+17%) | 24.1 ms (+43%) |
| pairwise_f64/16 | 329 ns | 537 ns (+63%) | 500 ns (+52%) | 537 ns (+63%) | 525 ns (+60%) | 746 ns (+127%) | 426 ns (+30%) | 475 ns (+44%) | 524 ns (+59%) | 559 ns (+70%) | 687 ns (+109%) |
| pairwise_f64/128 | 19.9 µs | 22.7 µs (+14%) | 21.7 µs (+9%) | 21.4 µs (+7%) | 21.6 µs (+8%) | 24.5 µs (+23%) | 19.2 µs (-4%) | 19.9 µs (+0%) | 20.9 µs (+5%) | 28.3 µs (+42%) | 31.3 µs (+57%) |
| pairwise_f64/1024 | 1.27 ms | 1.54 ms (+21%) | 1.37 ms (+7%) | 1.31 ms (+3%) | 1.3 ms (+2%) | 1.44 ms (+13%) | 1.19 ms (-7%) | 1.2 ms (-6%) | 1.27 ms (-0%) | 1.47 ms (+15%) | 1.89 ms (+49%) |
| pairwise_f64/4096 | 20.4 ms | 24.9 ms (+22%) | 22 ms (+8%) | 20.9 ms (+3%) | 20.6 ms (+1%) | 22.8 ms (+12%) | 19 ms (-7%) | 19 ms (-7%) | 19.9 ms (-3%) | 23.3 ms (+14%) | 30 ms (+47%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 242 ns | 459 ns (+90%) | 430 ns (+78%) | 455 ns (+88%) | 440 ns (+82%) | 582 ns (+141%) | 372 ns (+54%) | 371 ns (+53%) | 356 ns (+47%) | 422 ns (+75%) | 526 ns (+118%) |
| pairwise_f32/128 | 14.3 µs | 9.37 µs (-35%) | 7.91 µs (-45%) | 7.72 µs (-46%) | 6.93 µs (-52%) | 7.97 µs (-44%) | 15.4 µs (+8%) | 10.7 µs (-25%) | 9.79 µs (-32%) | 8.77 µs (-39%) | 9.87 µs (-31%) |
| pairwise_f32/1024 | 898 µs | 624 µs (-30%) | 485 µs (-46%) | 409 µs (-54%) | 318 µs (-65%) | 310 µs (-65%) | 934 µs (+4%) | 592 µs (-34%) | 563 µs (-37%) | 420 µs (-53%) | 471 µs (-48%) |
| pairwise_f32/4096 | 14.3 ms | 10.1 ms (-29%) | 7.99 ms (-44%) | 6.44 ms (-55%) | 4.94 ms (-66%) | 4.67 ms (-67%) | 14.9 ms (+4%) | 9.36 ms (-35%) | 8.91 ms (-38%) | 6.5 ms (-55%) | 7.3 ms (-49%) |
| pairwise_f64/16 | 304 ns | 481 ns (+58%) | 476 ns (+57%) | 582 ns (+91%) | 536 ns (+76%) | 768 ns (+152%) | 416 ns (+37%) | 365 ns (+20%) | 380 ns (+25%) | 441 ns (+45%) | 642 ns (+111%) |
| pairwise_f64/128 | 18.3 µs | 14.4 µs (-21%) | 12.6 µs (-31%) | 12.8 µs (-30%) | 12.4 µs (-32%) | 13.7 µs (-25%) | 19.1 µs (+5%) | 12.5 µs (-32%) | 11.3 µs (-38%) | 11.8 µs (-35%) | 17.8 µs (-2%) |
| pairwise_f64/1024 | 1.17 ms | 984 µs (-16%) | 798 µs (-32%) | 758 µs (-35%) | 699 µs (-40%) | 701 µs (-40%) | 1.19 ms (+2%) | 749 µs (-36%) | 654 µs (-44%) | 652 µs (-44%) | 934 µs (-20%) |
| pairwise_f64/4096 | 18.7 ms | 15.9 ms (-15%) | 12.9 ms (-31%) | 12.1 ms (-36%) | 11 ms (-41%) | 10.9 ms (-42%) | 19 ms (+1%) | 11.9 ms (-37%) | 10.3 ms (-45%) | 10.3 ms (-45%) | 14.7 ms (-22%) |

## v8 (`RUSTFLAGS=''`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 280 ns | 383 ns (+37%) | 385 ns (+37%) | 388 ns (+38%) | 451 ns (+61%) | 555 ns (+98%) | 358 ns (+28%) | 438 ns (+56%) | 440 ns (+57%) | 519 ns (+85%) | 516 ns (+84%) |
| pairwise_f32/128 | 16.7 µs | 17.2 µs (+3%) | 16 µs (-4%) | 15.9 µs (-5%) | 16.5 µs (-1%) | 17.5 µs (+5%) | 15.3 µs (-8%) | 16 µs (-4%) | 17.1 µs (+2%) | 19.6 µs (+17%) | 24.1 µs (+44%) |
| pairwise_f32/1024 | 1.05 ms | 1.23 ms (+17%) | 1.05 ms (+0%) | 992 µs (-6%) | 989 µs (-6%) | 1.03 ms (-2%) | 936 µs (-11%) | 943 µs (-10%) | 1.02 ms (-3%) | 1.14 ms (+9%) | 1.43 ms (+36%) |
| pairwise_f32/4096 | 16.8 ms | 19.9 ms (+18%) | 16.9 ms (+1%) | 15.9 ms (-6%) | 15.7 ms (-7%) | 16.5 ms (-2%) | 14.9 ms (-11%) | 15.4 ms (-9%) | 16.7 ms (-1%) | 18.3 ms (+9%) | 22.7 ms (+35%) |
| pairwise_f64/16 | 325 ns | 443 ns (+36%) | 443 ns (+36%) | 443 ns (+36%) | 482 ns (+48%) | 699 ns (+115%) | 418 ns (+29%) | 439 ns (+35%) | 482 ns (+48%) | 575 ns (+77%) | 719 ns (+121%) |
| pairwise_f64/128 | 19.9 µs | 21.3 µs (+7%) | 20.6 µs (+3%) | 20.5 µs (+3%) | 20.7 µs (+4%) | 22.9 µs (+15%) | 19 µs (-5%) | 19.3 µs (-3%) | 20 µs (+0%) | 22.9 µs (+15%) | 30.4 µs (+53%) |
| pairwise_f64/1024 | 1.27 ms | 1.53 ms (+20%) | 1.36 ms (+7%) | 1.3 ms (+2%) | 1.29 ms (+1%) | 1.33 ms (+5%) | 1.19 ms (-7%) | 1.19 ms (-7%) | 1.22 ms (-4%) | 1.37 ms (+7%) | 1.81 ms (+42%) |
| pairwise_f64/4096 | 20.4 ms | 24.8 ms (+22%) | 21.9 ms (+7%) | 20.8 ms (+2%) | 20.5 ms (+1%) | 21.3 ms (+4%) | 19 ms (-7%) | 18.9 ms (-7%) | 19.3 ms (-5%) | 21.7 ms (+6%) | 28.7 ms (+41%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | plain | two-pass-l1 | two-pass-l2 | two-pass-l4 | two-pass-l8 | two-pass-l16 | blocked-l1 | blocked-l2 | blocked-l4 | blocked-l8 | blocked-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 229 ns | 316 ns (+38%) | 315 ns (+38%) | 322 ns (+41%) | 344 ns (+51%) | 449 ns (+97%) | 347 ns (+52%) | 328 ns (+43%) | 339 ns (+48%) | 414 ns (+81%) | 507 ns (+122%) |
| pairwise_f32/128 | 21.6 µs | 8.22 µs (-62%) | 6.49 µs (-70%) | 6.4 µs (-70%) | 6.13 µs (-72%) | 6.83 µs (-68%) | 15.3 µs (-29%) | 9.64 µs (-55%) | 9.25 µs (-57%) | 8.48 µs (-61%) | 9.53 µs (-56%) |
| pairwise_f32/1024 | 1.39 ms | 614 µs (-56%) | 429 µs (-69%) | 353 µs (-75%) | 308 µs (-78%) | 303 µs (-78%) | 936 µs (-33%) | 571 µs (-59%) | 538 µs (-61%) | 408 µs (-71%) | 483 µs (-65%) |
| pairwise_f32/4096 | 22.2 ms | 10.1 ms (-54%) | 7.1 ms (-68%) | 5.68 ms (-74%) | 4.91 ms (-78%) | 4.72 ms (-79%) | 14.9 ms (-33%) | 9.05 ms (-59%) | 8.58 ms (-61%) | 6.65 ms (-70%) | 7.06 ms (-68%) |
| pairwise_f64/16 | 301 ns | 372 ns (+24%) | 372 ns (+24%) | 378 ns (+26%) | 409 ns (+36%) | 625 ns (+108%) | 398 ns (+32%) | 334 ns (+11%) | 357 ns (+19%) | 417 ns (+39%) | 674 ns (+124%) |
| pairwise_f64/128 | 18.2 µs | 13.4 µs (-26%) | 11.9 µs (-35%) | 11.9 µs (-35%) | 11.9 µs (-35%) | 13.5 µs (-26%) | 19 µs (+4%) | 12.1 µs (-34%) | 10.8 µs (-41%) | 11.5 µs (-37%) | 17 µs (-7%) |
| pairwise_f64/1024 | 1.17 ms | 974 µs (-17%) | 788 µs (-33%) | 717 µs (-39%) | 689 µs (-41%) | 703 µs (-40%) | 1.19 ms (+2%) | 743 µs (-36%) | 630 µs (-46%) | 640 µs (-45%) | 893 µs (-24%) |
| pairwise_f64/4096 | 18.7 ms | 15.9 ms (-15%) | 12.8 ms (-31%) | 11.5 ms (-39%) | 10.9 ms (-42%) | 10.9 ms (-42%) | 19 ms (+2%) | 11.8 ms (-37%) | 9.96 ms (-47%) | 10.1 ms (-46%) | 13.7 ms (-27%) |

## plain, each level against default

| bench | default | x86-64-v3 | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 204 ns (+0%) | 202 ns (-1%) | 200 ns (-2%) | 273 ns (+34%) | 242 ns (+18%) | 280 ns (+38%) | 229 ns (+12%) |
| pairwise_f32/128 | 13.1 µs (+0%) | 12.8 µs (-2%) | 12.8 µs (-2%) | 16.6 µs (+27%) | 14.3 µs (+9%) | 16.7 µs (+28%) | 21.6 µs (+65%) |
| pairwise_f32/1024 | 838 µs (+0%) | 822 µs (-2%) | 821 µs (-2%) | 1.06 ms (+26%) | 898 µs (+7%) | 1.05 ms (+25%) | 1.39 ms (+66%) |
| pairwise_f32/4096 | 13.4 ms (+0%) | 13.2 ms (-2%) | 13.1 ms (-2%) | 16.9 ms (+26%) | 14.3 ms (+7%) | 16.8 ms (+25%) | 22.2 ms (+66%) |
| pairwise_f64/16 | 278 ns (+0%) | 276 ns (-1%) | 278 ns (-0%) | 329 ns (+18%) | 304 ns (+9%) | 325 ns (+17%) | 301 ns (+8%) |
| pairwise_f64/128 | 18.2 µs (+0%) | 18.1 µs (-0%) | 18.3 µs (+0%) | 19.9 µs (+9%) | 18.3 µs (+0%) | 19.9 µs (+9%) | 18.2 µs (+0%) |
| pairwise_f64/1024 | 1.17 ms (+0%) | 1.17 ms (-0%) | 1.17 ms (+0%) | 1.27 ms (+9%) | 1.17 ms (+0%) | 1.27 ms (+9%) | 1.17 ms (+0%) |
| pairwise_f64/4096 | 18.7 ms (+0%) | 18.7 ms (-0%) | 18.8 ms (+0%) | 20.4 ms (+9%) | 18.7 ms (-0%) | 20.4 ms (+9%) | 18.7 ms (-0%) |

## perf

From `perf stat` over criterion's `--profile-time` run. GHz is
cycles / task-clock; per pair is criterion's mean time × GHz / pairs,
with pairs = n(n−1)/2. Backend stalls: cycles the core waited on
results or memory. Where each loop spends its cycles, instruction by
instruction: `perf/*.annotate.txt`.

| level | experiment | bench | GHz | IPC | cycles/pair | instr/pair | branch miss | backend stall |
|---|---|---|---|---|---|---|---|---|
| default | plain | pairwise_f64/1024 | 5.54 | 3.24 | 12.36 | 40.1 | 0.1% | – |
| default | plain | pairwise_f32/1024 | 5.53 | 4.41 | 8.85 | 39.1 | 0.1% | – |
| x86-64-v3 | plain | pairwise_f64/1024 | 5.53 | 2.76 | 12.33 | 34.1 | 0.1% | – |
| x86-64-v3 | plain | pairwise_f32/1024 | 5.53 | 3.81 | 8.68 | 33.1 | 0.1% | – |
| native | plain | pairwise_f64/1024 | 5.54 | 2.67 | 12.39 | 33.1 | 0.1% | – |
| native | plain | pairwise_f32/1024 | 5.54 | 3.70 | 8.68 | 32.1 | 0.1% | – |
| default | two-pass-l1 | pairwise_f64/1024 | 5.54 | 2.28 | 10.28 | 23.4 | 1.0% | – |
| default | two-pass-l1 | pairwise_f32/1024 | 5.54 | 2.08 | 6.48 | 13.5 | 1.2% | – |
| x86-64-v3 | two-pass-l1 | pairwise_f64/1024 | 5.54 | 1.75 | 7.69 | 13.5 | 1.2% | – |
| x86-64-v3 | two-pass-l1 | pairwise_f32/1024 | 5.54 | 1.57 | 5.30 | 8.3 | 1.1% | – |
| native | two-pass-l1 | pairwise_f64/1024 | 5.54 | 1.46 | 5.41 | 7.9 | 1.2% | – |
| native | two-pass-l1 | pairwise_f32/1024 | 5.54 | 1.28 | 4.47 | 5.7 | 1.1% | – |
| default | two-pass-l2 | pairwise_f64/1024 | 5.54 | 2.82 | 8.33 | 23.5 | 1.0% | – |
| default | two-pass-l2 | pairwise_f32/1024 | 5.54 | 3.00 | 4.51 | 13.5 | 1.4% | – |
| x86-64-v3 | two-pass-l2 | pairwise_f64/1024 | 5.54 | 2.13 | 5.71 | 12.2 | 1.4% | – |
| x86-64-v3 | two-pass-l2 | pairwise_f32/1024 | 5.54 | 2.39 | 3.34 | 8.0 | 1.1% | – |
| native | two-pass-l2 | pairwise_f64/1024 | 5.51 | 1.91 | 3.43 | 6.6 | 1.1% | – |
| native | two-pass-l2 | pairwise_f32/1024 | 5.54 | 2.18 | 2.48 | 5.4 | 0.7% | – |
| default | two-pass-l4 | pairwise_f64/1024 | 5.54 | 3.21 | 7.63 | 24.5 | 1.2% | – |
| default | two-pass-l4 | pairwise_f32/1024 | 5.54 | 3.74 | 3.75 | 14.0 | 1.4% | – |
| x86-64-v3 | two-pass-l4 | pairwise_f64/1024 | 5.54 | 2.44 | 4.77 | 11.7 | 1.5% | – |
| x86-64-v3 | two-pass-l4 | pairwise_f32/1024 | 5.54 | 2.72 | 2.38 | 6.5 | 1.2% | – |
| native | two-pass-l4 | pairwise_f64/1024 | 5.46 | 2.35 | 2.51 | 5.9 | 0.8% | – |
| native | two-pass-l4 | pairwise_f32/1024 | 5.54 | 2.44 | 1.53 | 3.7 | 0.1% | – |
| default | two-pass-l8 | pairwise_f64/1024 | 5.54 | 3.21 | 7.32 | 23.5 | 1.0% | – |
| default | two-pass-l8 | pairwise_f32/1024 | 5.54 | 3.93 | 3.46 | 13.6 | 1.3% | – |
| x86-64-v3 | two-pass-l8 | pairwise_f64/1024 | 5.54 | 2.60 | 4.51 | 11.8 | 1.2% | – |
| x86-64-v3 | two-pass-l8 | pairwise_f32/1024 | 5.54 | 3.10 | 2.03 | 6.3 | 1.1% | – |
| native | two-pass-l8 | pairwise_f64/1024 | 5.43 | 2.64 | 2.14 | 5.7 | 0.8% | – |
| native | two-pass-l8 | pairwise_f32/1024 | 5.51 | 3.12 | 1.12 | 3.5 | 0.1% | – |
| default | two-pass-l16 | pairwise_f64/1024 | 5.54 | 3.21 | 7.28 | 23.3 | 0.9% | – |
| default | two-pass-l16 | pairwise_f32/1024 | 5.54 | 3.83 | 3.22 | 12.3 | 1.3% | – |
| x86-64-v3 | two-pass-l16 | pairwise_f64/1024 | 5.54 | 2.64 | 4.47 | 11.8 | 1.0% | – |
| x86-64-v3 | two-pass-l16 | pairwise_f32/1024 | 5.54 | 3.27 | 1.95 | 6.4 | 0.9% | – |
| native | two-pass-l16 | pairwise_f64/1024 | 5.43 | 2.72 | 2.10 | 5.7 | 0.9% | – |
| native | two-pass-l16 | pairwise_f32/1024 | 5.47 | 3.37 | 1.01 | 3.4 | 0.2% | – |
| default | blocked-l1 | pairwise_f64/1024 | 5.54 | 2.84 | 12.47 | 35.4 | 0.1% | – |
| default | blocked-l1 | pairwise_f32/1024 | 5.54 | 3.68 | 9.61 | 35.4 | 0.1% | – |
| x86-64-v3 | blocked-l1 | pairwise_f64/1024 | 5.54 | 2.52 | 12.46 | 31.4 | 0.1% | – |
| x86-64-v3 | blocked-l1 | pairwise_f32/1024 | 5.54 | 3.26 | 9.61 | 31.4 | 0.1% | – |
| native | blocked-l1 | pairwise_f64/1024 | 5.54 | 2.37 | 12.42 | 29.4 | 0.1% | – |
| native | blocked-l1 | pairwise_f32/1024 | 5.54 | 3.10 | 9.47 | 29.4 | 0.1% | – |
| default | blocked-l2 | pairwise_f64/1024 | 5.54 | 2.72 | 8.52 | 23.1 | 0.5% | – |
| default | blocked-l2 | pairwise_f32/1024 | 5.54 | 3.03 | 11.71 | 35.4 | 0.5% | – |
| x86-64-v3 | blocked-l2 | pairwise_f64/1024 | 5.54 | 2.22 | 7.46 | 16.6 | 0.5% | – |
| x86-64-v3 | blocked-l2 | pairwise_f32/1024 | 5.53 | 2.87 | 10.95 | 31.5 | 0.5% | – |
| native | blocked-l2 | pairwise_f64/1024 | 5.54 | 2.26 | 7.09 | 16.0 | 0.5% | – |
| native | blocked-l2 | pairwise_f32/1024 | 5.54 | 3.12 | 11.37 | 35.5 | 0.1% | – |
| default | blocked-l4 | pairwise_f64/1024 | 5.54 | 2.68 | 7.35 | 19.7 | 0.9% | – |
| default | blocked-l4 | pairwise_f32/1024 | 5.54 | 2.91 | 5.12 | 14.9 | 0.9% | – |
| x86-64-v3 | blocked-l4 | pairwise_f64/1024 | 5.54 | 2.05 | 6.87 | 14.1 | 0.9% | – |
| x86-64-v3 | blocked-l4 | pairwise_f32/1024 | 5.54 | 2.69 | 5.03 | 13.5 | 0.9% | – |
| native | blocked-l4 | pairwise_f64/1024 | 5.54 | 2.06 | 6.60 | 13.6 | 0.9% | – |
| native | blocked-l4 | pairwise_f32/1024 | 5.54 | 2.67 | 4.72 | 12.6 | 0.9% | – |
| default | blocked-l8 | pairwise_f64/1024 | 5.53 | 3.17 | 6.90 | 21.9 | 1.2% | – |
| default | blocked-l8 | pairwise_f32/1024 | 5.54 | 3.14 | 3.96 | 12.4 | 1.0% | – |
| x86-64-v3 | blocked-l8 | pairwise_f64/1024 | 5.54 | 2.32 | 5.06 | 11.7 | 1.0% | – |
| x86-64-v3 | blocked-l8 | pairwise_f32/1024 | 5.53 | 2.62 | 4.13 | 10.8 | 1.0% | – |
| native | blocked-l8 | pairwise_f64/1024 | 5.54 | 1.89 | 4.81 | 9.1 | 1.0% | – |
| native | blocked-l8 | pairwise_f32/1024 | 5.54 | 2.34 | 3.79 | 8.9 | 1.2% | – |
| default | blocked-l16 | pairwise_f64/1024 | 5.54 | 3.10 | 7.30 | 22.6 | 0.6% | – |
| default | blocked-l16 | pairwise_f32/1024 | 5.54 | 3.34 | 4.11 | 13.7 | 0.7% | – |
| x86-64-v3 | blocked-l16 | pairwise_f64/1024 | 5.54 | 2.43 | 5.00 | 12.1 | 0.6% | – |
| x86-64-v3 | blocked-l16 | pairwise_f32/1024 | 5.54 | 2.57 | 3.67 | 9.4 | 0.6% | – |
| native | blocked-l16 | pairwise_f64/1024 | 5.54 | 2.09 | 3.62 | 7.6 | 0.4% | – |
| native | blocked-l16 | pairwise_f32/1024 | 5.51 | 2.44 | 3.01 | 7.3 | 0.4% | – |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--blocked-l1--accumulate-f32.s`: not found (inlined?)
- `default--blocked-l1--accumulate-f64.s`: not found (inlined?)
- `default--blocked-l1--sweep-f32.s`: divss ×1, sqrtss ×1
- `default--blocked-l1--sweep-f64.s`: divsd ×1, sqrtsd ×1
- `default--blocked-l16--accumulate-f32.s`: not found (inlined?)
- `default--blocked-l16--accumulate-f64.s`: not found (inlined?)
- `default--blocked-l16--sweep-f32.s`: divps xmm ×5, divss ×1, sqrtps xmm ×5, sqrtss ×1
- `default--blocked-l16--sweep-f64.s`: divpd xmm ×8, divsd ×1, sqrtpd xmm ×8, sqrtsd ×1
- `default--blocked-l2--accumulate-f32.s`: not found (inlined?)
- `default--blocked-l2--accumulate-f64.s`: not found (inlined?)
- `default--blocked-l2--sweep-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--blocked-l2--sweep-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--blocked-l4--accumulate-f32.s`: not found (inlined?)
- `default--blocked-l4--accumulate-f64.s`: not found (inlined?)
- `default--blocked-l4--sweep-f32.s`: divps xmm ×2, divss ×3, sqrtps xmm ×2, sqrtss ×3
- `default--blocked-l4--sweep-f64.s`: divpd xmm ×2, divsd ×3, sqrtpd xmm ×2, sqrtsd ×3
- `default--blocked-l8--accumulate-f32.s`: not found (inlined?)
- `default--blocked-l8--accumulate-f64.s`: not found (inlined?)
- `default--blocked-l8--sweep-f32.s`: divps xmm ×3, divss ×7, sqrtps xmm ×3, sqrtss ×7
- `default--blocked-l8--sweep-f64.s`: divpd xmm ×4, divsd ×7, sqrtpd xmm ×4, sqrtsd ×7
- `default--plain--accumulate-f32.s`: not found (inlined?)
- `default--plain--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l1--accumulate-f32.s`: not found (inlined?)
- `default--two-pass-l1--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l1--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--two-pass-l1--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--two-pass-l16--accumulate-f32.s`: not found (inlined?)
- `default--two-pass-l16--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l16--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--two-pass-l16--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--two-pass-l2--accumulate-f32.s`: not found (inlined?)
- `default--two-pass-l2--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l2--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--two-pass-l2--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--two-pass-l4--accumulate-f32.s`: not found (inlined?)
- `default--two-pass-l4--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l4--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--two-pass-l4--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--two-pass-l8--accumulate-f32.s`: not found (inlined?)
- `default--two-pass-l8--accumulate-f64.s`: not found (inlined?)
- `default--two-pass-l8--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--two-pass-l8--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `native--blocked-l1--accumulate-f32.s`: not found (inlined?)
- `native--blocked-l1--accumulate-f64.s`: not found (inlined?)
- `native--blocked-l1--sweep-f32.s`: divss ×3, sqrtss ×3
- `native--blocked-l1--sweep-f64.s`: divsd ×3, sqrtsd ×3
- `native--blocked-l16--accumulate-f32.s`: not found (inlined?)
- `native--blocked-l16--accumulate-f64.s`: not found (inlined?)
- `native--blocked-l16--sweep-f32.s`: divps xmm ×3, divps ymm ×1, divss ×3, sqrtps xmm ×3, sqrtps ymm ×1, sqrtss ×3
- `native--blocked-l16--sweep-f64.s`: divpd xmm ×2, divpd ymm ×1, divpd zmm ×1, divsd ×3, sqrtpd xmm ×2, sqrtpd ymm ×1, sqrtpd zmm ×1, sqrtsd ×3
- `native--blocked-l2--accumulate-f32.s`: not found (inlined?)
- `native--blocked-l2--accumulate-f64.s`: not found (inlined?)
- `native--blocked-l2--sweep-f32.s`: divss ×3, sqrtss ×3
- `native--blocked-l2--sweep-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `native--blocked-l4--accumulate-f32.s`: not found (inlined?)
- `native--blocked-l4--accumulate-f64.s`: not found (inlined?)
- `native--blocked-l4--sweep-f32.s`: divps xmm ×2, divss ×3, sqrtps xmm ×2, sqrtss ×3
- `native--blocked-l4--sweep-f64.s`: divpd xmm ×2, divsd ×3, sqrtpd xmm ×2, sqrtsd ×3
- `native--blocked-l8--accumulate-f32.s`: not found (inlined?)
- `native--blocked-l8--accumulate-f64.s`: not found (inlined?)
- `native--blocked-l8--sweep-f32.s`: divps xmm ×3, divss ×7, sqrtps xmm ×3, sqrtss ×7
- `native--blocked-l8--sweep-f64.s`: divpd xmm ×2, divpd ymm ×1, divsd ×7, sqrtpd xmm ×2, sqrtpd ymm ×1, sqrtsd ×7
- `native--plain--accumulate-f32.s`: not found (inlined?)
- `native--plain--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l1--accumulate-f32.s`: not found (inlined?)
- `native--two-pass-l1--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l1--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--two-pass-l1--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--two-pass-l16--accumulate-f32.s`: not found (inlined?)
- `native--two-pass-l16--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l16--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--two-pass-l16--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--two-pass-l2--accumulate-f32.s`: not found (inlined?)
- `native--two-pass-l2--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l2--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--two-pass-l2--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--two-pass-l4--accumulate-f32.s`: not found (inlined?)
- `native--two-pass-l4--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l4--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--two-pass-l4--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--two-pass-l8--accumulate-f32.s`: not found (inlined?)
- `native--two-pass-l8--accumulate-f64.s`: not found (inlined?)
- `native--two-pass-l8--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--two-pass-l8--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
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
- `x86-64-v3--blocked-l1--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--blocked-l1--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--blocked-l1--sweep-f32.s`: divss ×1, sqrtss ×1
- `x86-64-v3--blocked-l1--sweep-f64.s`: divsd ×1, sqrtsd ×1
- `x86-64-v3--blocked-l16--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--blocked-l16--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--blocked-l16--sweep-f32.s`: divps xmm ×3, divps ymm ×1, divss ×1, sqrtps xmm ×3, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--blocked-l16--sweep-f64.s`: divpd xmm ×2, divpd ymm ×3, divsd ×1, sqrtpd xmm ×2, sqrtpd ymm ×3, sqrtsd ×1
- `x86-64-v3--blocked-l2--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--blocked-l2--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--blocked-l2--sweep-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `x86-64-v3--blocked-l2--sweep-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `x86-64-v3--blocked-l4--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--blocked-l4--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--blocked-l4--sweep-f32.s`: divps xmm ×2, divss ×3, sqrtps xmm ×2, sqrtss ×3
- `x86-64-v3--blocked-l4--sweep-f64.s`: divpd xmm ×2, divsd ×3, sqrtpd xmm ×2, sqrtsd ×3
- `x86-64-v3--blocked-l8--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--blocked-l8--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--blocked-l8--sweep-f32.s`: divps xmm ×3, divss ×7, sqrtps xmm ×3, sqrtss ×7
- `x86-64-v3--blocked-l8--sweep-f64.s`: divpd xmm ×2, divpd ymm ×1, divsd ×7, sqrtpd xmm ×2, sqrtpd ymm ×1, sqrtsd ×7
- `x86-64-v3--plain--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--plain--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--two-pass-l1--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--two-pass-l1--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--two-pass-l1--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--two-pass-l1--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--two-pass-l16--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--two-pass-l16--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--two-pass-l16--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--two-pass-l16--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--two-pass-l2--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--two-pass-l2--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--two-pass-l2--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--two-pass-l2--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--two-pass-l4--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--two-pass-l4--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--two-pass-l4--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--two-pass-l4--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--two-pass-l8--accumulate-f32.s`: not found (inlined?)
- `x86-64-v3--two-pass-l8--accumulate-f64.s`: not found (inlined?)
- `x86-64-v3--two-pass-l8--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--two-pass-l8--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
