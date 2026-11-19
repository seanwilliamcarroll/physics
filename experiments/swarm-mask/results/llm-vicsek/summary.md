# Swarm mask experiments

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

Mean time; in brackets, the change against `convert` at the same level.

## default (`RUSTFLAGS=''`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.28 ms | 1.48 ms (+16%) | 1.28 ms (-0%) | 1.3 ms (+2%) | 1.17 ms (-8%) |

## x86-64-v3 (`RUSTFLAGS='-C target-cpu=x86-64-v3'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.2 ms | 1.1 ms (-8%) | 1.2 ms (+0%) | 1.22 ms (+2%) | 932 µs (-22%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.21 ms | 1.06 ms (-12%) | 1.21 ms (-0%) | 1.13 ms (-7%) | 954 µs (-21%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 2.86 ms | 3.04 ms (+6%) | 2.9 ms (+1%) | 2.91 ms (+2%) | 2.29 ms (-20%) |

## convert, each level against default

| bench | default | x86-64-v3 | native | v8-simd128 |
|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.28 ms (+0%) | 1.2 ms (-6%) | 1.21 ms (-5%) | 2.86 ms (+124%) |
