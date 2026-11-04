# TASKS — A1: Plucked string (Karplus–Strong)

Source: `docs/05-roadmap.md` (A1), `docs/00-scope.md` ("Acoustic
track"), `docs/03-wasm-shell.md` ("Not now": wasm-bindgen),
`docs/hosting.md` (cross-origin isolation; secure context).

**Goal:** the 2015 Piano Gloves core, redone properly: a delay line and a
lowpass make a convincing plucked string, tuned to the cent by a
fractional delay, with its decay under control and its buffer drawn live.

**Done when:** an on-screen keyboard plays in tune, and a toggle that
turns the fractional delay off makes the integer-delay detuning audible
(and measured).

## Workflow

- Each numbered section gets its own branch (`a1/<n>-<name>`) and one PR
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

## ⏸ M6: Colliding masses (paused after section 6, PRs #76–#82)

`docs/08-collision.md`; `Radius`, `Restitution`, walls; a sorted-cell-
list broadphase (proptest superset of brute force); the narrowphase
(speculative contacts, `CONTACT_MARGIN`); contacts in XPBD and the
impulse solver (accumulated clamp, warm start by pair, split pseudo-
impulse, restitution pass), tested on both: analytic head-on, momentum to
rounding, `e²` bounces, stacks at rest. **Paused (your call)** at the
scenes: Newton restitution with simultaneous contacts loses energy
through touching chains (a touching rack keeps 18–62%) and gains it when
one ball hits two (a gapped rack keeps 115–136%). The scenes and the
measurements are a local WIP commit on `m6/7-scenes`; the candidate fix
is Poisson restitution. Sections 7–10 (scenes, web, pages, cleanup)
remain.

---

## Decisions to review before starting

1. **Two new crates.** `acoustic` (library: delay line, string, voices,
   offline rendering; generic over `math::Scalar`, so f32 and f64 get the
   same tests now and fixed point can follow in M8) and `acoustic-web`
   (a `cdylib`, its own small `.wasm`). The audio module stays
   independent of the engine and tiny; the engine's `.wasm` is untouched.
2. **No wasm-bindgen.** The same raw C ABI as `web` (`03-wasm-shell.md`):
   exports over pointers into wasm memory. The roadmap guessed audio would
   be where wasm-bindgen arrives; it isn't needed for A1.
3. **Loading wasm into the worklet.** `AudioWorkletGlobalScope` has no
   `fetch`, so the page compiles the `WebAssembly.Module` and posts it to
   the worklet (a `Module` is structured-cloneable), which instantiates it
   synchronously. The worklet calls one export per 128-frame render
   quantum, writing into a buffer in wasm memory that it copies out.
4. **`postMessage`, not shared memory.** Notes and settings go in, and
   delay-line snapshots come out at display rate, over the worklet's
   `port`. No `SharedArrayBuffer`, so no cross-origin isolation headers on
   the host (`hosting.md` deferred the choice to A1).
5. **f32 at run time**, both scalars in tests. The sample rate is
   whatever the `AudioContext` reports (44.1 or 48 kHz); delay lengths are
   computed from it, and tests run at both.
6. **The Karplus–Strong loop** (Jaffe & Smith 1983): delay line of `N`
   samples, two-point averaging lowpass (half a sample of delay), and a
   first-order allpass for the fractional remainder, so the loop is
   exactly `fs / f0` samples. Decay control by the loss factor (and decay
   stretching for the high notes, which otherwise die too fast). The
   fractional delay can be switched off, back to the integer loop.
7. **Tests measure, offline, in Rust:** the fundamental by
   autocorrelation (with interpolation) within a cents bound across the
   keyboard, with the integer loop's error recorded as a known failure;
   decay time (T60) against its setting; both scalars, both rates.
8. **Determinism:** the noise excitation is seeded (the engine's
   `SplitMix64` pattern), and a golden hash of rendered audio is checked
   native and on wasm (`test-wasm`), like the engine's.
9. **Polyphony:** a fixed pool of voices (8) with oldest-note stealing;
   on-screen keyboard plus the computer keyboard.
10. **Excitation:** a seeded noise burst, or the Piano Gloves triangle
    (a hammer shape placed near one end of the delay line).
11. **Browser smoke test** with `OfflineAudioContext`: render a second of
    audio with no speakers, check it's audible and finite (headless Chrome
    can't be trusted to play real-time audio).

---

## ✅ 1. `docs/12-acoustic-foundations.md` (done)

How wasm makes sound (worklet, render quantum: 128 frames by default but
read from the buffer, `renderSizeHint` exists; module posted to the
worklet; ping-ponged snapshot buffers; autoplay); the loop (`N + ½`
samples; the integer loop is ~75 cents off at C8); allpass tuning with
`Δ ∈ [0.1, 1.1)`; decay (`T₆₀` from `ρ` and stretching `S`); release;
excitation (noise minus its mean); 8 voices, gain ¼, clamp counted;
pitch by autocorrelation in cents, `T₆₀` by envelope fit. References:
Karplus & Strong 1983 (DOI checked), Web Audio API 1.1.

## ✅ 2. `acoustic` crate: the string (done)

`DelayLine` (ring buffer), `KsString` (integer loop, average, loss ρ;
`pluck(f)`, `render`), `measure::{pitch, t60, cents}`; tests in both
scalars, both rates, and on wasm (`test-wasm` now includes `acoustic`).
The integer loop measures `fs / (N + ½)` within 0.09 cents, and `T₆₀`
the loop formula to four digits. **Found:** three measurement mistakes
(total RMS isn't the fundamental's decay; one short period interpolates
badly; many periods need a good first guess), fixed and recorded in `12`.

## ✅ 3. Tuning and decay (done)

`Voicing { tuned, decay: Loss(ρ) | T60(s) }`: the allpass coefficient
exact at `f₀` (`sin((1−Δ)w/2) / sin((1+Δ)w/2)`), the lowpass's exact
phase delay in the budget; `T₆₀` by `ρ` (shorten) or stretching `S`
(lengthen). `libm` adopted (your call) so coefficients are bit-identical
on wasm. Measured: 88 keys within **±0.006 cents** tuned; the integer
loop's known failure −75.5 / +71.1 cents at C8, 40–41 keys audibly off
(> 3 cents, from G3 up); `T₆₀` within **0.1%**. **Found:** inharmonic
partials fool the autocorrelation (−41 cents at C8), hence
`measure::partial` (the fundamental's DFT phase advance).

## ✅ 4. Excitation and voices (done)

`Excitation::{Noise, Triangle { peak }}` (zero-mean); `Voices` (8
strings preallocated for A0, re-strung in place so note on never
allocates; oldest stolen; release by an extra loss, pitch held; gain ¼,
clamp counted). `SplitMix64` moved to `math` (engine goldens unchanged).
Golden hash of a 1 s performance (chord, triangle melody, release, a
stolen voice): the same native and on wasm; peak 0.824, nothing clipped.

## 5. `acoustic-web` (PR)

- [ ] C ABI exports (render a block, note on/off, settings, snapshot);
      `xtask` builds the second `.wasm`; size recorded.

## 6. Site: the A1 page (PR)

- [ ] Worklet host (module handed over by the page), keyboard (screen and
      computer), tuning toggle, excitation choice, decay, the live delay
      line; `OfflineAudioContext` smoke case; gallery.
- [ ] Listening check against **Done when** (yours).

## 7. A1 cleanup (PR, if needed)

- [ ] Magic numbers, triggers, `docs/types.md`, small files.

---

## Out of scope for A1

- Pluck and pickup position, waveguides, spectra (A2).
- Stiffness, hammers, string groups (A3).
- SIMD and throughput benchmarks (A4/A5 and later).

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
