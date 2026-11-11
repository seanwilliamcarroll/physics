# TASKS — S1: Boids

Source: `docs/05-roadmap.md` ("Swarm track", S1), the swarm notes
(`docs/swarm-rust-implementation.md`, `docs/swarm-resources.md`).

**Papers** (DOIs checked on Crossref, 2026-11-11), each for what it
grounds:
- Reynolds (1987), *Flocks, herds and schools: a distributed behavioral
  model*, SIGGRAPH Computer Graphics 21(4). doi:10.1145/37402.37406 —
  the model: separation, alignment, cohesion from local perception.
- Couzin, Krause, James, Ruxton & Franks (2002), *Collective memory and
  spatial sorting in animal groups*, J. Theor. Biol. 218.
  doi:10.1006/jtbi.2002.3065 — zones (repulsion inside, orientation and
  attraction beyond: the protected range's role) and **group
  polarization**, the order measure the flocking test uses.
- Vicsek, Czirók, Ben-Jacob, Cohen & Shochet (1995), *Novel type of
  phase transition in a system of self-driven particles*, PRL 75.
  doi:10.1103/PhysRevLett.75.1226 — the same measure as `v_a`; S2's
  model, cited here so S1's number is S2's.
- Allen & Tildesley (2017), *Computer Simulation of Liquids*, 2nd ed.,
  OUP. doi:10.1093/oso/9780198803195.001.0001 — cell lists for
  fixed-radius neighbours (cell ≥ cutoff, search the 3 × 3 block),
  the grid's basis; and Hockney & Eastwood, *Computer Simulation Using
  Particles* (1981; CRC reprint doi:10.1201/9780367806934), where the
  chaining-mesh idea comes from.

**Secondary, for values and practice, not claims:** the ECE 4760 boids
algorithm (Hunter Adams; read directly, 2026-11-11:
https://vanhunteradams.com/Pico/Animal_Movement/Boids-algorithm.html):
the parameter set and the per-step update order, a course page, so the
defaults are labelled "ECE 4760's", not "measured". Reynolds (1999),
*Steering behaviors for autonomous characters*, GDC (no DOI): flee. Le
Grand (2007), GPU Gems 3 ch. 32: grids by sorting, on the GPU (S4).

**Goal:** the swarm track's first milestone. Agents that follow *rules*
(steer, align, cohere), not forces: no energy to conserve, so the tests
are invariants, agreement with brute force, and an emergent order that's
measured. Then the cost story: brute force is O(n²), a grid makes it
O(n), and the crossover is the first result.

**Done when:** a flock of 10k runs at 60 Hz, with the crossover plot.

## Workflow

- Each numbered section gets its own branch (`s1/<n>-<name>`) and one PR
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

---

## Decisions to review before starting

1. **Its own crates and module**, as the acoustic track and M9 did:
   `swarm` (the core: agents, the grid, the rules; no web code; on
   `math` for `Vec2`, `Scalar`, `SplitMix64`) and `swarm-web` (a cdylib,
   `swarm.wasm`, on `web-common`: the panic hook, `FixedStep`, the step
   cap). The hand-written C ABI and the loader (`instantiateWithPanicHook`)
   as `sand.wasm`. The notes' `wasm-bindgen` + `web-sys` front end isn't
   used: the repo has neither (`03-wasm-shell.md`).
2. **The model: Reynolds' three rules (1987) in ECE 4760's concrete
   form**, which is Couzin et al.'s zone structure (repulsion inside,
   orientation and attraction beyond) with constant gains. Per neighbour
   within the visual range: inside the protected range it counts toward
   **separation** (push away by the summed offsets) and *not* toward the
   others; outside it, toward **alignment** (match the mean velocity) and
   **cohesion** (steer to the mean position). Then **edge turning** (a
   constant push back inside a margin: a box with soft walls), then the
   **speed clamp** to `[min, max]`. The published values, our defaults:
   visual range 40, protected 8, centering 0.0005, avoid 0.05, matching
   0.05, turn 0.2, speed 3–6, a margin of 100. The notes' summary had
   them wrong (20, 2, 3, 2), which is why the source is read. Their
   scout "bias" (a course variant) is left out. The defaults are a
   course's tuning, not measured biology; the doc says so.
3. **A discrete map, not an ODE: per step, Δt = 1.** The published
   parameters are in pixels per frame, and the rules are a map from one
   step to the next, like M9's (no forces, nothing to integrate
   accurately). World units are the arena's pixels at 1:1. The rate
   (default 60 steps/s, `FixedStep`) sets how fast the flock moves on
   screen, not its behaviour. The alternative (velocities per second
   and a `dt`) would make the rate a numerical choice and the published
   numbers need converting: no gain for rules.
4. **Double-buffered, structure of arrays.** `x, y, vx, vy` as separate
   `Vec`s; each step reads `cur` and writes `next`, then swaps. The
   result doesn't depend on agent order (in-place, boid 7 would see boid
   3's new velocity and boid 9's old one) and the update is the shape a
   GPU pass needs (S4). The contrast with M9's in-place scan, where order
   is the problem to solve, goes in the doc. The lab's own C updates in
   place; we don't follow it there.
