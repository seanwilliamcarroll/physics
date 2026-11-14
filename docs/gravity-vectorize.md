# Vectorizing pairwise gravity: a lab notebook

Status: **in progress** (2026-11-14). The whole line of thought for the
gravity-loop experiments, in order, including the dead ends: the record
to write a post from. The short, settled results are in `experiments.md`;
the reproducible package (patches, `run.py`, results) is in
`experiments/gravity-vectorize/`.

## The question

`PairwiseGravity::accumulate` (`crates/engine/src/force.rs`) is the
direct n-body method: every pair `i < j` once, about 20 flops a pair, one
square root and one division among them. At 4,096 bodies that's 8.4
million pairs a step. How close can it get to what the hardware can do,
and what does it take?

Constraints that shape every answer:

- **Determinism.** The engine's results are pinned by golden hashes
  (`tests/determinism.rs`) and must be bit-identical on native and wasm.
  Floating-point addition isn't associative, so summing in a different
  order changes the bits. A compiler won't reorder float sums on its own;
  any change of order must be written into the source, and then the
  goldens are re-recorded deliberately.
- **Shipped code is built for the baseline target.** A plain `cargo
  build` for x86-64 may only use SSE2 (128-bit vectors); the demos run as
  wasm in the browser, where vectors are 128 bits and only with `simd128`
  enabled.
- **Clippy pedantic, no indexing in library code**, which steers loops
  towards iterators and `as_chunks`.

## Step 0: where it started, and what bounds it

