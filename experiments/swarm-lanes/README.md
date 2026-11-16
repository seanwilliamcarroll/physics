# Swarm lane experiments

The boids' neighbour loop (`Seen::add_span`, `crates/swarm/src/rules.rs`)
keeps each running sum in `LANES` partial sums, so the compiler can
vectorize it without reordering float additions (which Rust doesn't
allow it to do). How many lanes suit which machine, and could the
compiler vectorize the loop on its own?

Read on the M4 first (`docs/15-swarm.md`, "The lane loop's masks"): with
8 lanes the loop is all vector, but on x86's baseline level (SSE2, 16
vector registers) its 14 accumulators spill to the stack, and AVX-512's
512-bit registers go unused.

`run.py` runs it, with the shared machinery in `experiments/sweep/` (its
README has the levels, commands and output).

## Experiments

Settings of the lane loop's knobs (`crates/swarm/src/rules/knobs.rs`):

| Experiment | `SWARM_LANES` | `SWARM_SUM` | What it asks |
|---|---|---|---|
| `lanes-1` | 1 | `ordered` | one running sum, as written without lanes: what the compiler does alone |
| `lanes-2`, `lanes-4` | 2, 4 | `ordered` | fewer accumulators: does x86's baseline stop spilling? |
| `lanes-8` | 8 | `ordered` | today's code: the reference the tables compare against |
| `lanes-16` | 16 | `ordered` | wider: does AVX-512 get used? |
| `algebraic` | 1 | `algebraic` | one sum the compiler may reorder (`f32::algebraic_add`): free to vectorize as it likes |

All but `lanes-8` change the order of the sums, so the results' last
bits; the golden hashes through the lane loop skip when a knob is set.
`algebraic` lets the compiler pick the order, so its bits may differ
between targets, which the engine's determinism rules wouldn't allow:
an experiment, not a candidate as it stands.

Benches: `swarm_step/Brute` and `swarm_step/Sorted` at 1,000 and 10,000
boids; `--perf` profiles both at 10,000. The asm dumps are
`add_span` and `Flock::step` (with one lane, `add_span` is inlined into
it).

```sh
experiments/swarm-lanes/run.py --experiments sweep
```

6 experiments × up to 7 levels: about an hour.

## First look

A smoke run on the M4 (`--quick`, `swarm_step/Brute/1000` only, so rough):

| | `lanes-1` | `lanes-8` | `algebraic` |
|---|---|---|---|
| native | 1.15 ms | 454 µs | 380 µs |
| wasmtime + simd128 | 1.60 ms | 1.54 ms | 491 µs |
| V8 + simd128 | 1.61 ms | 1.84 ms | 474 µs |

In wasm, today's 8 lanes barely beat one sum, and letting the compiler
reorder is 3–4× faster: the wasm build of the lane loop looks badly
compiled. The asm on the M4 (natively): with one ordered sum the loop is
part vector, part scalar (LLVM's ordered reductions, as in the gravity
work); with `algebraic` it's a clean 27-instruction vector loop.
