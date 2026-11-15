# Vectorizing pairwise gravity: a lab notebook

Status: **in progress** (2026-11-14; updated 2026-11-15). The whole line of thought for the
gravity-loop experiments, in order, including the dead ends: the record
to write a post from. The short, settled results are in `experiments.md`;
the reproducible package (patches, `run.py`, results) is in
`experiments/gravity-vectorize/`.

**What's committed:** each run's `summary.md`, `results.csv` and
`machine.txt`, and `results/sweep.md`. The asm listings, perf output
(`perf/*.annotate.txt`, `*.stat.csv`), logs and criterion's raw data are
**not**: they stay on the machine that ran the experiment. Where this
notebook quotes them, rerun the package (`experiments/gravity-vectorize/`)
to see them again.

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

## Step 7: the M4 run and the lane sweep (2026-11-15)

Full tables: `results/m4/` and `results/llm-lanes/`.

**A bug on the way.** Both runs were given `--out` as a relative path;
criterion resolved it from the crate's folder inside the throwaway
worktree, so the native levels' data was deleted with it (the wasm
levels, run by wasmtime and Node from the script's folder, were fine).
Nothing needed rerunning: criterion prints every result, and
`run.py --from-log` rebuilt both summaries from the logs (criterion's
printed estimate, within a percent or so of its mean; used for every
level, so they stay comparable). `--out` is now made absolute.

`f64`, 4096 bodies, ms (best in bold):

| | base | C | D2 (`d-l4`) | `d-l8` | `d-l16` |
|---|---|---|---|---|---|
| M4 native | 8.85 | 10.21 | 12.28 | 9.89 | **8.51** |
| M4 wasm + simd128 | 9.77 | 10.32 | **7.43** | 7.64 | 10.40 |
| M4 V8 + simd128 | 10.65 | 9.66 | **6.98** | 6.99 | 9.14 |
| Zen 5 default (SSE2) | 18.74 | 11.51 | 10.92 | **10.09** | 10.83 |
| Zen 5 AVX2 | 18.71 | 7.51 | 11.59 | 8.73 | **7.40** |
| Zen 5 AVX-512 | 18.77 | **4.05** | 10.62 | 7.79 | 5.39 |
| Zen 5 wasm + simd128 | 18.69 | 11.65 | **10.08** | 10.12 | 13.14 |
| Zen 5 V8 + simd128 | 18.73 | 11.64 | 9.97 | **9.92** | 12.77 |

What it says:

- **The Cranelift result holds, narrowly.** On the M4, D2 as wasm runs
  in 7.4 ms (wasmtime) and 7.0 (V8) against 12.3 compiled natively by
  LLVM: the same source, the same CPU, 40% faster. But only at 4 lanes:
  natively 2 and 8 lanes are 9.9, and at 16 LLVM beats both wasm
  engines. Static asm counts (instructions, stack references, scalar
  adds) don't explain it. A specific case for an LLVM report: a 4-lane
  `f64` block on AArch64.
- **Wider blocks help, to a point.** The best D is about four vectors
  a block on x86 (8 lanes with SSE2, 16 with AVX2); the M4 in `f64`
  likes 16 (eight NEON vectors; it has 32 registers). Beyond, it falls
  off: 16 lanes in wasm is the worst in its row.
- **wasmtime and V8 within 1–2% of each other** everywhere.
- `target-cpu=native` changes nothing on the M4; `d-l4` and `d-soa`
  compile to identical code (`map2` as a loop or written out).
- Every vector version is slower at 16 bodies (5–14× at 8–16 lanes):
  a fallback below some n is needed.

### C and D are the same arithmetic

C with 4 lanes and D2 give **identical golden hashes**: each computes a
pair's force the same way, puts pair j in lane j mod LANES of body i's
sum, and adds the lanes in the same tree. They differ in the loop:

| | C | D |
|---|---|---|
| Passes per body i | two: pass 1 computes every pair's force, updates body j, stores the force in `fx`/`fy`; pass 2 sums them in LANES lanes | one: blocks of LANES pairs, body i's lanes updated in the same loop |
| LANES controls | pass 2 only (the order) | the block size and the order |
| Vector width chosen by | LLVM's loop vectorizer, on pass 1's plain loop: as wide as the target allows | the SLP vectorizer, packing D's straight-line block: at most LANES, and sensitive to its shape |
| Extra cost | `fx`/`fy` written and read for every pair | accelerations copied to separate arrays and back, once a call |

C trades memory traffic for a width that adapts; D avoids the traffic
but is tied to LANES. Hence C wins with AVX-512 and D at 128 bits.

### LANES can't vary by target

Speed-only flags (`simd128`, `target-cpu`) can differ per system: vector
square roots and divisions round as scalar ones, and Rust never fuses a
multiply and an add, so the bits don't change. LANES sets the order of
the sums, so it changes the bits, and the goldens must be identical on
native and wasm (`04-testing.md`). One LANES for every target, then:
C's design suits that, since the vector width only touches pass 1,
which sums nothing across pairs.

### Decisions (2026-11-15)

- **C, with LANES on top**, goes into the engine; changing the golden
  hashes is fine. C's pass 2 lane count is now build-time
  (`c-l1`…`c-l16`; `c-l1` is an in-order sum, to measure what the order
  costs; `c-l4` gives C's bits) and is being swept on both machines to
  choose one LANES; then a plain loop below a measured n.
- **Every wasm module built with `simd128`** (#276): engine −15 to −20%
  in Node, goldens unchanged. Without SIMD a module can't load at all
  (wasm has no fallback), so the loader detects that with a 31-byte probe
  and the pages show a `WasmUnsupportedError` message instead of a
  compile error. The same comparison found swarm's boids render 2× slower
  with `simd128` (it already shipped with it): open, in `15-swarm.md`.

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
- C's best LANES (the sweep) and the n below which the plain loop wins.
- The M4's 4-lane anomaly: LLVM's and Cranelift's machine code for D2's
  loop, side by side.

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
