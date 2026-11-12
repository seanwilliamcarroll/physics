# TASKS — S5: Evolving the rules

Source: `docs/05-roadmap.md` ("Swarm track", S5: "evolve rules, build");
`docs/15-swarm.md` (S3's ants, whose constants this evolves).

**Sources** (DOIs checked on Crossref, 2026-11-12):
- Eiben & Smith (2015), *Introduction to Evolutionary Computing*, 2nd
  ed., Springer. doi:10.1007/978-3-662-44874-8 — the standard textbook
  for the terms used (tournament selection, Gaussian mutation, elitism);
  **not read** here, cited for vocabulary, not results.
- Hansen & Ostermeier (2001), *Completely derandomized self-adaptation
  in evolution strategies*, Evolutionary Computation 9(2), 159–195.
  doi:10.1162/106365601750190398 — CMA-ES, the stronger method; noted,
  not built; not read.
- Werfel, Petersen & Nagpal (2014), *Designing collective behavior in a
  termite-inspired robot construction team*, Science 343(6172), 754–758.
  doi:10.1126/science.1245842 — collective construction, S5's other
  half, **deferred**; not read.

**Goal:** search S3's ant constants with an evolutionary algorithm, the
fitness a headless native run (food delivered), and ask the question
that matters: does the evolved setting beat S3's hand-scanned defaults
**on seeds and a scene it never saw**, or did it learn its training
seeds?

**Done when:** the algorithm is tested on a toy problem; the ants are
evolved natively (in parallel, the result independent of the thread
count); the best is measured against the defaults on held-out seeds and
on the barriers scene; and the page runs defaults and evolved side by
side with the evolution's history drawn.

## Decisions (your approval given in advance)

1. **Scope: evolving the rules only.** Collective construction (Werfel
   et al.) is a milestone's worth of its own: deferred, recorded.
2. **`swarm::evolve`**: a small evolutionary algorithm over a bounded
   real vector: a population, tournament selection (size 3), Gaussian
   mutation scaled to each gene's range (and shrinking over the
   generations), uniform crossover, elitism (the best 2 kept and
   **re-evaluated** each generation, so a lucky score can't persist).
   CMA-ES noted, not built.
3. **Noise-aware fitness**: a run's food delivered depends on its seed,
   so each individual is scored on K seeds (common to the whole
   generation, new each generation), the mean its fitness.
4. **The genome**: S3's seven tunable constants (SA, SD, RA, wiggle,
   fall-off, diffusion, decay), each within a stated range; speed and
   deposit fixed (they scale the rest).
5. **Parallel, deterministic**: evaluations natively on `std::thread::
   scope`; each depends only on its genome and seeds, so the result is
   bit-identical with 1 thread or 16 (tested). The wasm build stays
   single-threaded (`workers.md`).
6. **Generalization is the result**: the best evolved setting against
   the defaults on 8 held-out seeds in S3's scene and on the barriers
   scene. Reported either way.
7. **No new exports**: the page uses S3's `ant_*` exports
   (`ant_set_param`) to run defaults and evolved side by side; the
   evolution's history (best and mean fitness per generation) is
   embedded from the native run.

## ✅ 1. The doc (PR)

`15-swarm.md`, S5: the algorithm (elites re-scored, tournament,
crossover, shrinking Gaussian mutation), noise and common seeds, why it
runs parallel yet bit-identical, the genome, generalization as the
result; construction deferred. `references.md`: the three, unread.
## 2. The algorithm (PR): `swarm::evolve`, toy tests, thread-count determinism
## 3. Evolving the ants (PR): the run, held-out seeds, the barriers scene
## 4. The page (PR): `s5-evolve`
## 5. Cleanup (PR)

## Workflow

- Each numbered section gets its own branch (`s5/<n>-<name>`) and one PR
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

## ✅ M6: Colliding masses (done, PRs #76–#82, #133–#139)

`docs/08-collision.md`; `Radius`, `Restitution`, walls; a sorted-cell-list
broadphase and speculative contacts in XPBD and the impulse solver.
Simultaneous impacts by Generalized Reflections (Smith et al. 2012), an
impact stage between two half kicks in both solvers: one ball hitting two
and the break keep their energy to 1e-13, the cradle swings one ball out.
Scenes (box, break, cradle) with goldens; the cradle ignores iterations
and XPBD's shortfall is first order in substeps. Pages `m6-collisions`
(box and break, broadphase overlay) and `m6-cradle`. One sort key for
every sort: `engine.wasm` −35.9 KB. **Manual check of the pages pending.**

## ✅ A1: Plucked string, Karplus–Strong (done, PRs #84–#93)

