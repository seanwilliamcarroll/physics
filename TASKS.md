# TASKS — M7: Billiards

Source: `docs/05-roadmap.md` (M7), `docs/00-scope.md` (the open question
on spin), `docs/08-collision.md` (contacts, the impact stage, speculative
contacts).

**Goal:** a full game-feel simulation on M6's contacts: cushions, a cloth
that makes balls slide and then roll, pockets, and a cue.

**Done when:** you can play a break shot, the balls settle believably,
stun, follow and draw shots behave as on a real table, and the page shows
why speculative contacts stop tunneling.

## Workflow

- Each numbered section gets its own branch (`m7/<n>-<name>`) and one PR
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

---

## Decisions to review before starting

1. **Balls carry spin, without sidespin.** Top-down 2D can still model
   topspin and backspin: they're rotations about *horizontal* axes,
   `ω = (ω_x, ω_y)`, which set how the ball slips on the cloth. The slip
   velocity at the contact point, `u = v + ω × (−R ẑ)`, decides
   everything. A ball slides while `u ≠ 0` and rolls once `u = 0`. Sidespin
   (`ω_z`, "english") only shows at cushions and in ball–ball throw, both
   of which need contact friction (decision 3). **Deferred.** This answers
   `00-scope.md`'s open question.
2. **The cloth, in the kicks.** Sliding friction `μ_s m g`, opposing `u`,
   changes both `v` and `ω` (`I = 2/5 m R²`). The slip then decays
   linearly, `du/dt = −(7/2) μ_s g û`, and reaches 0 in finite time. Rolling
   resistance `μ_r g` then slows the rolling ball to rest, again in finite
   time. Applied with the forces in each half kick (the impact stage stays
   between them), and clamped so a substep can't overshoot the transition
   (it lands exactly on rolling). The tests are analytic. A centre hit
   rolls at **5/7 v₀** after sliding **12 v₀² / (49 μ_s g)**, in time
   **2 v₀ / (7 μ_s g)**. Kinetic energy gains the rotational `½ I ω²`.
   **Where it lives:** a `Table` component on `World` (μ_s, μ_r, g, and a
   spin per particle), off by default, so other worlds pay nothing.
3. **Contact friction deferred to M10.** The roadmap lists Coulomb friction
   in both solvers for M7. Without sidespin (1), ball–ball and ball–cushion
   friction can only nudge tangential velocities: no throw, no cushion
   spin. The real effects are small (ball–ball μ ≈ 0.06), and **sand (M10)
   needs it for real**, with angles of repose and piles at rest. So M7's
   contacts stay frictionless and the cloth is the only friction. The
   alternative is building friction now, adding two solver changes to an
   already large milestone.
4. **Cushions are segments.** A static `Segment` (two endpoints, its own
   restitution), and a circle–segment narrowphase (closest point; the
   endpoints act as rounded corners, which is what pocket jaws are),
   speculative like walls. A table is segments only, no half-planes.
5. **Restitution per contact.** Ball–ball from the world (≈ 0.95),
   ball–cushion from the segment (≈ 0.75–0.85). The impact stage applies
   `(1 + e_i) λ̃_i` per contact instead of one `e`. Section 1 checks that
   Generalized Reflections keeps its guarantee (energy never rises for
   every `e_i ≤ 1`) with mixed `e`.
6. **Tunneling: measured first, and it doesn't happen.** A probe (cue ball
   at 3–15 m/s into a resting ball, 1–10 substeps, both solvers) **never
   tunneled, even at one substep**. M6's speculative contacts catch a
   contact that closes during the substep, and the impact stage resolves
   it before positions move. The roadmap's showcase ("low substeps let
   balls pass through; raise substeps and it stops") would show nothing.
   **Proposed instead:** a `World` switch that turns speculation off
   (contacts only when touching at the start of a substep), and a
   tunneling counter (a swept test per candidate pair). The page then
   shows *why* speculative contacts exist. Off, a hard break tunnels at
   low substeps; on, nothing tunnels at any substeps. Tests: on, zero
   tunnels at the fastest break at 1 substep; off, tunnels at 1 substep,
   with the threshold measured.
