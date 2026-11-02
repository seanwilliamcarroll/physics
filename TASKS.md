# TASKS — M1: Orbits and integrators

Source: `docs/05-roadmap.md` (M1), `docs/04-testing.md` (phase 1
test-first order, steps 3–5), `docs/02-core-types.md` (forces,
integrators), `docs/03-wasm-shell.md` (multiple demos, plots),
`docs/type-invariants.md` (triggers).

**Goal:** why integrator choice matters. One two-body orbit, three
integrators side by side: explicit Euler spirals out, symplectic Euler
wobbles but stays bounded, velocity Verlet is tightest.

**Done when:** a page shows three orbits and one energy-vs-time plot with
three lines, and you can change `dt` with a slider and watch them diverge.

## Workflow

- Each numbered section gets its own branch (`m1/<n>-<name>`) and one PR
  into `main`, merged in order. Each branches from an up-to-date `main`.
- `main` is protected (ruleset `protect-main`): PR required, squash merge
  only, no force pushes, no bypass.
- Merges are done by hand on the GitHub site, never by tooling
  (`gh pr merge`). The next section starts once its predecessor is merged.
- Commit frequently on branches: one commit per logical step (failing tests,
  implementation, refactor). The squash merge keeps `main` at one commit
  per section.
- Hooks gate every commit and push: JS syntax, fmt, clippy `-D warnings`;
  tests, wasm32 check, browser smoke test.
- When a section is done, collapse it here to a one-paragraph summary.

---

## ✅ M0: Hello particles (done, PRs #1–#7)

Workspace (`math`, `engine`, `web`, `xtask`), lint policy and hooks, the
fountain demo with an `f32` render buffer and fixed-timestep accumulator,
raw `extern "C"` exports, `cargo xtask site|smoke|install-hooks`, the
M0 page with HUD and options, and a cleanup pass (magic numbers, ABI
mirror test, JS syntax check, browser smoke test, `FixedStep` rate type).
Details: the PRs, and `docs/lint-policy.md`, `docs/type-invariants.md`.
Open follow-up: choose a license (none yet, so "all rights reserved").

---

## Decisions to review before starting

Recommendations in **bold**; reply on the PR to change any.

1. **Orbit scale: SI at demo scale.** A heavy "star" and a light planet,
   2 m apart, period ≈ 3 s, which needs a star of about 5 × 10¹¹ kg
   (`G M = 4π² d³ / T²`). Positions and velocities stay order 1, so `f32`
   is fine, and SI (decided in M0) holds. Alternative: dimensionless units
   (`G = 1`), which breaks the SI decision.