`docs/12-acoustic-foundations.md`; the `acoustic` crate (delay line,
`KsString`, `Voicing` with the allpass exact at `f₀` and `T₆₀` by loss or
stretching, `Excitation`, 16 `Voices` that never allocate on the audio
thread) and its offline measurements (`pitch`, `partial`, `t60`, each
corrected once); `libm` (your call) so rendered audio is bit-identical on
wasm; `acoustic-web` → `acoustic.wasm` (53 KB) behind `synth_*`; the A1
page (worklet with the module in `processorOptions`, computer and
on-screen keyboard, tuning toggle with the synth's own cents readout,
five songs scheduled to the frame in the worklet, Mutopia's Entertainer
included). Measured: 88 keys within ±0.006 cents tuned; the integer loop
±75 cents at C8, 40 keys audibly off; `T₆₀` within 0.1%. Listening check:
yours, "looks good".

## ✅ A2: Waveguide string (done, PRs #95–#102)

`docs/13-waveguide.md`; our FFT (`acoustic::fft`, 4096-point spectrum
26 µs); A1's loop filter as a shared `Bridge`; `Waveguide` (two rails,
inverting ends, the odd sample in the bridge), **bit-exact** to A1's loop
from the same state; positions on the **effective length** `fs / 2f₀`
(the bridge's delay lengthens the string: on the bare cells the nulls
only reached −40 dB, on the effective length −73); pluck or pickup at 1/n
removes harmonic n by 45–51 dB, harmonics within 0.5 dB of
`sin(kπβ) sin(kπp)/k²`; both models per voice, live pickup, spectrum on
request; the A2 page and the acoustic pages' shared modules (A1's page
401 → 184 lines). Listening check: yours, "sounds good". Merged by me at
your request (`gh stack merge`, atomic).

## ✅ A3: Piano voice (done, PRs #103–#112)

