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

## Results (2026-11-16)

`results/llm` (Ryzen 7 9700X, Zen 5; with `--perf`) and `results/m4`
(Apple M4), on `main` at 43d6e33. Time against `lanes-8` (today's code)
at the same level, 10,000 boids:

| level | Brute: `lanes-1` | `lanes-4` | `lanes-16` | `algebraic` | Sorted: `lanes-1` | `lanes-4` | `lanes-16` | `algebraic` |
|---|---|---|---|---|---|---|---|---|
| Zen 5 default (SSE2) | +191% | +171% | −2% | −11% | +72% | +42% | +7% | −28% |
| Zen 5 x86-64-v3 (AVX2) | +558% | +473% | +16% | −0% | +167% | +114% | +34% | −16% |
| Zen 5 native (AVX-512) | +590% | +536% | −34% | −34% | +182% | +128% | +30% | −19% |
| Zen 5 wasmtime simd128 | −18% | −30% | −68% | −67% | −4% | −19% | −58% | −73% |
| Zen 5 V8 simd128 | −5% | −6% | −64% | −59% | −9% | −19% | −65% | −75% |
| M4 native | +156% | +177% | +2% | −21% | +75% | +64% | +22% | −29% |
| M4 wasmtime simd128 | +4% | −25% | −64% | −70% | −20% | −47% | −51% | −70% |
| M4 V8 simd128 | −1% | +5% | −70% | −71% | −24% | −29% | −55% | −71% |

Full tables (and 1,000 boids, wasm without simd128): each
`summary.md`.

What the asm says (`asm/`, not committed):

- **Natively, 8 lanes is the sweet spot**, except AVX-512 (Zen 5
  native), where 16 lanes fill a 512-bit register (−34% brute force).
  With 1 lane the sums are scalar; with 4, LLVM vectorizes awkwardly
  (x86 baseline: 131 instructions per 4 candidates, against 107 per 8).
  So the x86 baseline's stack spills at 8 lanes (24 a block) are not
  what holds it back: 4 lanes spill less and are 2.7× slower. At 16,
  AVX2's 16 registers spill (+16% to +34%).
- **In wasm with simd128, 8 lanes compiles badly.** The hot loop is
  half vector, half scalar: 76 lane extracts, inserts and splats, 68
  scalar f32 ops, 501 instructions a block. 16 lanes is clean (129
  vector ops, no lane moves, no scalar), and 2–3× faster. Not the masks'
  form: the select form (as on aarch64) gives the same loop. So LLVM's
  SLP vectorizer, for wasm, at 8.
- **`algebraic`** (one sum, reorderable) is fastest or close almost
  everywhere: what the compiler does when free to choose the order. Its
  bits depend on the target, so it can't ship as is, but it marks the
  headroom (the M4 natively: −21% to −29%).

The browser demos run the wasm-simd128 build, so they pay for the bad
8-lane loop.
