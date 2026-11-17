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

To fill in (phase 1 below): one row per bench group, with its share of
a profile on each target.

| Kernel | % (M4) | % (Zen 5) | % (V8) | Level | Asm read | Oracle-tested | Benchmarked | Floor |
|---|---|---|---|---|---|---|---|---|
| pairwise gravity (two-pass) | | | | 1 | yes | plain loop | yes | |
| boids neighbour loop (`Seen::add_span`) | | | | 1 | yes | grid, end to end | yes | 31 ms (M4, 10k brute) |
| Barnes–Hut | | | | 1 | no | pairwise? | yes | |
| broadphase | | | | 1 | no | | yes | |
| integrators (`step_*`) | | | | 1 | no | | yes | |
| sand step | | | | 1 | no | chunked = full | yes | |
| Vicsek, ants, Physarum steps | | | | 1 | no | | yes | |
| renders (boids, Vicsek, ants, Physarum, sand) | | | | 1 | no | | Node only | |
| waveguide, FFT, dispersion design | | | | 1 | no | | yes | |

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

1. **Measure (no code changes).** Profile every bench group on the M4
   (`cargo xtask profile`, samply) and on `llm` (the sweep's `--perf`),
   and the wasm through `bench-wasm`; fill the kernel table's shares.
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
