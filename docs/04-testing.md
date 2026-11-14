# 04 — Testing

Status: **Adopted** (M0), kept current: each section says how its part is
tested and run today
Depends on: `02-core-types.md`, `03-wasm-shell.md`

## Philosophy

1. **Physics is the specification.** Conservation laws, symmetries, and
   known numerical behavior are the assertions. Write the invariant test
   before the integrator or solver it checks.
2. **Native first.** All logic lives in `engine` (std only), so `cargo test`
   runs fast on the host. The wasm shell stays thin enough that it barely
   needs tests.
3. **Every test runs for every scalar.** `f32`, `f64`, and later `Fixed`,
   each with its own tolerances.
4. **Lock in failures, not just successes.** The side-by-side demos depend on
   bad methods behaving badly. Tests assert that too.

## Dev-dependencies

| Crate | Purpose | Justification |
|---|---|---|
| `proptest` | Property-based testing with shrinking | Most widely used property-testing crate; maintained under the `proptest-rs` org; pinned at 1.12.0 (`00-scope.md`) |
| `criterion` | Native benchmarks with statistics | Long-standing standard; active releases (0.8.2, Feb 2026) |

Re-check both before each phase. Nothing else without a doc entry.

## Layout

```
crates/engine/
  src/
    diagnostics.rs        // energy, momentum, etc. — shared by tests AND demo plots
    diagnostics/tests.rs  // its unit tests (every module: foo.rs + foo/tests.rs)
  tests/
    invariants.rs         // conservation and boundedness
    known_failures.rs     // methods that must misbehave
    determinism.rs        // repeatability + golden hashes
    properties.rs         // proptest
    barnes_hut.rs         // vs direct summation: accuracy, momentum
    properties.proptest-regressions  // committed: shrunk failures replay forever
  benches/
    step.rs               // criterion
crates/test-support/      // dev-dependency: for_each_scalar!, Tol and error
                          // laws, orbit helpers, state hash, proptest worlds
```

## `diagnostics` module

Tests and demo plots must measure the same thing, so metrics live in the engine:

```rust
pub fn momentum<S: Scalar>(p: &Particles<S>) -> Vec2<S>;
pub fn kinetic_energy<S: Scalar>(p: &Particles<S>) -> S;
pub fn gravity_potential<S: Scalar>(p: &Particles<S>, g: &PairwiseGravity<S>) -> S;
pub fn center_of_mass<S: Scalar>(p: &Particles<S>) -> Vec2<S>;
```

Static particles (`inv_mass = 0`) are excluded from momentum and kinetic energy.

**Consequence for `Scalar`:** comparisons against tolerances need a lossless
readout, so `to_f32` becomes **`to_f64`** (see `02-core-types.md`). The
render buffer does `to_f64() as f32`.

## Running every test for every scalar

```rust
// crates/test-support/src/tol.rs
pub trait Tol: Scalar {
    const MOMENTUM_ABS: f64;
    const ENERGY_REL: f64;
}
impl Tol for f32 { const MOMENTUM_ABS: f64 = 1e-4;  const ENERGY_REL: f64 = 1e-3; }
impl Tol for f64 { const MOMENTUM_ABS: f64 = 1e-10; const ENERGY_REL: f64 = 1e-6; }

#[macro_export]
macro_rules! for_each_scalar {
    ($test:ident) => {
        mod $test {
            #[test] fn f32() { super::$test::<f32>() }
            #[test] fn f64() { super::$test::<f64>() }
            // #[test] fn fixed() { super::$test::<Fixed>() }   // later
        }
    };
}
```

```rust
// tests/invariants.rs
fn pairwise_gravity_conserves_momentum<S: Tol>() {
    let mut w = scenarios::cluster::<S>(/*n*/ 16, /*seed*/ 1);
    let p0 = diagnostics::momentum(&w.particles);
    for _ in 0..1000 { w.step(S::from_f64(1.0 / 60.0)); }
    let p1 = diagnostics::momentum(&w.particles);
    assert!((p1 - p0).length().to_f64() < S::MOMENTUM_ABS);
}
for_each_scalar!(pairwise_gravity_conserves_momentum);
```

Tolerances are a hypothesis. When one fails, first decide whether the
tolerance or the physics is wrong, and record why in the test.

## Invariant catalog (phase 1)

| Test | Scenario | Assertion |
|---|---|---|
| Momentum conservation | Cluster, pairwise gravity only | `|Δp|` < tol after N steps |
| Center of mass | Same | COM moves linearly (constant velocity) |
| Free fall | One particle, uniform gravity | Matches `x0 + v0 t + ½ g t²` within integrator's known error |
| Static particles | `inv_mass = 0` under gravity | Position bit-identical after N steps |
| Bounded energy (symplectic) | Two-body circular orbit | Relative energy error stays below bound over 100 orbits; **does not trend** |
| Orbit radius | Same | Radius within band over 100 orbits |
| Zero `dt` | Any | State unchanged |
| Substep equivalence | Free fall, `substeps = k` vs `k` steps of `dt/k` | Identical state |

"Does not trend": compare the energy-error envelope in the first and last
10% of the run. A symplectic method oscillates; a bad one drifts.

**Measured (M1.3)**, circular orbit, dt = 1/60 s, 100 orbits, ωh = 0.0349:

| Integrator | max \|ΔE/E\| (f64) | Error law | f32 |
|---|---|---|---|
| Symplectic Euler | 1.219e-3 | (ωh)² = 1.218e-3 | same |
| Velocity Verlet | 3.704e-7 | (ωh)⁴/4 = 3.70e-7 | 9.7e-6: rounding-limited |
| Explicit Euler | 0.81, rising every orbit | (escapes) | same |

The tests bound each integrator by 1.5x its law plus a per-scalar
rounding floor (`Tol::ENERGY_FLOOR`), rather than by a measured constant.
In f32, rounding noise exceeds Verlet's truncation error and random-walks
upward, so f32 can't resolve Verlet's accuracy, and without the floor the
"does not trend" check would blame Verlet for f32's limits.

Precession is measured with the Laplace–Runge–Lenz vector on an eccentric
orbit (launch at 0.8x circular speed): over 3 orbits, symplectic Euler
turns 0.044 rad at dt = 1/60 s and 1.22 rad at 1/10 s.

