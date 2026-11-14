# Experiments

Performance experiments: what was tried, how it was measured, and what
came of it, whether or not it was kept. Benchmarks are `cargo xtask bench`
(`benchmarks.md`); a change is compared against a baseline saved on
`main` just before (`--save before`, then `--baseline before`), on the
same idle machine, with `main` re-run afterwards to check the machine
hadn't drifted.

## The machine (2026-11-14)

Apple M4 (4 performance cores, 6 efficiency; 128 KB L1 data per
performance core, 16 MB L2, 128-byte lines). macOS doesn't report the
clock: measured at **4.40 GHz** with a chain of dependent integer adds
(one cycle each). Throughput on NEON vectors with the data in L1, from a
throwaway probe (element-wise loops the compiler vectorizes):

| Per value | `f64` | `f32` |
|---|---|---|
| square root | 1.00 cycle | 0.50 |
| division | 0.63 | 0.33 |
| multiply-add (a load- and store-heavy loop: an upper bound) | 0.46 | 0.22 |

## Pairwise gravity (`PairwiseGravity::accumulate`, `force.rs`)

The direct method: every pair `i < j` once, about 20 flops a pair, one of
them a square root and one a division. At 4,096 bodies, 8,386,560 pairs.

The vectorizing experiments (B, C, D) are kept as patches in
`experiments/gravity-vectorize/`, with a script that reruns them on
another machine at several CPU levels and dumps their assembly.

**Where it started:** 13.1 ms at 4,096 (`f64`), 1.56 ns a pair, about 6.9
cycles. The compiled inner loop (`cargo asm -p engine --bench step
"<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate"`)
handles one pair per iteration: vectors hold one pair's x and y, the
square root and division are scalar, and body i's acceleration is loaded
from memory and stored back on every pair. That last is a dependency from
one iteration to the next through memory (store, reload, add): on its
own about the measured cost.

### Masses stored with the inverse masses: slower, not kept

`accumulate` copies positions, masses and inverse masses into one
`Vec<(Vec2, m, w)>` per call: an allocation and an array of structs made
from the particles' struct of arrays. Tried: `Particles` keeps `mass`
next to `inv_mass` (written with it in `push`, `set_body` and
`pop_if_last`), and the loop reads the three arrays directly, with no
allocation. Bit-identical results.

| | Copy (`main`) | Stored masses | Change |
|---|---|---|---|
| `pairwise_f64/16` | 181 ns | 199 ns | +10% |
| `pairwise_f64/128` | 17.6 µs | 21.9 µs | +25% |
| `pairwise_f64/4096` | 13.1 ms | 22.3 ms | +70% |
| `pairwise_f32/4096` | 9.68 ms | 14.6 ms | +51% |

The copy is n entries once per call; the loop then reads it n²/2 times,
and one packed stream beats three. The allocation is tens of nanoseconds,
a visible share only at 16 bodies (a 181 ns call). A reused scratch buffer
would keep the packed layout without the allocation, but `Force` takes
`&self`, so it needs interior mutability or a buffer passed in by the
world; not worth it at the sizes gravity runs at (hundreds to thousands).

### Body i's sum in a register: faster, kept

Body i's acceleration is copied into a local before the inner loop, added
to there, and written back once after it: the same additions in the same
order, so the bits don't change (the golden hashes pass).

| | `main` | Sum in a register | Change |
|---|---|---|---|
| `pairwise_f64/16` | 181 ns | 235 ns | +30% (not understood) |
| `pairwise_f64/128` | 17.6 µs | 8.6 µs | −51% |
| `pairwise_f64/1024` | 1.07 ms | 0.543 ms | −49% |
| `pairwise_f64/4096` | 13.1 ms | 8.73 ms | −33% |
| `pairwise_f32/1024` | 1.02 ms | 0.551 ms | −46% |
| `pairwise_f32/4096` | 9.68 ms | 8.79 ms | −9% |

Now 1.04 ns a pair (about 4.6 cycles) from 128 to 4,096 bodies, in both
precisions.

### How fast could it be?

Back of the envelope, compute only (memory free):

- **By raw flops:** 8.39 M pairs × ~20 flops = 168 Mflop. The M4's
  performance core has four 128-bit vector pipes (community measurements;
  Apple doesn't publish this): 2 `f64` lanes × multiply-add = 16 flops a
  cycle, 70 Gflop/s at 4.4 GHz, so 2.4 ms (`f32`, twice the lanes: 1.2
  ms). Too optimistic: this kernel isn't made of multiply-adds.
- **By the square root and division**, which dominate: vectorized, 1.63
  cycles a pair in `f64` (1.00 + 0.63, if they share a unit, as they
  appear to), 0.83 in `f32`. That's **3.1 ms (`f64`) and 1.6 ms (`f32`)**
  at 4,096 before any other arithmetic; with it, perhaps 3–5 ms and 2–3
  ms.
- **Memory:** a pair reads 32 bytes of body and 16 of acceleration and
  writes 16. At 4,096 the working set (192 KB) is just over L1; L2 keeps
  up at this rate.

So the loop is now about 2–3× from its compute floor in `f64` and 3–5×
in `f32`. The gap is vectorizing **across pairs** (two `f64` or four
`f32` pairs per instruction), which needs:

- positions split into `x[]` and `y[]` (or gathered so per call), so
  lanes hold different pairs;
- body i's sum over pairs reassociated into lanes: different rounding,
  so new golden hashes, and the same lane order on native and wasm
  (`simd128`) to keep them identical across targets; the compiler won't
  reassociate floats by itself;
- no data-dependent branch in the loop: `d_sq == 0` can only happen with
  no softening, so with softening the check can go (or become a select).

Not done; recorded as the next step if gravity's direct method ever
matters again (Barnes–Hut is the method for large N, `barnes-hut.md`).

### The `d_sq == 0` check

An exact comparison on purpose. `d_sq = |r|² + ε²` is never negative; it
is exactly zero only with no softening and two bodies at the same point
(or so close that `|r|²` underflows), and the check exists only to avoid
`0 / 0 = NaN` there. Any positive `d_sq`, however small, gives a finite
force; a tolerance would quietly change the physics of close pairs, which
is what the softening ε is for, explicitly. Its cost is a compare and a
branch that is never taken with softening on, but a branch in the loop
is one of the things that keeps the compiler from vectorizing across
pairs (above).
