# Performance audit

Against `perf-code-audit-guide.md` (its sections are §0–§7 here). Started
2026-11-17 at ba5fac56. The guide is about keeping platform-specific
code contained; this repo has almost none, so the audit's weight is on
the other half: finding the hot code, holding it to a floor, and keeping
it from regressing on each target.

## Audit: physics — 2026-11-17

Targets: wasm32 + `simd128` in browsers (what ships: the site's demos and
the `physics-engine` npm package); aarch64-apple-darwin (M4) and
x86_64-unknown-linux-gnu (Zen 5, `llm`) natively, for development,
tests and benchmarks.
Deployment: **distributed** (the `.wasm` runs on visitors' machines), so
no `target-cpu` in shipped builds; `simd128` is the one target feature
(`.cargo/config.toml`), and a browser without it gets a message
(`WasmUnsupportedError`).
Toolchain: rustc 1.99.1 (LLVM 23.1.1), wasmtime 50, Node 24 (V8).

### Inventory (§0)

| Metric | Count | Where |
|---|---|---|
| `#[cfg(target_arch/feature/os)]` | 3 | `swarm/src/rules/lanes.rs` (the 0/1 mask's form on aarch64); `web-common/src/panic_hook.rs` ×2 (wasm only, not performance) |
| `cfg!(target_…)` | 0 | |
| runtime feature detection | 0 | |
| `core::arch` / intrinsics | 0 | |
| `#[target_feature]` functions | 0 | |
| `#[repr(align(N))]` | 0 | |
| build-time tuning settings (`option_env!`) | 5 | `GRAVITY_LOOP`, `GRAVITY_LANES`, `GRAVITY_PLAIN_BELOW` (`engine/src/force/pairwise/knobs.rs`); `SWARM_LANES`, `SWARM_SUM` (`swarm/src/rules/knobs.rs`) |

Every kernel is at **level 1** (§7: portable Rust plus flags), written
in the vectorizer's style where it matters (fixed-size lane arrays,
`as_chunks`, branchless masks).

### Already true

- §1–2: nothing to contain or dispatch; the one per-architecture choice
  is a two-line helper (`unit`) with the reason in its doc.
- §4: the two hot loops vectorized on purpose (pairwise gravity, the
  boids' neighbour loop) had their asm read on every target, recorded
  in `docs/gravity-vectorize.md` and `experiments/swarm-lanes/`.
- §5: gravity's vector loops are tested against the plain loop (to
  rounding, sizes 1–40 and around every block boundary) and against
  each other (bit for bit); the boids' brute force against the grid,
  to rounding; golden hashes pin every model's bits, native and wasm.
- §6: criterion benches for each crate's top-level step; per-machine
  records with rustc's and criterion's versions (`docs/bench/`); a
  regression threshold (`cargo xtask bench --threshold`).

### Kernel table

Where each bench group's time goes, natively and in V8, on the M4 and on
Zen 5 (`experiments/perf-audit/`, `results/{m4,llm}/summary.md`;
2026-11-17): the hot kernel's share of the run. Native and V8 agree to
a few per cent nearly everywhere: the hot code is the same in the build
that ships.

| Kernel (bench case) | M4 native | M4 V8 | Zen 5 native | Zen 5 V8 | The hot part | Asm read | Oracle |
|---|---|---|---|---|---|---|---|
| pairwise gravity (`pairwise_f64/4096`; also both integrators at 1024) | 95% | 99% | 98% | 99% | `two_pass::pass_one`, then `lane_sum` | yes | plain loop |
| boids, sorted (`swarm_step/Sorted/10000`, the page's default) | 84% | 83% | 78% | 79% | `add_span`; the **scalar leftovers** (`Seen::add`, `rules.rs:70`, `:99`) about a third on the M4, 13% on Zen 5 | the lane loop only | grid, end to end |
| boids, grid (`Grid/10000`) | 84% | 87% | 82% | 86% | all scalar `Seen::add` (by design: the reference) | no | – |
| boids, brute force (`Brute/10000`) | 94% | 96% | 95% | 96% | the lane loop | yes | grid |
| Barnes–Hut (`barnes_hut_f64/theta_0.5/4096`) | 94% | 97% | 96% | 97% | the tree walk (`accel_on`, inlined; `barnes_hut.rs:181`, `:109`, `:90`) | no | ? |
| broadphase (`broadphase_f64/4096`) | 58% sort | 58% sort | 67% sort | 70% sort | sorting the `(i64, i64, usize)` keys and pairs; then `candidate_pairs` | no | ? |
| sand (`sand_step/busy/1920x1080`) | 95% | 97% | 97% | 97% | `Grid::step`, the per-cell rules (`rules.rs:60`, the neighbour loop `grid.rs:76`) | no | chunked = full |
| ants (`swarm_models/ants`) | 85% | 81% | 81% | 83% | `Field::diffuse_counted`: the 3 × 3 blur, an edge test per cell (`field.rs:158`) | no | ? |
| Physarum (`swarm_models/physarum`) | 96% | 99% | 81% + 17% `floorf` | 99% | the agents' sensing and turning (inlined; `physarum.rs:204`) and `Slime::cell`; on x86 also the wrap's `floor` (`physarum.rs:72`), a library call at the SSE2 baseline | no | ? |
| Vicsek (`swarm_models/vicsek`) | 92% | 94% | 92% | 96% | `Vicsek::step`'s neighbour loop, scalar and branchy (`vicsek.rs:349`–`364`) | no | ? |
| piano voices (`piano_16_voices_x3_strings/128`) | 86% | 81% | 87% | 83% | `Waveguide::step`: the dispersion allpass cascade (`bridge.rs:121`), one serial filter chain per string | no | ? |
| piano design (`piano_design_88_keys`, `stiff_waveguide_new/*`) | ~80% | ~80% | ~90% | ~87% | `libm`'s `atan` (31% M4, 61% Zen 5), `sin`, `cos` in `dispersion::refine` (inlined into `Voicing::coefficients` in the wasm); key 69 takes 27 ms against 1.8 ms for key 60 | no | ? |
| FFT (`fft_f32/16384`) | 96% | 99% | 99% | 99% | radix-2 butterflies (`fft.rs:87`–`94`) | no | ? |

### Candidates (from the profiles; the top three's floors below)

1. **Sorted boids' leftovers.** The page's default mode spends about a
   third of its step in the scalar path for each span's last < 16
   candidates: likely why 16 lanes cost sorted 20–34% natively. A
   vector path for the tail (a partial block, masked) would change
   bits (the leftovers' order), so it goes behind a setting first.
2. **The piano's dispersion cascade.** The audio thread's hot loop: 48
   strings, each a serial chain of allpass filters, so no vector
   within a chain, but the chains are independent (vectorize across
   strings). Real-time: its margin decides how many voices fit.
3. **The piano design's trigonometry,** and key 69's 15× outlier. Runs
   when the piano model is chosen (175 ms for 88 keys natively).
4. **Ants' diffusion:** the interior without the per-cell edge test,
   which should then vectorize.
5. **Vicsek's and Physarum's inner loops,** Barnes–Hut's walk, sand's
   rules: branchy, scalar; worth a read of the asm before anything.
6. **Physarum's wrap on x86:** `floor` is a library call at x86's SSE2
   baseline (no rounding instruction until SSE4.1): 17% of the step on
   Zen 5 natively, none on the M4 or in wasm, which have one. Native x86
   isn't shipped, so low; a wrap without `floor` would help all three.
7. **Broadphase's sort:** known (TASKS, 2026-11-14: kept, since the
   collision scenes have at most about 60 balls).

### Floors for the top three (2026-11-17)

Counted with temporary counters (not committed) on the bench's own cases,
then priced against each machine: the M4 at 4.4 GHz with four 128-bit
SIMD pipes; Zen 5 at 5.54 GHz (perf), two multiply and two add pipes.

**1. Sorted boids, 10,000 (one step).** 29,958 spans (three a boid: one
per row of cells), about 36 candidates each: 53,842 blocks of 16
(861,472 candidates) and **211,746 leftovers**, 1.07 M candidates in
all. At 22 FP operations a candidate the arithmetic floor is 0.34 ms on
the M4 and 0.29 ms on Zen 5 at SSE (0.07 ms with AVX-512). Measured with
16 lanes: 1.78 ms, 1.91 ms and 1.35 ms; `add_span` is 84% of it on the
M4, **4.5× its floor** (6.6× on Zen 5 at SSE, 18× with AVX-512). Where
the M4's 1.5 ms goes, from the profile's lines and the lane loop's
measured 31.5 cycles a block:

| | count | cycles each | ms | share of `add_span` |
|---|---|---|---|---|
| blocks (the vector loop) | 53,842 | 31.5 | 0.39 | 26% |
| leftovers (scalar `Seen::add`, branchy) | 211,746 | ~15 | 0.70 | 47% |
| per span (zeroing 7 × 16 lanes, adding them in order) | 29,958 | ~60 | 0.41 | 27% |

The vector loop itself is near its floor; three quarters is the span's
edges. Ways in, all changing sorted's bits (`GOLDEN_SORTED`, not
brute force's): one set of lanes per boid across its three spans (a
third of the reductions); the leftovers masked into a last block
instead of the scalar path; or sorted with its own, smaller lane count
(4: at most 3 leftovers, a 4-lane reduction).

**2. Piano voices, 128 samples (16 voices × 3 strings).** 5,760
string-samples, 33,792 dispersion stages (5.9 a string-sample), 8 flops
each. `Waveguide::step` is 86% of 50.8 µs on the M4: 192 k cycles, 5.7
a stage with all the per-sample work spread over them. The scalar floor
is 2 cycles a stage (8 operations, four pipes): 15 µs, **2.8× below**;
four strings to a vector, 0.5 a stage: 3.8 µs, 11× below. Each stage's
chain is long (written left to right, `low` waits on a multiply and four
adds, about 16 cycles), so the strings overlapping in the core is what
keeps it at 5.7. But the block's budget is 2.67 ms (128 samples at 48
kHz): it uses **1.9% of one core** (Zen 5: 63 µs, 2.4%). Headroom, not
a bottleneck: low priority unless more voices are wanted.

