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

Where each bench group's time goes on the M4, natively and in V8
(`experiments/perf-audit/`, `results/m4/summary.md`; 2026-11-17). The
two agree to a few per cent everywhere: the hot code is the same in the
build that ships. Zen 5: to come (`results/llm`).

| Kernel (bench case) | native | V8 | The hot part | Level | Asm read | Oracle | Benchmarked |
|---|---|---|---|---|---|---|---|
| pairwise gravity (`pairwise_f64/4096`; also both integrators at 1024) | 95% | 99% | `two_pass::pass_one` 85%, `lane_sum` 10% | 1 | yes | plain loop | yes |
| boids, sorted (`swarm_step/Sorted/10000`, the page's default) | 84% | 83% | `add_span`; about a third of the step is the **scalar leftovers** (`Seen::add`, `rules.rs:70`, `:99`): with 16 lanes, up to 15 a cell's span | 1 | the lane loop only | grid, end to end | yes |
| boids, grid (`Grid/10000`) | 84% | 87% | all scalar `Seen::add` (by design: the reference) | 1 | no | – | yes |
| boids, brute force (`Brute/10000`) | 94% | 96% | the lane loop | 1 | yes | grid | yes |
| Barnes–Hut (`barnes_hut_f64/theta_0.5/4096`) | 94% | 97% | the tree walk (`accel_on`, inlined; `barnes_hut.rs:181`, `:109`, `:90`) | 1 | no | ? | yes |
| broadphase (`broadphase_f64/4096`) | 58% sort | 58% sort | sorting the `(i64, i64, usize)` keys and pairs; `candidate_pairs` 26–33% | 1 | no | ? | yes |
| sand (`sand_step/busy/1920x1080`) | 95% | 97% | `Grid::step`, the per-cell rules (`rules.rs:60`, the neighbour loop `grid.rs:76`) | 1 | no | chunked = full | yes |
| ants (`swarm_models/ants`) | 85% | 81% | `Field::diffuse_counted`: the 3 × 3 blur, an edge test per cell (`field.rs:158`) | 1 | no | ? | yes |
| Physarum (`swarm_models/physarum`) | 96% | 99% | the agents' sensing and turning (inlined; `physarum.rs:204`, the turn's branches, 40%) and `Slime::cell` | 1 | no | ? | yes |
| Vicsek (`swarm_models/vicsek`) | 92% | 94% | `Vicsek::step`'s neighbour loop, scalar and branchy (`vicsek.rs:349`–`364`) | 1 | no | ? | yes |
| piano voices (`piano_16_voices_x3_strings/128`) | 86% | 81% | `Waveguide::step`: the dispersion allpass cascade (`bridge.rs:121`), one serial filter chain per string | 1 | no | ? | yes |
| piano design (`piano_design_88_keys`, `stiff_waveguide_new/*`) | ~80% | ~80% | `libm`'s `atan`, `sin`, `cos` (65–70%) in `dispersion::refine`; key 69 takes 27 ms against 1.8 ms for key 60 | 1 | no | ? | yes |
| FFT (`fft_f32/16384`) | 96% | 99% | radix-2 butterflies (`fft.rs:87`–`94`) | 1 | no | ? | yes |

### Candidates (from the profiles; floors and Zen 5 to come)

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
6. **Broadphase's sort:** known (TASKS, 2026-11-14: kept, since the
   collision scenes have at most about 60 balls).

### Findings

| # | § | Severity | Finding | Remediation |
|---|---|---|---|---|
| 1 | 6 | High | The shipped target has no recorded baseline: `cargo xtask bench-wasm` prints Node timings but keeps no record, so a wasm regression is judged from memory (the boids render's 2× with `simd128` went unnoticed until measured by hand). | Record `bench-wasm` per machine beside the native record, compared the same way. |
| 2 | 5 | Medium | The boids lane loop has no test at awkward span lengths (0, 1, `LANES` ± 1, …): only end to end, where spans are whatever the flock gives. | A property test: `add_span` against `Seen::add` over generated spans, to rounding. |
| 3 | 5, 6 | Medium | The aarch64 path (`unit`'s select) is built and tested only on the Mac: CI is x86, and the compute node's mutation runs can't see it (2026-11-17: its 3 mutants "missed"). | An aarch64 CI job (GitHub's arm64 runners), or at least the M4 in the release checklist. |
| 4 | 3 | Medium | The two settings files repeat their parsing (`number`, `same`, `panic_at_build`), and tuning values live in each crate's code (`CHUNK` in sand, the grids' cell sizes) without one place that lists them and how each was chosen. | One shared const parser; a table of tuning values (here or in each crate's doc) with their source. |
| 5 | 4 | Medium | Most hot loops' asm has never been read (the table's "no"s). | Phase 1 decides which deserve it: the ones with a large share and a gap to their floor. |
| 6 | 7 | Low | No per-kernel record of its level and why. | The kernel table's Level column, kept current. |

## Plan

1. **Measure (no code changes).** Profile every bench group natively
   and in V8 (`experiments/perf-audit/profile.py`; the M4 done
   2026-11-17, `llm` to come); fill the kernel table's shares.
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
