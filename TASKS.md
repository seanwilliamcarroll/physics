# TASKS — A2: Waveguide string

Source: `docs/05-roadmap.md` (A2), `docs/12-acoustic-foundations.md`
(the loop, tuning, decay, voices, the worklet), Smith, *Physical Audio
Signal Processing* (digital waveguides; Karplus–Strong as a special
case).

**Goal:** the string, not just its loop. Two traveling waves on a string
with fixed ends; where you pluck it and where you listen change the
timbre, and you can see why: harmonics go missing, as the spectrum shows.
And Karplus–Strong falls out as the same model, collapsed.

**Done when:** moving the pluck to 1/n of the string visibly and audibly
removes every nth harmonic (and the pickup does the same), and a
waveguide reproduces A1's Karplus–Strong output sample for sample.

## Workflow

- Each numbered section gets its own branch (`a2/<n>-<name>`) and one PR
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
remain; M6's cleanup should also trim its sorts (`engine.wasm` +65 KB,
26.7 KB of it sorting: `03-wasm-shell.md`).

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

---

## Decisions to review before starting

1. **The model** (Smith, *PASP*): two delay lines ("rails"), the
   right-going and left-going displacement waves, `N` samples in all
   (the round trip), split `⌈N/2⌉` / `⌊N/2⌋`. Each end reflects with −1
   (a fixed end). Displacement at a point is the sum of the two rails
   there, so the page draws the **string's shape**, not A1's loop.
2. **Losses and tuning lumped at one end** (the bridge): A1's lowpass,
   loss, and allpass fractional delay, unchanged, in the reflection. The
   loop budget is A1's (`N + τ_lowpass + Δ = fs / f₀`), so tuning and
   `T₆₀` carry over, and the 88-key and decay tests run again on the
   waveguide.
3. **Karplus–Strong is the special case, tested exactly:** a waveguide
   started from the state of an A1 loop (one rail its first half, the
   other its second half negated and reversed) reproduces the loop's
   output at the bridge **sample for sample** (bit-identical, both
   scalars). The claim becomes a test.
4. **Pluck position β** (a fraction of the length): the initial shape is
   a triangle peaked at β, zero velocity, split equally between the
   rails. Predicted harmonic amplitudes ∝ `sin(kπβ)/k²`, so β = 1/n
   removes every nth. Noise stays available as an excitation (it has no
   position).
5. **Pickup position p**: output is the displacement at p, read with
   linear interpolation between samples (positions are continuous on
   the page). Harmonics weighted by `sin(kπp)`.
6. **The showcase tests:** pluck (and pickup) at 1/n for several n and
   notes; harmonic n measured (A1's `partial`, at `n f₀`) at least a
   measured margin below its neighbors, both scalars, both rates. And
   `sin(kπβ)/k²` checked as a shape across the first harmonics.
7. **An FFT we write ourselves** (`acoustic::fft`): radix-2
   Cooley–Tukey, in place, generic over `Scalar`; tested against a naive
   DFT and on known tones. Used by the page's spectrum (and available to
   tests).
8. **The spectrum comes from the audio thread:** the synth keeps its last
   4096 output samples; on snapshot, a Hann-windowed FFT → dB magnitudes,
   sent with the string shape (same ping-pong buffers). The page draws
   0–5 kHz with ticks at the harmonics and the predicted missing ones
   marked.
9. **One synth, two models:** a voice holds either A1's `KsString` or
   the new `Waveguide` (an enum), chosen by `synth_set_model`; the A1
   page keeps the loop, the A2 page uses the waveguide. The keyboard and
   songs (`ks.ts`, `songs.ts`) are reused as they are.
10. **Determinism:** a golden hash of a waveguide performance, native and
    wasm, as A1's.

---

## ✅ 1. `docs/13-waveguide.md` (done)

Decisions as adopted, plus one the plan left open: **odd loop lengths.**
Both rails get `⌊N/2⌋` samples and, when `N` is odd, the extra sample is a
one-sample delay inside the bridge, so positions map symmetrically onto
both rails and the loop is still exactly `N`. Also written down: why the
waveguide is the exact sampled solution of the ideal wave equation (no
numerical dispersion, unlike A4's finite differences), why lumping the
filters at the bridge is exact (they commute), and how the KS equivalence
pins the shared machinery. Reference: Cooley & Tukey 1965 (DOI checked).

## ✅ 2. FFT (done)

`acoustic::fft::{Fft, Spectrum}`: radix-2 Cooley–Tukey in place
(index-free butterflies), everything precomputed so analysis never
allocates, `libm` twiddles. Against the naive DFT: 9.6e-12 (f64), 5.7e-6
(f32) at 1024 points; a tone lands in its bin; the spectrum reads a
full-scale sine at 0 dB. Bench: 4096-point spectrum 26.1 µs natively.

## ✅ 3. The waveguide string (done)

A1's loop filter extracted as `Bridge` (shared; A1's golden unchanged);
`voicing` moved to the crate root. `Waveguide`: two rails, inverting
ends, the bridge filter at one end, the odd sample inside it, pluck by
shape, linearly interpolated pickup, the string's shape for drawing.
**Bit-exact** to A1's loop from the same state (20,000 samples, five
notes, odd and even, tuned and not, both scalars). 88 keys within
±0.0073 cents, `T₆₀` within 0.1%, as the loop. Positions measured from
the bridge.

## 4. Pluck and pickup positions (PR)

- [ ] Triangle pluck at β, interpolated pickup at p; the missing-harmonic
      tests and the `sin(kπβ)/k²` shape; golden hash.

## 5. Voices and the web layer (PR)

- [ ] The voice enum (loop or waveguide); `synth_set_model`,
      `_set_pluck_position`, `_set_pickup`; the output history and
      spectrum; the string shape in the snapshot.

## 6. Site: the A2 page (PR)

- [ ] `a2-waveguide`: the string's shape with pluck and pickup markers,
      the spectrum with predicted missing harmonics, position sliders,
      the A1 keyboard and songs; smoke; gallery.
- [ ] Listening check against **Done when** (yours).

## 7. A2 cleanup (PR, if needed)

- [ ] Magic numbers, triggers, `docs/types.md`, small files.

---

## Out of scope for A2

- String stiffness and dispersion, a hammer, string groups, a body (A3).
- Two-dimensional strings and drums (A4–A5).
- Velocity or acceleration pickups (displacement only).

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