**3. Piano design (88 keys).** 141 fits (Levenberg–Marquardt, at most
80 iterations each), 6,779 iterations, **5.74 M `biquad_delay` calls**,
each two `sin`, two `cos` and two `atan2`: 30 ns a call, about 22 cycles
a transcendental, 175 ms on the M4 (165 on Zen 5), when the piano is
chosen. Its floor is the algorithm's, not the machine's:

- The finite-difference Jacobian recomputes each pole's un-nudged delay
  for both its parameters, though the residuals just computed it, and a
  nudge in `r` recomputes `sin` and `cos` of unchanged angles. Reusing
  both: about 2× fewer transcendentals. An analytic Jacobian (the
  derivatives from the same `sin` and `cos`): about 2.5×.
- **Key 69's 15×** (27 ms against 1.8 for key 60) is the fit, not the
  math: 6 fits instead of 2 (its cascade is too long for its loop, so
  `design` drops poles and refits, three extra times) and 444
  iterations, 74 a fit, against a cap of 80: they don't converge. Key
  84: 4 fits. Choosing the count that fits before the first fit would
  save most of it.

Together, 175 ms → perhaps 60. One-off, but it's a pause in the page when
the model changes (in wasm, more).

### Floors for the rest (2026-11-17)

Counted the same way (temporary counters, the benches' own cases);
times from the bench records (`docs/bench/`; Zen 5's at x86's SSE2
baseline). "Scalar floor": the operations over four pipes, one value
each; "vector floor": four values each.

| Kernel | Work a step | Measured (M4) | Cycles each (M4 / Zen 5) | Floor | Above it |
|---|---|---|---|---|---|
| pairwise gravity, `f64`/4096 | 8.39 M pairs | 8.43 ms | 4.4 / 7.2 a pair | 1.6 a pair (M4: vector `sqrt` 1.0, `div` 0.63, probed) | 2.8× |
| pairwise gravity, `f32`/4096 | 8.39 M pairs | 4.29 ms | 2.2 / 3.1 | ~0.8 (`sqrt` 0.5, `div` 0.33) | 2.7× |
| Barnes–Hut, `f64`/4096, θ 0.5 | 831 k node visits, 590 k interactions (144 a body against pairwise's 4,095) | 3.97 ms | 21 / 37 a visit | ~3 an interaction, ~2 a visit, scalar: 0.8 ms | 5× |
| broadphase, 4,096 circles | 4,096 keys, 11,585 pairs, two comparison sorts | 322 µs | 346 / 530 a circle | a radix sort and the pairs, ~50 a circle: 45 µs | 7× |
| Vicsek, N = 4,000 | 409 k candidates, 37% within range | 1.0 ms (`step` 92%) | 11 / 15 a candidate | 12 operations: scalar 3, vector 0.75 | 3.6× / 14× |
| ants, 200 × 120 | 2 diffusions, 40 k cells | 161 µs (diffusion 85%) | 18 / 24 a cell | ~12 operations: scalar 3, vector 0.75 | 6× / 23× |
| Physarum, 512², 100 k agents | 100 k agents (3 sensor reads each), 262 k cells diffused and decayed | 2.60 ms | 114 / 229 an agent, all in | diffusion ~0.7 a cell vector, agents ~15 scalar: ~0.5 ms | 5× |
| sand, busy, 1920 × 1080 | 2.07 M cells (70% empty), 621 k moves | 14.6 ms | 31 / 41 a cell | an empty cell a load and a test | see below |
| FFT, `f32`/16384 | 5 N log₂ N = 1.15 M flops | 97.8 µs | 2.7 / 1.5 flops a cycle | 16 a cycle (four 4-wide pipes) | 6× / 11× |

What the gaps are made of:

- **Vicsek** is the boids' neighbour loop again, scalar and branchy (37%
  of comparisons pass, unpredictably): the lane loop's method (masks,
  partial sums) applies directly, with the sorted spans' lesson.
