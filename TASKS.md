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
   Install it (`brew install wasmtime`) and add `cargo xtask test-wasm`
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

## 2. `PairwiseGravity` (test first, PR)

`docs/04-testing.md` step 3: momentum + center of mass, then the force.

- [ ] Tests first (`tests/invariants.rs`, both scalars): a 16-body
      `cluster` conserves momentum over 1000 steps; its center of mass
      moves at constant velocity; two bodies attract equally and oppositely.
- [ ] `diagnostics::center_of_mass` (static particles excluded, like
      momentum).
- [ ] `PairwiseGravity { g_const, softening_sq }`: O(n²), each pair once
      (`i < j`), equal and opposite. `new(g_const, softening)` stores ε².
- [ ] The `i < j` loop under `indexing_slicing`: `split_at_mut` or
      iterator pairs, not indexing; an `#[expect]` only if neither reads
      clearly.
- [ ] `scenarios::cluster(n, seed)` for tests (and M2): bodies in a disk,
      seeded.
- [ ] `G` (CODATA 2018: 6.674 30 × 10⁻¹¹ m³ kg⁻¹ s⁻²) as a cited constant.

## 3. Integrators, orbit scenario, energy (test first, PR)

`docs/04-testing.md` step 4: orbit tests and the explicit Euler known
failure, then the integrators.

- [ ] `scenarios::orbit(...)`: star + planet on a circular orbit, with the
      circular speed computed for the *softened* force (so it really is
      circular). Constants named and derived (decision 1).
- [ ] `diagnostics::gravity_potential(p, &PairwiseGravity)` (Plummer:
      `−G mᵢ mⱼ / √(r² + ε²)`, consistent with the softened force) and
      `total_energy`.
- [ ] Tests first:
  - symplectic Euler: relative energy error bounded over 100 orbits and
    **doesn't trend** (first vs last 10% envelope); radius within a band
  - velocity Verlet: same, with a tighter bound than symplectic Euler
  - known failure `explicit_euler_gains_energy_on_orbit`: energy rises
    monotonically when sampled per orbit; radius grows
  - known failure: symplectic Euler at a coarse `dt` precesses but stays
    bounded
- [ ] `Integrator::ExplicitEuler` and `Integrator::VelocityVerlet`
      (decision 2). `World` asks the integrator whether it needs a second
      force pass.
- [ ] Update `docs/02` (integrator section) with what was built.

## 4. Determinism and golden hashes (PR)

`docs/04-testing.md` step 5.

- [ ] FNV-1a over state bits (`to_f64().to_bits()` per coordinate), in
      `tests/common`, with its own reference-value test.
- [ ] Repeatability: every scenario × scalar × integrator, run twice, is
      bit-identical.
- [ ] Golden hashes for reference runs, committed as constants. On
      mismatch the test prints the new hash and asks whether the change
      was intended.
- [ ] Decision 7: native only, or add `cargo xtask test-wasm` + `wasmtime`.

## 5. Web: scenes, controls, metrics (PR)

- [ ] `Demo` holds a `Scene` enum (`Fountain`, `Orbit`), since only the
      fountain respawns.
- [ ] ABI (`abi.rs` + `abi.js`, sync test extended): `DEMO_ORBIT`,
      integrator codes.
- [ ] Exports: `demo_set_integrator(d, code) -> u32` (1 = ok),
      `demo_set_rate(d, hz) -> u32` (parses to `NonZeroU32`, decision 3),
      `demo_energy(d) -> f64` (total energy as `f64`, the readout).
- [ ] Native tests: set-then-read round trips, bad codes rejected,
      rate change resets the accumulator, energy matches `diagnostics`.
- [ ] `.wasm` size after two new integrators (`docs/03` table).

## 6. Site: shared infrastructure and the M1 page (PR)

The roadmap's "shared demo infrastructure", reused by every later
milestone.

- [ ] `site/js/plot.js`: ring buffer of samples, multiple series, polyline,
      autoscaled y-axis, zero line.
- [ ] `site/js/controls.js`: slider and dropdown helpers wired to
      `demo_set_*`, with the current value displayed.
- [ ] Trails (decision 6): fading position history per panel.
- [ ] `site/demos/m1-orbits/`: three panels (explicit Euler, symplectic
      Euler, velocity Verlet), one energy-error plot with three lines, a
      rate slider shared by all three (showing `dt`), a scalar dropdown,
      reset.
- [ ] Smoke test: `?smoke` support on the new page (pixels across all
      three canvases), new cases in `cargo xtask smoke`.
- [ ] Gallery link; options table like M0's, generated from one `OPTIONS`
      object.
- [ ] Manual check against **Done when**.

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