## Known-failure catalog

These guarantee the demos remain demonstrations.

| Test | Assertion |
|---|---|
| Explicit Euler orbit | Energy increases monotonically (sampled per orbit); radius grows |
| Unsoftened close pass | With `ε = 0`, a near-head-on encounter produces a velocity spike > threshold |
| Large `dt` orbit | Symplectic Euler at a coarse step visibly precesses (stays bounded) |
| Impulse pendulum, β = 0 (M3) | Rod stretches > 40 cm in 10 s (measured 47 cm) |
| XPBD pendulum, 1 substep (M3) | Loses > 8 of 9.81 J in 10 s (measured 8.79 J) |
| Force spring past `k_crit = 4m/h²` (M5.2, `springs.rs`) | Energy bounded at 0.9 `k_crit`, grows > 1e6x at 1.1 (measured 2e2x at 0.99, 6e71x at 1.01) |
| Classic Baumgarte on the 1:100 chain (M4.9, `chains.rs`) | Gains > 100 J in 10 s at 20 substeps, more than at 2 (measured +3398 J vs +15 J) |
| XPBD pendulum in f32, 100 substeps (M3) | Energy differs from f64 by > 0.2 J (f32 *gains* 0.11 J where f64 loses 0.31 J) |

Name them for what they demonstrate, e.g.
`explicit_euler_gains_energy_on_orbit`.

The whole `01-solvers.md` table is also a regression suite
(`tests/solver_table.rs`, one test per row).

## Determinism

**Repeatability (every scalar):** build a scenario, step N times, repeat,
compare state bit for bit (`to_bits` for floats, raw integer for `Fixed`).

**Golden hashes:** hash the final state of reference scenarios and commit
the values. These act as change detectors: a refactor that alters results
fails loudly, and you then decide whether the change is intended.

Use our own **FNV-1a** over state bits, not `std::hash::DefaultHasher`, whose
output is not guaranteed stable across Rust versions.

**Cross-platform:** floats are expected (not promised) to match between
native x86-64/ARM and wasm for phase 1 operations (`+ − × ÷ sqrt` are
correctly rounded IEEE everywhere; Rust does not fuse multiply-adds
implicitly). Treat a mismatch as an interesting bug, not a test failure,
until `Fixed` exists, which **must** match everywhere.

**As built (M1.4)** (`tests/determinism.rs`): five reference runs
(fountain with respawn, cluster, orbit × 3 integrators) × 2 scalars. The
hash covers position, velocity, and inverse mass as `to_f64()` bits (exact
for f32). On mismatch the test prints paste-ready replacement lines.
Keeping that guarantee meant scenarios avoid libm functions whose last bits
vary by platform: rejection sampling instead of `sin`/`cos` in `cluster`,
`q·√q` instead of `powf(1.5)` in `orbit`. M2.4 added `disk` and `collapse`
(seven runs), built the same way (rejection sampling in an annulus, `sqrt`
only); their hashes match on `wasm32-wasip1` too.

