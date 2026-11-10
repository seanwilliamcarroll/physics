# TASKS — A3: Piano voice

Source: `docs/05-roadmap.md` (A3), `docs/00-scope.md` (Piano Gloves'
known limits), `docs/12-acoustic-foundations.md` and
`docs/13-waveguide.md` (the loop filter, the waveguide, positions, the
FFT).

**Goal:** what Piano Gloves couldn't do: stiff strings whose overtones
run sharp, a felt hammer that strikes and interacts with the string,
two or three detuned strings per key, and a body. A piano note, not a
plucked string.

**Done when:** low notes' partials are measurably stretched as the
stiffness predicts (and you can toggle it and hear the bass change), a
harder strike sounds brighter, not only louder, and a chord sounds like
a piano.

## Workflow

- Each numbered section gets its own branch (`a3/<n>-<name>`) and one PR
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

## ✅ M6: Colliding masses (done, PRs #76–#82, #133–#138)

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

---

## Decisions to review before starting

1. **Inharmonicity by dispersion filters in the loop.** A stiff string's
   partials sit at `f_k = k f₀ √(1 + B k²)`: higher partials travel
   faster, so the loop needs a frequency-dependent delay. A cascade of
   allpass filters at the bridge (Van Duyne & Smith 1994; Rauhala &
   Välimäki 2006 for tunable designs; both to verify in section 1), in
   the same place as A1's tuning allpass, so the waveguide, its positions
   and its tests carry over. The alternative, a finite-difference
   stiff-string scheme, is left for A4's drum, which needs finite
   differences anyway.
2. **The tuning budget includes the dispersion filter's delay at `f₀`**
   (as A1's included the lowpass's), so the fundamental stays in tune:
   the 88-key sweep runs again, now with stiffness.
3. **`B` per key from measurements of real pianos** (Fletcher 1964;
   Young 1952 for `B` across the keyboard; to verify), not one global
   setting: `B` is smallest in the low middle and grows toward the treble.
   A toggle turns it off to hear what it does.
4. **The hammer: a mass on a nonlinear felt spring** (Chaigne & Askenfelt
   1994): force `F = K |compression|ᵖ` (p around 2.5), stepped each
   sample against the string's displacement at the strike point, until
   it leaves the string. The force enters the waveguide at that point as
   equal waves both ways. Hammer mass, `K` and `p` per register from the
   paper; strike position near 1/8 of the string, as pianos are built.
5. **Velocity is the hammer's speed.** The on-screen piano reads it from
   where you press a key (lower is harder, as on a real key); the
   computer keyboard uses a velocity slider. Web MIDI (true velocity)
   stays deferred, your call from A1.
6. **String groups: 1, 2 or 3 strings per key by register** (bass 1,
   tenor 2, the rest 3), detuned by a few cents, summed. **Not coupled**
   through the bridge in A3: uncoupled strings beat but don't give the
   true "double decay", which comes from coupling (Weinreich 1977, to
   verify). Coupling is a stretch, measured if attempted.
7. **The body: a few fixed resonances** (biquads at soundboard-like
   frequencies) on the summed output. Commuted synthesis (a measured body
   response folded into the excitation) is out of scope.
8. **A new model, `Model::Piano`**, beside the loop and the waveguide:
   strings, hammer and body per voice, preallocated as before, so the A1
   and A2 pages are unchanged.
9. **Polyphony cost measured:** 16 voices × up to 3 strings, each with
   its dispersion chain, plus the hammer; a bench before the page, to
   confirm it fits a render quantum with room.
10. **Tests:** partials of low notes at the stretched frequencies (A1's
    `partial` per harmonic, within cents); the fundamental in tune at
    every key; hammer contact time shorter for harder strikes, and
    brightness (the share of energy above the first few partials)
    rising monotonically with velocity; beats at the detuning's rate; the
    body filter's response peaking at its modes; goldens, native and
    wasm.

---

## ✅ 1. `docs/14-piano.md` (done)

Every source checked (Crossref for DOIs; one remembered DOI was wrong:
Rauhala & Välimäki's is `10.1109/LSP.2006.870376`). **`B`:** Rigaud et
al. 2011's model; the treble line as measured on five pianos, the bass
line **our choice** anchored at A0 = 2 · 10⁻⁴ (a Steinway grand,
Ortiz-Berenguer et al. 2004) and consistent with Dalmont 2021.
**Hammer:** the open literature gives `p`'s range (2.2–3.5; ~2 → ~4 bass
to treble) and contact times (~4 ms bass → < 1 ms treble, ±20 % p→ff) but
not masses or `K` (Chaigne & Askenfelt's table isn't open), so `M_h`
and `K` are **chosen to reproduce the measured contact times**, and the
tests check them. Strike point, velocity range, string groups and body:
marked as our choices.

## ✅ 2. Dispersion (done)