- **Ants' diffusion** scatters each cell's share to eight neighbours,
  with an edge test per cell. Written as a gather (each cell sums its
  neighbours' shares: a 3 × 3 stencil), the interior vectorizes.
- **Physarum's** agents branch on random field comparisons (the turn,
  40% of the profile's lines); its diffusion is the same stencil as the
  ants'. On x86 at the baseline, `floor` is a library call (17%).
- **Sand:** 31 cycles a cell on average, though 70% are empty. The
  profile's second-hottest lines (`grid.rs:76`–`79`, about 22%) wake the
  3 × 3 chunks around every move: 621 k moves × 9 chunk writes. Waking
  once per chunk per step (or per row) would remove most of it, before
  any look at the rules themselves.
- **Barnes–Hut** does 14× fewer interactions than pairwise at 4,096 but
  is only 2.1× faster: each costs 6–7× a vector pair (a scalar walk,
  unpredictable accept/open branches). Walking several bodies at once
  is the usual remedy; a bigger change.
- **FFT** and **broadphase**: well above their floors, but used by an
  analysis tool and by scenes of at most about 60 balls.

### Ranked by time to be saved (2026-11-17)

Longest-running first (the µs-scale kernels wait: ants, broadphase, FFT,
the piano voices). Measured: the bench records (`docs/bench/`; Zen 5 at
x86's SSE2 baseline), the boids at 16 lanes from the lane sweep. Floors
from the counts above. **Saving**: from half the gap to the floor
(realistic) to all of it (the bound); the floor is a model, so read the
ranges as an order of magnitude.

| # | Operation | M4: measured / floor | M4 saving | Zen 5: measured / floor | Zen 5 saving | The floor, and what's in the gap |
|---|---|---|---|---|---|---|
| 1 | piano design, 88 keys | 175 / ~60 ms | 57–115 ms | 165 / ~60 ms | 52–105 ms | An algorithmic floor (estimated): the Jacobian's redundant evaluations (~2–2.5×), key 69's refits; `std`'s trig in place of `libm`'s not counted |
| 2 | boids, Grid, 100k | 42 / 3.3 ms | 20–39 ms | 43 / 2.9 ms | 20–40 ms | ~10.7 M candidates at the lane loop's floor; Grid runs all scalar (`Seen::add`) |
| 3 | boids, Brute force, 10k | 45 / 31 ms | 7–14 ms | 48 / 27 ms | 10–21 ms | 10⁸ candidates, 22 FP ops each; the M4 is near its floor counting the masks (38 ms); Zen 5's AVX-512 build: 13 ms, floor 6.8 |
| 4 | sand, busy, 1920 × 1080 | 14.6 / ~4.7 ms | 5–10 ms | 15.2 / ~3.7 ms | 6–11 ms | Rough: ~10 cycles a cell; chunk waking alone is ~22% (3 ms) |
| 5 | boids, Sorted, 100k | 13.3 / 3.3 ms | 5–10 ms | 14.1 / 2.9 ms | 6–11 ms | As 10k: span edges (leftovers, per-span reductions) |
| 6 | pairwise gravity, `f64` 4096 | 8.4 / 3.1 ms | 3–5 ms | 10.9 / ~3.8 ms* | 4–7 ms* | 1.6 cycles a pair (M4, probed `sqrt`, `div`); *Zen 5: its AVX-512 build's 2.5 cycles, achieved, not a floor (the SSE floor needs a probe) |
| 7 | Barnes–Hut, `f64` 4096 | 4.0 / 0.8 ms | 2–3 ms | 5.6 / 1.6 ms | 2–4 ms | 590 k interactions, 831 k visits, scalar; Zen 5's scalar `sqrt` and `div` are slow (12 cycles a pair in gravity's base) |
| 8 | Physarum, 512², 100 k | 2.6 / 0.5 ms | 1–2 ms | 4.1 / 0.4 ms | 2–4 ms | Agents ~15 cycles scalar, the stencil vectorized; on x86 also `floor` |
| 9 | boids, Sorted, 10k | 1.8 / 0.34 ms | 0.7–1.4 ms | 1.9 / 0.29 ms | 0.8–1.6 ms | Span edges: three quarters of `add_span` |
| 10 | Vicsek, 4000 | 1.1 / 0.07 ms | 0.5–0.9 ms | 1.2 / 0.06 ms | 0.5–1.1 ms | 409 k candidates at a vector lane loop's floor |

### Done

- **Piano design, step 1 (2026-11-17):** the refinement's Jacobian in
  closed form (`biquad_delay_gradient`): 5.75 M → 1.17 M `biquad_delay`
  evaluations for 88 keys, and no `atan2` in the Jacobian. M4 174 → 67 ms
  (−61%); in wasm, V8 231 → 92 ms, wasmtime 198 → 84. Every key's worst
  partial error within 0.001 cent of before, the same biquad counts.
  Found on the way: 11 keys miss the design tests' 1-cent tolerance
  (keys 23–30, 52–53, 92, 98–100 at 1.0–2.7 cents; key 107 at 10.9, one
  biquad), before and after; the tests sample six keys, all fine.
- **Piano design, step 2 (2026-11-17):** most keys ran all 80
  iterations: the fit only stopped when its damping blew up. Now it
  stops when an accepted step gains under 1e-4 of the cost (1e-3 cost
  one key 2.2 cents; at 1e-4 no key's worst partial moved 0.0001 cent),
  and while a short loop's pole count is being chosen (33 keys refit
  2–4 times) the refits are short (10 iterations), the final count
  fitted in full. Iterations 6,748 → 5,267. M4 68 → 51 ms (−25%); V8
  93 → 68 ms, wasmtime 84 → 62.
- **Piano design, step 3 (2026-11-17): the asm, and algebraic adds.**
  Read on all five paths (M4, x86 at the baseline and x86-64-v3, the
  wasm through Cranelift and V8). Nothing in the fit was vectorized: the
  trig is `libm` calls, one value at a time; the normal equations' dot
  products are one running sum; the elimination's update (`solve.rs`)
  wasn't vectorized either, though it isn't a reduction (`zip().skip(c)`
  hid its length). Measured on the M4, each alone:
  - `libm::sincos` for `sin` and `cos` of one angle (one range
    reduction): −14%.
  - JᵀJ and Jᵀr only when a step is taken (a rejected step re-damps and
    re-solves), JᵀJ's lower half only: −8%. Bit-identical.
  - The elimination over slices: vectorized on all five (M4 `fmul.2d`
    unrolled 4×, x86 `mulpd`, v3 `ymm`, `f64x2` through Cranelift and
    V8): −9%. Bit-identical.
  - The residuals' `sin` and `cos` kept for the next Jacobian
    (`Angles`): −12%.
  - **Algebraic adds: tried twice, no gain.** The dot products, once
    cached, run too rarely (−0.5%); the elimination update, once
    vectorized, gains nothing from fused multiply–adds (+0.04%). Not
    kept.
  - **`std`'s math instead of `libm`** (every call in the crates
    switched, measured, not kept): `libm` earns its place. `std` has no
    fused `sincos` (its `sin_cos` is a `sin` and a `cos`, two range
    reductions), so the piano design was **20% slower in V8** (40.4 →
    48.6 ms) and 5% faster natively on the M4; and `libm` is Rust that
    LTO inlines into hot loops, where `std` calls the platform's
    library: Vicsek was **13% slower natively** with `std` (1.22 → 1.38
    ms), unchanged in V8. The rest moved a few per cent either way
    (ants, Physarum −2 to −4%; piano voices −7% native, +2% V8). Each
    `std` function on wasm is the same port as `libm`'s; the difference
    is `sincos` and inlining. Zen 5 natively not measured: x86 native
    isn't shipped.

  Every key's worst partial within 0.00001 cent of before, the same
  biquad counts and iterations. M4 51 → 30 ms; V8 69 → 40 ms; wasmtime
  63 → 35 ms. **Since the start: 174 → 30 ms natively, 231 → 40 ms in V8
  (−83%).** What's left is the trig, about half: vectorizing it (a
  polynomial `sincos` and `atan` over the ~25 target frequencies at once)
  would be the next step, and a bigger one.