7. **Pockets are sensors.** Circles at the corners and sides. A ball whose
   centre enters one is potted: taken out of play (`World::retire`: static,
   radius 0, so it collides with nothing, and still) and reported as an
   event for the page's tray. A scratched cue ball is re-spotted when the
   table is at rest (a page rule, not the engine's).
8. **Real units, real table** (each value checked against a source in
   section 1): a 9-ft table (2.54 × 1.27 m playing surface), 57.15 mm
   balls of ~0.17 kg, μ_s ≈ 0.2, μ_r ≈ 0.01, a break up to ~11 m/s, and
   pocket mouths per the WPA specifications. In-plane gravity is zero (the
   table is seen from above). `g` enters only through the cloth.
9. **The cue: aim, power, and follow or draw.** Drag back from the cue
   ball to aim and set the speed (slingshot-style, up to the break speed).
   A tip-height control sets the strike offset `b`, which gives
   `ω = 5 v b / (2 R²)`: positive follows, negative draws, 0 stuns.
   `|b| ≤ ½ R` (past that, a miscue). These shots emerge from decisions 1–3
   with no special cases. A frictionless ball–ball contact doesn't change
   `ω`, so after a full hit a sliding stun ball stops dead, a
   follow ball rolls on through, and a draw ball comes back.
10. **One table, impulse by default.** A game wants one table, not
    side-by-side panels. The solver is a setting (XPBD selectable), and so
    are substeps and speculation (6). A 15-ball 8-ball rack, touching.

---

## ✅ 1. `docs/09-billiards.md` (PR)

Table, balls and pockets from the WPA specification (read directly);
`μ_s` 0.2, `μ_r` 0.01, `e_b` 0.94 from Alciatore via secondary sources
(**to confirm by hand**: his page refuses automated fetches);
`e_c` = 0.8 our choice in a 0.7–0.98 spread. The slip derivation
(`du/dt = −(7/2) μ_s g û`; 5/7 v₀; 12 v₀² / 49 μ_s g; 2 v₀ / 7 μ_s g),
the cue's `ω = 5 b v / 2R²` (natural roll at 2R/5). **Found:**
per-contact `e` breaks Generalized Reflections' per-round energy
guarantee (`ΔT = ½ (Eλ̃)ᵀK(Eλ̃) − ½ λ̃ᵀKλ̃`); section 2 measures it.
Roadmap (M7, and contact friction in M10), `00-scope.md`, references.

## ✅ 2. Segments and per-contact restitution (PR)

`Segment` (own restitution; ends as corners), `Statics` (walls and
segments) through the narrowphase and both solvers. **Found and fixed:**
mixed `e` in one round gained 2.5% (a ball squeezed into a cushion);
now a coupled group bounces at its smallest `e`. **Found and fixed:**
start-of-substep normals sent cut shots 1–8° off (an 80° graze left at
60°); contacts now move to the moment of impact (exact for two circles,
conservative advancement for segments) and the test is swept: cuts
within 1.5e-11° at any substeps. M6 goldens for the box and the impulse
cradle updated. Tests: reflection, a corner, resting, no pass-through,
cut shots, mixed-`e` energy.

## 3. The cloth: spin, sliding and rolling (PR)

- [ ] `Table` on `World`: spin per ball, sliding friction and rolling
      resistance in the kicks, the exact transition; rotational energy in
      the diagnostics.
- [ ] Tests: 5/7 v₀, the slide distance and time (measured tolerances),
      a rolling ball's stopping distance `v² / (2 μ_r g)`, stun, follow
      and draw after a full hit, energy only falling.

## 4. Speculation switch and tunneling counter (PR)

- [ ] `World::set_speculative(bool)` (on by default), the swept test as a
      diagnostic. Tests as decision 6, the threshold measured.

## 5. Pockets (PR)

- [ ] Sensors, `World::retire`, potting events. Tests: a ball aimed in
      is potted; one rolling past the jaw isn't; a retired ball collides
      with nothing.

## 6. Scenes (PR)

- [ ] `table` (cushions, pockets), the rack, `break_shot(speed, offset)`;
      tests: the table settles (every ball at rest within a measured
      time), energy accounting; goldens, native and wasm.

## 7. Web layer (PR)

- [ ] Constructors, the cue (aim, speed, offset), the speculation switch,
      tunnel count, potting events, spin readout.

## 8. The page (PR)

- [ ] `m7-billiards`: cue drag, tip height, substeps, speculation,
      solver; the tunnel counter; the potted tray; smoke; gallery.
- [ ] Your check against **Done when**.

## 9. Cleanup (PR)

---

## Health audit (after A3)

Software-engineering health, not physics (PRs #122 on). Open:

- **Mutation, still to do:** `test-support` and `xtask` under
  `--test-workspace=true` (their misses are mostly artifacts). M6's
  collision files: done (16 missed of 164; 8 real gaps fixed, the rest
  equivalent, listed in the commit).
- **TODO: why the piano model is slow in debug builds.** Selecting it
  designs 88 keys' dispersion filters: 1.8 s unoptimized at 48 kHz,
  0.2 s with `acoustic`, `libm` and `math` at `opt-level = 3` (now set
  for dev builds). Is the time in `libm`'s transcendentals, the
  refinement's iterations, or something that could be designed lazily
  per key, or once and shared?

## Out of scope for M7

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

**M2 page at N = 4096 (found in review):** about 1 fps. One step of all
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
