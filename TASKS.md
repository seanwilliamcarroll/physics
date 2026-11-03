# TASKS — M5: Spring–mass jelly

Source: `docs/05-roadmap.md` (M5), `docs/06-constraints.md` (compliance in
both solvers, M4), `docs/01-solvers.md` ("very stiff spring" row).

**Goal:** stiffness vs stability. Force-based springs explode past a
critical stiffness; compliant constraints stay stable at any stiffness,
up to fully rigid.

**Done when:** sliding stiffness up blows up the force-based jelly and
merely firms up the constraint-based one.

## Workflow

- Each numbered section gets its own branch (`m5/<n>-<name>`) and one PR
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

---

## Decisions to review before starting

1. **The threshold is a formula, so it's a test.** Symplectic Euler on a
   spring is stable only while `ω h < 2` (`ω = √(k/m)`, `h` the substep):
   **`k_crit = 4 m / h²`**. Known failure
   `explicit_spring_diverges_above_critical_stiffness`: stable at
   0.9 `k_crit`, energy grows without bound at 1.1. A grid fails earlier
   (its stiffest mode is faster than one spring's); measured, recorded,
   and shown on the page.
2. **Two new parameter types** (`params/`, `checked_param!`):
   `Stiffness<S>` (k > 0, finite: a force-based spring can't be rigid) and
   `Damping<S>` (c ≥ 0, N·s/m). Compliant constraints keep `Compliance`
   (α = 1/k, and α = 0 is rigid). The page's one stiffness slider maps to
   both: log scale over orders of magnitude, with a "rigid" end that only
   the constraint panels can reach.
3. **`SpringForce`**: a `Force` over a list of springs `(a, b, rest, k, c)`,
   Hooke plus damping along the spring (`c · (v_b − v_a) · n`), equal and
   opposite (momentum to rounding). Stepped by the integrator like every
   force, so the explosion is the integrator's.
4. **Damping in the constraint solvers too**, so the comparison is fair
   (an undamped jelly wobbles forever; a damped force spring against
   undamped constraints compares damping, not stability). XPBD: Macklin
   et al. 2016's damped form (`γ = α̃ β̃ / h`); impulse: Catto 2011's full
   soft form with the damper (`γ = 1/(h(c + h k))`, bias factor
   `h k / (c + h k)`). Undamped (`c = 0`) stays bit-identical to M4.
   Checked: a damped bob's amplitude decays as `e^(−c t / 2m)` in all
   three (force, XPBD, impulse), within a measured tolerance.
5. **One spring network, two realizations.** `scenarios::jelly(cols, rows)`
   builds a `SpringNetwork` (particles plus structural, shear and bend
   pairs with rest lengths) once; it becomes either `SpringForce` springs
   or compliant `DistanceConstraint`s. Same topology, same masses, so the
   panels differ only in how springs are enforced.
6. **Ground: a half-plane clamp, not contacts** (M6 brings real ones).
   `World::set_ground(y)`: after each substep, any particle below `y`
   moves to it and loses its downward velocity (inelastic, no friction).
   Applies to every stepper (integrator and both solvers), so the jelly
   can land in every panel. It removes energy on impact: energy checks
   account for it (energy may only drop at impacts).
7. **Live stiffness.** Force panel: `clear_forces` + re-add the springs
   with the new k (M2's pattern). Constraint panels: a new
   `World::set_compliance(Compliance)` updates every constraint in place
   (the drag rod excluded), so the slider doesn't reset the jelly.
8. **Three panels: force springs, XPBD, impulse (soft)** (a change from
   the roadmap's two). Both constraint solvers stay stable at any
   stiffness, which is the point; showing both makes it a property of
   compliant constraints, not of XPBD. Dragging works in all three.
9. **Energy readout**: a spring-network potential (`½ k (L − L₀)²` per
   force spring; `½ C² / α` per compliant constraint, 0 when rigid) plus
   gravity and kinetic. The page's energy plot is where the explosion
   shows first (the jelly visibly tears a moment later).
10. **Grid size**: default 8 × 8 (64 particles, ~300 springs including
    bend), slider up to ~20 × 20; measured cost recorded, kept well under
    a frame.

---

## ✅ 1. `docs/07-soft-bodies.md` (done)

The threshold derived (symplectic Euler's matrix has det 1 and trace
`2 − h²ω²`, so it's bounded exactly while `ω h ≤ 2`: `k_crit = 4m/h²`;
a network fails earlier, at its fastest mode); why compliant constraints
have no threshold (implicit in disguise, paid for in damping);
`Stiffness`/`Damping`; `SpringForce`; damping in all three steppers
(Macklin eq. 26, Catto 2011); the network, the ground, live stiffness,
energy terms. Hairer–Lubich–Wanner added to references.

## ✅ 2. `Stiffness`, `Damping`, `SpringForce` (done)

`Stiffness` (k > 0, finite) and `Damping` (c ≥ 0, finite), written out
with a fallible `cast` (narrowing can overflow). `Spring`/`SpringForce`
(equal and opposite, potential). Period within 0.04%, damped energy within
0.8%, momentum 1.3e-14. Known failure: energy 2e2× at 0.99 `k_crit`,
6e71× at 1.01; below it the true energy still swings (19× at 0.9).

## ✅ 3. Damping in the constraint solvers (done)

`DistanceConstraint::with_damping`/`with_compliance`, `Constraint::damping`.
XPBD (Macklin eq. 26) and impulse (Catto 2011 with the damper); undamped
paths untouched (goldens bit-identical). Damped/undamped matches
`e^(−ct/m)` to 1% in both. **Found:** compliant constraints damp by
themselves at backward Euler's rate, `(1 + ω²h²)^−n` (predicted 0.6593,
measured 0.65925): implicit stability costs energy.

## ✅ 4. Ground plane (done)

`World::set_ground(Option<S>)` (default `None`: goldens unchanged); a clamp
at the end of every substep, after whichever stepper ran (so after XPBD's
velocity derive). At or below the ground (not strictly below: explicit
Euler leaves a resting particle on the ground moving down at `g h`).
Dropped particles settle exactly, in every stepper and both scalars; the
largest per-step energy gain is rounding (≤ 3.6e-14 J). Static particles
untouched. Built by a subagent. Open question it raised: a multi-particle
body lifted by the clamp could in principle pass energy on through its
rods; the jelly (section 5) is the real check.

## ✅ 5. The jelly (done)

`SpringNetwork::grid`, `scenarios::jelly(body, …, k, c)` (k parsed per
realization; constraints take ∞ = rigid), `World::update_constraints`
(skips a held grab's rod), `SpringForce::with_stiffness/with_damping`,
`diagnostics::constraint_potential`. Force springs blow up at 0.1–0.15
`k_crit`; both constraint solvers stable to rigid at one iteration.
**Found:** the impulse solver's soft constraints exploded from 10⁴ N/m
(the M4 mechanism through the soft form); your call was to fix the soft
form first: remedies measured, and **soft constraints are no longer
warm-started** (stable, period and damping unchanged). Decision 8 holds
as written. Stability judged by kinetic energy (elastic energy of stiff,
unconverged constraints is meaningless). Goldens for all three.

## 6. Web layer (PR)

- [ ] `demo_new_jelly`, `demo_set_stiffness` (live, both kinds),
      `demo_set_damping`, ground; ABI mirror; size row.

## 7. Site: the M5 page (PR)

- [ ] `m5-jelly`: three panels, one log stiffness slider with a rigid
      end, damping, grid size, drag, energy plot; smoke cases; gallery.
- [ ] Manual check against **Done when** (yours).

## 8. M5 cleanup (PR, if needed)

- [ ] Magic numbers, triggers, `docs/types.md`, small files.

---

## Out of scope for M5

- Real contacts and collisions (M6): the ground is a clamp.
- Friction, restitution (M6–M7).
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

**No CI:** with no CI, nothing on GitHub's side checks fmt, clippy, or tests: a PR is
only as clean as the hooks on the machine that pushed it, and `--no-verify`
skips them. Branch protection can't require a status check that doesn't
exist. Fine for a solo project; it's the main argument for adding CI later.
