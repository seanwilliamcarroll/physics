# TASKS — M0: Hello particles

Source: `docs/05-roadmap.md` (M0), `docs/repo-layout.md` (bootstrapping order),
`docs/02`–`04` (types, wasm shell, tests).

**Goal:** particles launched with random velocities arc under gravity in the
browser, at the same speed on 60 Hz and 120 Hz displays.

Where docs disagree, `repo-layout.md` wins (it is newer): `Scalar`/`Vec2` live
in `crates/math`, not `engine`.

## Workflow

- Sections 1–5 each get their own branch (`m0/1-math`, `m0/2-engine`, …)
  and one PR into `main`, merged in order. Each branches from an
  up-to-date `main`.
- `main` is protected (ruleset `protect-main`): PR required, squash merge
  only, no force pushes, no bypass.
- Merges are done by hand on the GitHub site, never by tooling
  (`gh pr merge`). The next section starts once its predecessor is merged.
- Commit frequently on branches: one commit per logical step (failing tests,
  implementation, refactor). The squash merge keeps `main` at one commit
  per section.
- Clippy warnings fail the commit (`-D warnings` in the pre-commit hook).
- When a section is done, collapse it here to a one-paragraph summary.

---

## ✅ 0. Repo infrastructure (done)

Committed directly to `main`. `doc/` → `docs/`, docs updated to the
`crates/` layout. A Cargo workspace with a placeholder `crates/math`, the
toolchain pinned to 1.99.1, the lint policy (`docs/lint-policy.md`),
`.githooks/` (pre-commit: fmt + clippy; pre-push: test + wasm32 check), and
a README. Public repo created with `main` protected. Verified: hooks reject fmt and lint
violations, and a direct push to `main` is rejected.

Follow-ups: choose a license (the repo currently has none, which means "all
rights reserved"); PR 4 adds `--exclude xtask` to the pre-push wasm check.

---

## ✅ 1. `crates/math` (done)

`Scalar` (`ZERO`, `ONE`, `from_f64`, `to_f64`, `sqrt`, `abs` + operator
supertraits) for `f32`/`f64`, and `Vec2<S>` (`#[must_use]`; ops, `dot`,
`cross`, `perp`, `length_sq`, `length`). 27 unit tests, each run for both
scalars via `for_each_scalar!` in `test_util.rs`; values chosen to be exactly
representable, so tests assert equality, not tolerances. Compiles for wasm32.

## 2. `crates/engine` (test first, PR)

Following steps 1–2 of the "Phase 1 test-first order" in `04-testing.md`.
Pairwise gravity, other integrators, golden hashes, and proptest are M1/M2.

- [ ] `tests/common/mod.rs`: `Tol` trait (f32/f64 tolerances), `for_each_scalar!`
- [ ] Write the failing tests first (`tests/invariants.rs`):
  - free fall matches `x0 + v0 t + ½ g t²` within symplectic Euler's known error
  - static particle (`inv_mass = 0`) is bit-identical after N steps
  - zero `dt` leaves the state unchanged
  - substep equivalence: `substeps = k` ≡ `k` steps of `dt/k`
- [ ] `Particles<S>` (SoA, private Vecs + slice accessors; `add(pos, vel, mass)`
      and `add_static(pos)`; `ParticleId` deferred to M3), `Force<S>` trait,
      `UniformGravity`
- [ ] `Integrator::SymplecticEuler` (enum with one variant for now)
- [ ] `World<S>`: `new(..) -> Result<_, ConfigError>` (rejects `substeps = 0`),
      `add_force`, `step(dt)` with substeps; `acc` scratch lives in `World`
- [ ] `diagnostics`: `momentum`, `kinetic_energy` (static particles excluded)
- [ ] `scenarios`: `fountain(n, seed)`, particles with random upward velocities.
      Needs a small in-house PRNG (e.g. SplitMix64) because of the dependency
      policy. Seeded, so it's deterministic.

## 3. `crates/web` (cdylib, PR)

- [ ] `demo.rs`: `Demo { world: AnyWorld, render_buf, accumulator, dt }`,
      `AnyWorld { F32, F64 }`, `advance(elapsed) -> u32`, `fill_render_buf`
- [ ] Native unit tests for `advance`: clamp at 0.25 s, step counts for odd
      elapsed times, no drift over many frames, 60 Hz vs 120 Hz frame
      sequences produce the same step count over 1 s
- [ ] `lib.rs`: one-line `extern "C"` exports (`demo_new`, `demo_free`,
      `demo_advance`, `demo_positions_ptr`, `demo_positions_len`), each
      `unsafe` with a `// SAFETY:` comment
- [ ] Record the release `.wasm` size (baseline for "measure size per scalar")

## 4. `xtask` (PR)

- [ ] Add `"xtask"` to workspace `members`; add `--exclude xtask` to the
      pre-push wasm check (a host-only CLI doesn't need to build for wasm)
- [ ] `cargo xtask site`: release build of `web` for wasm32, then copy it to
      `site/pkg/engine.wasm`
- [ ] `cargo xtask install-hooks`: set `core.hooksPath`
- [ ] `.cargo/config.toml` alias: `xtask = "run -p xtask --"`

## 5. Site: `site/demos/m0-hello` (PR)

- [ ] `site/js/wasm.js` (instantiateStreaming), `loop.js` (rAF → `demo_advance`),
      `canvas.js` (world→screen with y-up flip, high-DPI backing store,
      batched `fillRect`)
- [ ] `site/demos/m0-hello/{index.html,main.js}`: relative URLs only
- [ ] `site/index.html`: gallery linking to the demo
- [ ] Manual smoke test: `python3 -m http.server -d site`, check it at 60 Hz
      and 120 Hz (or with a throttled rAF)

---

## Decisions to make during M0 (from the docs' open questions)

- ~~**Units**~~: decided, SI (m, kg, s) with a render-space scale factor.
- ~~**Engine API**~~: decided before section 2 and recorded in `docs/02`:
  `World::new` returns `Result`, `add` + `add_static`, `ParticleId` deferred.
- **`[workspace.dependencies]`:** M0 has no dependencies, so defer until
  `proptest`/`criterion` arrive.
- **Where the library lints will bite** (each needs a design answer, not a
  blanket `expect`):
  - `indexing_slicing`: SoA loops like `pos[i] += vel[i] * dt`. Prefer
    `iter_mut().zip(...)`; that's also often what lets the loop vectorize.
    Pairwise `i < j` loops (M1) will need `split_at_mut` or a localized `expect`.
  - `cast_possible_truncation`: `to_f64() as f32` in the render buffer and
    `len() as u32` in `demo_positions_len`. Both are intended; each gets one
    `expect` with a reason, inside a small helper.

## Known gap

With no CI, nothing on GitHub's side checks fmt, clippy, or tests: a PR is
only as clean as the hooks on the machine that pushed it, and `--no-verify`
skips them. Branch protection can't require a status check that doesn't
exist. Fine for a solo project; it's the main argument for adding CI later.

## Out of scope for M0

- CI (GitHub Actions): later, around hosting
- `wasmtime` / `cargo xtask test-wasm`: not installed, not an M0 gate
- Pairwise gravity, explicit Euler/Verlet, plots, controls: M1