Measured on an Apple M4 (4.40 GHz, measured: macOS doesn't report it).
Start: 13.1 ms at 4,096 bodies (`f64`), about 6.9 cycles a pair.

A throwaway probe measured the M4's vector throughput per value: `f64`
square root 1.00 cycle, division 0.63; `f32` 0.50 and 0.33. With the
square root and division vectorized, the floor is about 1.6 cycles a pair
in `f64`: the loop was 4× off it. The details are in `experiments.md`
("How fast could it be?").

## Step 1: masses stored next to inverse masses: slower

**Idea:** `accumulate` copies positions and masses into one packed array
per call (an allocation). Keep masses in `Particles` instead and read the
arrays directly.

**Result:** up to 70% *slower*. The copy is n entries once; the loop reads
it n²/2 times, and one packed stream beats three separate ones.

**Learned:** layout and the number of memory streams matter more than an
allocation. Not kept.

## Step 2: body i's sum in a register: kept (#273)

**Idea:** the compiled loop loaded and stored body i's acceleration on
every pair, a dependency through memory from one iteration to the next.
Sum into a local instead and write once.

**Result:** −33% to −51% (4.6 cycles a pair), same bits (same additions,
same order). Merged.

**Learned:** the first thing to read in the asm is what each iteration
waits on.

## Step 3: what vectorizing across pairs needs

The loop now did one pair per iteration, vectors holding a pair's x and
y. To do 2 (`f64`) or 4 (`f32`) pairs per instruction:

1. **Layout:** lanes must hold *different pairs*, so x's together and y's
   together (separate arrays), not interleaved `Vec2`s. (Or the hardware
   unpacks interleaved data on load: NEON's `ld2`/`ld4` do.)
2. **No branch in the loop:** `if d_sq == 0 { continue }` (coincident
   bodies with no softening, to avoid 0/0) stops the vectorizer.
3. **Body i's sum split into lanes:** a sum over pairs is a chain of
   dependent adds; vectorizing it means several partial sums added at the
   end: a new order, so new bits.

Experiments A–D try these, alone and together.

## A: separate x, y, m, w arrays alone: slower

**Result:** not vectorized at all, +35–40%. Layout without the other two
changes buys nothing and costs more streams (as in step 1).
The code was lost (its branch deleted); only the numbers remain.

## B: the branch becomes a select

```rust
let s = g * m_i * m_j / (d_sq * d_sq.sqrt());
let s = if d_sq == S::ZERO { S::ZERO } else { s };
```

**Result (M4):** the loop vectorized across pairs (NEON `ld4.2d` unpacking
the interleaved bodies), but body i's sum, still in order, became a chain
of scalar adds. `f32` −25%, `f64` +29%. Same bits.

**Learned:** the select is free and correct (0/0 = NaN is computed and
thrown away), and a branch was indeed one blocker; the in-order sum is
the other.

## C: two passes; body i's sum in 4 lanes

Pass 1 computes every pair's force for body i into scratch arrays `fx`,
`fy` and updates body j: nothing summed across pairs, so it vectorizes.
Pass 2 sums `fx`/`fy` in 4 partial sums, pair j in lane j mod 4, added
`(l0 + l1) + (l2 + l3)`: a fixed order written in the source, so every
target gives the same bits.

**A detour: aliasing.** The first version had pass 1 inline, over local
slices. LLVM couldn't prove `acc`, `fx` and `fy` don't overlap, so it
emitted runtime overlap checks and a scalar fallback, and took the
fallback: 2× slower. Moving pass 1 into its own `#[inline(never)]`
function fixed it: Rust marks `&mut` parameters as non-aliasing
(`noalias`), which LLVM trusts.

**Result (M4):** `f32` −32 to −40%, `f64` +12 to +18%. Slower at 16
bodies. Golden hashes change (expected).

## D: separate arrays throughout, in blocks of 4

Everything as separate arrays, including the accelerations (copied in
and out); `sweep` (body i against all later bodies) works in blocks of 4
pairs (`as_chunks::<4>`), body i's sum in 4 lanes.

**Result (M4):** vectorized (`.2d`/`.4s`) but `f64` +44–49%, `f32` −14 to
−22%, 16 bodies up to +103%. The asm showed the block loop spilling to the
stack and adding lanes with scalar adds.

**D2: the block as whole-array steps.** Hypothesis: the spills and
scalar adds were the cost. Each step rewritten as one operation on
`[S; 4]` (`map2`: four lanes written out, no loop). The block loop became
clean: 42 of 75 instructions vector, no stack traffic, no scalar adds.
**Timing unchanged.** So the spills weren't the bottleneck: a useful
negative. On the M4 the `f64` loop is near neither its arithmetic floor
nor any obvious stall; at this point measuring on other hardware was the
better use of time than guessing.

## Aside: is `Vec<Vec2<S>>` the problem? (array of structs)

`pos: Vec<Vec2<S>>` is an array of structs at the level of one field
(`x0 y0 x1 y1 …`), though `Particles` as a whole is a struct of arrays
(`pos`, `vel`, `inv_mass`, `radius` each a `Vec`). The question was
whether `Vec2` should become a `Vec2s { x: Vec<S>, y: Vec<S> }`.

The case against, so far: a `Vec2` has two fields and loops use both, so
no cache line is wasted; NEON unpacks pairs for free (B did); and A and D,
which split the arrays, weren't faster on the M4. Where it could pay:
wider vectors (AVX-512 wants 8 x's in one load). Cost: 14 files, the wasm
boundary (JS reads positions as one interleaved `Float64Array`), and an
invariant (equal lengths). Decision deferred to the cross-machine results.

## Step 4: a package to rerun everything elsewhere

`experiments/gravity-vectorize/`: each experiment a patch against
`ea2169b`, and `run.py`, which for each experiment makes a git worktree,
applies the patch, runs criterion on the `pairwise_*` benches and dumps
the hot functions' asm, at several **levels**:

| Level | What it is |
|---|---|
| `default` | the target's baseline: x86-64 SSE2 or aarch64 NEON, 128-bit |
| `x86-64-v3` | AVX2: 256-bit |
| `native` | this CPU: AVX-512 (512-bit) on Zen 5 |
| `wasm` | wasm32-wasip1 under wasmtime, no SIMD |
| `wasm-simd128` | the same with `simd128`: 128-bit |
| `v8`, `v8-simd128` | the same two `.wasm` builds run in Node, on V8 |

Design decisions:

- **Patches, not branches:** C and D change the golden hashes, and the
  pre-push hook (rightly) blocks that; nothing here is meant to merge.
- **Three code generators for the same wasm:** wasmtime compiles wasm with
  Cranelift, V8 with TurboFan; natively it's LLVM's backend. Same LLVM
  middle end (the wasm is already LLVM-optimized), different final code
  generation.
- **perf (`--perf`, Linux):** `perf stat` gives cycles and instructions;
  combined with criterion's time, cycles and instructions *per pair*.
  `perf annotate` shows which instructions the samples land on.
- **Node pinned** to `.nvmrc`'s (the first smoke test ran on the machine's
  default Node 22; `run.py` now refuses a mismatch).
- Valgrind was considered and rejected: it doesn't support AVX-512, and
  its cache model is a simulation; perf reads the real counters.

## Step 5: results on Zen 5 (AMD Ryzen 7 9700X, `llm`)

Full tables: `experiments/gravity-vectorize/results/llm/summary.md`.

**Base is bound by square root and division.** 12.4 cycles a pair in
`f64` at every level, against 4.6 on the M4. Scalar `sqrtsd`/`divsd` on
Zen 5 cost many cycles each in throughput, per instruction, where the M4
does about one `f64` square root a cycle. perf annotate spreads the
samples evenly over the instructions after the division: the signature of
a loop waiting on one slow instruction. The consequence: on Zen 5 a
vector instruction does 2, 4 or 8 pairs' square roots for roughly the
price of one, so vectorizing pays a lot. On the M4 it had little to win
in `f64`.

**C scales with the vector width; D doesn't.**

| `f64`/1024, cycles a pair | default (2 lanes) | v3 (4) | native (8) |
|---|---|---|---|
| base | 12.4 | 12.3 | 12.4 |
| B | 12.4 | 12.4 | 7.3 |
| C | 7.6 | 4.8 | **2.5** |
| D2 | 7.3 | 8.0 | 7.2 |

C's pass 1 is a plain loop and LLVM's loop vectorizer picks the width
itself (`sqrtpd zmm` at native: 8 pairs an instruction): −80% in `f64`,
−82% in `f32`. D hard-codes 4 lanes, so at most 256-bit `ymm`, and its
hottest instructions are lane shuffles (`vhaddpd`, `vextractf128`). B
vectorizes only with AVX-512 (masked operations).

**wasm:** without `simd128` every version is within a few percent of
the others (all scalar, all bound by the square root). With it, C and D2
match native at `default` (both 128-bit): D2 −46% under wasmtime, −47%
under V8. wasmtime and V8 come out nearly identical. One oddity: base in
`f32` under V8 with `simd128` is 66% slower than without; LLVM emitted one
`f32x4.div` that V8 seems to handle badly.

**Small n:** every vector version is slower at 16 bodies (+20 to +130%):
the per-body setup outweighs 15 pairs. A real version would fall back to
the plain loop below some size.

## Step 6: LANES, swept

D's 4 lanes was a guess. What's best depends on more than the vector
width:

- **vector width** sets the minimum (fewer lanes leave vectors empty);
- **latency hiding** pushes it up: square root and division have long
  latency, and the core overlaps blocks only if each block has enough
  independent work, so 2–4 vectors a block can win;
- **register count** caps it (16 vector registers on SSE2/AVX2, 32 on
  AVX-512 and NEON); past that, spills;
- **the compiler's shape for the code** (D2's shuffles on x86).

So LANES is now set at build time by `GRAVITY_LANES` (a `const fn`
parses `option_env!`; a bad value fails the build), `map2` and the lane
sum work for any power of two (the sum a tree, halves first: four lanes
give D2's exact bits, checked against its golden hashes), and `run.py`
has `d-l2`, `d-l4`, `d-l8`, `d-l16`. Sweeping first, deriving a rule
after: if the best LANES turns out to be some multiple of the vector
width, production code could pick it at compile time from the target's
features (`cfg!(target_feature = "avx512f")`, `"simd128"`, …). That's
what the code is *built for*, not what the machine has: detecting the
running machine needs runtime dispatch (`is_x86_feature_detected!` and
per-feature compiled copies), which wasm can't use anyway.

A first rough look on the M4 (`--quick`, `f64`/1024): 4 lanes 759 µs, 8
lanes 630, 16 lanes 565 (base 543). Wider blocks help even where vectors
hold 2 `f64`: latency hiding, not width.

## Open questions

- **LLVM vs Cranelift on aarch64.** A smoke run on the M4: D2 natively
  (LLVM's AArch64 backend) 759 µs; the same code as wasm with `simd128`
  under wasmtime (Cranelift generating the AArch64 code) **448 µs**,
  faster than native base. Both start from LLVM-optimized IR (the wasm
  is LLVM's output), so the difference is in final code generation:
  instruction selection, scheduling, register allocation. To confirm with
  the full M4 run, then to isolate: compare the two machine-code
  listings for the hot loop (`wasmtime explore` or
  `wasmtime compile` + `objdump` for Cranelift's). If it holds, it's a
  candidate **missed-optimization report to LLVM** (below).
- Why base is +30% at 16 bodies after #273 (noted, not understood).
- The best LANES per machine and level (the sweep), and whether a
  compile-time rule fits it.
- Whether to adopt C (with a small-n fallback) or a D with the right
  LANES, given the golden-hash change.
- Whether the site's `engine.wasm` is built with `simd128` (likely not);
  if not, that's a separate, cheap win for the demos.

## Upstream? (LLVM)

If the aarch64 result holds, a good first contribution is a **reduced
test case in an issue**, not a patch:

1. Reduce: the hot loop alone as a small Rust function (or LLVM IR from
   `--emit=llvm-ir`), checked on Compiler Explorer against the current
   LLVM, with the timing gap shown.
2. File it on `llvm/llvm-project` (GitHub issues, labels like
   `backend:AArch64`, `missed-optimization`). Reports with a minimal IR
   reproducer and numbers get looked at.
3. A fix (in the SLP vectorizer or the AArch64 backend) is a much bigger
   step: LLVM's review is thorough and its codebase large. Reading the
   discussion on our own issue is the way in.

D2's x86 lane shuffles (`vhaddpd` for a 4-lane block) may be a second
case, though that one may simply be our code's shape.

## For the post

Threads worth telling:

- The same loop is limited by different things on different chips
  (memory traffic and adds on the M4, square root throughput on Zen 5),
  so "vectorize it" helps 5× on one and hurts on the other.
- A clean asm listing (D2) that's no faster: removing the visible problem
  isn't the same as removing the bottleneck.
- Determinism vs speed: every vector version changes the bits, and the
  order has to live in the source.
- Rust's `noalias` on `&mut` parameters, and what happens without it.
- Three code generators, one wasm file.
- Methodology: patches + worktrees, CPU levels, perf counters per pair.