**Cross-platform, confirmed (M1.7):** `cargo xtask test-wasm` (pre-push)
runs the math and engine suites compiled to `wasm32-wasip1` under
wasmtime, and the golden hashes recorded natively on aarch64-apple-darwin
match bit for bit on wasm. (Verified the test binaries really are `.wasm`:
without the runner, cargo can't execute them.)

A useful property, seen when checking the goldens: a change smaller than
f32's resolution (1 nm on a 1 cm softening) changes only the f64 hashes,
because the f32 runs are genuinely identical.

## Property tests (proptest)

Strategies generate random worlds:

```rust
fn particles<S: Scalar>(n: Range<usize>) -> impl Strategy<Value = Particles<S>> {
    // positions in a box, velocities bounded, masses in [0.1, 10],
    // occasionally inv_mass = 0
}
```

Properties:

| Property | Statement |
|---|---|
| Momentum | Pairwise gravity alone conserves momentum for **any** world |
| Finiteness | With softening, no position or velocity becomes non-finite (f32/f64) |
| Translation invariance | Shifting every position by `d` then stepping = stepping then shifting (within tol) |
| Rotation by 90° | Rotating the world with `perp()` commutes with stepping (exact-ish: no trig needed) |
| Permutation invariance | Shuffling particle order gives the same final state (within tol) |
| Determinism | Two runs of any generated world are bit-identical |

**Permutation invariance is a deliberate canary.** Pairwise forces pass it.
Gauss–Seidel solvers (phase 2+) are order-dependent by design, so that
property will need a looser form there. When it breaks, we learn exactly
where order dependence enters.

Configuration: modest `cases` by default (fast `cargo test`), with a higher
count behind an env var for CI or overnight runs. Commit
`proptest-regressions/` so every shrunk failure replays forever.

**As built (M2.2)** (`tests/properties.rs`, generators in `crates/test-support`):
- 64 cases by default; `PROPTEST_CASES=N` for more (verified: 6400 cases
  in under half a second, release). Each property runs f32 and f64 on the
  same generated world (2–12 bodies in a ±10 m box, one in ten static).
- **Momentum drift is bounded by an error law, `steps · ε · Σ m|v|`**
  (`momentum_drift_bound`): each step rounds every velocity by at most
  half an ulp. It replaced a constant calibrated on one 16-body cluster,
  which a two-body f32 world found by proptest exceeded. Worst over
  15,000 random worlds × 3 integrators: 0.26 (f32) / 0.10 (f64) of the
  bound.
- Translation and permutation tolerances are ~10x the worst case over
  2000 calibration worlds (f32: 3.7e-4 m and 4.8e-6 m; f64: 4.3e-13 m and
  1.2e-14 m).
- **Rotation by 90° is exact in value, not in bits.** Its first failure
  shrank to two bodies at rest at the origin: rotating `0.0` gives `-0.0`,
  and `-0.0 + 0.0 = +0.0`, so the result matches with `==` but not bit
  for bit. That case is committed and replays forever.
- With `fork` disabled, failures are saved beside the test file
  (`tests/properties.proptest-regressions`), not in a
  `proptest-regressions/` directory.
- **Under wasm** (`test-wasm`): properties pass, and a `prop_assert!`
  failure still shrinks (it's a returned error). But wasm uses
  `panic = abort`, so a *panic* inside a property aborts without
  shrinking, and saved regressions aren't replayed (WASI can't see the
  source tree). The native run is the one that reports and replays.

**At the wasm boundary (health audit, after A3):** every wasm crate has
a stateful property test over random sequences of its C exports
(`engine-web`'s, `acoustic-web`'s, `sand-web`'s and `swarm-web`'s
`exports/tests/sequences.rs`, and `swarm-web`'s Vicsek exports'; the sand one checks every material's count
sums to the grid after every call), with
hostile values (NaN, ±∞, ±0, `f64::MAX`, unknown codes, `u32::MAX`, sizes
past the ABI's caps). After every call: no panic, statuses 0 or 1, the
buffers JS reads consistent, and a refused call changes nothing (the
synth's: a shadow synth fed only the accepted calls renders bit-identical
audio). They found a strike velocity that panicked the worklet and a
grab whose −1 meant two things.

## Running as wasm

Run the same test suite compiled to wasm under `wasmtime` (an external
runtime, not a crate dependency):

```toml
# .cargo/config.toml
[target.wasm32-wasip1]
runner = "wasmtime"
```

```sh
cargo test -p engine --target wasm32-wasip1    # the target comes with rust-toolchain.toml
```

`cargo xtask test-wasm` runs `math`, `engine`, `acoustic`, `sand` and
`swarm` this way.

Verified (M2.2): proptest's default `fork`/`timeout` features run cases in
subprocesses, which WASI doesn't have, so the workspace uses
`default-features = false, features = ["std"]` everywhere.

`cargo xtask test-wasm` passes `--nocapture`: with `panic = abort`, a
failing test kills the process before libtest prints the output it
captured, and the panic message would otherwise be lost.

Golden-hash tests running on both targets give the cross-platform check above.

## Benchmarks

How to run every bench, save and compare baselines, and the current
numbers per module: `benchmarks.md`. The tables below are M2's.

- `criterion` natively: `World::step` for N ∈ {16, 128, 1024} per scalar;
  pairwise gravity and Barnes–Hut in isolation; SoA vs fully split SoA
  later.
- In the browser: `performance.now()` around `demo_advance`, shown in a
  small on-page overlay (steps/s, ms per step).
- Native vs wasm ratio per benchmark is itself a tracked number.

**Measured (M2.3)**, `cargo bench -p engine --bench step` (criterion,
release, aarch64-apple-darwin, Rust 1.99.1), mean per call, the
`cluster` scenario:

| | n = 16 | n = 128 | n = 1024 | 128 → 1024 |
|---|---|---|---|---|
| step, f32, symplectic Euler | 165 ns | 17.4 µs | 0.99 ms | ×57 |
| step, f32, velocity Verlet | 326 ns | 35.0 µs | 1.99 ms | ×57 |
| step, f64, symplectic Euler | 194 ns | 18.0 µs | 1.09 ms | ×61 |
| step, f64, velocity Verlet | 378 ns | 36.1 µs | 2.20 ms | ×61 |
| `PairwiseGravity` alone, f32 | 158 ns | 17.4 µs | 1.04 ms | ×60 |
| per-call body `Vec`, f32 | 13 ns | 40 ns | 250 ns | |

- **O(n²) confirmed:** 8× the bodies costs ×57–61 (ideal ×64): about
  **2 ns per pair** in both scalars. A step is essentially its force: the
  integrators are noise next to the pair loop.
- **Velocity Verlet costs exactly 2.0×** symplectic Euler (two force
  passes). M1's decision (no cached acceleration: `02-core-types.md`,
  "Integrators") stands: M2's few hundred
  bodies need ~90 µs (Verlet ~180 µs) of a 16.7 ms frame, so caching would
  trade a staleness bug class for time that isn't scarce.
- **The per-call body allocation is negligible:** 8% of the force at
  n = 16, 0.2% at 128, 0.02% at 1024. No change.
- **f32 is 5–10% faster than f64:** without SIMD the win is memory, not
  arithmetic (as M0 found).

**Barnes–Hut (M2.8)**, groups `barnes_hut_{f32,f64}` (θ = 0.5 and 1.0)
beside `pairwise_*`, at n ∈ {128, 1024, 4096} (pairwise gains n = 4096
for the comparison). Force alone, mean per call:

| | n = 128 | n = 1024 | n = 4096 |
|---|---|---|---|
| `PairwiseGravity`, f32 | 17.4 µs | 1.01 ms | 9.92 ms |
| `BarnesHut` θ = 0.5, f32 | 25.1 µs | 419 µs | 3.54 ms |
| `BarnesHut` θ = 1.0, f32 | 15.3 µs | 193 µs | 1.36 ms |
| `PairwiseGravity`, f64 | 18.0 µs | 1.09 ms | 13.3 ms |
| `BarnesHut` θ = 0.5, f64 | 24.7 µs | 412 µs | 3.80 ms |
| `BarnesHut` θ = 1.0, f64 | 21.9 µs | 173 µs | 1.48 ms |

Crossover ~200–256 bodies at θ = 0.5, ~128–256 at θ = 1.0; analysis in
`barnes-hut.md` (Measurements, Cost).

**Native vs wasm (M2.3)**, `cargo xtask bench-wasm` (the same cluster
cases through `engine.wasm` in Node 22, vs criterion's native means):

| | n = 16 | n = 128 | n = 1024 |
|---|---|---|---|
| f32 symplectic, wasm/native | 1.85 | 1.00 | 1.21 |
| f32 Verlet | 1.68 | 1.00 | 1.18 |
| f64 symplectic | 1.60 | 0.91 | 0.91 |
| f64 Verlet | 1.51 | 0.88 | 0.87 |

- **From n = 128 up, wasm runs at native speed** (0.87–1.21×). Physics in
  the browser costs no more than physics natively.
- **At n = 16, wasm is 1.5–1.85× slower:** each `demo_advance` pays fixed
  costs native `World::step` doesn't (the JS→wasm call, the fixed-step
  clock, the render-buffer fill), and with 120 pairs they dominate.
- **f64 wasm beats native by ~10% at large n: unexplained.** Tested and
  refuted: "V8 compiles for this CPU while `cargo bench` targets generic
  aarch64" (`-C target-cpu=native` made native no faster: 1.09 → 1.25 ms
  for f64 symplectic, within noise). Remaining candidates (instruction
  selection, alignment) need hardware counters; noted, not chased.

