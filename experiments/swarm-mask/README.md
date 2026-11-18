# Swarm mask experiments

#320 made the boids' Grid mode branchless: each candidate's two range
tests became 0/1 masks multiplied into the sums (`Seen::add_masked`,
`crates/swarm/src/rules.rs`). Grid at 100,000 boids got 18–37% faster
natively on both machines and 39% faster in V8 on the M4, but 43%
**slower** in V8 on llm (Zen 5): 58.6 → 83.7 ms. The wasm is the same
file on both; V8 compiles it for each CPU. Which way of writing the
masks compiles well everywhere?

A guess to check: on wasm the mask is an integer converted to a float
(`f32.convert_i32_u`), which V8 on x86 may compile to `cvtsi2ss`, an
instruction that writes only part of its register and so waits for its
last writer (native compilers zero the register first to break that
chain). On arm64, V8 compiled the same wasm to selects (`fcsel`), no
conversion at all.

`run.py` runs it, with the machinery in `experiments/sweep/` (its
README has the levels, commands and output).

## Experiments

`SWARM_MASK` (`crates/swarm/src/rules/knobs.rs`); every form gives the
same values (swarm's tests pass under each):

| Experiment | The mask | What it asks |
|---|---|---|
| `convert` | `f32::from(u8::from(c))` | what wasm and x86 shipped in #320: the reference |
| `select` | `if c { 1.0 } else { 0.0 }` | wasm's `select`, no conversion (aarch64's native form) |
| `bits` | `f32::from_bits(1.0_f32.to_bits() & u32::from(c).wrapping_neg())` | an integer AND and a reinterpret, no conversion |
| `value` | `sum += if c { x } else { 0.0 }` per term | a select per term, no multiply |
| `branch` | the branching `Seen::add` | before #320: fast on llm's V8, slow on the M4's |

Benches: `swarm_step/Grid` at 1,000, 10,000 and 100,000 boids, and
`swarm_models/vicsek/4000` (which isn't affected by the knob, but is
2.3× slower in V8 on llm than on the M4 too, so its code is captured).

## The code, three ways

For each experiment, in `results/<machine>/asm/`:

| File | What |
|---|---|
| `<level>--<form>--step_grid-f32.s` at `default`, `x86-64-v3`, `native` | rustc's code for the CPU |
| `v8-simd128--<form>--step_grid-f32.s` | the wasm (text) |
| `v8-simd128--<form>--step_grid.v8.s` | V8's code from that wasm (TurboFan, the optimized tier) for this machine's CPU |

and the same for `vicsek_step`. `step_grid` is `#[inline(never)]` so it
is its own function in all three.