**Second-order allpasses, not first-order** (the plan's chain; the
prototype showed first-order sections can't fit 30 partials, 40–78
cents off): up to 16 biquads, placed by Abel, Välimäki & Smith 2010
(`adf.m`) and refined by damped Gauss–Newton. Measured: designs within
0.66 cents over 30 partials; rendered partials within 0.20; 88 keys in
tune within 0.026 with stiffness on; a stiff golden, same on wasm.
**Design cost** 2–14 ms a key (~200 ms for 88, native): too slow for a
note on, so section 5 designs per key at start (measure on wasm there).

## ✅ 3. The hammer (done)

Physical units; a force at a junction; **energy-conserving** (discrete
gradient: explicit made energy, backward Euler lost 30–50 %); re-contact.
**`M` and `K` fitted to two measurements** (mf contact, pp→ff spread) on
a cheap model, then **smoothed** (a cubic; the exact fit was jagged),
offline into `hammer/table.rs`. Measured: contact within 27 %, shorter
when harder, C8 < 1 ms; no energy from nowhere; brighter and louder
when harder, A0 to C5. Treble gap below.

## ✅ 4. String groups and the body (done)

`Unison`: 1/2/3 strings (E1, G♯2 boundaries), 1 cent apart, a hammer per
string (a trio = 3× one string within 1.7e-4 at first), uncoupled, the
summed bridge force out; beats measured within 2 %. `Body`: five
bandpass biquads plus the direct sound. **For section 5:** `Unison`
holds a `Vec` of strings and designs each string's dispersion when
built; voices need it preallocated and re-strung (the per-key design
table), without allocating.

## ✅ 5. The piano in voices and the web layer (done)

**Your calls:** all 88 keys designed on the first switch to the piano;
a fixed decay curve per key (20 s → 1.5 s, our choice: a design depends
on the decay); velocity per note; **no hardness control**. `Model::Piano`,
preallocated three-string voices, one body on the sum, `PIANO_SCALE`;
`MODEL_PIANO`, `synth_note_on_velocity`, `synth_set_stiffness`, the
worklet's messages. Measured: in tune within 0.003 cents; louder when
harder; the toggle works; nothing clipped; a quantum of 16 × 3 strings
in 78 µs on wasm (456 µs while the hammers are on), the design 230 ms
once. A piano golden, same on wasm.

## 6. Site: the A3 page (PR)

- [x] `a3-piano`: velocity from where a key is pressed (pp at the top, ff
      at the bottom; a slider for the computer keyboard), stiff or ideal
      strings, strings per key and `B` in the readout, the spectrum with
      stretched-partial ticks, the latest strike's hammer force; smoke
      (`stretch_db` 69.9); gallery. Smoke now drives Chrome over DevTools
      and waits for the report (`--screenshot` quit at `load`, before
      A3's offline render).
- [x] Listening check against **Done when**: yours, "sounds pretty good".

## ✅ 7. A3 cleanup (done)

One pitch formula (the hammer fit regenerates bit-identically), the
cents factor and the table's key coordinate named once, the pages' log
floor named. Small files: the piano's voice methods, the waveguide's
hammer parts and the dispersion's refinement in their own modules.
`types.md` for A3 (and two stale A1 lines), the triggers re-checked
(velocity and felt checked once, in `Hammer::new`: not adopted),
`repo-layout.md`.

---

## Health audit (after A3)

Software-engineering health, not physics (PRs #122 on). Open:

- **Mutation, still to do:** `test-support` and `xtask` under
  `--test-workspace=true` (their misses are mostly artifacts); M6's
  `collision/narrowphase.rs` and `contact_solve.rs` when M6 resumes.
- **TODO: why the piano model is slow in debug builds.** Selecting it
  designs 88 keys' dispersion filters: 1.8 s unoptimized at 48 kHz,
  0.2 s with `acoustic`, `libm` and `math` at `opt-level = 3` (now set
  for dev builds). Is the time in `libm`'s transcendentals, the
  refinement's iterations, or something that could be designed lazily
  per key, or once and shared?

## Out of scope for A3

- Coupled strings through the bridge (a stretch, decision 6).
- Commuted synthesis, sympathetic resonance, the damper pedal.
- Web MIDI (deferred, your call in A1).
- Finite-difference strings (A4–A5).

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
Since the health audit the exact energy readout (about half a pairwise
step per panel: 6.6 ms at 4096 in the browser) runs 4 times a second,
not every frame; the gap is the steps alone (~55 ms a frame for the
three panels in the page), still well over a 60 Hz frame.

**CI is disabled:** `.github/workflows/ci.yml` (added in #73, green on
its runs) is turned off with `gh workflow disable CI`, so nothing on
GitHub's side checks a PR: it's only as clean as the hooks on the machine
that pushed it, and `--no-verify` skips them. `gh workflow enable CI` to
restore it.
