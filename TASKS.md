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
- Commit frequently on branches: one commit per logical step (failing tests,
  implementation, refactor). The squash merge keeps `main` at one commit
  per section.
- Clippy warnings fail the commit (`-D warnings` in the pre-commit hook).
- When a section is done, collapse it here to a one-paragraph summary.

---

## ✅ 0. Repo infrastructure (done)

Committed directly to `main`. `doc/` → `docs/`, docs updated to the
`crates/` layout. A Cargo workspace with a placeholder `crates/math`, the
toolchain pinned to 1.99.1, the lint policy below, `.githooks/` (pre-commit:
fmt + clippy; pre-push: test + wasm32 check), and a README. Public repo
created with `main` protected. Verified: hooks reject fmt and lint
violations, and a direct push to `main` is rejected.

Follow-ups: choose a license (the repo currently has none, which means "all
rights reserved"); PR 4 adds `--exclude xtask` to the pre-push wasm check.

---

## Lint policy

Configured in the root `Cargo.toml` (`[workspace.lints]`) and `clippy.toml`;
those files are the source of truth. Every crate opts in with
`[lints] workspace = true`. Summary: `pedantic` on (minus three
notation-hostile lints), library-safety restriction lints denied (`panic`,
`unwrap_used`, `print_stdout`, …), tests exempted via `clippy.toml`'s
`allow-*-in-tests`, and `f32`/`f64::mul_add` disallowed.

Why not a per-crate `#![cfg_attr(not(test), ...)]` block or a macro: a
macro can't emit crate-level `#![...]` attributes (tested), and the
`clippy.toml` test exemptions remove the need to repeat a block in each crate.

Rules that come with it:

- **Integration tests:** clippy only exempts code inside `#[test]` fns or
  `#[cfg(test)]` modules. Shared helpers must be declared
  `#[cfg(test)] mod common;` in each `tests/*.rs` (tested: without it,
  `tests/common/mod.rs` helpers get flagged).
- **`xtask`** is a CLI: `#![allow(clippy::print_stdout, clippy::print_stderr)]`
  at the top of `main.rs`. Cargo can't mix `workspace = true` with per-crate
  overrides, so the override goes in source.
- **`web`:** `#[expect(unsafe_code, reason = "...")]` on the exports module only.
- **`#[must_use]` on value types** (`Vec2`, later `Fixed`, `ParticleId`).
  Discarding one is then a rustc warning at the call site (`v.perp();`), and
  clippy stops asking for `#[must_use]` on each method that returns one.
  Not on containers that are mutated in place (`Particles`, `World`).
  For functions returning plain scalars (`dot -> S`, `len`),
  `must_use_candidate` makes us annotate the function itself (tested:
  without it, `v.dot(w);` compiles silently).
- **Local exceptions** use `#[expect(lint, reason = "...")]`, not `#[allow]`.
  `expect` fails if the lint stops firing, so stale exceptions don't build up.

### Perf and numeric lints: on vs off

| Lint | Group | Decision | Why |
|---|---|---|---|
| `perf` group | default | **on** | Already on by default (e.g. `manual_memcpy`, `large_enum_variant`) |
| `trivially_copy_pass_by_ref` | pedantic | **on** | `Vec2<f32>` is 8 bytes: pass by value |
| `large_types_passed_by_value`, `needless_pass_by_value` | pedantic | **on** | The other direction: don't copy big things |
| `inline_always` | pedantic | **on** | `#[inline(always)]` only with a benchmark to justify it |
| `cast_precision_loss` | pedantic | **on** | `n as f32` loses precision above 2²⁴: relevant for `f32` counts |
| `cast_possible_truncation`, `cast_sign_loss`, `cast_possible_wrap`, `cast_lossless` | pedantic | **on** | Your list; `pedantic` already covers them |
| `float_cmp` | pedantic | **on** | `==` on floats in library code is usually a bug. Tests compare bits with `to_bits()` or use tolerances |
| `suboptimal_flops` | nursery | **off** | Rewrites `a*x + y` into `mul_add` (tested). FMA changes results, so the determinism and golden-hash goals rule it out |
| `imprecise_flops` | nursery | **off** | Suggests `hypot`, `ln_1p`, …: slower libm calls that aren't guaranteed to match across platforms |
| `missing_inline_in_public_items` | restriction | **off** | Generic code (`Vec2<S>`) is monomorphized in the caller anyway, release uses LTO, and rustc already inlines small functions across crates |
| `float_arithmetic` | restriction | **off** | Forbids floats entirely; that's for no-FPU targets |
| `arithmetic_side_effects` | restriction | **revisit at M8** | Flags integer overflow: exactly what Q16.16 `Fixed` needs, but too noisy before then |

---

## 1. `crates/math` (test first, PR)

- [ ] `Scalar` trait: `ZERO`, `ONE`, `from_f64`, `to_f64`, `sqrt`, `abs`,
      plus the operator supertraits from `02`. Impls for `f32` and `f64`.
- [ ] `Vec2<S>`: `new`, `ZERO`, `dot`, `cross`, `perp`, `length_sq`, `length`,
      ops `Add/Sub/Neg/AddAssign/SubAssign`, `Mul<S>`, `Div<S>` (always `v * s`)
- [ ] Unit tests (both scalars): algebra identities, `perp` twice = `-v`,
      `cross(v, v) = 0`, `length` of 3-4-5, `from_f64`/`to_f64` round-trip

## 2. `crates/engine` (test first, PR)

Following steps 1–2 of the "Phase 1 test-first order" in `04-testing.md`.
Pairwise gravity, other integrators, golden hashes, and proptest are M1/M2.

- [ ] `tests/common/mod.rs`: `Tol` trait (f32/f64 tolerances), `for_each_scalar!`
- [ ] Write the failing tests first (`tests/invariants.rs`):
  - free fall matches `x0 + v0 t + ½ g t²` within symplectic Euler's known error
  - static particle (`inv_mass = 0`) is bit-identical after N steps
  - zero `dt` leaves the state unchanged
  - substep equivalence: `substeps = k` ≡ `k` steps of `dt/k`
- [ ] `Particles<S>` (SoA, `ParticleId(u32)`), `Force<S>` trait, `UniformGravity`
- [ ] `Integrator::SymplecticEuler` (enum with one variant for now)
- [ ] `World<S>`: `new`, `add_force`, `step(dt)` with substeps
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

- **Units:** SI (m, kg, s) with a render-space scale factor? (Recommended:
  yes, settle now, since every scenario depends on it.)
- **`[workspace.dependencies]`:** M0 has no dependencies, so defer until
  `proptest`/`criterion` arrive.
- **Where the library lints will bite** (each needs a design answer, not a
  blanket `expect`):
  - `indexing_slicing`: SoA loops like `pos[i] += vel[i] * dt`. Prefer
    `iter_mut().zip(...)`; that's also often what lets the loop vectorize.
    Pairwise `i < j` loops (M1) will need `split_at_mut` or a localized `expect`.
  - `cast_possible_truncation`: `to_f64() as f32` in the render buffer and
    `len() as u32` in `ParticleId` and `demo_positions_len`. Both are intended;
    each gets one `expect` with a reason, inside a small helper.
  - `panic`/`unwrap_used`/`unreachable`: no panics for bad input in library
    code. Constructors like `World::new(substeps = 0)` need a decision:
    `Result`, or a `NonZeroU32` type that rules the bad value out.

## Known gap

With no CI, nothing on GitHub's side checks fmt, clippy, or tests: a PR is
only as clean as the hooks on the machine that pushed it, and `--no-verify`
skips them. Branch protection can't require a status check that doesn't
exist. Fine for a solo project; it's the main argument for adding CI later.

## Out of scope for M0

- CI (GitHub Actions): later, around hosting
- `wasmtime` / `cargo xtask test-wasm`: not installed, not an M0 gate
- Pairwise gravity, explicit Euler/Verlet, plots, controls: M1
