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

Mean time; in brackets, the change against `base` at the same level.

## default (`RUSTFLAGS=''`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 207 ns | 245 ns (+19%) | 319 ns (+55%) | 409 ns (+98%) | 638 ns (+209%) | 1.1 µs (+432%) | 297 ns (+44%) | 533 ns (+158%) | 510 ns (+147%) | 710 ns (+244%) | 1.28 µs (+519%) |
| pairwise_f32/128 | 13.1 µs | 7.78 µs (-40%) | 6.55 µs (-50%) | 6.83 µs (-48%) | 8.75 µs (-33%) | 12.8 µs (-2%) | 14.9 µs (+14%) | 19.1 µs (+46%) | 10.4 µs (-20%) | 10.4 µs (-20%) | 14.7 µs (+13%) |
| pairwise_f32/1024 | 837 µs | 612 µs (-27%) | 431 µs (-48%) | 353 µs (-58%) | 336 µs (-60%) | 362 µs (-57%) | 920 µs (+10%) | 1.11 ms (+32%) | 489 µs (-42%) | 392 µs (-53%) | 429 µs (-49%) |
| pairwise_f32/4096 | 13.4 ms | 10.1 ms (-25%) | 7.1 ms (-47%) | 5.64 ms (-58%) | 5.04 ms (-62%) | 4.92 ms (-63%) | 14.7 ms (+9%) | 17.6 ms (+31%) | 7.48 ms (-44%) | 5.71 ms (-57%) | 5.94 ms (-56%) |
| pairwise_f64/16 | 278 ns | 308 ns (+11%) | 367 ns (+32%) | 465 ns (+67%) | 740 ns (+166%) | 1.17 µs (+320%) | 347 ns (+25%) | 550 ns (+98%) | 585 ns (+110%) | 809 ns (+191%) | 1.34 µs (+382%) |
| pairwise_f64/128 | 18.2 µs | 12.9 µs (-29%) | 12 µs (-34%) | 12.8 µs (-30%) | 14.4 µs (-21%) | 18.2 µs (-0%) | 18.7 µs (+3%) | 15.1 µs (-17%) | 14.2 µs (-22%) | 14.6 µs (-20%) | 19.7 µs (+8%) |
| pairwise_f64/1024 | 1.17 ms | 973 µs (-17%) | 792 µs (-32%) | 730 µs (-38%) | 720 µs (-38%) | 748 µs (-36%) | 1.18 ms (+1%) | 812 µs (-31%) | 707 µs (-40%) | 660 µs (-44%) | 730 µs (-38%) |
| pairwise_f64/4096 | 18.7 ms | 15.9 ms (-15%) | 12.9 ms (-31%) | 11.5 ms (-38%) | 11 ms (-41%) | 11.1 ms (-41%) | 18.9 ms (+1%) | 12.6 ms (-32%) | 10.9 ms (-42%) | 10 ms (-46%) | 10.7 ms (-43%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 198 ns | 306 ns (+54%) | 387 ns (+95%) | 495 ns (+150%) | 713 ns (+260%) | 1.28 µs (+544%) | 291 ns (+47%) | 536 ns (+170%) | 558 ns (+182%) | 717 ns (+262%) | 1.21 µs (+512%) |
| pairwise_f32/128 | 12.8 µs | 6.42 µs (-50%) | 5.32 µs (-58%) | 5.37 µs (-58%) | 7.11 µs (-44%) | 11.5 µs (-10%) | 14.6 µs (+14%) | 18 µs (+41%) | 11.9 µs (-7%) | 11.7 µs (-9%) | 14 µs (+9%) |
| pairwise_f32/1024 | 820 µs | 501 µs (-39%) | 320 µs (-61%) | 234 µs (-72%) | 212 µs (-74%) | 238 µs (-71%) | 906 µs (+11%) | 1.03 ms (+26%) | 571 µs (-30%) | 468 µs (-43%) | 389 µs (-53%) |
| pairwise_f32/4096 | 13.1 ms | 8.34 ms (-37%) | 5.33 ms (-59%) | 3.84 ms (-71%) | 3.19 ms (-76%) | 3.02 ms (-77%) | 14.5 ms (+10%) | 16.4 ms (+25%) | 8.84 ms (-33%) | 7.11 ms (-46%) | 5.09 ms (-61%) |
| pairwise_f64/16 | 276 ns | 300 ns (+9%) | 350 ns (+27%) | 448 ns (+63%) | 741 ns (+169%) | 1.24 µs (+350%) | 343 ns (+25%) | 548 ns (+99%) | 611 ns (+122%) | 778 ns (+182%) | 1.24 µs (+349%) |
| pairwise_f64/128 | 18.1 µs | 9.41 µs (-48%) | 8.03 µs (-56%) | 8.71 µs (-52%) | 10.8 µs (-40%) | 14.5 µs (-20%) | 18.7 µs (+3%) | 13.8 µs (-24%) | 14.7 µs (-19%) | 13.3 µs (-26%) | 16.2 µs (-10%) |
| pairwise_f64/1024 | 1.17 ms | 726 µs (-38%) | 542 µs (-53%) | 467 µs (-60%) | 449 µs (-62%) | 471 µs (-60%) | 1.18 ms (+1%) | 720 µs (-38%) | 755 µs (-35%) | 580 µs (-50%) | 509 µs (-56%) |
| pairwise_f64/4096 | 18.7 ms | 12 ms (-36%) | 8.94 ms (-52%) | 7.46 ms (-60%) | 6.86 ms (-63%) | 6.89 ms (-63%) | 18.8 ms (+1%) | 11.1 ms (-40%) | 11.6 ms (-38%) | 8.72 ms (-53%) | 7.39 ms (-60%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 202 ns | 235 ns (+16%) | 287 ns (+42%) | 434 ns (+115%) | 652 ns (+223%) | 1.23 µs (+509%) | 230 ns (+14%) | 549 ns (+172%) | 551 ns (+173%) | 706 ns (+250%) | 1.13 µs (+460%) |
| pairwise_f32/128 | 12.8 µs | 5.44 µs (-57%) | 4.1 µs (-68%) | 4.6 µs (-64%) | 6.3 µs (-51%) | 10.5 µs (-18%) | 8.47 µs (-34%) | 18.7 µs (+47%) | 11 µs (-14%) | 10.4 µs (-18%) | 12.5 µs (-2%) |
| pairwise_f32/1024 | 820 µs | 425 µs (-48%) | 241 µs (-71%) | 155 µs (-81%) | 131 µs (-84%) | 154 µs (-81%) | 514 µs (-37%) | 1.06 ms (+30%) | 513 µs (-37%) | 415 µs (-49%) | 323 µs (-61%) |
| pairwise_f32/4096 | 13.1 ms | 7.16 ms (-45%) | 4.16 ms (-68%) | 2.64 ms (-80%) | 1.95 ms (-85%) | 1.85 ms (-86%) | 8.16 ms (-38%) | 16.8 ms (+28%) | 7.87 ms (-40%) | 6.16 ms (-53%) | 4.32 ms (-67%) |
| pairwise_f64/16 | 277 ns | 385 ns (+39%) | 440 ns (+59%) | 583 ns (+111%) | 858 ns (+210%) | 1.39 µs (+403%) | 235 ns (-15%) | 542 ns (+96%) | 576 ns (+108%) | 748 ns (+170%) | 1.19 µs (+331%) |
| pairwise_f64/128 | 18.2 µs | 6.68 µs (-63%) | 5.46 µs (-70%) | 6.05 µs (-67%) | 8.32 µs (-54%) | 12.3 µs (-33%) | 10.2 µs (-44%) | 13.3 µs (-27%) | 13.2 µs (-28%) | 12 µs (-34%) | 13.9 µs (-24%) |
| pairwise_f64/1024 | 1.17 ms | 514 µs (-56%) | 334 µs (-71%) | 249 µs (-79%) | 230 µs (-80%) | 259 µs (-78%) | 624 µs (-47%) | 681 µs (-42%) | 670 µs (-43%) | 495 µs (-58%) | 386 µs (-67%) |
| pairwise_f64/4096 | 18.7 ms | 8.55 ms (-54%) | 5.54 ms (-70%) | 4.05 ms (-78%) | 3.39 ms (-82%) | 3.44 ms (-82%) | 9.96 ms (-47%) | 10.7 ms (-43%) | 10.6 ms (-44%) | 7.76 ms (-59%) | 5.37 ms (-71%) |

## wasm (`RUSTFLAGS=''`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 264 ns | 472 ns (+79%) | 576 ns (+118%) | 785 ns (+198%) | 1.16 µs (+341%) | 1.84 µs (+598%) | 537 ns (+104%) | 670 ns (+154%) | 869 ns (+230%) | 1.19 µs (+353%) | 1.8 µs (+583%) |
| pairwise_f32/128 | 16.4 µs | 18.5 µs (+13%) | 18.6 µs (+13%) | 20 µs (+22%) | 22.9 µs (+39%) | 29.6 µs (+81%) | 16.6 µs (+1%) | 18.1 µs (+10%) | 21.4 µs (+30%) | 25.4 µs (+55%) | 34.5 µs (+110%) |
| pairwise_f32/1024 | 1.04 ms | 1.23 ms (+18%) | 1.07 ms (+2%) | 1.02 ms (-2%) | 1.03 ms (-1%) | 1.21 ms (+16%) | 941 µs (-10%) | 968 µs (-7%) | 1.07 ms (+2%) | 1.24 ms (+19%) | 1.52 ms (+45%) |
| pairwise_f32/4096 | 16.7 ms | 19.9 ms (+19%) | 17 ms (+1%) | 15.9 ms (-5%) | 15.7 ms (-6%) | 18.1 ms (+8%) | 14.9 ms (-11%) | 15.2 ms (-9%) | 16.8 ms (+0%) | 18.7 ms (+12%) | 23.1 ms (+38%) |
| pairwise_f64/16 | 321 ns | 526 ns (+64%) | 650 ns (+102%) | 847 ns (+164%) | 1.23 µs (+285%) | 1.93 µs (+502%) | 603 ns (+88%) | 719 ns (+124%) | 890 ns (+177%) | 1.26 µs (+292%) | 1.94 µs (+506%) |
| pairwise_f64/128 | 19.9 µs | 22.6 µs (+14%) | 23.1 µs (+16%) | 24.5 µs (+23%) | 27.4 µs (+38%) | 34.1 µs (+72%) | 20.7 µs (+4%) | 21.7 µs (+9%) | 23.8 µs (+20%) | 28.8 µs (+45%) | 40.1 µs (+102%) |
| pairwise_f64/1024 | 1.27 ms | 1.54 ms (+21%) | 1.38 ms (+8%) | 1.33 ms (+5%) | 1.34 ms (+5%) | 1.52 ms (+20%) | 1.2 ms (-6%) | 1.21 ms (-5%) | 1.27 ms (-1%) | 1.44 ms (+13%) | 1.87 ms (+47%) |
| pairwise_f64/4096 | 20.4 ms | 24.9 ms (+22%) | 22 ms (+8%) | 21 ms (+3%) | 20.8 ms (+2%) | 23.2 ms (+14%) | 19 ms (-7%) | 19 ms (-7%) | 19.6 ms (-4%) | 22.2 ms (+9%) | 28.9 ms (+42%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 257 ns | 427 ns (+66%) | 553 ns (+115%) | 715 ns (+178%) | 1.09 µs (+322%) | 1.74 µs (+578%) | 529 ns (+106%) | 601 ns (+134%) | 772 ns (+200%) | 1.1 µs (+326%) | 1.8 µs (+600%) |
| pairwise_f32/128 | 14.1 µs | 9.32 µs (-34%) | 9.07 µs (-36%) | 9.24 µs (-35%) | 12.1 µs (-14%) | 16.6 µs (+17%) | 16.5 µs (+17%) | 12.3 µs (-13%) | 13.2 µs (-7%) | 13.4 µs (-5%) | 20.9 µs (+48%) |
| pairwise_f32/1024 | 889 µs | 625 µs (-30%) | 494 µs (-44%) | 373 µs (-58%) | 366 µs (-59%) | 395 µs (-56%) | 941 µs (+6%) | 608 µs (-32%) | 583 µs (-34%) | 465 µs (-48%) | 541 µs (-39%) |
| pairwise_f32/4096 | 14.2 ms | 10.1 ms (-28%) | 8.02 ms (-43%) | 5.73 ms (-60%) | 5.13 ms (-64%) | 5.05 ms (-64%) | 14.9 ms (+5%) | 9.41 ms (-34%) | 8.93 ms (-37%) | 6.67 ms (-53%) | 7.38 ms (-48%) |
| pairwise_f64/16 | 294 ns | 520 ns (+77%) | 592 ns (+102%) | 779 ns (+165%) | 1.16 µs (+294%) | 1.91 µs (+551%) | 603 ns (+105%) | 679 ns (+131%) | 860 ns (+193%) | 1.15 µs (+290%) | 2.02 µs (+588%) |
| pairwise_f64/128 | 18.2 µs | 14.4 µs (-21%) | 13.8 µs (-24%) | 15 µs (-18%) | 18.1 µs (-1%) | 23.9 µs (+31%) | 20.7 µs (+14%) | 15 µs (-18%) | 14.9 µs (-18%) | 17.2 µs (-6%) | 26.3 µs (+45%) |
| pairwise_f64/1024 | 1.17 ms | 984 µs (-16%) | 807 µs (-31%) | 753 µs (-35%) | 747 µs (-36%) | 788 µs (-33%) | 1.2 ms (+3%) | 763 µs (-35%) | 659 µs (-44%) | 674 µs (-42%) | 896 µs (-23%) |
| pairwise_f64/4096 | 18.7 ms | 16 ms (-15%) | 13 ms (-31%) | 11.6 ms (-38%) | 11.2 ms (-40%) | 11.3 ms (-40%) | 19 ms (+2%) | 11.8 ms (-37%) | 10.1 ms (-46%) | 10.1 ms (-46%) | 13.1 ms (-30%) |

## v8 (`RUSTFLAGS=''`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 279 ns | 385 ns (+38%) | 518 ns (+86%) | 695 ns (+149%) | 1.05 µs (+277%) | 2.07 µs (+642%) | 356 ns (+28%) | 510 ns (+83%) | 703 ns (+152%) | 1.22 µs (+339%) | 1.95 µs (+599%) |
| pairwise_f32/128 | 16.7 µs | 17.2 µs (+3%) | 17.3 µs (+4%) | 18.7 µs (+12%) | 21.7 µs (+30%) | 29.7 µs (+78%) | 15.5 µs (-7%) | 16.6 µs (-1%) | 19.6 µs (+17%) | 24.5 µs (+47%) | 33.3 µs (+99%) |
| pairwise_f32/1024 | 1.05 ms | 1.23 ms (+17%) | 1.07 ms (+1%) | 1.02 ms (-3%) | 1.03 ms (-2%) | 1.11 ms (+5%) | 947 µs (-10%) | 940 µs (-11%) | 1.04 ms (-1%) | 1.17 ms (+12%) | 1.4 ms (+33%) |
| pairwise_f32/4096 | 16.8 ms | 20 ms (+19%) | 17.1 ms (+2%) | 16.1 ms (-4%) | 15.9 ms (-6%) | 16.5 ms (-2%) | 15.1 ms (-10%) | 14.9 ms (-11%) | 16.5 ms (-2%) | 18.2 ms (+8%) | 21.3 ms (+27%) |
| pairwise_f64/16 | 326 ns | 441 ns (+35%) | 578 ns (+77%) | 760 ns (+133%) | 1.13 µs (+247%) | 2.17 µs (+566%) | 408 ns (+25%) | 531 ns (+63%) | 744 ns (+128%) | 1.3 µs (+298%) | 2.1 µs (+545%) |
| pairwise_f64/128 | 20 µs | 21.4 µs (+7%) | 21.8 µs (+9%) | 23.2 µs (+16%) | 26.5 µs (+32%) | 34.7 µs (+73%) | 19.1 µs (-5%) | 20.2 µs (+1%) | 22.4 µs (+12%) | 27.8 µs (+39%) | 39.6 µs (+98%) |
| pairwise_f64/1024 | 1.27 ms | 1.53 ms (+20%) | 1.36 ms (+7%) | 1.32 ms (+3%) | 1.34 ms (+5%) | 1.43 ms (+12%) | 1.19 ms (-6%) | 1.19 ms (-6%) | 1.23 ms (-3%) | 1.36 ms (+7%) | 1.78 ms (+40%) |
| pairwise_f64/4096 | 20.4 ms | 24.8 ms (+22%) | 21.9 ms (+8%) | 20.9 ms (+2%) | 20.7 ms (+2%) | 21.6 ms (+6%) | 19.1 ms (-7%) | 18.9 ms (-7%) | 19.3 ms (-5%) | 21.2 ms (+4%) | 27.1 ms (+33%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 223 ns | 320 ns (+44%) | 430 ns (+93%) | 597 ns (+168%) | 1.06 µs (+375%) | 1.94 µs (+770%) | 352 ns (+58%) | 415 ns (+86%) | 575 ns (+158%) | 1.1 µs (+393%) | 1.9 µs (+751%) |
| pairwise_f32/128 | 21.6 µs | 8.32 µs (-62%) | 7.43 µs (-66%) | 8.44 µs (-61%) | 11.5 µs (-47%) | 18.6 µs (-14%) | 15.4 µs (-28%) | 10.4 µs (-52%) | 11.4 µs (-47%) | 13.3 µs (-38%) | 20.3 µs (-6%) |
| pairwise_f32/1024 | 1.39 ms | 615 µs (-56%) | 434 µs (-69%) | 354 µs (-75%) | 353 µs (-75%) | 395 µs (-72%) | 947 µs (-32%) | 579 µs (-58%) | 554 µs (-60%) | 442 µs (-68%) | 522 µs (-62%) |
| pairwise_f32/4096 | 22.2 ms | 10.1 ms (-54%) | 7.12 ms (-68%) | 5.66 ms (-75%) | 5.1 ms (-77%) | 5.04 ms (-77%) | 15.1 ms (-32%) | 9.1 ms (-59%) | 8.71 ms (-61%) | 6.58 ms (-70%) | 7.2 ms (-68%) |
| pairwise_f64/16 | 295 ns | 371 ns (+26%) | 483 ns (+64%) | 642 ns (+118%) | 1.05 µs (+257%) | 2.14 µs (+625%) | 392 ns (+33%) | 431 ns (+46%) | 595 ns (+102%) | 1.17 µs (+297%) | 2.15 µs (+629%) |
| pairwise_f64/128 | 18.2 µs | 13.5 µs (-26%) | 12.9 µs (-29%) | 14.2 µs (-22%) | 17.4 µs (-5%) | 25.2 µs (+38%) | 19 µs (+4%) | 12.9 µs (-29%) | 12.8 µs (-30%) | 16.8 µs (-8%) | 28.2 µs (+54%) |
| pairwise_f64/1024 | 1.17 ms | 975 µs (-17%) | 795 µs (-32%) | 731 µs (-37%) | 740 µs (-37%) | 791 µs (-32%) | 1.19 ms (+2%) | 746 µs (-36%) | 644 µs (-45%) | 679 µs (-42%) | 921 µs (-21%) |
| pairwise_f64/4096 | 18.7 ms | 15.9 ms (-15%) | 12.9 ms (-31%) | 11.5 ms (-38%) | 11.1 ms (-41%) | 11.2 ms (-40%) | 19.1 ms (+2%) | 11.7 ms (-37%) | 9.96 ms (-47%) | 9.95 ms (-47%) | 12.9 ms (-31%) |

## base, each level against default

| bench | default | x86-64-v3 | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 207 ns (+0%) | 198 ns (-4%) | 202 ns (-2%) | 264 ns (+28%) | 257 ns (+24%) | 279 ns (+35%) | 223 ns (+8%) |
| pairwise_f32/128 | 13.1 µs (+0%) | 12.8 µs (-2%) | 12.8 µs (-2%) | 16.4 µs (+25%) | 14.1 µs (+8%) | 16.7 µs (+28%) | 21.6 µs (+65%) |
| pairwise_f32/1024 | 837 µs (+0%) | 820 µs (-2%) | 820 µs (-2%) | 1.04 ms (+25%) | 889 µs (+6%) | 1.05 ms (+26%) | 1.39 ms (+66%) |
| pairwise_f32/4096 | 13.4 ms (+0%) | 13.1 ms (-2%) | 13.1 ms (-2%) | 16.7 ms (+25%) | 14.2 ms (+6%) | 16.8 ms (+25%) | 22.2 ms (+66%) |
| pairwise_f64/16 | 278 ns (+0%) | 276 ns (-1%) | 277 ns (-0%) | 321 ns (+15%) | 294 ns (+6%) | 326 ns (+17%) | 295 ns (+6%) |
| pairwise_f64/128 | 18.2 µs (+0%) | 18.1 µs (-0%) | 18.2 µs (+0%) | 19.9 µs (+9%) | 18.2 µs (-0%) | 20 µs (+10%) | 18.2 µs (+0%) |
| pairwise_f64/1024 | 1.17 ms (+0%) | 1.17 ms (-0%) | 1.17 ms (+0%) | 1.27 ms (+9%) | 1.17 ms (-0%) | 1.27 ms (+9%) | 1.17 ms (-0%) |
| pairwise_f64/4096 | 18.7 ms (+0%) | 18.7 ms (-0%) | 18.7 ms (+0%) | 20.4 ms (+9%) | 18.7 ms (-0%) | 20.4 ms (+9%) | 18.7 ms (-0%) |

## perf

From `perf stat` over criterion's `--profile-time` run. GHz is
cycles / task-clock; per pair is criterion's mean time × GHz / pairs,
with pairs = n(n−1)/2. Backend stalls: cycles the core waited on
results or memory. Where each loop spends its cycles, instruction by
instruction: `perf/*.annotate.txt`.

| level | experiment | bench | GHz | IPC | cycles/pair | instr/pair | branch miss | backend stall |
|---|---|---|---|---|---|---|---|---|
| default | base | pairwise_f64/1024 | 5.54 | 3.25 | 12.36 | 40.1 | 0.1% | – |
| default | base | pairwise_f32/1024 | 5.54 | 4.42 | 8.86 | 39.1 | 0.1% | – |
| x86-64-v3 | base | pairwise_f64/1024 | 5.54 | 2.77 | 12.33 | 34.1 | 0.1% | – |
| x86-64-v3 | base | pairwise_f32/1024 | 5.54 | 3.82 | 8.67 | 33.1 | 0.1% | – |
| native | base | pairwise_f64/1024 | 5.54 | 2.67 | 12.38 | 33.1 | 0.1% | – |
| native | base | pairwise_f32/1024 | 5.54 | 3.70 | 8.67 | 32.1 | 0.1% | – |
| default | c-l1 | pairwise_f64/1024 | 5.54 | 2.28 | 10.28 | 23.4 | 1.0% | – |
| default | c-l1 | pairwise_f32/1024 | 5.54 | 2.08 | 6.48 | 13.5 | 1.2% | – |
| x86-64-v3 | c-l1 | pairwise_f64/1024 | 5.54 | 1.75 | 7.67 | 13.4 | 1.3% | – |
| x86-64-v3 | c-l1 | pairwise_f32/1024 | 5.54 | 1.57 | 5.30 | 8.3 | 1.1% | – |
| native | c-l1 | pairwise_f64/1024 | 5.54 | 1.46 | 5.43 | 7.9 | 1.2% | – |
| native | c-l1 | pairwise_f32/1024 | 5.54 | 1.28 | 4.49 | 5.8 | 1.0% | – |
| default | c-l2 | pairwise_f64/1024 | 5.54 | 2.82 | 8.37 | 23.6 | 1.1% | – |
| default | c-l2 | pairwise_f32/1024 | 5.54 | 2.99 | 4.56 | 13.6 | 1.3% | – |
| x86-64-v3 | c-l2 | pairwise_f64/1024 | 5.53 | 2.14 | 5.73 | 12.2 | 1.3% | – |
| x86-64-v3 | c-l2 | pairwise_f32/1024 | 5.54 | 2.40 | 3.38 | 8.1 | 1.1% | – |
| native | c-l2 | pairwise_f64/1024 | 5.52 | 1.92 | 3.52 | 6.8 | 1.0% | – |
| native | c-l2 | pairwise_f32/1024 | 5.54 | 2.19 | 2.55 | 5.6 | 0.7% | – |
| default | c-l4 | pairwise_f64/1024 | 5.54 | 3.16 | 7.71 | 24.4 | 1.0% | – |
| default | c-l4 | pairwise_f32/1024 | 5.54 | 3.52 | 3.73 | 13.1 | 1.6% | – |
| x86-64-v3 | c-l4 | pairwise_f64/1024 | 5.54 | 2.46 | 4.94 | 12.2 | 1.3% | – |
| x86-64-v3 | c-l4 | pairwise_f32/1024 | 5.54 | 2.77 | 2.47 | 6.9 | 1.2% | – |
| native | c-l4 | pairwise_f64/1024 | 5.47 | 2.43 | 2.59 | 6.3 | 0.8% | – |
| native | c-l4 | pairwise_f32/1024 | 5.54 | 2.54 | 1.64 | 4.2 | 0.2% | – |
| default | c-l8 | pairwise_f64/1024 | 5.54 | 3.20 | 7.62 | 24.3 | 0.9% | – |
| default | c-l8 | pairwise_f32/1024 | 5.54 | 3.75 | 3.55 | 13.3 | 1.1% | – |
| x86-64-v3 | c-l8 | pairwise_f64/1024 | 5.54 | 2.61 | 4.74 | 12.4 | 1.2% | – |
| x86-64-v3 | c-l8 | pairwise_f32/1024 | 5.53 | 3.02 | 2.24 | 6.8 | 0.9% | – |
| native | c-l8 | pairwise_f64/1024 | 5.44 | 2.71 | 2.39 | 6.5 | 1.0% | – |
| native | c-l8 | pairwise_f32/1024 | 5.51 | 3.12 | 1.38 | 4.3 | 0.6% | – |
| default | c-l16 | pairwise_f64/1024 | 5.54 | 3.16 | 7.90 | 25.0 | 0.7% | – |
| default | c-l16 | pairwise_f32/1024 | 5.53 | 3.65 | 3.83 | 14.0 | 1.0% | – |
| x86-64-v3 | c-l16 | pairwise_f64/1024 | 5.53 | 2.66 | 4.97 | 13.2 | 0.7% | – |
| x86-64-v3 | c-l16 | pairwise_f32/1024 | 5.54 | 3.19 | 2.51 | 8.0 | 0.7% | – |
| native | c-l16 | pairwise_f64/1024 | 5.44 | 2.73 | 2.69 | 7.3 | 0.9% | – |
| native | c-l16 | pairwise_f32/1024 | 5.52 | 3.05 | 1.63 | 5.0 | 0.7% | – |
| default | d-l1 | pairwise_f64/1024 | 5.54 | 2.99 | 12.52 | 37.4 | 0.1% | – |
| default | d-l1 | pairwise_f32/1024 | 5.54 | 3.84 | 9.72 | 37.4 | 0.1% | – |
| x86-64-v3 | d-l1 | pairwise_f64/1024 | 5.54 | 2.60 | 12.45 | 32.3 | 0.1% | – |
| x86-64-v3 | d-l1 | pairwise_f32/1024 | 5.54 | 3.38 | 9.58 | 32.3 | 0.1% | – |
| native | d-l1 | pairwise_f64/1024 | 5.54 | 2.40 | 6.60 | 15.9 | 0.5% | – |
| native | d-l1 | pairwise_f32/1024 | 5.53 | 3.01 | 5.44 | 16.3 | 0.5% | – |
| default | d-l2 | pairwise_f64/1024 | 5.54 | 2.66 | 8.58 | 22.8 | 0.5% | – |
| default | d-l2 | pairwise_f32/1024 | 5.54 | 3.12 | 11.73 | 36.6 | 0.5% | – |
| x86-64-v3 | d-l2 | pairwise_f64/1024 | 5.54 | 2.27 | 7.61 | 17.3 | 0.7% | – |
| x86-64-v3 | d-l2 | pairwise_f32/1024 | 5.53 | 2.99 | 10.89 | 32.5 | 0.7% | – |
| native | d-l2 | pairwise_f64/1024 | 5.54 | 2.30 | 7.20 | 16.6 | 0.5% | – |
| native | d-l2 | pairwise_f32/1024 | 5.54 | 3.25 | 11.26 | 36.5 | 0.1% | – |
| default | d-l4 | pairwise_f64/1024 | 5.54 | 2.62 | 7.47 | 19.6 | 0.7% | – |
| default | d-l4 | pairwise_f32/1024 | 5.54 | 2.90 | 5.17 | 15.0 | 0.7% | – |
| x86-64-v3 | d-l4 | pairwise_f64/1024 | 5.54 | 2.04 | 7.98 | 16.3 | 0.6% | – |
| x86-64-v3 | d-l4 | pairwise_f32/1024 | 5.52 | 2.47 | 6.02 | 14.8 | 0.6% | – |
| native | d-l4 | pairwise_f64/1024 | 5.54 | 2.13 | 7.08 | 15.1 | 0.6% | – |
| native | d-l4 | pairwise_f32/1024 | 5.54 | 2.63 | 5.43 | 14.3 | 0.6% | – |
| default | d-l8 | pairwise_f64/1024 | 5.54 | 3.06 | 6.98 | 21.4 | 0.8% | – |
| default | d-l8 | pairwise_f32/1024 | 5.54 | 3.24 | 4.15 | 13.4 | 0.8% | – |
| x86-64-v3 | d-l8 | pairwise_f64/1024 | 5.54 | 2.24 | 6.13 | 13.7 | 0.6% | – |
| x86-64-v3 | d-l8 | pairwise_f32/1024 | 5.54 | 2.43 | 4.94 | 12.0 | 0.5% | – |
| native | d-l8 | pairwise_f64/1024 | 5.54 | 2.08 | 5.24 | 10.9 | 0.5% | – |
| native | d-l8 | pairwise_f32/1024 | 5.54 | 2.47 | 4.39 | 10.8 | 0.5% | – |
| default | d-l16 | pairwise_f64/1024 | 5.54 | 3.18 | 7.73 | 24.6 | 0.5% | – |
| default | d-l16 | pairwise_f32/1024 | 5.54 | 3.29 | 4.54 | 14.9 | 0.5% | – |
| x86-64-v3 | d-l16 | pairwise_f64/1024 | 5.54 | 2.51 | 5.39 | 13.5 | 0.5% | – |
| x86-64-v3 | d-l16 | pairwise_f32/1024 | 5.54 | 2.77 | 4.12 | 11.4 | 0.4% | – |
| native | d-l16 | pairwise_f64/1024 | 5.54 | 2.18 | 4.08 | 8.9 | 0.4% | – |
| native | d-l16 | pairwise_f32/1024 | 5.54 | 2.56 | 3.42 | 8.7 | 0.2% | – |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--base--accumulate-f32.s`: divps xmm ×1, divss ×2, sqrtss ×1
- `default--base--accumulate-f64.s`: divpd xmm ×1, divsd ×2, sqrtsd ×1
- `default--c-l1--accumulate-f32.s`: divss ×1
- `default--c-l1--accumulate-f64.s`: divsd ×1
- `default--c-l1--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--c-l1--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--c-l16--accumulate-f32.s`: divss ×1
- `default--c-l16--accumulate-f64.s`: divsd ×1
- `default--c-l16--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--c-l16--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--c-l2--accumulate-f32.s`: divss ×1
- `default--c-l2--accumulate-f64.s`: divsd ×1
- `default--c-l2--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--c-l2--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--c-l4--accumulate-f32.s`: divss ×1
- `default--c-l4--accumulate-f64.s`: divsd ×1
- `default--c-l4--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--c-l4--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--c-l8--accumulate-f32.s`: divss ×1
- `default--c-l8--accumulate-f64.s`: divsd ×1
- `default--c-l8--pass_one-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `default--c-l8--pass_one-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
- `default--d-l1--accumulate-f32.s`: divss ×1
- `default--d-l1--accumulate-f64.s`: divsd ×1
- `default--d-l1--sweep-f32.s`: divss ×1, sqrtss ×1
- `default--d-l1--sweep-f64.s`: divsd ×1, sqrtsd ×1
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
- `native--c-l1--accumulate-f32.s`: divss ×1
- `native--c-l1--accumulate-f64.s`: divsd ×1
- `native--c-l1--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--c-l1--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--c-l16--accumulate-f32.s`: divss ×1
- `native--c-l16--accumulate-f64.s`: divsd ×1
- `native--c-l16--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--c-l16--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--c-l2--accumulate-f32.s`: divss ×1
- `native--c-l2--accumulate-f64.s`: divsd ×1
- `native--c-l2--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--c-l2--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--c-l4--accumulate-f32.s`: divss ×1
- `native--c-l4--accumulate-f64.s`: divsd ×1
- `native--c-l4--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--c-l4--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--c-l8--accumulate-f32.s`: divss ×1
- `native--c-l8--accumulate-f64.s`: divsd ×1
- `native--c-l8--pass_one-f32.s`: divps xmm ×1, divps zmm ×1, divss ×3, sqrtps xmm ×1, sqrtps zmm ×1, sqrtss ×3
- `native--c-l8--pass_one-f64.s`: divpd zmm ×1, divsd ×3, sqrtpd zmm ×1, sqrtsd ×3
- `native--d-l1--accumulate-f32.s`: divss ×1
- `native--d-l1--accumulate-f64.s`: divsd ×1
- `native--d-l1--sweep-f32.s`: divps xmm ×1, divss ×1, sqrtps xmm ×1, sqrtss ×1
- `native--d-l1--sweep-f64.s`: divpd xmm ×1, divsd ×1, sqrtpd xmm ×1, sqrtsd ×1
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
- `wasm--c-l1--accumulate-f32.s`: f32.div ×1
- `wasm--c-l1--accumulate-f64.s`: f64.div ×1
- `wasm--c-l1--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--c-l1--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--c-l16--accumulate-f32.s`: f32.div ×1
- `wasm--c-l16--accumulate-f64.s`: f64.div ×1
- `wasm--c-l16--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--c-l16--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--c-l2--accumulate-f32.s`: f32.div ×1
- `wasm--c-l2--accumulate-f64.s`: f64.div ×1
- `wasm--c-l2--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--c-l2--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--c-l4--accumulate-f32.s`: f32.div ×1
- `wasm--c-l4--accumulate-f64.s`: f64.div ×1
- `wasm--c-l4--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--c-l4--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--c-l8--accumulate-f32.s`: f32.div ×1
- `wasm--c-l8--accumulate-f64.s`: f64.div ×1
- `wasm--c-l8--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--c-l8--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1
- `wasm--d-l1--accumulate-f32.s`: f32.div ×1
- `wasm--d-l1--accumulate-f64.s`: f64.div ×1
- `wasm--d-l1--sweep-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm--d-l1--sweep-f64.s`: f64.div ×1, f64.sqrt ×1
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
- `wasm-simd128--c-l1--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--c-l1--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--c-l1--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--c-l1--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--c-l16--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--c-l16--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--c-l16--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--c-l16--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--c-l2--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--c-l2--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--c-l2--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--c-l2--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--c-l4--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--c-l4--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--c-l4--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--c-l4--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--c-l8--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--c-l8--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--c-l8--pass_one-f32.s`: f32.div ×1, f32.sqrt ×1, f32x4.div ×1, f32x4.sqrt ×1
- `wasm-simd128--c-l8--pass_one-f64.s`: f64.div ×1, f64.sqrt ×1, f64x2.div ×1, f64x2.sqrt ×1
- `wasm-simd128--d-l1--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--d-l1--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--d-l1--sweep-f32.s`: f32.div ×1, f32.sqrt ×1
- `wasm-simd128--d-l1--sweep-f64.s`: f64.div ×1, f64.sqrt ×1
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
- `x86-64-v3--c-l1--accumulate-f32.s`: divss ×1
- `x86-64-v3--c-l1--accumulate-f64.s`: divsd ×1
- `x86-64-v3--c-l1--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--c-l1--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--c-l16--accumulate-f32.s`: divss ×1
- `x86-64-v3--c-l16--accumulate-f64.s`: divsd ×1
- `x86-64-v3--c-l16--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--c-l16--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--c-l2--accumulate-f32.s`: divss ×1
- `x86-64-v3--c-l2--accumulate-f64.s`: divsd ×1
- `x86-64-v3--c-l2--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--c-l2--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--c-l4--accumulate-f32.s`: divss ×1
- `x86-64-v3--c-l4--accumulate-f64.s`: divsd ×1
- `x86-64-v3--c-l4--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--c-l4--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--c-l8--accumulate-f32.s`: divss ×1
- `x86-64-v3--c-l8--accumulate-f64.s`: divsd ×1
- `x86-64-v3--c-l8--pass_one-f32.s`: divps ymm ×1, divss ×1, sqrtps ymm ×1, sqrtss ×1
- `x86-64-v3--c-l8--pass_one-f64.s`: divpd ymm ×1, divsd ×1, sqrtpd ymm ×1, sqrtsd ×1
- `x86-64-v3--d-l1--accumulate-f32.s`: divss ×1
- `x86-64-v3--d-l1--accumulate-f64.s`: divsd ×1
- `x86-64-v3--d-l1--sweep-f32.s`: divss ×1, sqrtss ×1
- `x86-64-v3--d-l1--sweep-f64.s`: divsd ×1, sqrtsd ×1
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
