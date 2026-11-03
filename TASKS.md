# TASKS — M4: Chains and the double pendulum

Source: `docs/05-roadmap.md` (M4), `docs/06-constraints.md` ("Extending"),
`docs/01-solvers.md` (mass ratios, the side-by-side demo table).

**Goal:** where the two solver families really diverge. A heavy bob on a
light chain (1:100) stays solid under one solver and goes rubbery under
the other; a double pendulum shows chaos (copies 1e-9 apart, and f32 vs
f64); any particle can be grabbed and dragged with the mouse.

**Done when:** dragging a chain feels solid in one panel and stretchy in
the other at the same cost; the double pendulum divergence is visible.

## Workflow

- Each numbered section gets its own branch (`m4/<n>-<name>`) and one PR
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

## ✅ M3: Pendulum, the solver duel (done, PRs #32–#41)

`docs/06-constraints.md`; `ParticleId`, `Mass`; `Constraint` (geometry
only) and `DistanceConstraint`; XPBD and sequential impulses with
`Baumgarte`; `01`'s table reproduced row for row as regression tests,
plus a finding (f32 XPBD at 100 substeps gains energy: noisy derived
velocities); the pendulum page; `xtask serve` sends `no-store`.
**Audit before M4 (#42–#50):** `docs/types.md`; scenarios, params, demo
and world split into small files with re-exports; shared site modules;
`World::new(NonZeroU32)` can't fail; `cargo doc -D warnings` in pre-push.

---

## Decisions to review before starting

1. **Dragging needs compliance now, a milestone early.** The roadmap's
   drag is a *soft* constraint from the grabbed particle to the cursor;
   a rigid one would yank the chain and, with the impulse solver, inject
   energy. So M4 adopts **`Compliance<S>`** (α ≥ 0, m/N; a `params/`
   type via `checked_param!`) and a compliant `DistanceConstraint`. M5
   then reuses both for springs instead of introducing them.
2. **The impulse solver gets the soft form too** (the question `06` left
   for M5). Catto's soft constraints (GDC 2011) map a spring onto the
   impulse update in the same shape as XPBD:
   `Δλ = −(J v + b + α̃ λ) / (w + α̃)`, `α̃ = α / h²`. The bias `b` differs
   by kind: a **rigid** rod (α = 0) keeps today's Baumgarte `b = (β/h) C`
   with the β setting (so goldens are unchanged); a **compliant** one uses
   its spring's own bias, `b = C / h` (Catto's mapping with no damper:
   `γ = α/h²`, bias factor 1). Both solvers then mean the same physical
   stiffness `k = 1/α`. The alternative, "impulse is rigid-only", would
   make the drag panel impossible to compare. (Damping: none in M4; M5's
   springs decide.)
3. **The drag anchor is a static particle the page moves.** Grab: the
   world adds a static particle at the cursor and a compliant rod of rest
   length 0 to the nearest particle (within a pick radius). Drag: the
   anchor's position is set each frame. Release: both are removed. Needs
   `Particles::set_static_position(id, pos)` (static only, checked), a
   way to remove the last constraint and particle (a small `pop`, not
   general removal, so `ParticleId` stays a plain index), and a rest
   length of 0, whose gradient is undefined exactly when C = 0 (already
   handled: `evaluate` returns `None`, the solvers skip).
4. **Picking happens in Rust**, nearest particle to the cursor within a
   radius: `demo_grab(d, x, y, radius) -> i32` (index or −1),
   `demo_drag(d, x, y)`, `demo_release(d)`. Rust has the positions in its
   own scalar; JS only converts the pointer to world coordinates
   (`View.toWorld`, pure and unit-tested).
5. **Constraint rendering:** the page needs to know which particles are
   joined. `demo_links_ptr/len` exposes `[a0, b0, a1, b1, …]` as `u32`
   (rebuilt only when constraints change), so the renderer draws lines
   without knowing scene topology.