`docs/14-piano.md` (every source Crossref-checked; `B` along the keyboard;
hammer masses and stiffness chosen to reproduce measured contact times).
Dispersion by up to 16 refined biquad allpasses (88 keys in tune within
0.026 cents, stiff); an energy-conserving felt hammer (discrete gradient),
fitted and smoothed offline; `Unison` string groups with a hammer each,
and a five-mode body; `Model::Piano` in preallocated voices (16 × 3
strings in 78 µs a quantum on wasm), velocity, a stiffness toggle; the
`a3-piano` page (velocity from where a key is pressed, stretched-partial
ticks, the hammer's force); cleanup. Treble hammer gap below.

## ✅ M7: Billiards (done, PRs #142–#153)

`docs/09-billiards.md`. Segment cushions with their own restitution;
contacts moved to the **moment of impact** (cut shots were 1–8° off,
a graze bounced a substep early; now within 1.5e-11° at any substeps)
and a swept contact test; restitution by **coupled group** (mixed `e`
gained 2.5% in one round). The cloth on a `Table`: spin about horizontal
axes, slide → roll → rest, exact transitions; the cue's tip height;
stun, follow and draw emerge (`(5/7)(b/R) v₀`). Tunneling: none with
speculative contacts at any substeps; a switch turns them off (13 of 20
tunnel at one substep at 12 m/s) and a counter shows it. Pockets as
sensors; `retire`/`reinstate`. The WPA table, rack and break (settles by
6.5 s), goldens; the `m7-billiards` page (your check: "plays well").
`engine.wasm` +47.1 KB.
Contact friction moved to M10.

## ✅ M9: Falling sand (done, PRs #167–#173)

`docs/11-falling-sand.md`. A new `sand` crate: a byte a cell (3-bit
material, 4-bit shade), rules that only swap, bottom-up scans
alternating per row and step, a **moved-here bitset** (the planned parity
bit goes stale in sleeping chunks), random choices **keyed by `(seed,
step, x, y)`** (a stream would break chunked = full). Conservation every
step; a centred pour within 0.6% of symmetric; water level within a
cell; goldens, same on wasm. **32 × 32 chunks**, bit-identical to the
full update (a property test; a move must wake neighbours for this step
too, found writing it); settled grids cost ~175× less. Lava and steam
with their own accounting (sand; water + steam; lava + stone).
`sand.wasm` (37.6 KB, on `web-common`), and the `m9-falling-sand` page:
a brush, scenes drawn with it, cells/s in the HUD (your check: "looks
good"). Wasm busy 640 × 360: 1.84 ms a step (125 M cells/s); render 8.6
→ 0.47 ms at 1920 × 1080 with a palette.


## ✅ S1: Boids (done, PRs #176–#184)

`docs/15-swarm.md`, papers checked on Crossref. A `swarm` crate:
Reynolds' rules in ECE 4760's form and values (read at the source: the
notes had them wrong), a map with Δt = 1, double-buffered SoA, f32.
Boids **leave the arena** (alignment turns a flock as a body: measured,
bounded); **alignment makes the flock** (polarization 0.49–0.77 with
it, 0.03–0.08 without). A counting-sort grid, **exact after one fix**
the property test found (cells 1/1024 wider than the range). Reordering
by cell alone gained nothing; it made a **branchless 8-lane loop**
possible, 5× faster (10k boids 1.42 ms natively); `simd128` adopted for
`swarm.wasm` (1.3–1.7×, goldens unchanged), after finding it made the
scalar brute force 20× slower. The `s1-boids` page: a 2560 × 1440
world at half scale, the pointer as predator, every constant on a
slider, polarization, a cost table measured in the browser (your check:
"looks good"). 10k boids 2.37 ms a step in V8.

## ✅ S2: The Vicsek model (done, PRs #187–#194)

`docs/15-swarm.md`, S2; the paper read in full (its "ρ = 0.4" against
Fig. 2a's ρ ≈ 4 recorded). `swarm::vicsek`: unit headings (`atan2`'s
meaning), Eq. 1 literally, `libm` noise, a periodic grid (exact; brute
force below 3 cells; 135–170 ns a particle to 100,000). **No exact 0/0
in ~5M averages**, against Chen & Zhang's "fairly high probability". At
η = 2π, `v_a` = √π/(2√N), not 1/√N. **Fig. 2a reproduced to N = 4000:**
alike at low noise, larger systems less ordered past the drop, the 0.5
crossing 3.69 → 2.67, fluctuations peaking at the transition; the later
papers (discontinuous) beyond these sizes. `vicsek_*` in `swarm.wasm`
(64.9 KB); the `s2-vicsek` page with a browser sweep (your check: "looks
good"). N = 10,000 on the node: `vicsek_sweep 10000`.

## ✅ S3: Ant foraging (done, PRs #196–#203)

`docs/15-swarm.md`, S3 (the ant papers unread: logins; cited for their
known results, the bridge called ours). `swarm::Field` (diffusion
conserving mass around walls, to 3.3e-9 a step), `swarm::Colony` (Jones's
three sensors, U-turns, the fall-off deposit, exact food accounting).
**The planned decay failed**; a scan chose the defaults: 1,312–1,959
delivered against a random walk's 12–21 and **constant deposits' 7–255**
(the fall-off is the mechanism). **The double bridge (ours):** the short
arm 0.71–0.77 of the traffic against the geometry's 0.49–0.61; equal
arms split (no symmetry breaking). Two bugs found by tests and the page
(a brush that hung at 1e300; ants left at the old nest). `ant_*` in
`swarm.wasm` (84.4 KB); the `s3-ants` page (your check: "looks good";
the long slider decimals fixed for custom formats too).

## ✅ S4: Physarum (done, PRs #205–#211)

`docs/15-swarm.md`, S4 (Jones 2010's abstract read; every value ours).
`Field::diffuse_periodic` (the mean filter as `D = 8/9`) and
`top_share`; `swarm::Slime`. **Sensing concentrates the field** (top
10%: 0.97 against a random walk's 0.13); **the web contracts into one
straight band wrapping the torus** (128²: 0.76–0.81 at 250 steps, 0.97 by
1,500); an SA × RA map (0.72–1.00); strong nodes linked in two of three
seeds. `slime_*` in `swarm.wasm` (103.8 KB): 100k agents on 512², 5.6
ms a step in V8, 60 Hz to ~250k; the GPU question recorded with the
numbers, not built. The `s4-physarum` page (your check: "looks good").
The slider readouts rounded for custom formats too.
---

## Health (after M7)

Done: the API audit and its PRs (#159–#164: `web-common`, `engine-web`,
narrower surfaces, `cargo xtask api`), `cargo xtask mutants` (#165), the
pre-push hook at ~60 s with nextest (#166), the step budget (#156), M6's
mutation run (#144); the second full run (16cea2a, M9's crates
included) triaged, its real gaps tested (`04-testing.md`, "Mutation
testing"); `docs/setup.md`, Node through nvm. Open:

- **Your check:** `m2-cluster?n=4096` in slow motion, not frozen.
- **The compute node:** `cargo install --locked cargo-nextest`.
- **To measure, on the node: nextest under `cargo xtask mutants`.**
  cargo-mutants can run each mutant's tests with nextest (`--test-tool
  nextest`), which runs that mutant's tests in parallel; `-j 8` already
  runs 8 mutants at once, so the two may oversubscribe the cores rather
  than add up. Compare wall time (and that the caught/missed lists are
  identical) for the same file set: `-j 8` with cargo test (today's
  default), `-j 8 --test-tool nextest`, and fewer jobs with nextest (`-j
  4`, `-j 2`). Make the winner `xtask mutants`' default.
- **CI stays off** (your call: it fights loading a stack and merging it
  piece by piece).
- **Mutation, still to do:** `test-support` and `xtask` under
  `--test-workspace=true` (their misses are mostly artifacts).
- **TODO: why the piano model is slow in debug builds.** Selecting it
  designs 88 keys' dispersion filters: 1.8 s unoptimized at 48 kHz,
  0.2 s with `acoustic`, `libm` and `math` at `opt-level = 3` (now set
  for dev builds).
- **Undecided (M6.11):** dropping the broadphase's final pair sort:
  smaller and faster, but every collision golden changes.

---

## Out of scope for S5

- Collective construction (Werfel et al. 2014): deferred to its own
  milestone. CMA-ES. Evolving boids or Physarum (the same machinery
  would apply). Evolution in the browser.

## Out of scope for S4 (carried forward)

- The GPU path (recorded as a decision with numbers, not built);
  chemorepulsion; the one-particle-per-cell exclusion; multiple species.

## Out of scope for S3 (carried forward)

- Ant Colony Optimization on graphs (Dorigo et al.): context only.
- Several colonies, castes, recruitment beyond pheromone; 3D; the GPU
  (S4 decides).

## Out of scope for S2 (carried forward)

- Vectorial noise and the large-system bands (Grégoire & Chaté 2004;
  Chaté et al. 2008): noted, not reproduced.
- Critical exponents (β, δ): the later papers dispute a critical point.
- Fields (S3), the GPU (S4), 3D, variable speed.

## Out of scope for S1 (carried forward)

- Vicsek's model and periodic boundaries (S2); fields and stigmergy (S3,
  S4); the GPU (S4 decides); threads (`docs/workers.md`).
- Fixed point (M8's panel); 3D; obstacles; the lab's scout bias.

## Out of scope for M9 (carried forward)

- Per-cell velocity and momentum (cells move by rules, not forces);
  frictional, particle-based sand is M10's DEM panel.
- Temperature and pressure fields, fire, gases beyond steam.
- Threads or the GPU (`docs/workers.md`; the swarm track's S4 decides
  WebGPU).

## Out of scope for M7 (carried forward)

- Sidespin (english), throw, cushion-induced spin (decisions 1, 3).
- Contact friction in the solvers (M10, decision 3).
- Jump and massé shots; cushion height (a cushion strikes above the
  ball's centre on a real table).
- Continuous collision detection (`00-scope.md`: substeps and speculative
  contacts are the answer).
- Game rules beyond potting and re-spotting a scratched cue ball;
  opponents.

## Known gaps

**A3 treble hammer (A3.3):** from C6 up the blow outlasts a period, the
string takes 0.2–13 % of the hammer's energy, and brightness and level
don't rise reliably with velocity (C6's centroid falls 1102 → 1050 Hz pp
→ ff). Our contact curve between the measured ends is interpolated, and
C8's waveguide is five cells. Options: shorter treble contact targets,
a higher internal rate for the top octaves, or accept (real top-octave
tones are nearly pure too).

**M2 page at N = 4096 (found in review):** about 1 fps. **A step budget
is in** (`docs/workers.md`, option 1): the page should now run in slow
motion with a responsive display, to check by hand (`?n=4096`). The
rest of this note is the history. One step of all
three panels costs ~27 ms (f32 and f64 direct, plus Barnes–Hut), so 60 Hz
needs ~1.6 s of compute per second. Every frame then runs the 15 steps
`FixedStep`'s 0.25 s clamp allows (~400 ms). 2048 keeps up (~7 ms per
step). Options: a per-frame step budget, so the sim runs in slow motion
instead of freezing the display; fewer panels at large N; or Web Workers,
one per panel (the panels are independent, so that's real parallelism) and
the main thread only draws. Leaning toward workers; revisit after M2.
Options written up in `docs/workers.md` (a step budget first; workers
opt-in, piloted here).
Since the health audit the exact energy readout (about half a pairwise
step per panel: 6.6 ms at 4096 in the browser) runs 4 times a second,
not every frame; the gap is the steps alone (~55 ms a frame for the
three panels in the page), still well over a 60 Hz frame.

**CI is disabled:** `.github/workflows/ci.yml` (added in #73, green on
its runs) is turned off with `gh workflow disable CI`, so nothing on
GitHub's side checks a PR: it's only as clean as the hooks on the machine
that pushed it, and `--no-verify` skips them. `gh workflow enable CI` to
restore it.
