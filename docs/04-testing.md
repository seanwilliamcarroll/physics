# 04 — Testing

Status: **Draft**
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
| `proptest` | Property-based testing with shrinking | Most widely used property-testing crate; maintained under the `proptest-rs` org; 1.11 released March 2026 |
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
| Classic Baumgarte on the 1:100 chain (M4.9, `chains.rs`) | Gains > 100 J in 10 s at 20 substeps, more than at 2 (measured +3398 J vs +15 J) |
| XPBD pendulum in f32, 100 substeps (M3) | Energy differs from f64 by > 0.2 J (f32 *gains* 0.11 J where f64 loses 0.31 J) |

Name them for what they demonstrate, e.g.
`explicit_euler_gains_energy_on_orbit`.

Still to come from `01-solvers.md`: force-based stiff spring diverges
(M5). The whole `01` table is also a regression suite
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

## Running as wasm

Run the same test suite compiled to wasm under `wasmtime` (an external
runtime, not a crate dependency):

```toml
# .cargo/config.toml
[target.wasm32-wasip1]
runner = "wasmtime"
```

```sh
rustup target add wasm32-wasip1
cargo test -p engine --target wasm32-wasip1
```

Verified (M2.2): proptest's default `fork`/`timeout` features run cases in
subprocesses, which WASI doesn't have, so the workspace uses
`default-features = false, features = ["std"]` everywhere.

`cargo xtask test-wasm` passes `--nocapture`: with `panic = abort`, a
failing test kills the process before libtest prints the output it
captured, and the panic message would otherwise be lost.

Golden-hash tests running on both targets give the cross-platform check above.

## Benchmarks

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
  passes). M1 decision 2 (no cached acceleration) stands: M2's few hundred
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
- **ABI mirror:** `crates/web/src/abi.rs` owns the `demo_new` codes and
  buffer layout; a test reads `site/js/abi.js` and fails on any mismatch.

## Browser smoke test

`cargo xtask smoke` (also in pre-push) builds the site and loads the demo
in headless Chrome, one fresh profile per case: M0 (default, f64, 500k,
panic) and M1 (orbits in f64 and f32; every panel must step, draw its
planet, and report finite energy; the reported pixels are the minimum
across panels, so one blank panel fails), and M2 (the default disk, the
unsoftened collapse, and the cluster at N = 1024, both scalar panels),
M3 (both solver panels: the default, and f32 at 100 substeps), and M4
(the chain's two solver panels; the double pendulum in both comparison
modes). The
page's `?smoke` mode (`site/js/smoke.js`) advances 30 frames
synchronously, draws once, counts particle-colored pixels, and logs
`SMOKE ok steps=N particle_px=N`.

Lessons that shaped it:

- **Headless rAF pacing is unreliable** (a few frames, then stalls; slower
  with more particles), so smoke mode doesn't use the rAF loop.
- **Console levels and uncaught errors aren't distinguishable** in Chrome's
  stderr, so the page reports a positive result line; a missing line fails.
- **Count particle pixels, not "non-background" pixels**: the ground line
  alone would pass the latter. The 500k blank-canvas bug produced 0
  particle pixels and a `Failed to serialize op` log; the test checks both.
- **Fresh profile per run**: a reused one served stale JS from cache.
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
dependency) in pre-push: the pure modules (`options.js`, `ring.js`, the
scale math in `plot.js`, the fade bands in `trail.js`, `RateMeter` and
`Smoothed`, and since M2 `divergence.ts` and `perf.ts`'s cost table).
DOM-touching code is covered by the browser smoke test
instead. The tests live outside `site/`, so they're never served. Note:
`node --test` needs a glob; a directory argument is treated as a module.

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
  `controls.ts`, `smoke.ts` and the demo pages aren't in it at all, not
  even as 0%.
- **Report only, no thresholds.** Both halves run every time (the JS
  half takes well under a second). Warm run: ~2.5 s; after
  `cargo llvm-cov clean --workspace`: ~4 s.

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
accessor, a generic instantiated differently), and there's no CI to
hold a baseline; a local hook would need a committed number that every
PR edits. The JS percentage is mostly a statement about how much of the
site is DOM code, so gating it would push tests toward the wrong layer.
Revisit if CI arrives, or if a review ever finds a real bug in code the
report showed as unexecuted.

## Phase 1 test-first order

1. `Vec2` and `Scalar` unit tests.
2. Free fall + static particles → implement `UniformGravity` and symplectic Euler.
3. Momentum + COM → implement `PairwiseGravity`.
4. Orbit energy/radius + explicit Euler known-failure → implement remaining integrators.
5. Determinism + golden hashes.
6. Property tests.
7. Benchmarks.
