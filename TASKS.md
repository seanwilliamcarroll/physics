# TASKS — M2: N-body cluster

Source: `docs/05-roadmap.md` (M2), `docs/04-testing.md` (phase 1 steps 6–7:
property tests, benchmarks), `docs/type-invariants.md` (the `Softening`
trigger), `docs/03-wasm-shell.md` (rendering cost).

**Goal:** O(n²) cost made visible, softening, and the first **scalar
comparison**: the same cluster in `f32` and `f64` drifting apart over time.

**Done when:** a few hundred bodies run at 60 Hz; f32/f64 panels visibly
diverge; the overlay reports cost growth with N.

## Workflow

- Each numbered section gets its own branch (`m2/<n>-<name>`) and one PR
  into `main`, merged in order. Each branches from an up-to-date `main`.
- `main` is protected (ruleset `protect-main`): PR required, squash merge
  only, no force pushes, no bypass.
- Merges are done by hand on the GitHub site, never by tooling
  (`gh pr merge`). The next section starts once its predecessor is merged.
- Commit frequently on branches: one commit per logical step (failing tests,
  implementation, refactor). The squash merge keeps `main` at one commit
  per section.
- Hooks gate every commit and push: JS syntax, `tsc`, fmt, clippy (native
  and wasm32); tests, `node --test`, `test-wasm`, wasm32 check, browser
  smoke test.
- When a section is done, collapse it here to a one-paragraph summary,
  then list the headings to check nothing else moved.

---

## ✅ M1: Orbits and integrators (done, PRs #8–#17)

Wasm panic hook; `PairwiseGravity`, center of mass, `cluster`; explicit
Euler and velocity Verlet with closed-form and error-law tests ((ωh)²,
(ωh)⁴/4); Plummer potential and energy; the orbit scene; determinism and
FNV-1a golden hashes, confirmed bit-identical on wasm (`cargo xtask
test-wasm`); the M1 page (three panels, log energy plot, rate slider) on
shared `plot`/`trail`/`controls`/`options` modules with `node --test`
unit tests; checked JS, then TypeScript for `site/js` (new pages in
`.ts`). Proposed tracks recorded: controls (PID) and web ideas.
Open follow-up: choose a license.

---

## Decisions to review before starting

Recommendations in **bold**; reply on the PR to change any.

1. **Dev dependencies: `proptest` 1.12.0 and `criterion` 0.8.2**, through
   **`[workspace.dependencies]`** (one pinned version for the workspace;
   the open question in `repo-layout.md`). Both are re-checked: active,
   widely used, under `proptest-rs` / `criterion-rs`.
2. **`proptest` with `default-features = false, features = ["std"]`.** Its
   default `fork`/`timeout` features run each case in a subprocess, which
   WASI doesn't have, and `cargo xtask test-wasm` runs the engine tests on
   WASI. Check in section 2 that the property tests build and pass there.
3. **Native-vs-wasm benchmark ratio: `criterion` natively, plus a small
   Node harness timing the same scenarios through `engine.wasm`** (the M0
   approach, as `cargo xtask bench-wasm`). That's closer to what the
   browser runs than `criterion` under wasmtime, and avoids getting
   `criterion` itself working on WASI.
4. **Changing ε live: `World::clear_forces` + re-add.** The demo's
   softening slider rebuilds the scene's force list rather than mutating a
   `Box<dyn Force>` in place (which would need downcasting or a
   parameter-setting method on every force).
5. **`Softening<S>` becomes a type** (`type-invariants.md` item 2: the
   slider is its trigger). Non-negative, ε = 0 allowed, since M2's demo
   sets it on purpose. `demo_set_softening(d, eps)` parses at the C
   boundary and rejects negative or NaN.
6. **f32-vs-f64 divergence metric: RMS distance between matching bodies**,
   plotted on a log scale. Both panels build the same seeded scene, so the
   only difference at t = 0 is f32's rounding of the initial state, and
   the plot shows that difference growing roughly exponentially (chaos).
