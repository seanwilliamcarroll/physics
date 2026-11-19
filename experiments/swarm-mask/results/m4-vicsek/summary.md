# Swarm mask experiments

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

Mean time; in brackets, the change against `convert` at the same level.

## default (`RUSTFLAGS=''`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.25 ms | 1.09 ms (-13%) | 1.24 ms (-1%) | 1.02 ms (-18%) | 984 µs (-21%) |

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.24 ms | 1.08 ms (-13%) | 1.24 ms (-0%) | 1.01 ms (-18%) | 973 µs (-22%) |

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | convert | select | bits | value | branch |
|---|---|---|---|---|---|
| swarm_models/vicsek/4000 | 1.28 ms | 1.1 ms (-14%) | 1.27 ms (-1%) | 1.11 ms (-14%) | 999 µs (-22%) |

## convert, each level against default

| bench | default | native | v8-simd128 |
|---|---|---|---|
| swarm_models/vicsek/4000 | 1.25 ms (+0%) | 1.24 ms (-1%) | 1.28 ms (+3%) |