## The wasm shell

- The accumulator (`FixedStep`) is plain Rust, unit-tested natively against
  its invariant: `steps * dt + leftover == elapsed`, `0 <= leftover < dt`,
  plus clamping and bad (negative/NaN) frame times.
- The `extern "C"` exports have a native round-trip test (create, advance,
  read positions, free; null handles).
- **ABI mirror:** `crates/engine-web/src/abi.rs` owns the `demo_new` codes and
  buffer layout; a test reads `site/js/abi.ts` and fails on any mismatch.
- **Public API snapshots** (`cargo xtask api`, `docs/api/`): each library
  crate's public API (`cargo public-api` on a pinned nightly), checked
  in; `cargo xtask api --check` in pre-push fails while one is stale, so
  a widened surface shows in the PR's diff (`docs/api-audit.md`).
- **Declared types against the real exports** (`xtask/src/abi_check.rs`):
  `cargo xtask site` reads each built `.wasm`'s export table (a small
  parser for the type, import, function and export sections) and compares
  it with the hand-written `engine.d.ts` / `acoustic.d.ts` interfaces:
  every export declared and every declaration exported, the same parameter
  and result counts, `bigint` exactly for `i64`. `tsc` only checks the
  pages against the `.d.ts`; this checks the `.d.ts` against Rust. Not
  covered: the order of same-typed parameters and what a number means.
  Runs in `site`, so `serve`, `smoke` and pre-push all check it.

## Browser smoke test

`cargo xtask smoke` (also in pre-push) builds the site and loads every
demo in headless Chrome, one fresh profile per case, driven over the
DevTools protocol by `xtask/smoke_page.mjs` (it waits for the page's
`SMOKE` line, up to 10 s, then screenshots; audio muted). A page's
`?smoke` mode (`site/js/smoke.ts`) advances 30 frames synchronously,
draws once, counts particle-colored pixels, and logs
`SMOKE ok steps=N particle_px=N`. The cases (the list itself is in
`xtask/src/smoke/cases.rs`; M9's and the swarm pages' are in their docs):

| Page | Cases |
|---|---|
| M0 | default, f64, 500k, panic |
| M1 | orbits in f64 and f32: every panel must step, draw its planet, and report finite energy; the reported pixels are the minimum across panels, so one blank panel fails |
| M2 | the default disk, the unsoftened collapse, the cluster at N = 1024, both scalar panels |
| M3 | both solver panels: the default, and f32 at 100 substeps |
| M4 | the chain's two solver panels; the double pendulum in both comparison modes |
| M5 | the jelly's three panels at the default k, and at rigid on a 4 × 4 grid, where the force panel keeps its finite default |
| M6 | the full box with the broadphase overlay; the break with 5 mm gaps; the cradle at its defaults, and at one substep with eight balls, three pulled |
| M7 | a 12 m/s break; the tunneling preset (no speculation, one substep), where the cue ball passes through the rack |
| A1 | the start of a song rendered by an `OfflineAudioContext` through the real worklet and `acoustic.wasm`: `Check::Sounds` wants finite samples with an audible, unclipped peak, and an onset found for every scheduled note within 10 ms (`SMOKE ok audio_peak=… samples=… song_notes=… onsets=… onset_worst_ms=…`) |
| A2 | A4 on the waveguide plucked at ½: the 2nd harmonic, measured in the rendered audio, at least 20 dB under its neighbors (`missing_db=…`) |
| A3 | a stiff C4 at mf: its 10th partial at least 10 dB louder at its stretched frequency than at the harmonic one (`stretch_db=…`; measured 69.9) |

Lessons that shaped it:

- **Headless rAF pacing is unreliable** (a few frames, then stalls; slower
  with more particles), so smoke mode doesn't use the rAF loop.
- **Console levels and uncaught errors aren't distinguishable** in Chrome's
  stderr, so the page reports a positive result line; a missing line fails.
- **Count particle pixels, not "non-background" pixels**: the ground line
  alone would pass the latter. The 500k blank-canvas bug produced 0
  particle pixels and a `Failed to serialize op` log; the test checks both.
- **Fresh profile per run**: a reused one served stale JS from cache.
- **Wait for the report, not for `load` (A3.6):** Chrome's `--screenshot`
  captures at the page's load event and quits (about 0.5 s) without
  waiting for async work. A1's and A2's offline renders finished inside
  that window; A3's, which designs all 88 keys first, didn't. The DevTools
  driver waits for the line itself.
- **A deep listen backlog (A3.4):** `http.server` queues 5 connections; a
  page requests its dozen modules at once, and on macOS the overflow is a
  reset (`ERR_CONNECTION_RESET` on a module, the page never starts: about
  1 load in 10). `xtask/serve.py` uses 128. Found by listing the pending
  requests over DevTools when a load hung.
- **It catches scene design, not just plumbing (M2.6):** the N = 1024
  cluster case drew 0 pixels because the cluster's per-body masses made
  total mass grow with N, and every body left the view in 0.5 s. The
  cluster now has a fixed total mass.
- **The panic case** (`?smoke&panic`) calls the shipped
  `demo_panic_for_test` export and passes only if the page saw
  `TEST_PANIC_MESSAGE` arrive through the `console_error` import *and*
  Chrome logged the `engine.wasm panicked at` line. The export ships in
  every build so the test checks the real binary. Its panic lives in a
  Rust-ABI helper, because a panic can't unwind out of an `extern "C"` fn
  (Rust aborts), so only the helper is natively testable.

The JS itself gets a syntax check in pre-commit
(`node --input-type=module --check`; plain `node --check` passes ES-module
syntax errors in `.js` files).

## Site JS unit tests

