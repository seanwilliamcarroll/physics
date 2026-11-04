# TASKS — M6: Colliding masses

Source: `docs/05-roadmap.md` (M6), `docs/06-constraints.md` (both
solvers, warm starting, split impulses), `docs/07-soft-bodies.md` (the
ground clamp contacts replace).

**Goal:** momentum exchange in collisions. Circles that collide, elastic
to inelastic by a restitution slider, in both solvers; and **Newton's
cradle**, which exposes how sequential solvers handle simultaneous
contacts.

**Done when:** a box of bouncing balls keeps its energy at `e = 1` (and
loses it as `e` drops), a free-space collision keeps a flat momentum plot,
and the cradle behaves (or misbehaves) per solver.

## Workflow

- Each numbered section gets its own branch (`m6/<n>-<name>`) and one PR
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
- CI (`.github/workflows/ci.yml`) exists but is **disabled** (your call,
  after #73): the hooks are the only gate. `gh workflow enable CI` turns
  it back on.
- When a section is done, collapse it here to a one-paragraph summary,
  then list the headings to check nothing else moved.

---

## ✅ M1: Orbits and integrators (done, PRs #8–#17)

Panic hook, pairwise gravity, explicit Euler and velocity Verlet with
error-law tests, energy, the orbit scene, golden hashes (bit-identical on
wasm), and the M1 page with shared TypeScript modules.

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

## ✅ M4: Chains and the double pendulum (done, PRs #51–#61)

`Compliance` (a milestone early) and Catto's soft form in the impulse
solver; `Order`; chain and double-pendulum scenes; dragging (`Grab`);
two pages. **Found in review:** classic Baumgarte + warm starting blows up
heavy chains (worse with more substeps); fixed with
`Stabilization::{Baumgarte, Split}` (split by default, pendulum scenes
classic, since split impulses dissipate like XPBD). The original "solid vs
rubbery" showcase was that blow-up; corrected everywhere. Process lessons
carried forward: **every scene's tests check energy**, and **scripted
edits must fail loudly** when their target text is missing (one silently
didn't apply, leaving a test that asserted nothing). License: MIT (#62).

## ✅ M5: Spring–mass jelly (done, PRs #64–#72)

`Stiffness`, `Damping`, `SpringForce` (`k_crit = 4m/h²`, a tested known
failure); damping in both constraint solvers (Macklin eq. 26, Catto
2011); a ground clamp; the jelly as force springs, XPBD and impulse
constraints; a three-panel page with a log stiffness slider to rigid.
**Found:** soft constraints in the impulse solver exploded when
warm-started (now restarted each substep; rigid ones still warm-start);
compliant constraints damp at backward Euler's rate by themselves; an
exploding force jelly leaves the view within a frame or two, so the page
freezes on the last sane frame. **Before M6 (#73):** CI, `UnitVec2`.

---

## Decisions to review before starting

1. **The roadmap's "done when" needs a fix: walls don't conserve
   momentum.** A box's walls push back, so a box of balls' momentum isn't
   flat (it's not supposed to be). So two showcases: **energy** in the
   box (flat at `e = 1`, falling below it), and **momentum** in a
   wall-free, gravity-free scene (a cue ball fired into a cluster),
   flat to rounding in both solvers.
2. **Circles are particles with a radius.** A `radius` column in
   `Particles` (SoA, like `inv_mass`), 0 meaning a point that never
   collides, so every existing scene is unchanged (goldens). No rotation
   in M6 (circles without friction don't need it; M7's spin decides).
3. **Walls are static half-planes** `{ normal: UnitVec2, offset }` in the
   `World`. The M5 ground clamp stays for the jelly (its goldens), and
   isn't how M6's floor works.
4. **Contacts are transient constraints, rebuilt every substep.** A
   `Contact { a, b (particle or wall), normal: UnitVec2, depth }` with
   `C = |x_b − x_a| − (r_a + r_b) ≥ 0`: an *inequality*. XPBD applies a
   correction only while `C < 0`; the impulse solver clamps the
   *accumulated* impulse at ≥ 0 (Catto 2006: clamping each delta
   instead breaks stacks). Detection per substep is the simple, correct
   choice (Macklin 2019 detects once per step with a margin, an
   optimization to measure later).
5. **Warm starting for contacts** in the impulse solver, matched by
   `(a, b)` from the previous substep: M4/M5 kept rigid constraints
   warm-started for exactly this (stacks settle without it only with
   many iterations). XPBD needs none.
6. **Restitution `e` in [0, 1]**, a new `Restitution` param, one per
   world in M6 (per material in M7). Impulse: target normal velocity
   `−e · v_n` from *before* the solve. XPBD: Müller et al. 2020's velocity
   pass after positions settle. Both skip restitution below a small
   approach speed (`~2 g h`), or resting balls jitter forever.
7. **Broadphase: a uniform grid**, cell size the largest diameter,
   rebuilt each substep; tested by proptest as a **superset** of the
   true overlapping pairs (brute force). Sweep-and-prune stays a later
   comparison.
8. **Split impulses for contacts too** (M4's default): penetration is
   corrected positionally, so it doesn't turn into bounce. Classic
   Baumgarte remains selectable (the pendulum lesson again: here it shows
   as balls popping out of each other).
9. **Newton's cradle**: five balls on rods (M3's `DistanceConstraint`,
   rigid), just touching. A sequential solver with one iteration spreads
   the impact (several balls swing out); more iterations or substeps get
   closer to "one in, one out". Shown per solver, with an iterations
   slider; tests record the measured behavior rather than demand the
   ideal (as M4 did for chains).
10. **Pages: two**, as in M4. `m6-collisions`: the box (restitution,
    ball count, a broadphase overlay of grid cells and candidate pairs,
    energy plot) and the free-space momentum shot. `m6-cradle`: the
    cradle, XPBD vs impulse side by side.
11. **Out of M6:** friction, segments and pockets (M7), tunneling
    measurement (M7: M6's speeds are low enough with substeps), polygons
    and rotation (deferred).

---

## ✅ 1. `docs/08-collision.md` (done)

Decisions as adopted, plus three the code forced: **the solver steps any
world that collides** (radius > 0 or walls, not only constraints);
**contacts are their own type** (a wall contact has one body, the
`Constraint` trait two), solved in the same passes after the rods;
**speculative contacts** in the impulse solver (a contact exists when the
gap is less than the pair can close this substep; `v_target = −C/h`), and
so **restitution is a separate pass** after the iterations in both solvers,
from the approach speed recorded before the solve (a speculative contact
stops the ball exactly at the surface, so the next substep sees no
approach). Roadmap "done when" corrected.

## 2. Radius, walls, `Restitution` (PR)

- [ ] `Particles` radius column (0 = no collision; goldens unchanged),
      `World` walls, `Restitution` param (`checked_param!`, [0, 1]).

## 3. Broadphase: uniform grid (PR)

- [ ] Candidate pairs; proptest superset of brute force; cost measured.

## 4. Narrowphase: contacts (PR)

- [ ] Circle–circle, circle–wall → `Contact` (normal, depth); coincident
      centers handled (no direction: `UnitVec2` makes it explicit).

## 5. Contacts in XPBD (PR)

- [ ] Inequality correction, velocity pass with restitution. Tests:
      head-on elastic matches analytic velocities, `e = 0` sticks,
      momentum conserved, resting penetration within tolerance, energy.

## 6. Contacts in the impulse solver (PR)

- [ ] Accumulated clamp, warm starting by pair, restitution target,
      split impulses. The same tests as section 5.

## 7. Scenes (PR)

- [ ] Box of balls, free-space break, Newton's cradle; goldens; energy
      and momentum tests per scene; the cradle's measured behavior per
      solver and iteration count.

## 8. Web layer (PR)

- [ ] Scene constructors, radii and walls for drawing, live
      restitution, broadphase debug buffers (cells, candidate pairs).

## 9. Site: two pages (PR)

- [ ] `m6-collisions` (box + overlay, momentum shot) and `m6-cradle`;
      smoke cases; gallery.
- [ ] Manual check against **Done when** (yours).

## 10. M6 cleanup (PR, if needed)

- [ ] Magic numbers, triggers, `docs/types.md`, small files.

---

## Out of scope for M6

- Friction, cushions (segments), pockets, a cue (M7).
- Tunneling measurement (M7).
- Rotation, polygons, CCD (deferred).
- Web Workers (known gap below).

## Known gaps

**M2 page at N = 4096 (found in review):** about 1 fps. One step of all
three panels costs ~27 ms (f32 and f64 direct, plus Barnes–Hut), so 60 Hz
needs ~1.6 s of compute per second. Every frame then runs the 15 steps
`FixedStep`'s 0.25 s clamp allows (~400 ms). 2048 keeps up (~7 ms per
step). Options: a per-frame step budget, so the sim runs in slow motion
instead of freezing the display; fewer panels at large N; or Web Workers,
one per panel (the panels are independent, so that's real parallelism) and
the main thread only draws. Leaning toward workers; revisit after M2.

**CI is disabled:** `.github/workflows/ci.yml` (added in #73, green on
its runs) is turned off with `gh workflow disable CI`, so nothing on
GitHub's side checks a PR: it's only as clean as the hooks on the machine
that pushed it, and `--no-verify` skips them. `gh workflow enable CI` to
restore it.
