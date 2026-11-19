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

## sqrt and div in the dumped functions

x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.
aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.
wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.
Each file is in asm/.

- `native--all--grid_fill-f32.s`: none
- `native--all--step_sorted-f32.s`: fdiv s ×1
- `native--base--grid_fill-f32.s`: none
- `native--base--step_sorted-f32.s`: fdiv s ×1
- `native--span-tail--grid_fill-f32.s`: none
- `native--span-tail--step_sorted-f32.s`: fdiv s ×1
- `native--table--grid_fill-f32.s`: none
- `native--table--step_sorted-f32.s`: fdiv s ×1