`tests/site/*.test.js`, run by Node's built-in runner (`node --test`, no
dependency) in pre-push, importing the `.ts` modules directly (Node
strips the types): the pure modules and the pure halves of the rest
(`options.ts`, `ring.ts`, the scale math in `plot.ts`, the fade bands in
`trail.ts`, `RateMeter` and `Smoothed`, `divergence.ts`, `perf.ts`'s
cost table, and each later page's scenes and helpers). DOM-touching code
is covered by the browser smoke test instead. The tests live outside `site/`, so they're never served. Note:
`node --test` needs a glob; a directory argument is treated as a module.

## CI

Nightly, not per pull request (`docs/17-nightly-ci.md` has the
reasoning): `.github/workflows/nightly.yml` runs at 07:17 UTC, and only
does anything if `main` has moved since its last successful run.

- **What it runs:** the hook scripts themselves, `.githooks/pre-commit`
  then `.githooks/pre-push`, on `ubuntu-24.04`. Not a copy of their
  commands: a check added to a hook is in CI the same day. A second job
  runs the slow tier, `cargo xtask slow` ("Running strategy").
- **Strict:** `HOOKS_STRICT=1`, so a check whose tool is missing fails
  where locally it is skipped.
- **Same toolchain:** `rustup toolchain install` reads
  `rust-toolchain.toml`, so CI uses the pinned compiler and the goldens
  are checked against it. The tools are pinned too
  (`.github/actions/setup/action.yml`): nextest, machete,
  cargo-public-api, wasmtime.
- **Determinism across machines:** the runner is Linux x86-64, while
  local runs are macOS arm64, so the golden hashes are checked on a
  second CPU architecture and OS every night `main` moves.
- **Screenshots on failure:** the smoke test's `target/smoke/` is
  uploaded as an artifact when a step fails.
- **By hand:** `gh workflow run Nightly` runs everything, whether or
  not `main` moved.
- **What it isn't:** a gate on a pull request. A failure is found after
  the merge and fixed by the next PR; the hooks stay the first line.

## Coverage

```sh
cargo xtask coverage          # needs: cargo install cargo-llvm-cov
```

- **Rust:** `cargo-llvm-cov` (LLVM source-based coverage) runs the
  workspace tests, except xtask's, instrumented, then writes an HTML
  report to `target/llvm-cov/html/index.html` (per file, line by line)
  and prints lines and functions covered per crate. `test-support` and
  math's `#[cfg(test)]` `test_util` are left out of the report: they're
  test tooling. cargo-llvm-cov already drops `tests/` and `foo/tests.rs`.
  The `llvm-tools` component it uses is pinned in `rust-toolchain.toml`.
- **Site JS:** `node --test --experimental-test-coverage` over
  `tests/site` (the test files themselves excluded). Node prints its own
  table. It only lists **modules the tests import**: `dom.ts`, `wasm.ts`,
  `controls.ts`, `smoke.ts`, `page.ts` and the demo pages aren't in it at all, not
  even as 0%.
- **Report only, no thresholds.** Both halves run every time (the JS
  half takes well under a second). Warm run: ~2.5 s; after
  `cargo llvm-cov clean --workspace`: ~4 s.
- **The record, `docs/coverage.md`:** lines and functions covered per
  crate and per file, as of a commit. Every run compares the Rust half
  with it and prints (and under GitHub Actions, adds to the job summary)
  the totals and every file with **more lines or functions missed** than
  the record, plus new files that aren't fully covered. It counts missed
  lines, not percentages, so adding code that's fully covered never reads
  as a drop. It reports; it never fails. One record for every machine:
  coverage depends on the code and the tests, not the machine.
- **`cargo xtask coverage --record`** replaces the record with this run's,
  in a pull request made through GitHub's API (as bench records are,
  `benchmarks.md`): from a commit (it refuses uncommitted changes), after
  a change that moves coverage on purpose.
- **The property tests' seed is fixed in a coverage run**
  (`PROPTEST_RNG_SEED`): proptest draws a new random seed every run, and
  a branch only odd inputs reach (`voices.rs`'s `note_on` refusals) was
  covered on some runs and not others, which the comparison would have
  reported as a change. Seeded, two runs give identical per-file
  reports. Ordinary test runs keep their random seeds.
- **Nightly:** CI's `coverage` job runs it every night `main` moved
  (`17-nightly-ci.md`); the comparison is in that job's summary.

Only the native `cargo test` run counts. The wasm run (`test-wasm`) and
the browser smoke test execute code too, but aren't measured.

**First report (M2.7, measured after M2.6 on the stack):**

| Crate | Lines | Functions |
|---|---|---|
| `math` | 100.00% (65/65) | 100.00% (21/21) |
| `engine` | 98.38% (426/433) | 97.53% (79/81) |
| `web` | 98.33% (236/240) | 97.62% (41/42) |
| Rust total | 98.51% (727/738) | 97.92% (141/144) |

(On `main` before M2.3–M2.6: 97.42% lines, 96.52% functions. The new
code came with its tests, and those tests covered two earlier gaps.)

| Site JS (imported modules only) | Lines | Branches | Functions |
|---|---|---|---|
| `abi.ts`, `options.ts` | 100% | 100% | 100% |
| `ring.ts` | 100% | 94.12% | 100% |
| `loop.ts` | 81.01% | 93.33% | 87.50% |
| `plot.ts` | 43.93% | 87.50% | 75.00% |
| `trail.ts` | 42.47% | 85.71% | 50.00% |
| `canvas.ts` | 27.46% | 50.00% | 0.00% |
| `divergence.ts` | 100% | 100% | 100% |
| `perf.ts` | 80.82% | 100% | 81.82% |
| All listed files | 61.01% | 94.29% | 75.00% |

**What no test executes, and whether it matters:**

- `web` `demo_panic_for_test` (`exports.rs`): can't run natively, since
  a panic can't unwind out of an `extern "C"` fn. Its Rust-ABI helper is
  tested, and the smoke test's panic case runs the export in Chrome. Fine.
- (Closed since: `ZeroSubsteps`'s message was tested in M2.9, and the
  variant itself is gone since `World::new` takes `NonZeroU32`. The f32
  energy gap closed when M2.5 tested every gravity scene in both
  scalars.)
- `engine` `World::substeps()` getter and `Particles::default()`: unused
  accessors. Harmless.
- (Closed since: the never-taken `?` after `World::new` in every scene is
  gone with the `Result`.)
- Site JS: the uncovered lines are drawing code (`canvas.ts`, the
  drawing halves of `plot.ts` and `trail.ts`, `perf.ts`'s HTML and
  `performance.now()` helpers) and `runLoop` (rAF). They
  touch the DOM, so by design they're covered by the browser smoke test,
  not unit tests. The pure halves of those modules are covered.

**Gate: not recommended yet.** The Rust misses are all explained above,
so a number like 97% adds little that reading the HTML doesn't. A "can't
drop" ratchet would trip on harmless changes (a new `Default` impl, an
accessor, a generic instantiated differently), and CI is nightly, not a
gate ("CI"), so nothing would hold a baseline; a local hook would need a
committed number that every PR edits. The JS percentage is mostly a
statement about how much of the site is DOM code, so gating it would
push tests toward the wrong layer. Revisit if per-PR CI arrives, or if a
review ever finds a real bug in code the report showed as unexecuted.

