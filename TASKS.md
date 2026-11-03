# TASKS — M3: Pendulum, the solver duel

Source: `docs/05-roadmap.md` (M3), `docs/01-solvers.md` (the two families
and the measured table), `docs/type-invariants.md` (the mass-type and
`ParticleId` triggers both fire in M3).

**Goal:** `01-solvers.md` made interactive. An impulse-based solver and
XPBD on a single pendulum, side by side: rod stretch with β = 0,
Baumgarte tuning, XPBD's energy loss, and substeps as the great equalizer.

**Done when:** two pendulums swing side by side with live rod-error and
energy plots, and every row of the `01` table can be reproduced with the
controls.

## Workflow

- Each numbered section gets its own branch (`m3/<n>-<name>`) and one PR
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

Panic hook, pairwise gravity, explicit Euler and velocity Verlet with
error-law tests, energy, the orbit scene, golden hashes (bit-identical on
wasm), and the M1 page with shared TypeScript modules. Open follow-up:
choose a license.

## ✅ M2: N-body cluster (done, PRs #18–#31)

`cargo xtask serve`; TypeScript everywhere; proptest suite (six
properties, two real bugs found); test layout (`foo/tests.rs`,
`test-support`); `clap` for xtask; criterion + `bench-wasm` (~2 ns/pair,
wasm ≈ native from N = 128); `Softening` and `OpeningAngle` types;
`clear_forces`; disk and collapse scenes (fixed total masses; the cluster
too, after the smoke test caught it flinging bodies away at N = 1024);
`demo_set_softening`/`demo_set_theta`; the M2 page (f32 / f64 / f64
Barnes–Hut panels, divergence, energy, per-N cost with ns/pair);
`cargo xtask coverage` (98.5% Rust lines, no gate); `unreachable_pub`;
Barnes–Hut (design doc, Morton-key quadtree, crossover ~200–256 bodies at
θ = 0.5). `.wasm` 75.9 KB. Lesson recorded: generic sorts compile per
type (~7 KB each).

---

## Decisions to review before starting

1. **Constraints describe geometry only** (`01-solvers.md`): a
   `Constraint<S>` trait evaluates `C(x)` and `∇C(x)` for the particles it
   touches, plus its compliance α. First and only one in M3:
   `DistanceConstraint { a, b, length, compliance }`. **No
   `PinConstraint`:** a pin is a distance constraint to a static particle
   (`add_static`, `inv_mass = 0`), which both solvers handle for free.
2. **Solver: an enum, not a trait object**, like `Integrator`:
   `Solver::{Xpbd, Impulse}`, with β a separate `Baumgarte<S>` setting
   (revised in `06-constraints.md`: keeps `Solver` non-generic). Two known solvers; the closed set
   gives exhaustive matches, no `dyn`, and an easy `demo_set_solver` code.
   The `01` sketch (`trait Solver`) predates the `Integrator` precedent;
   revisit if a third solver appears.
3. **How a solver relates to the integrator.** Each solver *is* a way
   of stepping, so with constraints present the solver owns the step:
   - XPBD: predict `x* = x + h v + h² a`, project constraints (λ per
     substep), then `v = (x − x_prev) / h`.
   - Impulse: `v += h a`, solve velocity constraints (with Baumgarte bias
     β·C/h, accumulated λ, warm-started), then `x += h v`.

   Proposal: `World` gets `constraints` and a `Solver`. With no
   constraints, the integrator steps exactly as today, so every M0–M2
   golden is unchanged. With constraints, the solver steps and the
   integrator setting is ignored (documented, and tested so it can't
   silently half-apply).
4. **Per-solver state lives in the world, next to the constraints:** one
   λ per constraint (`Vec<S>`, same order), reset per substep by XPBD and
   kept across steps by the impulse solver for warm starting. Switching
   solvers resets it.
5. **`ParticleId` (deferred since M0): a plain index newtype, no
   generation.** Constraints need to name particles; `Particles::add`
   returns a `ParticleId`. Nothing can be removed in M3, so a stale id
   can't exist yet. The generational handle waits for removal
   (`type-invariants.md` item 5 keeps that trigger).
6. **Mass types (`type-invariants.md` item 1): the trigger fires.** Both
   solvers weight corrections by `inv_mass`, so a bad mass corrupts every
   constraint it touches. Proposal: `Mass<S>` (positive, finite) taken by
   `Particles::add`; `add_static` stays the only way to get `inv_mass = 0`.
   Cost: every `add` call site (scenarios, tests, proptest) changes; done
   as its own section so the churn is reviewable apart from the solvers.
7. **Iterations and substeps are both controls.** Substeps already exist
   (`World::new`); iterations (Gauss–Seidel passes per substep) are new and
   matter only from M4 (one constraint converges in one pass), but the
   control is cheap and the `01` table needs neither more nor less.
8. **The `01` table as a regression test**, one test per row, with
   tolerances set from our measured values (the `01` numbers came from a
   standalone script, so ours may differ in the second digit; any
   difference is recorded, not hidden). Known failures:
   `impulse_without_baumgarte_stretches`,
   `xpbd_single_substep_loses_energy`.
