# TASKS — M9: Falling sand

Source: `docs/05-roadmap.md` (M9; M10 builds on it), `docs/workers.md`
(the step budget), the swarm notes (`05-roadmap.md`, "Swarm track": the
pixel-buffer renderer and the counting-sort grid are shared ideas).

**Goal:** a cellular automaton, not a solver: millions of cells, piles
that emerge from local rules, materials that interact. A memory and cache
problem: what's measured is cells per second, and what's tested is
conservation and the absence of scan-order bias.

**Done when:** a full-screen grid runs at 60 Hz while you paint into it,
sand piles symmetrically, water levels, and the tests show no material
created or lost and no left/right bias.

## Workflow

- Each numbered section gets its own branch (`m9/<n>-<name>`) and one PR
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

---

## Decisions to review before starting

1. **Its own crates and module**, as the acoustic track did: `sand` (the
   automaton: grid, materials, rules; no web code) and `sand-web` (a
   `cdylib`, `sand.wasm`, behind a hand-written C ABI, checked by the
   `.d.ts` check like the others). Nothing from the engine's solvers is
   needed, and keeping it out keeps `engine.wasm` unchanged.
2. **Integers only.** Cells are a material per byte (`u8` enum),
   row-major, one `Vec<u8>`; no `Scalar`, no floats in the rules. So
   results are bit-identical everywhere by construction, and goldens are
   cheap. Velocity-free classic rules (Noita-style automata): sand falls,
   else slides diagonally; water falls, else diagonally, else sideways.
3. **Materials:** empty, sand, water, stone (static), in the core
   sections; lava (with water: stone and steam; steam rises and
   condenses) as its own section, since reactions break plain
   conservation and need their own accounting.
4. **Update order: bottom-up, alternating direction, with a moved-here
   mark.** Scanning bottom-up means a falling cell isn't met again in the
   same step; alternating direction each row and each step removes the
   drift a fixed direction gives piles. **Changed at the design doc:** the
   mark is a separate bitset (set where something moves to, cleared each
   step), not a parity bit in the byte, which goes stale in sleeping
   chunks (`11-falling-sand.md`).
5. **Randomness is seeded, by position:** the diagonal and dispersion
   choices hash `(seed, step, x, y)` with `SplitMix64`'s mixer.
   **Changed at the design doc:** not a stream, which would make chunked
   and full updates diverge (a skipped chunk shifts every later draw).
   The bias test checks the choice is fair.
6. **Dirty chunks:** the grid in 32 × 32 chunks, each with an "awake"
   flag; a step updates only awake chunks, and any change wakes the
   chunk and its neighbours. A settled pile costs nothing. Tested to give
   **bit-identical** results to updating everything (it's an
   optimization, not a model change), and measured: cells per second
   with and without, native and wasm.
7. **Grid size:** fixed at creation; the page's default is full width at
   2 px per cell (on a 1280 px wide page about 640 × 360, 230k cells),
   up to 1920 × 1080 cells (2M, the roadmap's "millions") as a stress
   case. Measured cost decides the default.
8. **Rendering: an RGBA buffer in wasm memory**, one `u32` per cell from a
   colour per material (with a little per-cell shade so sand reads as
   grains), blitted with `putImageData` onto a canvas scaled by CSS
   (`image-rendering: pixelated`). `site/js/pixels.ts`, shared later with
   A4's height map and the swarm track's trail maps.
9. **Stepping: a fixed rate, the step budget included.** `FixedStep`
   lives in `web-common` (moved there from `web` with the panic hook,
   after the API audit: pacing isn't `math`), so `sand-web` shares it, cap
   and all (#156); the sand page runs at 60 steps per simulated second and
   slows down rather than freezing on a huge grid.
10. **Painting:** a brush (radius, material, including "erase") applied by
    an export between steps; painting into a cell wakes its chunk.

## ✅ 1. `docs/11-falling-sand.md` (PR)

The byte (3-bit material, 4-bit shade), the rules (swaps only, so
movement conserves), bottom-up scans alternating per row and step, a
moved-here bitset (the parity bit goes stale in sleeping chunks), random
choices keyed by `(seed, step, x, y)` (a stream would break chunked =
full), 32 × 32 chunks that wake their neighbours and are exact, not an
approximation; Margolus blocks weighed and set aside. Sources: Noita's
GDC 2019 talk via 80.lv's write-up; Toffoli & Margolus 1987 (Crossref).

## ✅ 2. The automaton (PR)

`sand`: the grid (a byte a cell), empty / sand / water / stone, swaps
only, bottom-up scans alternating per row and step, the moved-here
bitset, draws keyed by position. Measured: conservation over 2,000
random steps; a falling column one row a step; a centred pour within
0.6% of symmetric; water level within a cell; a golden, same on wasm.
`sand` in `test-wasm` and `xtask api`.

## 3. Dirty chunks and cost (PR)

- [ ] Chunks with awake flags; bit-identical to the full update (a
      property test over random grids and paint); cells per second,
      native and wasm, settled and busy, with and without chunks.

## 4. Lava and reactions (PR)

- [ ] Lava (flows slowly), lava + water → stone + steam, steam rises and
      condenses back to water. Tests: the reactions' accounting (what's
      made equals what's consumed), the rest still conserved.

## 5. Web layer (PR)

- [ ] `sand-web` on `web-common` (the panic hook, `FixedStep`):
      create, step, paint, the RGBA buffer, counts per material; the
      `.d.ts` check and the call-sequence property test cover it.

## 6. The page (PR)

- [ ] `m9-falling-sand`: `pixels.ts`, the brush (material, radius,
      erase), presets (an hourglass, a dam, lava into water), cells per
      second in the HUD; smoke; gallery.
- [ ] Your check against **Done when**.

## 7. Cleanup (PR)

---

## Health (after M7)

Done: the API audit and its PRs (#159–#164: `web-common`, `engine-web`,
narrower surfaces, `cargo xtask api`), `cargo xtask mutants` (#165), the
pre-push hook at ~60 s with nextest (#166), the step budget (#156), M6's
mutation run (#144). Open:

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

## Out of scope for M9

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
