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
rights reserved").

---

## ✅ 1. `crates/math` (done)

`Scalar` (`ZERO`, `ONE`, `from_f64`, `to_f64`, `sqrt`, `abs` + operator
supertraits) for `f32`/`f64`, and `Vec2<S>` (`#[must_use]`; ops, `dot`,
`cross`, `perp`, `length_sq`, `length`). 27 unit tests, each run for both
scalars via `for_each_scalar!` in `test_util.rs`; values chosen to be exactly
representable, so tests assert equality, not tolerances. Compiles for wasm32.

## ✅ 2. `crates/engine` (done)

`Particles<S>` (struct of arrays, private Vecs + slice accessors, `add` /
`add_static`), `Force<S>` + `UniformGravity`, `Integrator::SymplecticEuler`,
`World<S>` (`new` returns `Result`; `acc` scratch in `World`), `diagnostics`
(momentum, kinetic energy), in-house `SplitMix64`, and `scenarios::fountain`.
Invariant tests in `tests/invariants.rs` check free fall against the exact
discrete solution, plus first-order error, static bit-identity, zero `dt`,
and substep equivalence; tolerances are set ~10x above measured error.
`Scalar` gained a `'static` bound (for `Box<dyn Force<S>>`). Integration
tests use a crate-level `#![cfg(test)]` (`docs/lint-policy.md`).

## ✅ 3. `crates/web` (done)

`FixedStep` accumulator (0.25 s clamp; negative/NaN frames ignored; tests
assert the time-conservation invariant), `Demo` with `AnyWorld { F32, F64 }`
and an `f32` render buffer, and `unsafe extern "C"` exports (`demo_new`,
`demo_free`, `demo_advance`, `demo_positions_ptr`, `demo_positions_len`)
with `# Safety` contracts; null handles are harmless. The engine's
`fountain` became a `Fountain` scene with continuous respawn. Release
`.wasm`: 28,593 B (9,998 B gzip), zero imports, recorded in `docs/03`;
smoke-tested in Node.

## ✅ 4. `xtask` (done)

Std-only build helper, run as `cargo xtask <cmd>` via the alias in
`.cargo/config.toml`: `site` (release wasm build → `site/pkg/engine.wasm`,
using the same pinned cargo) and `install-hooks` (`core.hooksPath`). Paths
anchor at the workspace root, so it runs from any directory; argument
parsing is unit-tested. Pre-push wasm check now excludes `xtask`; README
documents both commands.

## ✅ 5. Site: `site/demos/m0-hello` (done)

Native ES modules, no bundler, relative URLs only: `js/wasm.js` (streaming
instantiate, `engine.wasm` resolved via `import.meta.url`, fresh
`Float32Array` view per frame), `js/loop.js` (rAF elapsed time only; Rust
owns the timestep; optional fps cap), `js/canvas.js` (high-DPI backing
store, one `setTransform` for meters/y-up, batched rects). The demo page's
HUD shows display fps vs physics steps/s plus ms per frame in physics vs
draw; an options table with presets is generated from the same `OPTIONS`
object that parses the URL (`scalar`, `n` up to 2M, `seed`, `fps`).
Verified by headless Chrome screenshots and a manual browser check by the
user (fountain correct; physics holds 60 steps/s across display rates).

---

## Cleanup PR (after section 5, before M1)

- [ ] **Magic numbers:** every non-obvious literal in library code becomes a
      named `const` whose doc comment gives its source (paper, spec, or
      derivation). Prefer values derived in code over literals where the
      language can express them, e.g. `1.0_f64.to_bits()` instead of
      `0x3ff0_0000_0000_0000`, `64 - (f64::MANTISSA_DIGITS - 1)` instead of
      `12`. Tests are exempt: inline inputs read better there.
  - Known case: `SplitMix64` (golden-ratio increment from Steele, Lea &
    Flood, OOPSLA 2014; Stafford's "Mix13" multipliers and shifts, 2011).
- [ ] **Enforcement:** clippy has no magic-number lint (verified:
      `clippy::magic_numbers` is unknown). Decide between convention plus a
      review checklist (likely), an `xtask` scan, or a `dylint` custom
      lint. Record the rule in `docs/lint-policy.md`.
- [ ] **JS isn't checked by the hooks.** Add at least `node --check` on
      `site/**/*.js` to pre-commit (no new tooling; Node is already used).
- [ ] General pass over M0 code for anything else that's grown awkward.

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
