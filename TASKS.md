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

## ✅ 1. Tooling: `cargo xtask serve`, TypeScript demo pages (done)

`cargo xtask serve [--port N]` builds, serves (default 8000), and runs
`tsc --watch`; Ctrl-C stops all; a taken port is reported and leaves no
orphaned watcher. The M0 and M1 pages are now `.ts`, so `site/` is all
TypeScript and one `tsconfig.json` both checks (`--noEmit`) and builds;
`tsconfig.build.json` is gone.

## ✅ 2. Dependencies and property tests (done)

`proptest` 1.12.0 via `[workspace.dependencies]`, default features off
(no subprocesses on WASI). Six properties in `tests/properties.rs`, f32
and f64 on the same generated worlds: momentum, finiteness, translation,
exact 90° rotation, permutation, determinism. Proptest found two real
issues: rotation is exact in value, not bits (signed zero), and the f32
momentum tolerance (a constant from one cluster run) was too tight; it's
now an error law, `steps · ε · Σm|v|` (worst seen: 0.26 of it). Both
shrunk cases are committed and replay. Known failure
`unsoftened_close_pass_spikes` (1024 vs 2.8 m/s). `test-wasm` passes
`--nocapture`, so wasm failures print their message.

## ✅ 2⅓. Test layout (done, raised during M2.2)

Every inline `mod tests { … }` moved to `src/<module>/tests.rs` (14
modules; crate roots use `src/tests.rs`). `tests/common/mod.rs` became
`crates/test-support` (tol, orbit, hash, worlds), a dev-dependency, so
the repo has no `mod.rs` and no `dead_code` allowance. Edition 2024
reserves `gen`, so the generators module is `worlds`.

## ✅ 2½. `clap` for xtask (done)

`clap` 4.6.7 (`derive`) via `[workspace.dependencies]`, `xtask` only. The
hand-written parser is gone; gains are typo suggestions, range-checked
`--port`, per-subcommand help, and `debug_assert` of the definition in
tests. `xtask` allows `doc_markdown` (doc comments are `--help` text).
Cost: clean build 0.38 s → 2.35 s, incremental 0.16 s.

## ✅ 3. Benchmarks (done)

`criterion` 0.8.2 (no plotters/rayon) in `benches/step.rs`: O(n²) at
~2 ns/pair; Verlet exactly 2× (M1 decision 2 stands); the per-call body
`Vec` is negligible (no change); f32 only 5–10% faster. `cargo xtask
bench-wasm` (Node, codes from `abi.ts`): wasm matches native from n = 128
(0.87–1.21×), pays fixed per-call costs at n = 16; f64 wasm ~10% faster
than native is unexplained (target-cpu=native hypothesis tested and
refuted). A minimal `DEMO_CLUSTER` + `cluster_gravity` moved up from
section 5 for the wasm side. Also: `thiserror` considered, not adopted.

## ✅ 4. Scenarios and softening (done)

`Softening<S>`: `new(eps) -> Option`, rejecting negative and NaN with one
`>= 0`; ε = 0 is valid. `PairwiseGravity::new` takes it. Scene constants
are checked once (`cluster_gravity`/`orbit_gravity` → `Result`,
`ConfigError::InvalidSoftening`), and `scenarios::gravity(ε)` plus
`World::clear_forces` rebuild a scene's force. The web demo stores the
scene's gravity next to the world for energy readouts. New `disk` (heavy
center, enclosed-mass circular orbits, zero-momentum boost; approximate in
2D, since there's no shell theorem) and `collapse` (cold equal-mass cloud),
both with fixed total mass so time scales don't depend on N. Seven golden
runs; native and wasm agree.

## ✅ 5. Web layer (done)

`DEMO_DISK` (3) and `DEMO_COLLAPSE` (4) are their own kinds rather than a
scenario code on `DEMO_CLUSTER`, so `demo_new` is unchanged; in Rust,
`DemoKind::Gravity(GravityScene)`. `demo_set_softening(d, eps)` parses
`Softening` in `f64` at the boundary (`Softening::cast` carries it to f32),
rejects negative/NaN and the fountain, and the energy readout follows ε.
`.wasm` 58,544 B (gzip 19,926); the disk's sort was the surprise (~7–9 KB),
now unstable and shared with Barnes–Hut.

## 6. Site: the M2 page (PR)

- [ ] `site/demos/m2-cluster/` (`.ts`): f32 and f64 panels of the same
      seeded scene; a divergence plot (decision 6) and an energy plot;
      controls for N (rebuilds), softening (live), scenario, rate, reset.
- [ ] Performance overlay as a shared module: steps/s, ms per step, ms
      per draw, and a small table of measured cost at each N tried, so cost
      growth with N is visible.
- [ ] Smoke cases for the new page; gallery link.
- [ ] Manual check against **Done when**.

## 7. Code coverage (PR, raised during M2.2)

Report coverage to see what's untested; gate on it later, if at all.

- [ ] Rust: `cargo-llvm-cov` (LLVM source-based coverage; a tool install,
      not a crate; policy entry in `docs/00-scope.md`), `llvm-tools`
      component in `rust-toolchain.toml`, and `cargo xtask coverage`:
      HTML report under `target/` plus a summary line per crate.
- [ ] JS: Node's built-in `node --test --experimental-test-coverage` for
      `tests/site` (no dependency). DOM code stays covered by the browser
      smoke test.
- [ ] First report: note anything important that no test executes; decide
      whether to gate (e.g. "coverage can't drop") once we've seen the numbers.

## 8. Stretch: Barnes–Hut (PR, only if time)

- [ ] `docs/barnes-hut.md` first: quadtree, θ, accuracy vs cost.
- [ ] A third panel with θ as a slider.

## 9. M2 cleanup (PR, if needed)

- [ ] Magic-number pass; `type-invariants.md` triggers re-checked.
- [ ] Turn on `unreachable_pub` in `[workspace.lints]`: items marked
      `pub` that aren't exported become `pub(crate)`, so rustc's
      `dead_code` can see them (dead `pub` code is otherwise invisible).
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