9. **The page is f64 by default with an f32 option** (as M1). Two panels,
   one per solver, plus plots of rod-length error (log) and energy.
10. **Out of scope, unchanged:** the 4096-body known gap (Web Workers) stays
    parked; it doesn't block M3.

---

## ✅ 1. `docs/06-constraints.md` (done)

Two-body `Constraint<S>` trait (C, ∇C, compliance), solvers generic over
it with concrete storage (`Vec<DistanceConstraint>`, no `dyn`);
`DistanceConstraint::between` takes its rest length from current positions
(no invalid length) and is rigid-only until M5's `Compliance`;
`add_constraint` checks ids (`UnknownParticle`). `Solver::{Xpbd, Impulse}`
plus `Baumgarte<S>` (0 ≤ β ≤ 1), `set_iterations`/`set_substeps` take
`NonZeroU32`. With constraints the solver owns the step (XPBD with no
constraints wouldn't even match symplectic Euler bit for bit). λ per
constraint, reset per substep (XPBD) or warm-started (impulse).

## ✅ 2. `ParticleId` and `Mass<S>` (done)

`ParticleId`: a plain index newtype that only the engine constructs;
`add`/`add_static` return it (not `#[must_use]`: most callers ignore it).
`Mass<S>`: `new(m) -> Option`, requiring `m > 0`, finite, and `1/m`
finite and `> 0` (the last can only fail on fixed point, where it would
silently make a particle static). It stores the exact `1/m`, so goldens
are unchanged. `ConfigError::InvalidMass` for scene masses; `kg()` test
shorthands (one for unit tests, one in `test-support`). Built by a
subagent.

## ✅ 3. Constraints and XPBD (done)

`Constraint<S>` (`evaluate -> (C, Option<∇C>)`: C stays readable for
coincident bodies) and `DistanceConstraint::between`; `World` constraints,
λ, `Solver::Xpbd`, `set_iterations`/`set_substeps` (`NonZeroU32`),
`add_constraint` rejecting foreign ids (`UnknownParticle`). With
constraints the solver owns the step (integrator ignored, tested);
without, goldens are unchanged. Diagnostics: `constraint_error`,
`uniform_gravity_potential`. `scenarios::pendulum`. XPBD holds the rod to
8 ulps, and energy lost over 10 s matches `01`: 8.791 / 1.454 / 0.312 J at
1 / 20 / 100 substeps (table 8.8 / 1.46 / 0.31). Golden for the XPBD
pendulum, native and wasm.

## ✅ 4. Impulse solver (done)

`Solver::Impulse`: kick, warm start, velocity solve with bias `(β/h) C`,
drift; `Baumgarte<S>` in `[0, 1]`, default 0.2 (Box2D v2). `01`'s table
is a regression suite (`tests/solver_table.rs`) and every row
reproduces. Known failures: `impulse_without_baumgarte_stretches`,
`xpbd_single_substep_loses_energy`, and a new one,
`xpbd_f32_substeps_derive_noisy_velocities` (f32 XPBD at 100 substeps
gains energy). Goldens for both solvers, native and wasm.

## 5. Web layer (PR)

- [ ] `DEMO_PENDULUM`, `demo_set_solver`, `demo_set_beta`,
      `demo_set_substeps`, `demo_set_iterations` (parsed at the boundary),
      `demo_constraint_error`; ABI mirror; size row.

## 6. Site: the M3 page (PR)

- [ ] `site/demos/m3-pendulum/`: XPBD and impulse panels, rod drawn,
      rod-error and energy plots, controls (β, substeps, iterations,
      scalar, rate, reset), presets for each row of the `01` table, smoke
      cases, gallery link.
- [ ] Manual check against **Done when** (yours).

## 7. M3 cleanup (PR, if needed)

- [ ] Magic numbers, `type-invariants.md` triggers (`UnitVec2`: M3 adds
      the first `x / |x|` in a constraint gradient), awkward bits.

---

## Out of scope for M3

- Chains, mass ratios, mouse dragging, double pendulum (M4).
- Springs and soft bodies (M5), contacts (M6+).
- Web Workers for the M2 page (known gap below).

## Known gaps

**M2 page at N = 4096 (found in review):** about 1 fps. One step of all
three panels costs ~27 ms (f32 and f64 direct, plus Barnes–Hut), so 60 Hz
needs ~1.6 s of compute per second. Every frame then runs the 15 steps
`FixedStep`'s 0.25 s clamp allows (~400 ms). 2048 keeps up (~7 ms per
step). Options: a per-frame step budget, so the sim runs in slow motion
instead of freezing the display; fewer panels at large N; or Web Workers,
one per panel (the panels are independent, so that's real parallelism) and
the main thread only draws. Leaning toward workers; revisit after M2.

**No CI:** with no CI, nothing on GitHub's side checks fmt, clippy, or tests: a PR is
only as clean as the hooks on the machine that pushed it, and `--no-verify`
skips them. Branch protection can't require a status check that doesn't
exist. Fine for a solo project; it's the main argument for adding CI later.
