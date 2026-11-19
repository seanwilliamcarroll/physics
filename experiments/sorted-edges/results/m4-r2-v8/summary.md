# Boids Sorted's span edges

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

## v8-simd128 (`RUSTFLAGS='-C target-feature=+simd128'`)

| bench | base | span-tail | all | table | all-8 | table-8 |
|---|---|---|---|---|---|---|
| swarm_step/Sorted/1000 | 116 µs | 167 µs (+45%) | 167 µs (+45%) | 164 µs (+42%) | 139 µs (+20%) | 138 µs (+20%) |
| swarm_step/Sorted/10000 | 1.63 ms | 1.88 ms (+15%) | 1.88 ms (+15%) | 1.84 ms (+13%) | 1.61 ms (-1%) | 1.6 ms (-2%) |
| swarm_step/Sorted/100000 | 20.2 ms | 21.2 ms (+5%) | 21.2 ms (+5%) | 20.9 ms (+3%) | 17.4 ms (-14%) | 17.3 ms (-15%) |