## Against the checklist

`docs/numerical-testing-checklist.md` is a generic plan for a 2D
rigid-body engine. Here's how this repo maps onto it (audited after the
health audit, then filled in):

- **Prerequisites: all met, and beyond.** A fixed timestep (`TimeStep`,
  `FixedStep`), seeded RNGs, no `HashMap` or wall clock in library code,
  shared tolerances (`test_support::Tol`). Determinism is checked twice in
  a process, and **bit-exact across native and wasm**, not within a
  tolerance.
- **Covered, by category:**

  | Checklist | Here |
  |---|---|
  | Math primitives | `math`'s unit tests; `math/tests/properties.rs` (identities bit for bit, unit directions over 1e-30..1e30, and the edge inputs) |
  | Integrators | Free fall per integrator (`invariants.rs`); orbits' energy behavior (`invariants.rs`, `known_failures.rs`); convergence order per integrator, position and velocity (`convergence.rs`) |
  | Broadphase | Unit cases; brute-force superset over uniform, clustered and mixed scenes far from the origin, insertion order (`broadphase_properties.rs`) |
  | Narrowphase | Unit cases; swap, translation, well-formed contacts (`collision/narrowphase/properties.rs`, a unit test so the narrowphase stays crate-private) |
  | Contact solver | Analytic head-on, momentum, energy, stacks, a bullet, fast circles, 1:1e6 (`contacts.rs`); simultaneous contacts, the break and the cradle (`impacts.rs`); goldens of the box, the break and the cradle |
  | Joints and constraints | Rod error bounds, chains, compliant and rigid pendulum periods, soft rods at several passes |
  | World and API | The ABI property tests (`exports/tests/sequences.rs`, every wasm crate); goldens of every demo scene, native and wasm |

- **Not applicable:** mass properties and inertia (point particles and
  circles), polygon narrowphase, friction, sleeping, angular momentum.
- **Outside the checklist:** the acoustic crate, tested in the same styles
  (analytic tuning and decay, FFT against a naive DFT, the bit-exact
  loop-and-waveguide equivalence, energy accounting, goldens); `sand`
  and `swarm`, in theirs (`11-falling-sand.md`, `15-swarm.md`).

## Test runner: nextest

`cargo nextest run` (`cargo install --locked cargo-nextest`) runs the
native tests in the pre-push hook, `cargo xtask slow` and `cargo xtask
coverage`, each falling back to `cargo test` with a note where it isn't
installed. `cargo test` still works as ever by hand.

- **Why:** `cargo test` runs one test binary at a time; nextest runs
  every binary's tests in one pool, one process each, so the long tests
  overlap. Measured (warm): **89 s with `cargo test`, 19 s with nextest**
  (623 tests), after the one 30 s test (the ball box running down) was
  split per solver and restitution, so the longest is now ~15 s.
- **`.config/nextest.toml`:** a test past 15 s is flagged slow; one past
  2 min is stopped, so a hang fails a push instead of stalling it.