2. **Velocity Verlet recomputes accelerations every substep (no cache).**
   Two force evaluations per step. A cached `a(x)` from the previous step
   halves that, but goes stale whenever positions change outside the
   integrator (the fountain's respawn teleports particles). Correct first;
   measure the cost in M2's benchmarks before caching.
3. **The `dt` slider sets the physics rate (steps/s), not `dt` directly.**
   `dt = 1 / rate` keeps `FixedStep`'s `NonZeroU32` guarantee; the export
   parses `u32 → NonZeroU32` at the boundary (`docs/type-invariants.md`).
   The UI shows the resulting `dt`. Changing the rate resets the
   accumulator's leftover.
4. **Softening: accept ε, store ε².** Squaring makes a negative ε harmless,
   so no `Softening` type is needed while it's a constant. The type
   (non-negative, since M2 sets ε = 0 on purpose) waits for M2's slider.
5. **Plot relative energy error `(E − E₀) / |E₀|`**, not raw energy: the
   three integrators' curves share a scale, and "0 = perfect" reads at a
   glance.
6. **Trails live in JS** (a ring buffer per panel). They're a rendering
   concern; Rust keeps returning positions only.
7. **Golden hashes run natively only.** The cross-platform check (same
   hash under `wasm32-wasip1`) needs `wasmtime`, which isn't installed.
   Install it (MacPorts: `sudo port install wasmtime`; 50.0.0 is available) and add `cargo xtask test-wasm`
   now, or defer to M2? **Defer**, unless you want the cross-platform
   check in M1.

8. ✅ **Decided: checked JS before section 6** (raised during M1.1). The site JS
   already passes the "few hundred lines" trigger in
   `docs/type-invariants.md` (item 8), and section 6 roughly doubles it.
   **JSDoc types + `tsc --checkJs --noEmit` in pre-commit**, plus an
   `engine.d.ts` for the wasm exports; files stay plain `.js` with no
   build step. Alternatives (`.ts` with a compile step, or nothing) and
   their costs are in that doc. Agreed: its own small PR before
   section 6. The longer-term goal is `.ts` source; see the experiment
   section below.
---

## ✅ 1. Wasm panic hook (done)

A std panic hook (installed once from `demo_new`) sends "panicked at
<file:line>: <message>" through the module's first import,
`env.console_error`, supplied by `site/js/wasm.js`. Imports are
wasm-only, so `crates/web/src/imports.rs` is cfg-gated and pre-commit
gained a wasm32 clippy run; `unsafe` now lives in two FFI modules
(`exports`, `imports`). Tested end to end by a shipped
`demo_panic_for_test` export and a `panic` smoke case (verified to fail
when the hook is missing). `.wasm`: 28,593 → 34,230 B. Decision 8
(checked JS) added for review before section 6.

## ✅ 2. `PairwiseGravity` (done)

`PairwiseGravity` (softened, O(n²), one force vector per pair applied ±,
static particles excluded, ε stored squared, coincident unsoftened pairs
skipped, `split_first_mut` instead of indexing), the CODATA 2018
`GRAVITATIONAL_CONSTANT`, `diagnostics::center_of_mass` (returns `None`
without dynamic mass), and `scenarios::cluster` (rejection-sampled disk,
no trig, so it's bit-identical across platforms). Invariants over 1000
steps of a 16-body cluster: momentum (f64 drift at rounding level) and
center of mass at `P/M`, tolerances ~10x measured; verified to fail when
the reaction force is wrong.

## ✅ 3. Integrators, orbit scenario, energy (done)

`ExplicitEuler` and `VelocityVerlet` (second force pass into a second
scratch buffer, no cache), `Integrator::ALL`; free fall checks each
integrator's exact closed form (`c = +1 / −1 / 0`). Plummer
`gravity_potential` (consistent with the softened force) and
`total_energy`. `scenarios::orbit(integrator, speed_ratio)`: mass from
Kepler's third law (const), circular speed for the softened force, no
`powf`. Orbit tests bound energy by measured error laws, (ωh)² and
(ωh)⁴/4, plus an f32 rounding floor; known failures: explicit Euler
escapes; coarse-dt symplectic Euler precesses (LRL vector) but stays
bounded. Verified tests fail if symplectic Euler's step order is swapped.

## ✅ 4. Determinism and golden hashes (done)

FNV-1a 64 (reference vectors checked independently) over every particle's
state bits; five reference runs (fountain with respawn, cluster, orbit ×
3 integrators) × 2 scalars are repeatable and match committed goldens; a
mismatch prints paste-ready replacements. A 1 nm softening change alters
exactly the f64 orbit hashes. Decision 7: native only; the wasm
comparison waits for `wasmtime`. Also recorded: a proposed controls track
(PID demos C1–C3) in `docs/05-roadmap.md`.

## ✅ 5. Web: scenes, controls, metrics (done)

`Demo` holds a `Scene` (fountain respawns, orbit doesn't); `DEMO_ORBIT`
and integrator codes in the ABI (sync test extended); exports
`demo_set_integrator`, `demo_set_rate` (parses `NonZeroU32` at the
boundary; drops owed time), `demo_energy` (NaN where undefined). Engine:
`World::set_integrator`, `scenarios::orbit_gravity` (single source for
the orbit's force). M0's irrefutable `let DemoKind::Fountain` became a
compile error on cue. `.wasm`: 41,820 B. wasmtime: not installed (MacPorts
has 50.0.0; `cargo install wasmtime-cli` also works).

## 5½. Checked JS (PR, before section 6)

Decision 8: JSDoc types + `tsc --checkJs --noEmit`.

- [ ] `package.json` pinning `typescript` (dev only) and a `tsconfig.json`
      (`checkJs`, `strict`, `noEmit`, ES modules); dependency-policy entry
      in `docs/00-scope.md`.
- [ ] `site/js/engine.d.ts`: the wasm exports and the `env` import, typed.
- [ ] JSDoc annotations across `site/js/` and `demos/m0-hello/`.
- [ ] Pre-commit runs `tsc` (fails if `node_modules` is missing, like the
      Node check); README setup gains `npm ci`.

## 7. M1 cleanup (PR, if needed)

- [ ] Magic-number pass over new code; `docs/type-invariants.md` triggers
      re-checked (softening, rate, integrator codes).
- [ ] Anything that grew awkward.

---

## After M1, before M2: TypeScript experiment

Goal: decide whether to move `site/` from JSDoc-checked `.js` to `.ts`
source (the long-term preference). Time-boxed, on a branch; merge only
if it wins.

- [ ] Convert a slice (e.g. `site/js/` + one demo) to `.ts`; `tsc` emits
      `.js` for the browser, run by `cargo xtask site`.
- [ ] Compare against the JSDoc version: type ergonomics, the edit →
      reload loop, generated files kept out of git, hook and smoke-test
      changes, and what the wasm `engine.d.ts` looks like in each.
- [ ] Record the outcome in `docs/type-invariants.md` (item 8) and adopt
      or drop it before M2's site work starts.

## Out of scope for M1

- Property tests (`proptest`) and benchmarks (`criterion`): M2
- N-body cluster demo, Barnes–Hut, runtime scalar comparison panels: M2
- Constraints and solvers: M3

## Known gap

With no CI, nothing on GitHub's side checks fmt, clippy, or tests: a PR is
only as clean as the hooks on the machine that pushed it, and `--no-verify`
skips them. Branch protection can't require a status check that doesn't
exist. Fine for a solo project; it's the main argument for adding CI later.
