# Benchmarks

What's measured, how to run it, and the numbers as of the last run. The
milestone docs keep the tables that drove their decisions; this file is
the index and the current state.

## Running

| Command | What it does |
|---|---|
| `cargo xtask bench --save main` | Every criterion bench (`cargo bench --workspace --benches`), saved as baseline `main`. |
| `cargo xtask bench --baseline main` | Runs them again and compares: lists every benchmark whose mean moved more than 10% (`--threshold N` changes it), faster or slower, and **fails if anything got slower**. |
| `cargo xtask bench-wasm` | Builds the site, then times the modules in Node 22: the engine's cluster against criterion's native numbers, then sand, boids, Vicsek, ants and Physarum through their exports (`xtask/bench_modules.mjs`). |

Benchmarks are noisy on a laptop (a few percent run to run, more with
other work going on): **save and compare on the same machine, idle**,
ideally the compute node. The usual pattern: `--save main` on `main`,
switch to the branch, `--baseline main`.

Neither runs in a hook: a full criterion run takes minutes.

## The suites

| Crate | Bench | Covers | Drove |
|---|---|---|---|
| `engine` | `step` | `World::step` per scalar and integrator at n = 16, 128, 1024; pairwise gravity; Barnes–Hut θ = 0.5, 1.0; per-call allocation; the broadphase | O(n²) confirmed (~2 ns a pair); Barnes–Hut's crossover (`barnes-hut.md`); M6's broadphase |
| `acoustic` | `fft`, `dispersion`, `piano` | FFT sizes; stiff-string allpass design; 16 piano voices; designing 88 keys | A2's analyzer budget; A3's design-once decision (`14-piano.md`) |
| `sand` | `step` | busy and settled grids, chunks on and off, 640 × 360 and 1920 × 1080 | M9's chunks (~175× settled) |
| `swarm` | `step` | boids by brute force, grid and sorted, 300 to 100k | S1's grid, the lane loop, `simd128` (`15-swarm.md`) |

Not covered by criterion (measured by examples, `crates/swarm/examples/`):
the Vicsek and Physarum steps (`timing.rs`), the transition sweep
(`vicsek_sweep.rs`), the ants' evolution (`evolve_ants.rs`).

## Wasm, as of the last run

`cargo xtask bench-wasm`, Node 22, Apple silicon, 2026-11-12:

| Module | Case | Per call |
|---|---|---|
| sand | busy step, 640 × 360 | 0.97 ms |
| sand | settled step, chunks on | 3.4 µs |
| sand | render | 53 µs |
| boids | sorted step, 10k (page's density) | 2.30 ms |
| boids | grid step, 10k | 4.11 ms |
| boids | brute-force step, 2k | 6.49 ms |
| boids | render, 10k | 0.24 ms |
| vicsek | step, N = 400 | 0.12 ms |
| vicsek | step, N = 4000 | 1.27 ms |
| ants | step, 200 × 120, 500 ants | **0.68 ms** (see `profiling.md`: the fields' diffusion) |
| ants | render, 600 × 360 | 0.33 ms |
| physarum | step, 512², 100k agents | 5.89 ms |
| physarum | render, 512² | 0.94 ms |

The engine's table (native against wasm, per case) is in
`04-testing.md`, "Benchmarks".