- **Not under nextest:** doctests (it can't run them on stable; a `cargo
  test --doc` step follows it, though the workspace has none today), and
  `cargo xtask test-wasm` (a process per test would be a wasmtime start
  per test).

## Running strategy

Three tiers (the checklist's §3):

- **Every push (the pre-push hook, ~60 s warm):** every test at its
  default size (nextest), with property tests at 64 cases; unused
  dependencies (`cargo machete`, when installed; with `HOOKS_STRICT=1`,
  as CI sets, a missing tool fails the hook: `docs/17-nightly-ci.md`);
  the public API
  snapshots; doc links; wasm tests (built at `opt-level = 1`: 88 s became
  15 s); smoke. The mutation report on the push's own lines is **opt-in**
  (`MUTANTS=1`): otherwise the hook prints how many there are and the
  command. It was the unbounded part, and git holds the connection to
  GitHub open, idle, for the whole hook: a stack push of 3–6 minutes was
  dropped by GitHub ("Connection closed by remote host").
- **The slow tier, `cargo xtask slow`:** not in any hook. Nightly CI runs
  it when `main` has moved (54 min on a runner: `17-nightly-ci.md`); by
  hand, before a release.
  - **Every test with each property test at 10 000 cases**
    (`--cases N` to change it).
  - **The long runs:** tests named `slow_*` and marked
    `#[ignore = "slow: …"]`, so plain `cargo test` skips them. The name is
    the filter, so other ignored tests (generators, such as the hammer
    table's) stay out. Today: the integrator orders at 8 halvings, the
    symplectic orbits over 2 000 orbits, the chain for a minute, the
    ants' trails and the evolved constants on every seed, the sand pour
    on every grid, the ball box at e = 0.5 by impulses.
  - **Built with the `slow` profile:** optimized, with debug assertions
    and overflow checks kept, and run under nextest's `slow` profile
    (`.config/nextest.toml`): a test is stopped after an hour, not the
    2 minutes that protect a push. Under the default the tier could not
    pass: the synth's export-sequence property test at 10 000 cases
    takes about 20 minutes (0.13 s a case on Apple silicon), and was
    killed at 2. Expect about 25 minutes in all, nearly all of it that
    test; `--cases 2000` is a 5-minute version.
  - **Its first run found a bug:** a strike refused for its velocity
    silenced the ringing key first. The ABI property test needed 10 000
    cases to draw the sequence (a strike, then a refused restrike of the
    same key); a direct regression test now covers it at every push.
  - **Its first run under nextest found another** (2026-11): a Physarum
    node depositing 2.6e38 a step, finite as an `f32`, summed the field
    to infinity and the concentration read NaN. Deposits are capped
    (`swarm::MAX_DEPOSIT`, for agents, ants and nodes), with the node's
    shrunk case as a regression test.
- **By hand, when it matters:** `cargo xtask coverage`, full mutation
  runs, `cargo bench`.

A new long-running check goes in as a `slow_*` test, with what it
measured written next to its bound, as every tolerance here is.

**Keeping the push tier quick.** Nextest runs tests in parallel, so the
suite's time is about its longest test plus the queue behind it. When
one grows past ~15 s (`slow-timeout` flags it), split it rather than
drop it: the pattern is one representative case on every push and the
full sweep as a `slow_*` test (the ants' seeds, the sand pour's grids),
or, for a property test whose cases are each expensive, fewer cases on
a push (`test_support::proptest_config_with`; the slow tier still runs
10 000). The health pass (2026-11-12) did this for the three longest:
the suite went from 28 s to 22 s, its longest test from 23 s to 13 s.

## Duplication

`cargo dupes` (`cargo install --locked cargo-dupes`) compares functions
by the shape of their syntax trees. Not in a hook: most of what it finds
is meant (one-line getters, an export per setting), so it's a report to
read now and then, not a gate:

```sh
cargo dupes stats  --exclude-tests --exclude target --exclude xtask --min-lines 8
cargo dupes report --exclude-tests --exclude target --exclude xtask --min-lines 8
```

`--min-lines 8` drops the getters and thin ABI adapters. As of the
health pass (2026-11-12): 1.9% of lines in functions of 8 lines or more
are exact duplicates (3.6% before it). What it removed, each to one
definition:

- every `*_set_rate` and `*_set_step_cap` export's parse:
  `FixedStep::set_rate_hz`, `set_cap_steps` (`web-common`), through
  each demo's `clock()`;
- every demo's advance loop: `FixedStep::run`;
- the export-sequence tests' argument strategy: `test_support::hostile_f64`;
- the loaders' budgeted advance and free: `StepBudget.budgeted`,
  `.forgetting` (`site/js/loop.ts`);
- the pixel pages' smoke count: `countOtherThan` (`site/js/pixels.ts`).

What's left is the same shape over different types, where sharing would
need a macro or a trait for a few lines each: the engine's code-to-enum
setters, the swarm demos' parameter slots (`slot`, `param_slot`: one
match per parameter struct), `Boids::get`/`set` beside Vicsek's
`State::get`/`set` (two structs of arrays with different fields), the
checked casts in `math::convert`. Left alone on purpose.

## Mutation testing

Coverage says code ran during a test; mutation testing says whether a
test would notice it breaking. `cargo-mutants` (`cargo install
cargo-mutants`) changes the code one small edit at a time (`<` to `<=`,
`+` to `-`, a body replaced by `()` or a constant), runs the owning
package's tests, and reports each **missed** mutant: one every test
still passed.

- **`cargo xtask mutants [args]`** wraps `cargo mutants` for full runs
  (the compute node): `TMPDIR` set to `$MUTANTS_TMPDIR` or
  `$HOME/.cache/mutants-tmp`, outside the repo (cargo-mutants copies the
  whole tree there per build, has no setting for where, and a quota'd
  `/tmp` failed with "Disk quota exceeded"; a dir inside the workspace is
  refused, since the copy would copy itself); leftover
  `cargo-mutants-*.tmp` build dirs from killed runs removed before and
  after, nothing else touched; `-j 8 --no-shuffle` unless given, and
  `--test-tool nextest` when nextest is installed (unless a tool is
  given); every other argument passed through, and its exit code
  returned.
  - **Why nextest:** measured on the node over one shard (270 mutants,
    `--shard 1/20`, one run each): `cargo test` at `-j 8` 294 s; nextest
    at `-j 8` 197 s, `-j 4` 231 s, `-j 2` 344 s. The same mutants missed
    in all four. Five to seven hammer mutants that timed out under
    `cargo test` did not under nextest and weren't missed: a hung test
    holds its whole binary under `cargo test`, where under nextest
    another test's failure ends the run (inferred, not confirmed from
    the logs). That shard was a contiguous slice heavy in those
    timeouts, so it was run again spread across the workspace
    (`--sharding round-robin`, one run each): `cargo test` at `-j 8`
    626 s; nextest at `-j 8` 365 s (−42%), at `-j 12` 369 s. The gain
    held (it was larger), and more jobs than 8 bought nothing. The
    outcomes of that second sample weren't compared.
  - **Under nextest the push profile's 2-minute stop applies**
    (`.config/nextest.toml`): a test it kills fails the mutant, so the
    mutant counts as caught, where cargo-mutants' own timeout would
    have called it a timeout. Both count as detected.
- **Pre-push (opt-in, informational, never a gate):** without
  `MUTANTS=1` the hook only counts the mutants in the push's changed
  lines and prints the `cargo xtask mutants --in-diff …` command. With
  it, it mutates those lines (up to `MUTANTS_MAX`, default 60, `-j 4`,
  test builds at `opt-level = 1`) and lists what no test caught. Output:
  `mutants.out/pre-push/`.