5. **f32 only, not generic.** The engine is generic over `Scalar`; here
   that buys a second copy of the module for a comparison nobody needs
   (agents aren't an accuracy story). M8's fixed point is the scalar
   comparison worth having, and the notes' "boids in s15.16" can be its
   panel then. Goldens still match native and wasm (no transcendentals:
   `sqrt` is exact in IEEE; no FMA contraction in Rust).
6. **The speed clamp at zero:** the source divides by the speed without
   a guard. A boid exactly at rest (speed 0) keeps its previous
   heading's direction at `min` speed; tested.
7. **Neighbour search, twice, both kept:** brute force (every pair; the
   reference) and a **uniform grid by counting sort** (cell = visual
   range, so every neighbour is in the 3 × 3 block around a boid; a
   histogram, a prefix sum and a scatter: O(n), no comparison sort, so
   no sort instantiation in the `.wasm`). Bounded arena, so a dense
   array of cells: not the engine's sorted cell list (built for an
   unbounded world), as the roadmap decided. **Tested exact:** the grid
   finds the same neighbour *set* as brute force (proptest). Trajectories
   agree only to rounding (summation order differs), measured.
8. **The cost experiments, each measured on its own** (native criterion
   and wasm in Node, as `bench-wasm`): ns per agent-step, brute force
   against grid, at 1k, 10k and 100k (the crossover); then **agents
   reordered by cell** every step against indexing through the order
   (the cache experiment); then **`simd128`** for `swarm.wasm` only
   (autovectorization from the SoA layout, no intrinsics, no `unsafe`).
   Each is adopted only if it wins, and the numbers go in the doc either
   way.
9. **Rendering: splatted into an RGBA buffer by Rust**, `pixels.ts`
   from M9. Each boid a few pixels, **coloured by heading** (a hue
   wheel), so aligned groups show as one colour. Canvas path calls stop
   scaling at a few thousand agents (the notes; M0's measurement agrees).
   The heading's hue from a pseudo-angle (no trig); rendering only, so
   not in the goldens.
10. **Sizes and caps.** Agents fixed at creation, up to `MAX_AGENTS` =
    262,144 (2¹⁸). Brute force is refused above 16,384 on the page (at
    100k it would be ~10¹⁰ pair checks, seconds a step: the step budget
    can't help when one step blows the frame). The benches go further.
    The arena: the canvas's size (default 1280 × 720).
11. **The page's extra: the pointer as a predator.** Boids within a
    radius of the pointer flee it (Reynolds' 1999 "flee"; one more
    steering term, off when the pointer is away). It's the only way to
    *poke* a flock. Small; drop it if you'd rather not.

---

## ✅ 1. `docs/15-swarm.md` (PR)

The track's doc, S1 first: Reynolds' rules in ECE 4760's form (Couzin et
al.'s zones with constant gains), the update order as published, the
clamp at zero speed, a map with Δt = 1, double buffering against M9's
in-place scan, f32 only, brute force and a counting-sort cell list
(Allen & Tildesley; Hockney & Eastwood) and why not the engine's
broadphase, what's tested with nothing conserved (polarization: Couzin
et al., Vicsek et al.), the measurements. `references.md`: a Swarms
section, the papers with Crossref-checked DOIs, volumes and pages; the
course page and GDC talk marked secondary.

## ✅ 2. Boids, brute force (PR)

`swarm`: checked `Params` (ECE 4760's), `Arena`, a double-buffered SoA
`Flock`, the rules in the source's order, the clamp at zero, brute-force
`step`, `polarization`. Measured: speeds in the band; boids **leave the
arena** (2–3.4% of boid-steps, up to ~400 px) because alignment makes a
flock turn as a body, not a bug; reversed storage identical after a
step, rounding after; mean polarization 0.49–0.77 with alignment,
0.03–0.08 without. A golden, same on wasm. `swarm` in `test-wasm`, `xtask
api` and the dev profile at `opt-level = 3`.

## 3. The grid (PR)

- [ ] Counting-sort grid; the neighbour sets equal brute force's
      (proptest); grid and brute trajectories agree to rounding.
- [ ] Benches: ns per agent-step, brute and grid, at 1k, 10k, 100k,
      native: the crossover.

## 4. Cache and SIMD (PR)

- [ ] Reorder by cell each step against indexing through the order;
      `simd128` for `swarm.wasm`; wasm timings in Node. Each measured and
      recorded; adopted only if it wins.

## 5. Web layer (PR)

- [ ] `swarm-web` → `swarm.wasm` on `web-common`: create, advance with
      the step cap, parameters (each parsed at the boundary), brute/grid
      switch, the predator, the RGBA buffer, polarization, timings.
      `swarm-abi.ts`, `swarm.d.ts` (checked), the call-sequence proptest.

## 6. The page (PR)

- [ ] `s1-boids`: the flock on `pixels.ts`, sliders for the five factors
      and two ranges, n, brute/grid, the predator; HUD with ns per
      agent-step and polarization; the crossover table measured in the
      page (as M2's per-N cost); smoke; a "Swarms" gallery heading.
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

## Out of scope for S1

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
