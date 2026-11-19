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

## native (`RUSTFLAGS='-C target-cpu=native'`)

| bench | base | span-tail | all | table |
|---|---|---|---|---|
| swarm_step/Sorted/1000 | 80.1 µs | 83.4 µs (+4%) | 83.1 µs (+4%) | 80.5 µs (+0%) |
| swarm_step/Sorted/10000 | 1.02 ms | 978 µs (-4%) | 974 µs (-5%) | 948 µs (-7%) |
| swarm_step/Sorted/100000 | 15 ms | 10.6 ms (-29%) | 10.6 ms (-29%) | 10.4 ms (-31%) |