- **Pairwise gravity's kernels per target (2026-11-17):** the guide's
  §1–3 done for the one kernel with per-target choices.
  `force/pairwise/tuning.rs` holds each target's kernel per scalar (loop
  and lane count) and the plain-loop threshold, the only target `cfg`
  in the crate; the build settings override it for experiments; the
  loops are generic over their lane count. From the sweeps on `main`:
  `f32` two-pass at 16 lanes everywhere; `f64` blocked at 4 lanes in
  wasm, at 1 on aarch64, at 8 at x86's SSE2 baseline, two-pass at 16
  with AVX2 and up. Measured: `f64` at 4,096 bodies **−17% in V8**
  (8.56 → 7.12 ms; −29% at 128), −6% natively on the M4 (−14% at 128);
  `f32` unchanged. The two loops are tested bit for bit against each
  other at 1, 4, 8 and 16 lanes, and against the plain loop to rounding.

- **The boids' lane counts per target and search (2026-11-17):** the
  same structure (`swarm/src/rules/tuning.rs`), from the lane sweep:
  sorted 8 lanes natively everywhere (short spans: fewer leftovers,
  cheaper reductions), 16 in wasm (LLVM compiles 8 badly there); brute
  force 16 in wasm, with AVX-512 and at SSE2, 8 on aarch64 and with AVX2.
  M4: sorted −18% at 10k, −23% at 100k, −27% at 1k; brute force −2%;
  wasm unchanged. `llm` confirmed pairwise's table: `f64` −8% at SSE2,
  −9% in V8, every other row within 0.4%
  (`experiments/gravity-vectorize/results/llm-kernels`).