- **A missed mutant is one of:** a real gap (write the test); dead or
  redundant code (delete it); an **equivalent** mutant, which can't change
  behavior (a least-squares sum's `t − t̄` against `t + t̄`, since the
  deviations sum to zero; `|` against `^` on disjoint bits); or a result
  robust by design (a safeguarded Newton step's slope). Equivalent ones
  stay, noted where they're found.
- **Only the owning package's tests run**, so code that other crates'
  tests check (`test-support`, much of `math`) looks untested. Run those
  with `--test-workspace=true`, or give the crate its own tests.
- **The full run (after A3):** 415 of 3663 missed, about 130 of them for
  that reason. The real gaps it found (soft constraints at several
  passes, the elastic potential, live k and c, three synth controls that
  could do nothing, `pitch` of silence returning 504 Hz) have tests.
- **The second full run (after M9, at 16cea2a):** 442 of 4237 missed
  (31 timeouts, which count as caught). Real gaps, now tested: a strike
  only ever aimed along +x (a lost sign in the spin axis survived); the
  squeezed-ball restitution test passing by insertion order (the object
  ball first in both its contacts, so `union` deleted changed nothing);
  the tunnel counter's segment and wall branches and its search cell;
  the pool table's geometry (55: now checked against WPA §9 directly);
  the spring and spin energies; a blocked respot; the raised double
  pendulum's offset; M9's `keep` (a waiting lava or steam cell alone in
  a still grid, which random grids never produce), chunk skipping (a
  test-only count of visited cells), the move count, the right edge,
  exact colours and the demo's setters. Dead code deleted:
  `Grid::shade_at`, `SandDemo::pixels`. **Equivalent**, new classes:
  bounds a later clamp repeats (a waveguide's `m − 1` before
  `clamped_index`); constants that make two operations agree (`2 · l`
  and `2 / l` at l = 1, `d · d` and `d + d` at d = 2); a larger search
  cell (more candidates, never fewer); a disc's `x + dx` for `x − dx`;
  capacity hints (`Vec::with_capacity`); a skip that's exact by design
  (chunks), now observable only through the visited count.
- **The third full run (after S5, at 4b299dd):** 304 of 5,322 missed
  (41 timeouts). 128 were in `swarm`, new since the last run and never
  triaged; those were gone through one by one:
  - **Real gaps, now tested:** a field's diffusion at the right edge
    wrapping into the next row's first cell (mass was conserved either
    way, so the conservation tests passed); a value left inside a wall;
    `Field::zero`, the sizes, the top share of everything; the ants'
    disc clipping at each edge, the food accounts when painting over
    food and erasing, pheromone removed under a new wall, the nest and
    parameter setters' refusals, and the random-walk baseline's turn
    (nothing checked its range, only that trails beat it); a flock at
    exactly `MAX_BOIDS` and one over, the predator's setter, the
    polarization of off-axis and resting boids; the evolution's mean,
    its population staying the population, σ's schedule (from −x to x it
    passes through exactly 0, so one generation is unmutated copies),
    crossover really mixing two parents, and a golden hash for a whole
    run; `Vicsek::with_particles` wrapping what it's given.
  - **Re-run on those mutants: 147 of 164 caught.** The 17 left are
    equivalent: `is_empty` on collections that are never empty; a
    polarization sum's sign (only its length is used); `<` against `<=`
    where equality has probability zero (a random draw against 0.5) or
    a later bounds check repeats it; a fallback value for an index
    already checked; the last generation skipping a breeding nobody
    reads; one thread taking the threaded path (the same numbers, which
    is the point of it); a tournament's ties (only between NaNs).
  - **The other 176** (`acoustic` 77, `engine` 71, the rest 28) were
    not gone through one by one. Their largest groups were checked
    (`t60`'s least squares, `Chunks::wake`, `count_tunnels`, the
    waveguide's pickup, `colour`, the hammer's slope) and are the
    equivalent classes above, with one gap found and tested: `t60`
    given a window under two samples. The rest are assumed to be what
    the second run left; a mutant-by-mutant pass is still open.
  - Code the health pass rewrote after this run (`Field::diffuse`,
    Physarum's wraps, Vicsek's candidates, the broadphase's cell lookup)
    was tested as it was written, but not mutated: the next full run
    covers it.

- **The fourth full run (2026-11-12, at f687282, on the compute node,
  nextest, 74 minutes):** 475 of 6,947 missed (32 timeouts, 764
  unviable). This time every crate was gone through mutant by mutant,
  and each crate's real gaps were tested in that crate (the per-crate
  run tests a mutant only with its own crate's tests: swarm-web's tests
  don't count for swarm's code):

  | Crate | Missed | Real gaps, tested in | Left after a re-run on those functions |
  |---|---|---|---|
  | `xtask` | 91 | #244 (24 in pure logic; the other 67 wrap commands the hooks run) | 1, equivalent |
  | `swarm` | 121 | #249 | 0 |
  | `swarm-web` | 85 | #250 | 12, equivalent |
  | `acoustic` | 76 | #251 | equivalent only |
  | `engine` | 72 | #252 | 2, equivalent |
  | `math`, `sand`, `sand-web`, `engine-web`, `web-common` | 30 | none: all equivalent | |

  - **Some gaps the earlier passes had called equivalent:** the hammer's
    mean-force slope (Newton converges with a wrong one, so whole blows
    passed; tested directly now), the waveguide's pickup (checked to 2%
    near a peak; now exactly, on a straight line), and tests that sat
    where a wrong formula gives the right answer (one end at the origin,
    a radius of 1, a jump of 2 m where `2 · 2 = 2 + 2`).
  - **A test that couldn't fail:** the short-loop dispersion test was an
    `if let`, so a design that gave up passed it.
  - **New equivalent classes:** for circles on straight paths the
    speculative contact test covers every case the swept one would
    (distance is convex in time), so mutating the swept test changes
    nothing; least-squares sums with the mean subtracted, where a wrong
    mean cancels; the FFT's bit-reversal swap (once per pair, from either
    end); `* DETUNE_CENTS` while it is 1; `math::convert`'s exact-limit
    test, which differs only on 32-bit targets, which mutants don't run
    on; the panic hook, which only the browser smoke test sees.

- **The fifth full run (2026-11-13, at 777de29, after #258's bench
  records and before #261's coverage record):** 351 of 7,124 missed (36
  timeouts, 777 unviable), from 475. The node had pulled `43de4a7`
  mid-run; cargo-mutants copies the source when it starts, so `777de29`
  is what it mutated. Code changed after it (`github.rs`, the coverage
  record) waits for the next run.
  - **Real gaps, now tested:** three in tests written for the fourth
    run (two more origin and symmetry traps: coincident Barnes–Hut bodies
    at the origin, where a bucket's moment is zero whichever way it's
    summed; a pinned contact tested with only the second body pinned),
    a contact's resting speed (`2 |a_rel| h`, never read), and the bench
    command's decisions (which criterion flag, what fails, the
    toolchain and "weren't compared" warnings, the freshness filter),
    pulled out of the command into functions to test them.
  - **Everything else** is the equivalent classes above, crate by crate:
    `xtask`'s remaining misses wrap commands (`cargo`, `git`, `gh`,
    Chrome) that the hooks and real runs exercise.

## Phase 1 test-first order

1. `Vec2` and `Scalar` unit tests.
2. Free fall + static particles → implement `UniformGravity` and symplectic Euler.
3. Momentum + COM → implement `PairwiseGravity`.
4. Orbit energy/radius + explicit Euler known-failure → implement remaining integrators.
5. Determinism + golden hashes.
6. Property tests.
7. Benchmarks.
