# TASKS — S2: The Vicsek model

Source: `docs/05-roadmap.md` ("Swarm track", S2), `docs/15-swarm.md`
(S1, whose crate, grid and polarization this reuses).

**Papers** (read 2026-11-11; DOIs checked on Crossref):
- Vicsek, Czirók, Ben-Jacob, Cohen & Shochet (1995), *Novel type of
  phase transition in a system of self-driven particles*, PRL 75(6),
  1226–1229. doi:10.1103/PhysRevLett.75.1226 (read in full: arXiv
  cond-mat/0611743) — the model, its parameters, `v_a`, Fig. 2a's sizes.
- Grégoire & Chaté (2004), *Onset of collective and cohesive motion*,
  PRL 92(2), 025702. doi:10.1103/PhysRevLett.92.025702 — the transition
  is "always discontinuous, including for the minimal model of Vicsek et
  al.", against the original's continuous one.
- Chaté, Ginelli, Grégoire & Raynaud (2008), *Collective motion of
  self-propelled particles interacting without cohesion*, PRE 77(4),
  046113. doi:10.1103/PhysRevE.77.046113 — first-order-like, with
  "propagating solitary structures" (high-density, high-order) near the
  transition, at sizes beyond small simulations.
- Chen & Zhang (2007), *Comment on "Novel type of phase transition..."*,
  arXiv cond-mat/0703532 (a preprint; no journal version found) — the
  0/0 case ("direction annihilation") and three fixes.
- Baglietto & Albano (2008), PRE 78(2), 021125.
  doi:10.1103/PhysRevE.78.021125 — a finite-size scaling study of the
  same model; cited for its existence, not yet read.

**Goal:** the swarm track's quantitative check. The minimal flocking
model (constant speed, align with neighbours, add noise) and its
order–disorder transition: `v_a` falls from 1 to ~0 as the noise η
rises, measured as Fig. 2a measured it, and set beside what later,
larger studies found (the transition is discontinuous).

**Done when:** the page sweeps η and draws `v_a(η)` for several sizes at
the paper's density, the curves sharpening with N as Fig. 2a's do, and
the tests pin the model's limits and the paper's parameters.

## Workflow

- Each numbered section gets its own branch (`s2/<n>-<name>`) and one PR
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
---

## What the paper says (read, not recalled)

- **Rule:** each step, a particle takes "the average direction of the
  velocities of particles (including particle i) being within a circle
  of radius r", plus `Δθ` uniform on `[−η/2, η/2]`. The average is
  written `arctg[⟨sin θ⟩/⟨cos θ⟩]`.
- **Update (Eq. 1):** `x(t + 1) = x(t) + v(t) Δt`: positions move with
  the *old* velocity; the new angle is for the next step.
