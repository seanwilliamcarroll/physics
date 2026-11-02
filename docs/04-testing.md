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
    ...                   // unit tests inline: #[cfg(test)] mod tests
  tests/
    common/mod.rs         // scalar macro, tolerances, scenario builders, state hash
    invariants.rs         // conservation and boundedness
    known_failures.rs     // methods that must misbehave
    determinism.rs        // repeatability + golden hashes
    properties.rs         // proptest
  benches/
    step.rs               // criterion
  proptest-regressions/   // committed: failing seeds replay forever
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
// tests/common/mod.rs
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

Name them for what they demonstrate, e.g.
`explicit_euler_gains_energy_on_orbit`.

Phase 2+ additions from `01-solvers.md`: unstabilized impulse pendulum
stretches; XPBD with 1 substep loses most of its energy; force-based stiff
spring diverges.

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
`q·√q` instead of `powf(1.5)` in `orbit`. Native only so far; the
`wasm32-wasip1` comparison needs `wasmtime` (`cargo xtask test-wasm`,
planned).

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

To verify when set up: proptest's default `fork`/`timeout` features may not
build for WASI. If so, use `default-features = false, features = ["std"]`
for the wasm run.

Golden-hash tests running on both targets give the cross-platform check above.

## Benchmarks

- `criterion` natively: `World::step` for N ∈ {16, 128, 1024} per scalar;
  pairwise gravity in isolation; SoA vs fully split SoA later.
- In the browser: `performance.now()` around `demo_advance`, shown in a
  small on-page overlay (steps/s, ms per step).
- Native vs wasm ratio per benchmark is itself a tracked number.

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
across panels, so one blank panel fails). The
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
`Smoothed`). DOM-touching code is covered by the browser smoke test
instead. The tests live outside `site/`, so they're never served. Note:
`node --test` needs a glob; a directory argument is treated as a module.

## Phase 1 test-first order

1. `Vec2` and `Scalar` unit tests.
2. Free fall + static particles → implement `UniformGravity` and symplectic Euler.
3. Momentum + COM → implement `PairwiseGravity`.
4. Orbit energy/radius + explicit Euler known-failure → implement remaining integrators.
5. Determinism + golden hashes.
6. Property tests.
7. Benchmarks.