- **Checking what each target compiled (2026-11-17):**
  `experiments/perf-audit/kernels.py` builds pairwise's and the boids'
  kernels for the M4, x86 at SSE2, AVX2 and AVX-512, and wasm, and
  reports each one's hottest loops: register width, vector and scalar
  float ops, square roots, stack traffic, shuffles. Every target got the
  kernel its table names (e.g. AVX-512: brute force's loop in `zmm`,
  sorted's in `ymm`; wasm: the boids' loop all `f32x4`, no lane moves).
  Run it after any tuning change.
- **Boids Grid (2026-11-17/18, #320 and the mask sweep):** the
  candidates through a branchless scalar test (`Seen::add_masked`):
  18–37% faster natively and on the M4's V8 at 100,000 boids. On llm's
  V8 it measured 43% *slower* (58.6 → 83.7 ms); the sweep
  (`experiments/swarm-mask/`, rustc's code, the wasm and V8's code
  captured for each form) found two causes. Inlined into `Flock::step`
  with the other two searches, x86 V8 compiled Grid's loop about twice
  as slow: `#[inline(never)]` on `step_grid`, 83.7 → 42.5 ms on llm's V8
  (free natively and on the M4). And V8 compiles a wasm float `select`
  to `fcsel` on arm64 but to a branch on x86, so the mask's form is per
  target (`rules/tuning.rs`): a converted integer in wasm, a select
  natively (Zen 5 at SSE2 −17%). Grid stays scalar by design: its
  candidates are gathers through an index; Sorted is its vectorized
  form.
- **Vicsek in V8 on x86 (2026-11-18, open):** 2.3× slower in llm's V8
  than natively (2.29 against 0.95 ms at 4,000; the M4's V8 is level).
  Not the trig (97% of V8's time in `Vicsek::step` itself) and not the
  masks: making its tests branchless lost 10–30% everywhere, llm's V8
  included (`experiments/swarm-mask/README.md`, round 2). Parked at
  ~1.3 ms a step; next would be V8's x86 code against the wasm.
- **Sand chunk waking (2026-11-18):** profiled first, waking was ~35% of
  a busy step on the M4 and ~31% on Zen 5 (`Chunks::wake`'s 3 × 3 loop,
  36 flag writes a move). Now once per chunk per step (a `woke` flag;
  exact, as flags only go up until the step ends), the loop out of line.
  Busy 1920 × 1080: M4 14.6 → 8.5 ms (−42%), V8 17.7 → 11.3 (−36%).
  Next in the profiles: `index()` and `is_moved` (~16% M4, ~25% Zen 5),
  recomputing `y·width + x` with bounds checks at every read.
- **Sand cell reads (2026-11-18, not merged):** both profiles charged
  much of a busy step to reading cells (M4 ~25%, Zen 5 ~47% with the
  decode). Two changes, each measured on both machines at every level:
  computing each cell's index once and reaching neighbours by offset
  (a `Pos` of x, y, index) made the every-cell settled scan 15–35%
  faster but busy steps 1–3% slower natively and 6–7% slower in V8;
  decoding the cell byte through a 256-entry table instead of the
  `match` made busy steps 10–20% slower (the compiler already decoded
  with a compare and a select; the table adds a load on the critical
  path). Neither merged: busy steps with chunks on are the page's case.
  The line profile had charged reads with work that is the rules'
  branching, folded together with them by the compiler.
- **Sand's dispatch (2026-11-18):** `perf record` on Zen 5 (instructions,
  branch misses, cycles; `perf stat`: IPC 2.44, 62 instructions a cell,
  1.5 branch misses a moving grain, no cache misses): ~45% of samples
  land where the per-cell `match` on the material (a jump table, one
  indirect jump a cell) arrives; the random draws' hashing is 0.02%.
  Empty cells now leave on their own branch before it: busy −1–6%
  natively, −2.5% in V8 (merged). Skipping all-empty groups of eight
  cells, read as one word, was exact but on the bench's busy scene (a
  uniform 30% random fill: 6% of groups empty) +16% natively and +17%
  in V8, though the every-cell settled scan was 26% faster; not merged.
  Judging it needs a busy scene like the page's (brush blobs, streams,
  piles), which the bench lacks.