6. **Iteration order: `Order::{Forward, Reverse, Alternating}`** on
   `Constraints` (where the audit put solver settings), default Forward
   (goldens unchanged). Alternating flips every iteration, a cheap way to
   cancel Gauss–Seidel's directional bias along a chain.
7. **The permutation canary.** `properties.rs` checks that shuffling
   bodies changes results only by rounding. With constraints, Gauss–Seidel
   order is part of the method, so a shuffled chain gives a genuinely
   different (but valid) answer. The existing property stays for
   unconstrained worlds; a new one for constrained worlds asserts a
   *bounded* difference (both runs keep the chain within the solver's
   error bound) and the doc says why exact invariance is gone.
8. **Scenes:** `chain(links, mass_ratio)` (pinned at one end, links of
   equal length, light links and a bob `mass_ratio` times heavier;
   1:100 is the roadmap's case) and `double_pendulum(offset)` (two rods,
   released horizontal; `offset` nudges the tip, 1e-9 m for the chaos
   demo). Both take a solver and substeps like `pendulum`.
9. **Two pages:** `m4-chain` (XPBD vs impulse panels on the same chain,
   drag in either, mass-ratio and iteration controls, length-error plot)
   and `m4-double-pendulum` (two copies 1e-9 apart, or f32 vs f64, tip
   trails, log divergence plot). Default solver for the double pendulum:
   impulse with 20 substeps, the one `01` measured nearly energy-
   conserving (chaos needs the energy to stay put).
10. **Shared pointer module** (`site/js/pointer.ts`): pointer events →
    world coordinates through `View`, with pointer capture so a drag
    survives leaving the canvas. Touch works through pointer events too.

---

## 1. `docs/06-constraints.md` update (PR)

- [ ] Compliance in both solvers (decisions 1–2), iteration order (6),
      the drag design (3–5), the permutation property (7).

## 2. Compliance (test first, PR)

- [ ] `Compliance<S>` in `params/`; compliant `DistanceConstraint`
      (`with_length` for rest length 0, compliance argument).
- [ ] Impulse soft form; α = 0 bit-identical to today (goldens).
- [ ] Tests: a compliant rod's small-oscillation period matches
      `2π √(m α)` in both solvers (within a measured tolerance).

## 3. Iteration order and the permutation property (test first, PR)

- [ ] `Order::{Forward, Reverse, Alternating}`, `World::set_order`.
- [ ] Constrained-world permutation property (bounded difference).

## 4. Chains and the double pendulum (test first, PR)

- [ ] `scenarios::chain`, `scenarios::double_pendulum`.
- [ ] Chain length error under 1:100, per solver (the roadmap test),
      recorded against substeps and iterations.
- [ ] Double pendulum: copies 1e-9 apart separate (to > 1 cm) within a
      few seconds; f32 vs f64 likewise. Golden hashes.

## 5. Dragging (test first, PR)

- [ ] `Particles::set_static_position`, the pop operations, grab / drag /
      release on `World` or `Demo` (decide in code review).
- [ ] Tests: grab picks the nearest within radius; release restores the
      world's constraint and particle counts exactly; a dragged chain
      follows the anchor.

## 6. Web layer (PR)

- [ ] `DEMO_CHAIN`, `DEMO_DOUBLE_PENDULUM`; grab/drag/release exports;
      `demo_links_ptr/len`; `demo_set_order`; ABI mirror; size row.

## 7. Site: the M4 pages (PR)

- [ ] `pointer.ts` (+ `View.toWorld`, unit-tested), constraint lines and
      tip trails, `m4-chain` and `m4-double-pendulum`, smoke cases,
      gallery links.
- [ ] Manual check against **Done when** (yours).

## 8. M4 cleanup (PR, if needed)

- [ ] Magic numbers, `type-invariants.md` triggers (`Compliance` adopted;
      `UnitVec2`?), `docs/types.md` kept current, awkward bits.

---

## Out of scope for M4

- Force-based springs and soft bodies (M5); M4 only adds compliance.
- Contacts (M6+). General particle removal (generational `ParticleId`).
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