- **Units:** `r = 1`, `Δt = 1`, `v = 0.03` ("in a wide range of the
  velocities (0.003 < v < 0.3) the actual value of v does not affect
  the results"); a square cell of side L, periodic.
- **Start:** random positions, speed v, random directions.
- **Fig. 2a** (v_a against η): N = 40 (L = 3.1), 100 (5), 400 (10),
  4000 (31.6), 10000 (50): density ρ = N/L² ≈ 4. Errors from 5 runs.
- **Reported:** `β = 0.45 ± 0.07`; `η_c(∞) = 2.9 ± 0.05` "for ρ = 0.4".
  **A discrepancy:** Fig. 2a's sizes give ρ ≈ 4, not 0.4, and Fig. 3a's
  caption says ρ = 0.4 too. We measure at ρ = 4 (the figure's) and say
  which.

## Decisions to review before starting

1. **In the `swarm` crate and `swarm.wasm`**, not new ones: a `vicsek`
   module beside the boids (`Vicsek`, its own SoA state), new
   `vicsek_*` exports, a page `s2-vicsek`. S1's `pixels.ts`, step
   budget, smoke and cost machinery carry over.
2. **The paper's units**: `r = 1`, `Δt = 1`, `v = 0.03` by default (a
   slider), L and N chosen as Fig. 2a's. The page scales the L × L box
   to the canvas.
3. **Headings as unit vectors**, not angles: the neighbourhood's
   average direction is `Σ (cos θ, sin θ)` normalized, which is the
   paper's `arctg` with the quadrant right (the literal `arctg` of a
   ratio can't tell θ from θ + π; every implementation means `atan2`).
   The noise rotates it by `Δθ`, `sin`/`cos` from `libm` (pure Rust:
   bit-identical on wasm, as `acoustic` already relies on). No `atan2`
   needed.
4. **The 0/0 case: keep the previous direction** (Chen & Zhang's first
   fix, and S1's clamp's choice), and **count it**. Their comment
   plots its probability at up to ~20% (it grows with noise and falls
   with density); in floating point an *exact*
   zero sum needs exact cancellation, so we expect it essentially never
   outside constructed cases. A test constructs it (two particles
   exactly opposite); the long runs report the count. Which is right is
   then a measurement, not an argument.
5. **Eq. 1 literally**: move with `v(t)`, then take the new heading
   (double-buffered, as S1). Many implementations move with the new
   heading instead (a one-step lag either way); we follow the paper and
   say so. Your call if you'd rather the other.
6. **Vicsek's angular noise only.** Grégoire & Chaté's vectorial
   ("extrinsic") noise is the variant behind their discontinuity
   results; noted, not built (a candidate extra if the page wants it).
7. **Periodic neighbour search**: S1's cell list with wrap-around and
   minimum-image distances; an integer number of cells per side, each
   at least `r` (1/1024 wider, S1.3's lesson), and **brute force when
   fewer than 3 cells fit** (L < 3r: the 3 × 3 block would wrap onto
   itself and see particles twice; Fig. 2a's N = 40 box, L = 3.1, is
   right at that edge). Tested exact against brute force, as S1's. At ρ
   = 4 a particle has ~ρπr² ≈ 13 neighbours: the scalar loop is enough;
   S1's lanes only if measurement says so.
8. **The transition, measured as the paper did:** for each η, discard a
   transient, then average `v_a` over a window; several seeds; mean ±
   s.d. Native sweeps for N = 40, 100, 400, 4000 at ρ = 4 (10,000 on
   the compute node, `cargo xtask slow`). Tests: `η = 0` from an aligned
   start stays at `v_a = 1`; `η = 2π` gives `v_a ≈ 1/√N`'s scale;
   `v_a(η)` decreasing; the curves sharper with N; the transition region
   against the paper's `η_c ≈ 2.9`. **Not** the exponent β (the later
   papers dispute that there is one) and not the discontinuity (it
   needs sizes beyond these); the doc reports what the curves show and
   what the later papers say.
9. **The page**: the live system (η, ρ via N and L, v, the rate),
   coloured by heading as S1; a sweep that runs η from 0 to 2π in
   chunks off the main loop and plots `v_a(η)` for N = 40, 100, 400,
   4000 together, Fig. 2a's layout; the 0/0 count in the HUD.

---

## ✅ 1. The doc (PR)

`docs/15-swarm.md`, S2: the model as the paper states it (quoted), our
readings (unit vectors for `atan2`'s meaning, Eq. 1 literally, 0/0 kept
and counted), the ρ = 0.4 / 4 discrepancy, the periodic grid (brute
force below 3 cells), the measurement plan and what the later papers
found. `references.md`: the four new papers.

## ✅ 2. The model (PR)

`swarm::vicsek`: unit headings, double buffer, minimum image, `libm`
noise, 0/0 kept and counted. Measured: speed exactly v; η = 0 aligned
stays exactly 1; at η = 2π `v_a` is √π/(2√N) (0.0443 at N = 400), not
1/√N; **no exact 0/0 in ~5M averages** (the constructed case tested). A
golden, same on wasm with and without `simd128`.

## ✅ 3. The periodic grid (PR)

S1's grid split into geometry and counting sort; `rebuild_periodic`
(whole cells ≥ r, none below 3) and `around_wrapped`. Exact at 2,000
cases (boxes under 3 cells refused; lattice points on edges and through
the wrap). Native at ρ = 4: 135–170 ns a particle, flat to 100,000
(N = 4000: 0.57 ms a step; brute force 28.5).

## ✅ 4. The transition (PR)

`Vicsek::mean_order`; `examples/vicsek_sweep.rs` at Fig. 2a's sizes (5
seeds, 3,000 + 3,000 steps). Fig. 2a's finite-size picture: alike at low
noise, larger systems less ordered past the drop; `v_a` crosses 0.5 at η
≈ 3.69, 3.53, 3.28, 2.67 (N = 40–4000), a marker that falls through the
paper's `η_c` = 2.9 as N grows; fluctuations peak at the transition;
large boxes order slowly at low noise. Tests pin N ≤ 400. **To run on
the node:** `cargo run --release -p swarm --example vicsek_sweep 10000`.

## ✅ 5. Web layer (PR)

`vicsek_*` exports in `swarm.wasm` (64.9 KB): create, advance, rate,
cap, η, v, `mean_order` (one call per measurement, ≤ 20,000 steps),
`v_a`, the 0/0 count, a square heading-coloured view. Codes mirrored,
`.d.ts` checked, a call-sequence property test. V8: 0.98 ms a step at
N = 4000.

## 6. The page (PR)

- [ ] `s2-vicsek`: the live box, η and density controls, the sweep plot
      (Fig. 2a's sizes), the 0/0 count; smoke; gallery.
- [ ] Your check against **Done when**.

## 7. Cleanup (PR)

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

## Out of scope for S2

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