7. **The M2 page is `.ts`, and M0/M1 pages convert in the same PR.** Adding
   demo pages to the TypeScript build means gitignoring their emitted
   `main.js`. A pattern that covers some demos but not others gets
   fragile, so convert all three at once (they're already JSDoc-typed).
8. **Scenarios:** keep `cluster`; add **`disk`** (a central heavy body
   with lighter bodies on circular orbits for the enclosed mass, so it
   looks stable before chaos sets in) and **`collapse`** (a cold cloud, all
   at rest, that falls in on itself).
9. **Barnes–Hut stays a stretch:** only if everything else lands, and it
   needs its own design doc first (`docs/barnes-hut.md`).

---

## 1. Tooling: `cargo xtask serve`, TypeScript demo pages (PR)

- [ ] `cargo xtask serve [--port N]`: build the site, then serve it
      (python3 `http.server`) with `tsc --watch` alongside; one Ctrl-C
      stops both. README: "build and serve" becomes one command.
- [ ] Decision 7: `tsconfig.build.json` also emits `site/demos/**/*.ts`;
      convert `m0-hello/main.js` and `m1-orbits/main.js` to `.ts`;
      gitignore `site/demos/**/*.js` (+ maps). Smoke test unchanged in
      what it checks.

## 2. Dependencies and property tests (test first, PR)

`docs/04-testing.md` step 6.

- [ ] `[workspace.dependencies]` with `proptest` (decision 2) and
      `criterion` (section 3); dependency-policy entries re-checked in
      `docs/00-scope.md`.
- [ ] `proptest` strategies in `tests/common`: random particle sets
      (positions in a box, bounded velocities, masses in a range,
      occasionally static).
- [ ] Properties (`tests/properties.rs`), both scalars: pairwise gravity
      conserves momentum for **any** world; finiteness with softening;
      translation invariance; rotation by 90° (`perp`, no trig); permutation
      invariance (the canary for M3's Gauss–Seidel); determinism.
- [ ] Known failure `unsoftened_close_pass_spikes`: with ε = 0, a
      near-head-on encounter produces a velocity spike over a threshold.
- [ ] Commit `proptest-regressions/`; modest default case count, more via
      `PROPTEST_CASES` for longer runs.
- [ ] Confirm the property tests build and pass under `test-wasm`.

## 3. Benchmarks (PR)

`docs/04-testing.md` step 7.

- [ ] `crates/engine/benches/step.rs` (`criterion`): `World::step` for
      N ∈ {16, 128, 1024} per scalar and integrator; `PairwiseGravity`
      alone.
- [ ] `cargo xtask bench-wasm` (decision 3): the same scenarios through
      `engine.wasm` in Node; report the native/wasm ratio per case.
- [ ] Use the numbers on two M1 questions: the per-call mass allocation in
      `PairwiseGravity`, and velocity Verlet's second force pass (M1
      decision 2). Change code only where a measurement says to.
- [ ] Record results in `docs/04-testing.md` (benchmarks section).

## 4. Scenarios and softening (test first, PR)

- [ ] `Softening<S>` (decision 5): non-negative, built from `f64` with a
      `Result`/`Option`; `PairwiseGravity::new` takes it.
- [ ] `World::clear_forces` (decision 4) and a scene-level way to rebuild
      forces with a new ε.
- [ ] `scenarios::disk` and `scenarios::collapse` (decision 8), with
      setup tests (counts, bounds, determinism; disk's launch speeds
      balance the enclosed mass).
- [ ] Golden hashes extended to the new scenarios.

## 5. Web layer (PR)

- [ ] `DEMO_CLUSTER` with a scenario code (`cluster`, `disk`, `collapse`),
      using `n` and `seed`; ABI mirror and sync test.
- [ ] `demo_set_softening(d, eps) -> u32` (parses `Softening` at the
      boundary), `demo_energy` for the cluster scenes.
- [ ] Native tests; `.wasm` size row in `docs/03`.

## 6. Site: the M2 page (PR)

- [ ] `site/demos/m2-cluster/` (`.ts`): f32 and f64 panels of the same
      seeded scene; a divergence plot (decision 6) and an energy plot;
      controls for N (rebuilds), softening (live), scenario, rate, reset.
- [ ] Performance overlay as a shared module: steps/s, ms per step, ms
      per draw, and a small table of measured cost at each N tried, so cost
      growth with N is visible.
- [ ] Smoke cases for the new page; gallery link.
- [ ] Manual check against **Done when**.

## 7. Stretch: Barnes–Hut (PR, only if time)

- [ ] `docs/barnes-hut.md` first: quadtree, θ, accuracy vs cost.
- [ ] A third panel with θ as a slider.

## 8. M2 cleanup (PR, if needed)

- [ ] Magic-number pass; `type-invariants.md` triggers re-checked.
- [ ] Anything that grew awkward.

---

## Out of scope for M2

- Constraints, solvers, and the pendulum duel: M3
- Fixed point: M8
- WebGL rendering (`docs/05-roadmap.md` web track): only if a few hundred
  bodies can't hold 60 Hz on Canvas 2D (M0 measured 100k+ is fine)

## Known gap

With no CI, nothing on GitHub's side checks fmt, clippy, or tests: a PR is
only as clean as the hooks on the machine that pushed it, and `--no-verify`
skips them. Branch protection can't require a status check that doesn't
exist. Fine for a solo project; it's the main argument for adding CI later.
