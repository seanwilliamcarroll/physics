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

Time as criterion printed it (its point estimate; rebuilt from the run's log with `--from-log`); in brackets, the change against `base` at the same level.

## default (`RUSTFLAGS=''`)

| bench | base | b-select | c-lanes | d-soa | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 145 ns | 135 ns (-7%) | 241 ns (+66%) | 220 ns (+52%) | 336 ns (+132%) | 382 ns (+163%) | 574 ns (+296%) | 1.07 µs (+638%) |
| pairwise_f32/128 | 8.62 µs | 6.66 µs (-23%) | 5.33 µs (-38%) | 7.46 µs (-13%) | 14.4 µs (+67%) | 8.15 µs (-5%) | 10.1 µs (+18%) | 11.7 µs (+36%) |
| pairwise_f32/1024 | 549 µs | 414 µs (-25%) | 359 µs (-35%) | 436 µs (-21%) | 897 µs (+63%) | 442 µs (-19%) | 515 µs (-6%) | 346 µs (-37%) |
| pairwise_f32/4096 | 8.77 ms | 6.6 ms (-25%) | 6.19 ms (-29%) | 6.91 ms (-21%) | 14.3 ms (+63%) | 6.94 ms (-21%) | 8.06 ms (-8%) | 4.87 ms (-44%) |
| pairwise_f64/16 | 156 ns | 204 ns (+30%) | 274 ns (+76%) | 315 ns (+102%) | 305 ns (+96%) | 463 ns (+197%) | 661 ns (+323%) | 1.09 µs (+601%) |
| pairwise_f64/128 | 8.56 µs | 11 µs (+29%) | 9.18 µs (+7%) | 12.6 µs (+47%) | 10.3 µs (+21%) | 13.4 µs (+57%) | 13 µs (+51%) | 15.4 µs (+80%) |
| pairwise_f64/1024 | 541 µs | 702 µs (+30%) | 618 µs (+14%) | 758 µs (+40%) | 616 µs (+14%) | 763 µs (+41%) | 633 µs (+17%) | 560 µs (+4%) |
| pairwise_f64/4096 | 8.85 ms | 11.3 ms (+27%) | 10.2 ms (+15%) | 12.3 ms (+39%) | 9.85 ms (+11%) | 12.3 ms (+39%) | 9.89 ms (+12%) | 8.51 ms (-4%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | base | b-select | c-lanes | d-soa | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 160 ns | 151 ns (-5%) | 245 ns (+53%) | 225 ns (+41%) | 336 ns (+110%) | 381 ns (+138%) | 570 ns (+256%) | 1.07 µs (+567%) |
| pairwise_f32/128 | 8.65 µs | 6.66 µs (-23%) | 5.17 µs (-40%) | 7.46 µs (-14%) | 14.4 µs (+67%) | 8.09 µs (-6%) | 10.3 µs (+19%) | 11.6 µs (+35%) |
| pairwise_f32/1024 | 550 µs | 414 µs (-25%) | 359 µs (-35%) | 436 µs (-21%) | 897 µs (+63%) | 442 µs (-20%) | 516 µs (-6%) | 346 µs (-37%) |
| pairwise_f32/4096 | 8.78 ms | 6.6 ms (-25%) | 6.21 ms (-29%) | 6.92 ms (-21%) | 14.3 ms (+63%) | 6.94 ms (-21%) | 8.01 ms (-9%) | 4.87 ms (-45%) |
| pairwise_f64/16 | 158 ns | 201 ns (+27%) | 275 ns (+74%) | 318 ns (+101%) | 307 ns (+94%) | 468 ns (+196%) | 642 ns (+305%) | 1.03 µs (+549%) |
| pairwise_f64/128 | 8.58 µs | 11 µs (+28%) | 9.06 µs (+6%) | 12.7 µs (+48%) | 10.3 µs (+20%) | 13.4 µs (+56%) | 12.8 µs (+49%) | 14.9 µs (+73%) |
| pairwise_f64/1024 | 542 µs | 701 µs (+29%) | 624 µs (+15%) | 756 µs (+40%) | 613 µs (+13%) | 763 µs (+41%) | 630 µs (+16%) | 559 µs (+3%) |
| pairwise_f64/4096 | 8.72 ms | 11.3 ms (+29%) | 10.3 ms (+18%) | 12.3 ms (+41%) | 9.85 ms (+13%) | 12.3 ms (+41%) | 9.92 ms (+14%) | 8.53 ms (-2%) |

## wasm (`RUSTFLAGS=''`)

| bench | base | b-select | c-lanes | d-soa | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 207 ns | 218 ns (+5%) | 437 ns (+111%) | 430 ns (+108%) | 521 ns (+152%) | 853 ns (+312%) | 1.45 µs (+600%) | 2.58 µs (+1148%) |
| pairwise_f32/128 | 12.2 µs | 13.7 µs (+13%) | 14.1 µs (+16%) | 13.6 µs (+12%) | 14 µs (+15%) | 16.8 µs (+38%) | 23.3 µs (+91%) | 37.5 µs (+208%) |
| pairwise_f32/1024 | 767 µs | 876 µs (+14%) | 878 µs (+14%) | 808 µs (+5%) | 786 µs (+2%) | 833 µs (+9%) | 976 µs (+27%) | 1.36 ms (+78%) |
| pairwise_f32/4096 | 12.2 ms | 14 ms (+14%) | 14.1 ms (+15%) | 12.8 ms (+5%) | 12.3 ms (+1%) | 12.9 ms (+6%) | 14.9 ms (+22%) | 20.1 ms (+64%) |
| pairwise_f64/16 | 217 ns | 227 ns (+5%) | 437 ns (+102%) | 431 ns (+99%) | 536 ns (+147%) | 839 ns (+288%) | 1.45 µs (+569%) | 2.62 µs (+1112%) |
| pairwise_f64/128 | 12.4 µs | 13.9 µs (+12%) | 15 µs (+21%) | 13.8 µs (+11%) | 15.9 µs (+28%) | 17 µs (+37%) | 23.8 µs (+92%) | 38.5 µs (+210%) |
| pairwise_f64/1024 | 783 µs | 909 µs (+16%) | 921 µs (+18%) | 813 µs (+4%) | 918 µs (+17%) | 844 µs (+8%) | 1.01 ms (+29%) | 1.41 ms (+80%) |
| pairwise_f64/4096 | 12.6 ms | 14.5 ms (+15%) | 15 ms (+19%) | 13 ms (+4%) | 14.4 ms (+14%) | 13.2 ms (+5%) | 15.9 ms (+26%) | 21.1 ms (+67%) |

## wasm-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | b-select | c-lanes | d-soa | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 180 ns | 208 ns (+16%) | 380 ns (+111%) | 331 ns (+84%) | 492 ns (+172%) | 732 ns (+306%) | 1.29 µs (+614%) | 2.5 µs (+1287%) |
| pairwise_f32/128 | 10.2 µs | 12.8 µs (+26%) | 6.35 µs (-37%) | 7.68 µs (-24%) | 9.11 µs (-10%) | 10.7 µs (+5%) | 13.8 µs (+36%) | 24.2 µs (+139%) |
| pairwise_f32/1024 | 640 µs | 812 µs (+27%) | 372 µs (-42%) | 437 µs (-32%) | 452 µs (-29%) | 465 µs (-27%) | 397 µs (-38%) | 494 µs (-23%) |
| pairwise_f32/4096 | 10.2 ms | 13 ms (+27%) | 6.27 ms (-39%) | 6.94 ms (-32%) | 7 ms (-31%) | 7.07 ms (-31%) | 5.52 ms (-46%) | 6.11 ms (-40%) |
| pairwise_f64/16 | 174 ns | 210 ns (+21%) | 400 ns (+130%) | 349 ns (+101%) | 478 ns (+175%) | 719 ns (+313%) | 1.32 µs (+661%) | 2.62 µs (+1403%) |
| pairwise_f64/128 | 9.71 µs | 12.8 µs (+32%) | 10.6 µs (+9%) | 8.61 µs (-11%) | 10.5 µs (+9%) | 11.7 µs (+21%) | 17.6 µs (+81%) | 28.5 µs (+194%) |
| pairwise_f64/1024 | 607 µs | 809 µs (+33%) | 619 µs (+2%) | 452 µs (-26%) | 529 µs (-13%) | 476 µs (-22%) | 512 µs (-16%) | 706 µs (+16%) |
| pairwise_f64/4096 | 9.77 ms | 13 ms (+33%) | 10.3 ms (+6%) | 7.33 ms (-25%) | 8.45 ms (-14%) | 7.43 ms (-24%) | 7.64 ms (-22%) | 10.4 ms (+6%) |

## v8 (`RUSTFLAGS=''`)

| bench | base | b-select | c-lanes | d-soa | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 211 ns | 225 ns (+6%) | 449 ns (+113%) | 403 ns (+91%) | 460 ns (+118%) | 807 ns (+282%) | 1.4 µs (+562%) | 2.37 µs (+1020%) |
| pairwise_f32/128 | 12.4 µs | 13.8 µs (+12%) | 14.7 µs (+19%) | 13.8 µs (+11%) | 13.4 µs (+9%) | 16.8 µs (+36%) | 23.4 µs (+89%) | 35.7 µs (+188%) |
| pairwise_f32/1024 | 782 µs | 882 µs (+13%) | 893 µs (+14%) | 804 µs (+3%) | 774 µs (-1%) | 829 µs (+6%) | 1.01 ms (+29%) | 1.35 ms (+73%) |
| pairwise_f32/4096 | 12.5 ms | 14.2 ms (+14%) | 14.5 ms (+16%) | 12.8 ms (+3%) | 12.3 ms (-2%) | 12.9 ms (+3%) | 15.6 ms (+25%) | 20.1 ms (+61%) |
| pairwise_f64/16 | 219 ns | 233 ns (+6%) | 462 ns (+111%) | 414 ns (+89%) | 506 ns (+131%) | 868 ns (+296%) | 1.49 µs (+580%) | 2.5 µs (+1043%) |
| pairwise_f64/128 | 12.6 µs | 14 µs (+11%) | 15 µs (+19%) | 14 µs (+11%) | 13.7 µs (+8%) | 17.4 µs (+38%) | 24.5 µs (+94%) | 37.4 µs (+196%) |
| pairwise_f64/1024 | 802 µs | 896 µs (+12%) | 926 µs (+15%) | 822 µs (+3%) | 772 µs (-4%) | 847 µs (+6%) | 1.04 ms (+30%) | 1.4 ms (+75%) |
| pairwise_f64/4096 | 12.9 ms | 14.3 ms (+11%) | 15.1 ms (+17%) | 13.1 ms (+2%) | 12.2 ms (-5%) | 13.2 ms (+3%) | 16 ms (+25%) | 20.9 ms (+62%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | b-select | c-lanes | d-soa | d-l2 | d-l4 | d-l8 | d-l16 |
|---|---|---|---|---|---|---|---|---|
| pairwise_f32/16 | 220 ns | 208 ns (-6%) | 378 ns (+72%) | 322 ns (+46%) | 419 ns (+90%) | 660 ns (+200%) | 1.23 µs (+458%) | 2.22 µs (+908%) |
| pairwise_f32/128 | 10.5 µs | 12.7 µs (+20%) | 6.25 µs (-41%) | 8.01 µs (-24%) | 9.28 µs (-12%) | 10.4 µs (-1%) | 13.1 µs (+24%) | 22.1 µs (+109%) |
| pairwise_f32/1024 | 661 µs | 811 µs (+23%) | 357 µs (-46%) | 451 µs (-32%) | 513 µs (-22%) | 471 µs (-29%) | 382 µs (-42%) | 476 µs (-28%) |
| pairwise_f32/4096 | 10.6 ms | 13 ms (+23%) | 5.93 ms (-44%) | 7.12 ms (-33%) | 8.09 ms (-23%) | 7.19 ms (-32%) | 5.33 ms (-49%) | 5.98 ms (-43%) |
| pairwise_f64/16 | 201 ns | 213 ns (+6%) | 397 ns (+97%) | 325 ns (+62%) | 423 ns (+111%) | 690 ns (+244%) | 1.32 µs (+555%) | 2.44 µs (+1117%) |
| pairwise_f64/128 | 10.5 µs | 12.8 µs (+22%) | 9.46 µs (-10%) | 7.74 µs (-27%) | 9.67 µs (-8%) | 10.7 µs (+1%) | 15.2 µs (+44%) | 26.8 µs (+154%) |
| pairwise_f64/1024 | 662 µs | 820 µs (+24%) | 572 µs (-14%) | 423 µs (-36%) | 538 µs (-19%) | 451 µs (-32%) | 476 µs (-28%) | 660 µs (-0%) |
| pairwise_f64/4096 | 10.6 ms | 13.2 ms (+24%) | 9.66 ms (-9%) | 7.06 ms (-34%) | 8.65 ms (-19%) | 6.98 ms (-34%) | 6.99 ms (-34%) | 9.14 ms (-14%) |

## base, each level against default

| bench | default | native | wasm | wasm-simd128 | v8 | v8-simd128 |
|---|---|---|---|---|---|---|
| pairwise_f32/16 | 145 ns (+0%) | 160 ns (+10%) | 207 ns (+43%) | 180 ns (+25%) | 211 ns (+46%) | 220 ns (+52%) |
| pairwise_f32/128 | 8.62 µs (+0%) | 8.65 µs (+0%) | 12.2 µs (+41%) | 10.2 µs (+18%) | 12.4 µs (+43%) | 10.5 µs (+22%) |
| pairwise_f32/1024 | 549 µs (+0%) | 550 µs (+0%) | 767 µs (+40%) | 640 µs (+17%) | 782 µs (+43%) | 661 µs (+20%) |
| pairwise_f32/4096 | 8.77 ms (+0%) | 8.78 ms (+0%) | 12.2 ms (+40%) | 10.2 ms (+16%) | 12.5 ms (+42%) | 10.6 ms (+20%) |
| pairwise_f64/16 | 156 ns (+0%) | 158 ns (+2%) | 217 ns (+39%) | 174 ns (+11%) | 219 ns (+40%) | 201 ns (+29%) |
| pairwise_f64/128 | 8.56 µs (+0%) | 8.58 µs (+0%) | 12.4 µs (+45%) | 9.71 µs (+13%) | 12.6 µs (+48%) | 10.5 µs (+23%) |
| pairwise_f64/1024 | 541 µs (+0%) | 542 µs (+0%) | 783 µs (+45%) | 607 µs (+12%) | 802 µs (+48%) | 662 µs (+22%) |
| pairwise_f64/4096 | 8.85 ms (+0%) | 8.72 ms (-1%) | 12.6 ms (+42%) | 9.77 ms (+10%) | 12.9 ms (+45%) | 10.6 ms (+20%) |

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `default--b-select--accumulate-f32.s`: fdiv s ×2, fdiv.4s ×6, fsqrt s ×1, fsqrt.4s ×5
- `default--b-select--accumulate-f64.s`: fdiv d ×2, fdiv.2d ×5, fsqrt d ×1, fsqrt.2d ×4
- `default--base--accumulate-f32.s`: fdiv s ×2, fdiv.4s ×1, fsqrt s ×1
- `default--base--accumulate-f64.s`: fdiv d ×2, fdiv.2d ×1, fsqrt d ×1
- `default--c-lanes--accumulate-f32.s`: fdiv s ×1
- `default--c-lanes--accumulate-f64.s`: fdiv d ×1
- `default--c-lanes--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `default--c-lanes--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
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
- `default--d-soa--accumulate-f32.s`: fdiv s ×1
- `default--d-soa--accumulate-f64.s`: fdiv d ×1
- `default--d-soa--sweep-f32.s`: fdiv s ×3, fdiv.4s ×5, fsqrt s ×3, fsqrt.4s ×5
- `default--d-soa--sweep-f64.s`: fdiv d ×3, fdiv.2d ×6, fsqrt d ×3, fsqrt.2d ×6
- `native--b-select--accumulate-f32.s`: fdiv s ×2, fdiv.4s ×6, fsqrt s ×1, fsqrt.4s ×5
- `native--b-select--accumulate-f64.s`: fdiv d ×2, fdiv.2d ×5, fsqrt d ×1, fsqrt.2d ×4
- `native--base--accumulate-f32.s`: fdiv s ×2, fdiv.4s ×1, fsqrt s ×1
- `native--base--accumulate-f64.s`: fdiv d ×2, fdiv.2d ×1, fsqrt d ×1
- `native--c-lanes--accumulate-f32.s`: fdiv s ×1
- `native--c-lanes--accumulate-f64.s`: fdiv d ×1
- `native--c-lanes--pass_one-f32.s`: fdiv s ×1, fdiv.4s ×1, fsqrt s ×1, fsqrt.4s ×1
- `native--c-lanes--pass_one-f64.s`: fdiv d ×1, fdiv.2d ×1, fsqrt d ×1, fsqrt.2d ×1
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
- `native--d-soa--accumulate-f32.s`: fdiv s ×1
- `native--d-soa--accumulate-f64.s`: fdiv d ×1
- `native--d-soa--sweep-f32.s`: fdiv s ×3, fdiv.4s ×5, fsqrt s ×3, fsqrt.4s ×5
- `native--d-soa--sweep-f64.s`: fdiv d ×3, fdiv.2d ×6, fsqrt d ×3, fsqrt.2d ×6
- `wasm--b-select--accumulate-f32.s`: f32.div ×2, f32.sqrt ×1
- `wasm--b-select--accumulate-f64.s`: f64.div ×2, f64.sqrt ×1
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
- `wasm--d-soa--accumulate-f32.s`: f32.div ×1
- `wasm--d-soa--accumulate-f64.s`: f64.div ×1
- `wasm--d-soa--sweep-f32.s`: f32.div ×7, f32.sqrt ×7
- `wasm--d-soa--sweep-f64.s`: f64.div ×7, f64.sqrt ×7
- `wasm-simd128--b-select--accumulate-f32.s`: f32.div ×2, f32.sqrt ×1, f32x4.div ×1
- `wasm-simd128--b-select--accumulate-f64.s`: f64.div ×2, f64.sqrt ×1
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
- `wasm-simd128--d-soa--accumulate-f32.s`: f32.div ×1
- `wasm-simd128--d-soa--accumulate-f64.s`: f64.div ×1
- `wasm-simd128--d-soa--sweep-f32.s`: f32.div ×3, f32.sqrt ×3, f32x4.div ×2, f32x4.sqrt ×2
- `wasm-simd128--d-soa--sweep-f64.s`: f64.div ×3, f64.sqrt ×3, f64x2.div ×2, f64x2.sqrt ×2