- **Sorted boids' span edges (2026-11-18):** profiles put a quarter to a
  third of a Sorted step at the spans' edges (scalar leftovers, a
  per-span 8-to-1 reduction) and ~5% at x86's baseline in a `floorf`
  call. Three changes, swept in every combination over two rounds
  (`experiments/sorted-edges/`): one set of lanes per boid, reduced
  once; the leftovers as one more block with the lanes outside them
  masked out, the mask a window on a table of zeros then ones; the cell
  lookup truncating. All three on every target, with 8 lanes for Sorted
  in wasm: Zen 5 −38% at 10k and 100k (AVX-512), −36%/−37% (AVX2),
  −26%/−30% (SSE2); the M4 −7%/−31%; V8 −17%/−19% (Zen 5), −2%/−15%
  (the M4). The block removes the leftovers' branches (branch misses
  3.6% → 0.3%). At 1k (about a boid a span) V8 is 7–20% slower: large
  flocks first. **The records after it (2026-11-19) showed V8 21–35%
  slower,** not faster: the sweep's 8-lane build gave brute force 8
  lanes too, so the lane loop had two callers and stayed out of line;
  as shipped (brute force 16) it was inlined into `step_sorted`, too big
  a function for V8 (the M4: 2.26 ms at 10k against 1.63). Kept out of
  line for Sorted in wasm (`Lanes::add_apart`): 1.69 ms; brute force
  keeps it inlined (apart: 22% slower). The lesson, as with Grid's:
  a sweep build must change only what it names.

