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

Mean time; in brackets, the change against `base` at the same level.

## default (`RUSTFLAGS=''`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 145 ns | 253 ns (+74%) | 322 ns (+122%) | 452 ns (+211%) | 679 ns (+367%) | 1.05 µs (+619%) | 226 ns (+55%) | 338 ns (+133%) | 381 ns (+162%) | 567 ns (+290%) | 1.07 µs (+633%) |
| pairwise_f32/128 | 8.6 µs | 9.53 µs (+11%) | 6.76 µs (-21%) | 6.72 µs (-22%) | 8.06 µs (-6%) | 11.2 µs (+30%) | 5.85 µs (-32%) | 14.5 µs (+68%) | 8.14 µs (-5%) | 10.1 µs (+17%) | 11.8 µs (+37%) |
| pairwise_f32/1024 | 550 µs | 787 µs (+43%) | 491 µs (-11%) | 360 µs (-34%) | 317 µs (-42%) | 317 µs (-42%) | 339 µs (-38%) | 900 µs (+64%) | 445 µs (-19%) | 516 µs (-6%) | 347 µs (-37%) |
| pairwise_f32/4096 | 8.76 ms | 13.3 ms (+52%) | 8.43 ms (-4%) | 6.05 ms (-31%) | 4.9 ms (-44%) | 4.46 ms (-49%) | 5.38 ms (-39%) | 14.3 ms (+64%) | 6.96 ms (-21%) | 8.02 ms (-8%) | 4.87 ms (-44%) |
| pairwise_f64/16 | 156 ns | 275 ns (+76%) | 331 ns (+112%) | 462 ns (+196%) | 610 ns (+290%) | 1.06 µs (+578%) | 410 ns (+163%) | 303 ns (+94%) | 466 ns (+198%) | 663 ns (+325%) | 1.05 µs (+570%) |
| pairwise_f64/128 | 8.57 µs | 13.2 µs (+53%) | 10.2 µs (+20%) | 10.2 µs (+19%) | 11.5 µs (+35%) | 15.1 µs (+77%) | 8.26 µs (-4%) | 10.4 µs (+21%) | 13.4 µs (+56%) | 13 µs (+52%) | 15 µs (+75%) |
| pairwise_f64/1024 | 542 µs | 1.02 ms (+89%) | 719 µs (+33%) | 602 µs (+11%) | 565 µs (+4%) | 575 µs (+6%) | 492 µs (-9%) | 616 µs (+14%) | 767 µs (+42%) | 630 µs (+16%) | 561 µs (+4%) |
| pairwise_f64/4096 | 8.74 ms | 17.4 ms (+99%) | 12.3 ms (+40%) | 9.96 ms (+14%) | 9.03 ms (+3%) | 8.65 ms (-1%) | 7.94 ms (-9%) | 9.9 ms (+13%) | 12.3 ms (+41%) | 9.9 ms (+13%) | 8.51 ms (-3%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 139 ns | 254 ns (+83%) | 325 ns (+134%) | 447 ns (+221%) | 692 ns (+397%) | 1.06 µs (+663%) | 227 ns (+63%) | 335 ns (+141%) | 383 ns (+175%) | 572 ns (+311%) | 1.07 µs (+665%) |
| pairwise_f32/128 | 8.64 µs | 9.58 µs (+11%) | 6.79 µs (-21%) | 6.57 µs (-24%) | 8.38 µs (-3%) | 11.5 µs (+33%) | 5.86 µs (-32%) | 14.4 µs (+67%) | 8.17 µs (-6%) | 10.1 µs (+17%) | 11.7 µs (+35%) |
| pairwise_f32/1024 | 550 µs | 786 µs (+43%) | 498 µs (-10%) | 361 µs (-34%) | 318 µs (-42%) | 316 µs (-42%) | 339 µs (-38%) | 899 µs (+63%) | 444 µs (-19%) | 515 µs (-6%) | 346 µs (-37%) |
| pairwise_f32/4096 | 8.82 ms | 13.3 ms (+51%) | 8.53 ms (-3%) | 6.04 ms (-31%) | 4.9 ms (-44%) | 4.46 ms (-49%) | 5.38 ms (-39%) | 14.3 ms (+63%) | 6.96 ms (-21%) | 8.01 ms (-9%) | 4.88 ms (-45%) |
| pairwise_f64/16 | 158 ns | 280 ns (+77%) | 342 ns (+116%) | 460 ns (+191%) | 607 ns (+284%) | 959 ns (+507%) | 235 ns (+49%) | 308 ns (+95%) | 470 ns (+198%) | 648 ns (+310%) | 1.03 µs (+551%) |
| pairwise_f64/128 | 8.59 µs | 13.2 µs (+54%) | 11.4 µs (+33%) | 10.5 µs (+22%) | 11.2 µs (+31%) | 14.4 µs (+68%) | 8.25 µs (-4%) | 10.4 µs (+20%) | 13.4 µs (+56%) | 12.8 µs (+49%) | 15.6 µs (+82%) |
| pairwise_f64/1024 | 542 µs | 1.02 ms (+88%) | 757 µs (+40%) | 627 µs (+16%) | 563 µs (+4%) | 565 µs (+4%) | 493 µs (-9%) | 615 µs (+14%) | 765 µs (+41%) | 630 µs (+16%) | 562 µs (+4%) |
| pairwise_f64/4096 | 8.72 ms | 17.3 ms (+98%) | 12.2 ms (+40%) | 10 ms (+15%) | 9.11 ms (+4%) | 8.66 ms (-1%) | 8.01 ms (-8%) | 9.87 ms (+13%) | 12.4 ms (+42%) | 9.94 ms (+14%) | 8.53 ms (-2%) |

## wasm (`RUSTFLAGS=''`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 207 ns | 463 ns (+123%) | 600 ns (+189%) | 798 ns (+285%) | 1.36 µs (+557%) | 2.55 µs (+1127%) | 366 ns (+76%) | 523 ns (+152%) | 855 ns (+312%) | 1.45 µs (+599%) | 2.59 µs (+1146%) |
| pairwise_f32/128 | 12.2 µs | 15.4 µs (+26%) | 15.6 µs (+28%) | 17.3 µs (+42%) | 21.9 µs (+80%) | 31.5 µs (+159%) | 13.1 µs (+7%) | 14 µs (+15%) | 16.9 µs (+39%) | 23.3 µs (+92%) | 37.4 µs (+208%) |
| pairwise_f32/1024 | 768 µs | 1.18 ms (+54%) | 987 µs (+28%) | 890 µs (+16%) | 899 µs (+17%) | 976 µs (+27%) | 784 µs (+2%) | 788 µs (+3%) | 835 µs (+9%) | 975 µs (+27%) | 1.36 ms (+77%) |
| pairwise_f32/4096 | 12.2 ms | 20 ms (+64%) | 16.9 ms (+38%) | 14.4 ms (+17%) | 13.4 ms (+10%) | 13.8 ms (+13%) | 12.5 ms (+2%) | 12.4 ms (+1%) | 13 ms (+6%) | 14.9 ms (+22%) | 20.1 ms (+64%) |
| pairwise_f64/16 | 216 ns | 456 ns (+111%) | 587 ns (+172%) | 810 ns (+275%) | 1.38 µs (+537%) | 2.63 µs (+1115%) | 349 ns (+61%) | 540 ns (+150%) | 848 ns (+292%) | 1.45 µs (+572%) | 2.63 µs (+1117%) |
| pairwise_f64/128 | 12.6 µs | 15.8 µs (+26%) | 16 µs (+27%) | 18.2 µs (+45%) | 22.3 µs (+78%) | 32.9 µs (+162%) | 13.3 µs (+6%) | 15.9 µs (+27%) | 17.1 µs (+36%) | 23.8 µs (+89%) | 38.6 µs (+207%) |
| pairwise_f64/1024 | 784 µs | 1.22 ms (+55%) | 1.02 ms (+31%) | 932 µs (+19%) | 933 µs (+19%) | 1.02 ms (+30%) | 799 µs (+2%) | 919 µs (+17%) | 845 µs (+8%) | 1.01 ms (+29%) | 1.41 ms (+80%) |
| pairwise_f64/4096 | 12.6 ms | 20.7 ms (+65%) | 17 ms (+35%) | 15.1 ms (+20%) | 14.4 ms (+14%) | 14.6 ms (+16%) | 12.8 ms (+2%) | 14.4 ms (+14%) | 13.2 ms (+5%) | 15.9 ms (+26%) | 21.1 ms (+67%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 181 ns | 387 ns (+114%) | 531 ns (+194%) | 762 ns (+322%) | 1.28 µs (+609%) | 2.43 µs (+1245%) | 346 ns (+91%) | 494 ns (+173%) | 733 ns (+305%) | 1.29 µs (+613%) | 2.5 µs (+1285%) |
| pairwise_f32/128 | 10.2 µs | 8.68 µs (-15%) | 7.79 µs (-24%) | 8.84 µs (-13%) | 12.8 µs (+25%) | 22.3 µs (+118%) | 13 µs (+27%) | 9.14 µs (-10%) | 10.7 µs (+6%) | 13.8 µs (+36%) | 24.3 µs (+138%) |
| pairwise_f32/1024 | 641 µs | 698 µs (+9%) | 473 µs (-26%) | 358 µs (-44%) | 364 µs (-43%) | 416 µs (-35%) | 787 µs (+23%) | 453 µs (-29%) | 466 µs (-27%) | 397 µs (-38%) | 495 µs (-23%) |
| pairwise_f32/4096 | 10.2 ms | 12.1 ms (+18%) | 8.17 ms (-20%) | 5.96 ms (-42%) | 5.2 ms (-49%) | 4.89 ms (-52%) | 12.5 ms (+22%) | 7 ms (-31%) | 7.09 ms (-31%) | 5.52 ms (-46%) | 6.14 ms (-40%) |
| pairwise_f64/16 | 173 ns | 393 ns (+127%) | 546 ns (+216%) | 776 ns (+348%) | 1.31 µs (+654%) | 2.51 µs (+1350%) | 342 ns (+98%) | 482 ns (+178%) | 721 ns (+317%) | 1.33 µs (+667%) | 2.62 µs (+1414%) |
| pairwise_f64/128 | 9.71 µs | 12.6 µs (+30%) | 11.6 µs (+19%) | 13.3 µs (+37%) | 17.4 µs (+79%) | 27.8 µs (+186%) | 13.1 µs (+35%) | 10.6 µs (+9%) | 11.7 µs (+21%) | 16.5 µs (+70%) | 28.6 µs (+195%) |
| pairwise_f64/1024 | 607 µs | 938 µs (+54%) | 717 µs (+18%) | 618 µs (+2%) | 603 µs (-1%) | 672 µs (+11%) | 787 µs (+30%) | 530 µs (-13%) | 477 µs (-21%) | 513 µs (-16%) | 707 µs (+16%) |
| pairwise_f64/4096 | 9.77 ms | 16.3 ms (+66%) | 12.1 ms (+24%) | 10.2 ms (+5%) | 9.32 ms (-5%) | 9.21 ms (-6%) | 12.6 ms (+29%) | 8.45 ms (-13%) | 7.42 ms (-24%) | 7.61 ms (-22%) | 10.4 ms (+6%) |

## v8 (`RUSTFLAGS=''`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 212 ns | 433 ns (+105%) | 593 ns (+180%) | 832 ns (+293%) | 1.31 µs (+517%) | 2.37 µs (+1018%) | 354 ns (+67%) | 463 ns (+119%) | 818 ns (+286%) | 1.4 µs (+563%) | 2.37 µs (+1019%) |
| pairwise_f32/128 | 12.4 µs | 16 µs (+29%) | 15.7 µs (+27%) | 18.5 µs (+49%) | 21.5 µs (+74%) | 29.7 µs (+140%) | 12.8 µs (+4%) | 13.5 µs (+9%) | 16.9 µs (+36%) | 23.5 µs (+90%) | 35.7 µs (+188%) |
| pairwise_f32/1024 | 782 µs | 1.21 ms (+55%) | 1 ms (+28%) | 922 µs (+18%) | 895 µs (+14%) | 958 µs (+22%) | 772 µs (-1%) | 776 µs (-1%) | 829 µs (+6%) | 1.01 ms (+29%) | 1.35 ms (+73%) |
| pairwise_f32/4096 | 12.5 ms | 20.7 ms (+66%) | 16.6 ms (+33%) | 15 ms (+20%) | 13.6 ms (+9%) | 13.9 ms (+11%) | 12.3 ms (-1%) | 12.3 ms (-2%) | 12.9 ms (+4%) | 15.5 ms (+24%) | 20.1 ms (+61%) |
| pairwise_f64/16 | 219 ns | 451 ns (+106%) | 612 ns (+179%) | 855 ns (+290%) | 1.34 µs (+513%) | 2.48 µs (+1031%) | 366 ns (+67%) | 509 ns (+132%) | 875 ns (+300%) | 1.5 µs (+584%) | 2.54 µs (+1058%) |
| pairwise_f64/128 | 12.7 µs | 16.2 µs (+28%) | 16 µs (+26%) | 17.9 µs (+42%) | 22 µs (+74%) | 30.9 µs (+144%) | 13.1 µs (+3%) | 13.7 µs (+8%) | 17.5 µs (+39%) | 24.5 µs (+94%) | 37.6 µs (+197%) |
| pairwise_f64/1024 | 801 µs | 1.24 ms (+55%) | 1.03 ms (+29%) | 942 µs (+18%) | 924 µs (+15%) | 994 µs (+24%) | 789 µs (-1%) | 774 µs (-3%) | 850 µs (+6%) | 1.03 ms (+29%) | 1.4 ms (+74%) |
| pairwise_f64/4096 | 12.9 ms | 21.2 ms (+65%) | 17.2 ms (+34%) | 15.5 ms (+21%) | 14.3 ms (+11%) | 14.7 ms (+15%) | 12.6 ms (-2%) | 12.2 ms (-5%) | 13.2 ms (+3%) | 16 ms (+25%) | 20.9 ms (+62%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | c-l1 | c-l2 | c-l4 | c-l8 | c-l16 | d-l1 | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 219 ns | 373 ns (+70%) | 510 ns (+133%) | 739 ns (+237%) | 1.26 µs (+476%) | 2.16 µs (+885%) | 348 ns (+59%) | 420 ns (+92%) | 664 ns (+203%) | 1.23 µs (+460%) | 2.21 µs (+911%) |
| pairwise_f32/128 | 10.5 µs | 8.71 µs (-17%) | 7.36 µs (-30%) | 8.74 µs (-17%) | 12.9 µs (+22%) | 20 µs (+90%) | 12.8 µs (+21%) | 9.3 µs (-12%) | 10.4 µs (-1%) | 13.1 µs (+24%) | 22 µs (+109%) |
| pairwise_f32/1024 | 661 µs | 711 µs (+8%) | 449 µs (-32%) | 343 µs (-48%) | 341 µs (-49%) | 378 µs (-43%) | 772 µs (+17%) | 515 µs (-22%) | 472 µs (-29%) | 383 µs (-42%) | 474 µs (-28%) |
| pairwise_f32/4096 | 10.6 ms | 12.5 ms (+19%) | 7.97 ms (-24%) | 5.79 ms (-45%) | 4.91 ms (-54%) | 4.69 ms (-56%) | 12.3 ms (+17%) | 8.12 ms (-23%) | 7.21 ms (-32%) | 5.33 ms (-49%) | 5.97 ms (-43%) |
| pairwise_f64/16 | 201 ns | 391 ns (+94%) | 524 ns (+160%) | 766 ns (+281%) | 1.29 µs (+540%) | 2.39 µs (+1090%) | 348 ns (+73%) | 424 ns (+111%) | 691 ns (+244%) | 1.3 µs (+546%) | 2.45 µs (+1116%) |
| pairwise_f64/128 | 10.6 µs | 11.7 µs (+11%) | 10.5 µs (-1%) | 12.2 µs (+16%) | 16.5 µs (+56%) | 25.1 µs (+137%) | 13.1 µs (+24%) | 9.7 µs (-8%) | 10.7 µs (+1%) | 15.1 µs (+43%) | 26.9 µs (+154%) |
| pairwise_f64/1024 | 662 µs | 928 µs (+40%) | 672 µs (+1%) | 584 µs (-12%) | 578 µs (-13%) | 628 µs (-5%) | 793 µs (+20%) | 539 µs (-18%) | 452 µs (-32%) | 476 µs (-28%) | 661 µs (-0%) |
| pairwise_f64/4096 | 10.6 ms | 16.2 ms (+52%) | 11.8 ms (+11%) | 9.78 ms (-8%) | 9.01 ms (-15%) | 8.78 ms (-18%) | 12.6 ms (+19%) | 8.67 ms (-19%) | 7 ms (-34%) | 6.96 ms (-35%) | 9.14 ms (-14%) |

## base, each level against default

| bench | default | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|
| pairwise_f32/16 | 145 ns (+0%) | 139 ns (-4%) | 207 ns (+43%) | 181 ns (+24%) | 212 ns (+46%) | 219 ns (+51%) |
| pairwise_f32/128 | 8.6 µs (+0%) | 8.64 µs (+1%) | 12.2 µs (+42%) | 10.2 µs (+18%) | 12.4 µs (+44%) | 10.5 µs (+23%) |
| pairwise_f32/1024 | 550 µs (+0%) | 550 µs (+0%) | 768 µs (+40%) | 641 µs (+17%) | 782 µs (+42%) | 661 µs (+20%) |
| pairwise_f32/4096 | 8.76 ms (+0%) | 8.82 ms (+1%) | 12.2 ms (+40%) | 10.2 ms (+16%) | 12.5 ms (+42%) | 10.6 ms (+20%) |
| pairwise_f64/16 | 156 ns (+0%) | 158 ns (+1%) | 216 ns (+38%) | 173 ns (+11%) | 219 ns (+40%) | 201 ns (+29%) |
| pairwise_f64/128 | 8.57 µs (+0%) | 8.59 µs (+0%) | 12.6 µs (+47%) | 9.71 µs (+13%) | 12.7 µs (+48%) | 10.6 µs (+23%) |
| pairwise_f64/1024 | 542 µs (+0%) | 542 µs (+0%) | 784 µs (+45%) | 607 µs (+12%) | 801 µs (+48%) | 662 µs (+22%) |
| pairwise_f64/4096 | 8.74 ms (+0%) | 8.72 ms (-0%) | 12.6 ms (+44%) | 9.77 ms (+12%) | 12.9 ms (+47%) | 10.6 ms (+22%) |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--base--accumulate-f32.s`: fdiv s ×2, fdiv.4s ×1, fsqrt s ×1
- `default--base--accumulate-f64.s`: fdiv d ×2, fdiv.2d ×1, fsqrt d ×1
- `default--c-l1--accumulate-f32.s`: fdiv s ×1
- `default--c-l1--accumulate-f64.s`: fdiv d ×1
- `default--c-l1--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--c-l1--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `default--c-l16--accumulate-f32.s`: fdiv s ×1
- `default--c-l16--accumulate-f64.s`: fdiv d ×1
- `default--c-l16--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--c-l16--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `default--c-l2--accumulate-f32.s`: fdiv s ×1
- `default--c-l2--accumulate-f64.s`: fdiv d ×1
- `default--c-l2--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--c-l2--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `default--c-l4--accumulate-f32.s`: fdiv s ×1
- `default--c-l4--accumulate-f64.s`: fdiv d ×1
- `default--c-l4--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--c-l4--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `default--c-l8--accumulate-f32.s`: fdiv s ×1
- `default--c-l8--accumulate-f64.s`: fdiv d ×1
- `default--c-l8--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--c-l8--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `default--d-l1--accumulate-f32.s`: fdiv s ×1
- `default--d-l1--accumulate-f64.s`: fdiv d ×1
- `default--d-l1--sweep-f32.s`: fdiv s ×1, fdiv.4s ×2, fsqrt s ×1, fsqrt.4s ×2
- `default--d-l1--sweep-f64.s`: fdiv d ×1, fdiv.2d ×2, fsqrt d ×1, fsqrt.2d ×2
- `default--d-l16--accumulate-f32.s`: fdiv s ×1
- `default--d-l16--accumulate-f64.s`: fdiv d ×1
- `default--d-l16--sweep-f32.s`: fdiv s ×1, fdiv.4s ×3, fsqrt s ×1, fsqrt.4s ×3
- `default--d-l16--sweep-f64.s`: fdiv d ×1, fdiv.2d ×8, fsqrt d ×1, fsqrt.2d ×8
- `default--d-l2--accumulate-f32.s`: fdiv s ×1
- `default--d-l2--accumulate-f64.s`: fdiv d ×1
- `default--d-l2--sweep-f32.s`: fdiv s ×3, fsqrt s ×3
- `default--d-l2--sweep-f64.s`: fdiv d ×1, fdiv.2d ×5, fsqrt d ×1, fsqrt.2d ×5
- `default--d-l4--accumulate-f32.s`: fdiv s ×1
- `default--d-l4--accumulate-f64.s`: fdiv d ×1
- `default--d-l4--sweep-f32.s`: fdiv s ×3, fdiv.4s ×5, fsqrt s ×3, fsqrt.4s ×5
- `default--d-l4--sweep-f64.s`: fdiv d ×3, fdiv.2d ×6, fsqrt d ×3, fsqrt.2d ×6
- `default--d-l8--accumulate-f32.s`: fdiv s ×1
- `default--d-l8--accumulate-f64.s`: fdiv d ×1
- `default--d-l8--sweep-f32.s`: fdiv s ×7, fdiv.4s ×10, fsqrt s ×7, fsqrt.4s ×10
- `default--d-l8--sweep-f64.s`: fdiv d ×7, fdiv.2d ×12, fsqrt d ×7, fsqrt.2d ×12
- `native--base--accumulate-f32.s`: fdiv s ×2, fdiv.4s ×1, fsqrt s ×1
- `native--base--accumulate-f64.s`: fdiv d ×2, fdiv.2d ×1, fsqrt d ×1
- `native--c-l1--accumulate-f32.s`: fdiv s ×1
- `native--c-l1--accumulate-f64.s`: fdiv d ×1
- `native--c-l1--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--c-l1--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `native--c-l16--accumulate-f32.s`: fdiv s ×1
- `native--c-l16--accumulate-f64.s`: fdiv d ×1
- `native--c-l16--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--c-l16--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `native--c-l2--accumulate-f32.s`: fdiv s ×1
- `native--c-l2--accumulate-f64.s`: fdiv d ×1
- `native--c-l2--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--c-l2--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `native--c-l4--accumulate-f32.s`: fdiv s ×1
- `native--c-l4--accumulate-f64.s`: fdiv d ×1
- `native--c-l4--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--c-l4--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `native--c-l8--accumulate-f32.s`: fdiv s ×1
- `native--c-l8--accumulate-f64.s`: fdiv d ×1
- `native--c-l8--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--c-l8--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
- `native--d-l1--accumulate-f32.s`: fdiv s ×1
- `native--d-l1--accumulate-f64.s`: fdiv d ×1
- `native--d-l1--sweep-f32.s`: fdiv s ×1, fdiv.4s ×2, fsqrt s ×1, fsqrt.4s ×2
- `native--d-l1--sweep-f64.s`: fdiv d ×1, fdiv.2d ×2, fsqrt d ×1, fsqrt.2d ×2
- `native--d-l16--accumulate-f32.s`: fdiv s ×1
- `native--d-l16--accumulate-f64.s`: fdiv d ×1
- `native--d-l16--sweep-f32.s`: fdiv s ×1, fdiv.4s ×3, fsqrt s ×1, fsqrt.4s ×3
- `native--d-l16--sweep-f64.s`: fdiv d ×1, fdiv.2d ×8, fsqrt d ×1, fsqrt.2d ×8
- `native--d-l2--accumulate-f32.s`: fdiv s ×1
- `native--d-l2--accumulate-f64.s`: fdiv d ×1
- `native--d-l2--sweep-f32.s`: fdiv s ×3, fsqrt s ×3
- `native--d-l2--sweep-f64.s`: fdiv d ×1, fdiv.2d ×5, fsqrt d ×1, fsqrt.2d ×5
- `native--d-l4--accumulate-f32.s`: fdiv s ×1
- `native--d-l4--accumulate-f64.s`: fdiv d ×1
- `native--d-l4--sweep-f32.s`: fdiv s ×3, fdiv.4s ×5, fsqrt s ×3, fsqrt.4s ×5
- `native--d-l4--sweep-f64.s`: fdiv d ×3, fdiv.2d ×6, fsqrt d ×3, fsqrt.2d ×6
- `native--d-l8--accumulate-f32.s`: fdiv s ×1
- `native--d-l8--accumulate-f64.s`: fdiv d ×1
- `native--d-l8--sweep-f32.s`: fdiv s ×7, fdiv.4s ×10, fsqrt s ×7, fsqrt.4s ×10
- `native--d-l8--sweep-f64.s`: fdiv d ×7, fdiv.2d ×12, fsqrt d ×7, fsqrt.2d ×12
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