### Findings

| # | § | Severity | Finding | Remediation |
|---|---|---|---|---|
| 1 | 6 | High | The shipped target has no recorded baseline: `cargo xtask bench-wasm` prints Node timings but keeps no record, so a wasm regression is judged from memory (the boids render's 2× with `simd128` went unnoticed until measured by hand). | Record `bench-wasm` per machine beside the native record, compared the same way. |
| 2 | 5 | Medium | The boids lane loop has no test at awkward span lengths (0, 1, `LANES` ± 1, …): only end to end, where spans are whatever the flock gives. | A property test: `add_span` against `Seen::add` over generated spans, to rounding. |
| 3 | 5, 6 | Medium | The aarch64 path (`unit`'s select) is built and tested only on the Mac: CI is x86, and the compute node's mutation runs can't see it (2026-11-17: its 3 mutants "missed"). | An aarch64 CI job (GitHub's arm64 runners), or at least the M4 in the release checklist. |
| 4 | 3 | Medium | The two settings files repeat their parsing (`number`, `same`, `panic_at_build`), and tuning values live in each crate's code (`CHUNK_SIDE` in sand, the grids' cell sizes) without one place that lists them and how each was chosen. | One shared const parser; a table of tuning values (here or in each crate's doc) with their source. |
| 5 | 4 | Medium | Most hot loops' asm has never been read (the table's "no"s). | Phase 1 decides which deserve it: the ones with a large share and a gap to their floor. |
| 6 | 7 | Low | No per-kernel record of its level and why. | The kernel table's Level column, kept current. |

## Plan

1. **Measure (no code changes).** Profile every bench group natively
   and in V8 (`experiments/perf-audit/profile.py`; both machines,
   2026-11-17); fill the kernel table's shares; floors for the top
   three (done, above).
   For the top kernels, a back-of-envelope floor (operations ÷ the
   machine's throughput, as for the boids) and the measured fraction of
   it. Output: the kernels ranked by share × gap to floor.
2. **Protect the shipped target (finding 1).** `bench-wasm` records,
   per machine, compared like the native record. Before any
   optimization, so its wins and losses in wasm are measured.
3. **Oracles where kernels lack them (findings 2, 3).** The lane loop's
   property test; the aarch64 job or checklist line.
4. **Optimize, top of the ranking first.** Per kernel: read the asm on
   each target, try the change behind a build setting if it changes
   bits, sweep on both machines and in wasm, record the result
   (adopted or not) as the gravity and swarm work did.
5. **Tidy the tuning values (finding 4)** as each kernel is touched,
   not as a separate rewrite.
