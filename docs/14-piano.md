# 14 — Piano Voice

Status: **Adopted** (A3.1; as built: dispersion A3.2, the hammer A3.3,
string groups and the body A3.4, the synth A3.5, the page A3.6). Depends on `12-acoustic-foundations.md` (the
loop filter, tuning) and `13-waveguide.md` (the waveguide, positions on
the effective length, the FFT).

A1 and A2 made a plucked string. A3 makes it a piano: the string is stiff
steel, so its overtones run sharp; it's struck by a felt hammer that
stays on it for a millisecond or two; most notes have two or three
strings; and a body shapes the sound. Every number here is from a source
checked for this doc, or marked as **our choice** where the literature
gives a behavior but not a value.

## Stiff strings: partials run sharp

A stiff string is part string, part bar: bending stiffness adds a
restoring force that grows with frequency, so higher modes vibrate faster
than `k f₀`. For a plain stiff string with fixed ends (Fletcher 1964;
Rigaud et al. 2011, eq. 1):

```
f_k = k F₀ √(1 + B k²)          B = π³ E d⁴ / (64 T L²)
```

`B`, the inharmonicity coefficient, grows with the wire's stiffness `E`
and diameter `d` (as `d⁴`) and shrinks with tension and length.

### `B` across the keyboard

Rigaud, David & Daudet (2011) model `B` along the keyboard (MIDI note `m`,
21 to 108) as the sum of two straight lines in `log B`, one per bridge:

```
B(m) = e^(s_B m + y_B) + e^(s_T m + y_T)
```

- **The treble line is the same for every piano** (string design above C4
  is standardized): fitted on five pianos, C4–C8,
  `s_T ≈ 9.26 · 10⁻²`, `y_T ≈ −13.64`, matching a physics-based estimate
  (`9.44 · 10⁻²`, `−13.68`). We use it as measured.
- **The bass line differs per piano** (the bass bridge, wound strings: `B`
  rises again toward A0) and the paper reports it only as fitted curves.
  **Our choice:** a line through A0 = 2 · 10⁻⁴ (measured on a Steinway &
  Sons grand about 2.9 m long, Ortiz-Berenguer et al. 2004) meeting the
  treble line at C2, so `s_B ≈ −0.1193`, `y_B ≈ −6.012`. That's
  consistent with `B` of order 10⁻⁴ for the lowest strings of a large
  grand (Dalmont 2021; up to 10⁻³ on an upright).

| key | `B` | partial 2, cents sharp | partial 10, cents sharp |
|---|---|---|---|
| A0 (21) | 2.1e-4 | 0.7 | 17.8 |
| C2 (36) | 6.7e-5 | 0.2 | 5.8 |
| C3 (48) | 1.1e-4 | 0.4 | 9.4 |
| C4 (60) | 3.1e-4 | 1.1 | 26.5 |
| A4 (69) | 7.1e-4 | 2.5 | 59.4 |
| C6 (84) | 2.9e-3 | 9.8 | 217 |
| C8 (108) | 2.6e-2 | 86.5 | (above Nyquist) |

The bass's character is in its high partials: A0's 30th partial is about
150 cents sharp. A tuner stretches the octaves to match the sharp partials
(Rigaud et al. model the resulting tuning curve too); we don't: `f₀`
stays equal-tempered, as tuning is the tuner's art, not the string's
physics.

## Dispersion in the loop

In the waveguide, a stiff string means **higher frequencies travel
faster**, so a round trip takes less time at higher frequencies. Partial
`k` sits where the loop's phase delay `τ(f)` makes exactly `k` cycles:
`τ(f_k) = k fs / f_k`. The loop already has `N` samples, the lowpass and
the tuning allpass (`12`); stiffness adds a **dispersion filter** whose
phase delay falls with frequency, at the bridge with the others.

**A cascade of second-order allpasses** (A3.2), each a pole pair
`r e^{±jθ}`, `H = (r² − 2r cos θ z⁻¹ + z⁻²) / (1 − 2r cos θ z⁻¹ + r² z⁻²)`,
at most 16, designed in two steps:

1. **Placement** (Abel, Välimäki & Smith 2010; CCRMA's `adf.m`, ported
   line for line): the string needs a phase lag in excess of a pure
   delay; one biquad per 2π of it, each pole's angle where the excess
   reaches π, 3π, 5π, …, its radius from the spacing to its neighbors
   (their smoothing factor 0.85). Placement decides how many biquads and
   roughly where.
2. **Refinement** (ours): damped Gauss–Newton (Levenberg–Marquardt) on
   every pole's angle and radius, minimizing the first 30 partials'
   round-trip delays' errors, in cents, against `f_k`, with the loop's
   lowpass included. A fixed iteration limit and `libm`: the same bits on
   every platform (a stiff golden checks it on wasm).

Why not the simpler designs (measured on a prototype first):

- **Identical first-order sections** (Van Duyne & Smith 1994; Rauhala &
  Välimäki 2006 make them tunable by `B`): two numbers, `(a, M)`, can't
  fit 30 partials: 16 sections were 40–78 cents off at some partial.
- **Independent first-order sections:** no better. A first-order
  allpass's delay always peaks at DC, so they can't put delay mid-band.
- **Placement alone:** 10–200 cents off in our port. Its one-step
  approximations need the refinement.

**Measured:** designs within 0.66 cents over 30 partials from A0 to C6,
with 4–14 biquads; rendered partials (`measure::partial`, one by one)
within 0.20 cents of `k F₀ √(1 + B k²)` while they run up to 84 cents
sharp of `k f₁` (A4's 12th). Placement can give very few biquads where
`B` is smallest (C2 got 2, refined only to 1.6 cents), so it starts from
at least 4.

The cascade's delay at `f₀` goes into the **tuning budget**
(`N + τ_lowpass + τ_dispersion + Δ = fs / f₀`), so the fundamental stays
in tune: with stiffness on, all 88 keys measure within 0.026 cents
(`f32`, both rates). A short treble loop can't hold a large cascade, so
the dispersion gets at most half the loop; where it would take more
(A4: 14 biquads, 60 samples, in a 109-sample loop), it keeps the count
that fits and refines again. With fewer than two partials below 0.4 `fs`
(the top of the keyboard) there's no cascade at all.

**Cost:** designing takes 2–14 ms a key natively (about 200 ms for all
88), far beyond a note on's budget (a render quantum is 2.7 ms), so the
piano designs each key once, when it starts (A3.5, measured on wasm:
"Cost"). Running it costs a biquad (5 multiplies) per section per sample.

A toggle turns stiffness off (`B = 0`: A2's waveguide).

## The hammer

Chaigne & Askenfelt (1994) model the hammer as a **mass on a nonlinear
felt spring**: while the felt is compressed by `c` (the hammer's position
minus the string's at the strike point), it pushes with

```
F = K c^p          (c > 0; no force while apart)
```

What's measured, and what we do with it:

- **The exponent `p`:** static measurements of hammers from pianos give
  2.2 to 3.5 (unused hammers 1.5 to 2.8); in a voiced Steinway action
  `p` rises from about 2 in the bass to about 4 in the treble (Russell,
  summarizing Hall & Askenfelt). **We use** 2.3 in the bass rising to 3.0
  in the treble, inside the static range.
- **Contact time:** about 4 ms in the bass to under 1 ms in the highest
  treble at mezzo-forte, varying about ±20 % from p to ff, shorter when
  louder (Askenfelt, KTH lecture notes). The open literature we could
  check gives no hammer masses or felt stiffnesses `K` per key (they are
  in Chaigne & Askenfelt's table, not open), so **we fit** `M` and `K`
  per key to **reproduce those behaviors** (below), and the tests measure
  them.
- **The strike point:** **our choice**, an eighth of the length from the
  nut (the agraffe). A strike point near an eighth is the commonly cited
  piano design (it sits near the nodes of the 7th–9th harmonics, which A2
  showed a strike there weakens); not checked against a measurement for
  this doc.
- **Velocity** is the hammer's speed at impact. **Our choice:** 0.5 m/s
  (pp) to 5 m/s (ff), mf their geometric mean (1.58 m/s). A strike above
  twice ff (10 m/s, `MAX_VELOCITY`) is refused: a finite but huge speed
  overflowed the `f32` strings and panicked (found by the ABI property
  test).
- **The string's wave impedance `Z = √(T μ)`, our choice:** about 750 N
  of tension; a heavy wound string at A0 (`Z` = 10 kg/s), plain wire of
  about 1 mm at C4 (2.2) and 0.8 mm at C8 (1.7), log-linear between.

### Coupling, as built (A3.3)

Everything is in physical units (m, kg, N), so the string's energy can be
checked against the hammer's.

- **A junction between two cells.** A point force moves the string at
  `F / 2Z` (it launches half each way), so each wave it launches carries
  displacement `I / 2Z`, `I = ∫F dt`. The force acts between two cells,
  not on one: adding to both rails in one cell counts that cell twice
  (our first prototype did). After the hammer leaves, `I` stays constant:
  the step it launched reflects inverted at the ends and cancels.
- **Energy-conserving and implicit.** Each sample, the hammer moves by
  the midpoint rule and the felt's force is its potential's difference
  quotient (a discrete gradient): `F̄ = (V(c₁) − V(c₀)) / (c₁ − c₀)`,
  `V = K c^(p+1) / (p+1)`. Kinetic plus felt energy then changes by
  exactly the work done on the string. The new compression solves one
  monotone scalar equation (Newton, safeguarded). Energy-preserving
  schemes are the norm in piano models that check their energy
  (Chabassier, Chaigne & Joly 2013). Both simpler schemes failed:
  explicit stepping (the force a sample late) put up to 16× the hammer's
  momentum into the string, and backward Euler lost 30–50 % of an
  elastic bounce's energy. Against a rigid wall, ours keeps it to 10⁻⁹,
  and the contact time matches Hertz's closed form to 0.02 %.
- **Re-contact.** In the treble the near end's reflection can kick the
  string away from a hammer still flying forward, so it touches again
  (several pulses in one blow, as measured on real pianos). The hammer
  stays a free mass until it moves away from the string, then retires.

### Fitting each key's hammer

Two measurements, two unknowns per key: `M` and `K` such that a **cheap
model** of the blow gives the key's contact time at mf (4 ms at A0 to
0.8 ms at C8, log-linear: the ends measured, the curve ours) **and** the
pp-to-ff spread (`τ_pp / τ_ff` = 1.5, our reading of ±20 %). The cheap
model is the hammer against the string's near end only: the wave
launched toward the nut comes back inverted after `1/8` of a period,
which is what throws the hammer off in the bass (4.5 ms at A0). The fit
is a nested bisection: for each mass, `K` for the contact time; then the
mass for the spread.

- Fitting `K` alone drove the tenor's felt nearly rigid (its target sits
  near the string's own floor, about `M / 2Z` plus the near return), and
  then velocity barely changed the sound. Hence the spread as a second
  target.
- The exact per-key fit is **jagged** (neighbors 2.7× apart in mass): the
  near return is a whole number of samples, and the fit hops between
  branches where a contact pulse appears. The piano uses a **smooth
  cubic** through it in `log M` and `log K`: about 15 g at A0, 2 g in the
  middle, rising to 3.7 g at C8 (not monotonic, unlike real hammers: a
  result of our `Z` curve, not a measurement).
- Fitting all 88 keys takes seconds, so it runs offline: eight
  coefficients in `hammer/table.rs`, regenerated by an ignored test.
  **Refitted after A3** (health audit): the cheap model's contact times
  had run to the next whole sample (separation wasn't interpolated, up
  to 21 µs at 48 kHz). The coefficients moved by under 0.1 % in their
  constant terms, and the numbers below by a hertz or a thousandth.

**Measured on the waveguide** (with stiffness):

- mf contact within 27 % of the target at every key (most within 10 %),
  shorter at every step from pp to ff, and C8's under 1 ms; spread 1.34
  to 2.17.
- **No energy from nowhere:** when the hammer leaves, the string's energy
  plus the hammer's is at most 1.0000 of the impact's (and at least
  0.965: the rails' measure misses what's inside the bridge's filters).
- **Brighter and louder when harder** (the bridge force's spectral
  centroid and level), from A0 to C5. Bass contacts are short against a
  period, so a harder blow, a shorter pulse, reaches higher partials:
  A0's centroid rises from 109 to 192 Hz from pp to ff.
- **Known gap, the treble:** from C6 up, the blow outlasts a period, the
  string takes only 0.2–13 % of the hammer's energy, and every partial
  sits in the force pulse's spectral sidelobes: neither brightness nor
  level rises reliably with velocity (C6's centroid even falls slightly,
  1102 → 1050 Hz). The cause is our interpolated contact times (only
  "under 1 ms" at the very top is measured), plus a waveguide only five
  cells long at C8.

## String groups

Most piano notes have two or three strings, tuned a few cents apart.
**Our choice by register:** 1 string from A0 to E1, 2 from F1 to G♯2, 3
above; neighboring strings 1 cent apart, spread symmetrically about the
note (±½ cent for a pair; −1, 0, +1 for a trio). **Uncoupled**: each
string is its own waveguide and their forces on the bridge sum, so
neighbors `Δf = f (2^(1/1200) − 1)` apart beat at `Δf` (for an evenly
spread trio, the envelope `|1 + 2 cos(2π Δf t)|` repeats at `Δf` too).
Real strings couple through the bridge, which is what gives a piano's
two-stage "double decay" (a fast initial drop, then a long aftersound)
and its polarization effects (Weinreich 1977); A3 leaves coupling out (a
stretch, measured if attempted).

**A hammer per string** (A3.4): each string is struck by its own copy of
the key's fitted hammer. At impact the strings are identical, and a cent
barely changes them during a 1–4 ms contact, so `N` hammers of mass `M`
on `N` strings behave like one of `N M` on all of them: the fitted hammer
is a hammer per string (making a whole trio's about 6 g in the middle),
and the contact times stay the tested ones. A shared hammer (one mass, `N`
felt contacts, coupled equations each sample) would differ inaudibly.

**Measured:** a trio's bridge force is 3× one string's within 1.7 · 10⁻⁴
of the peak over its first 6 ms; groups make no energy (the strings' and
hammers' energy at most 0.9999 of the hammers' at impact); a pair (G♯2,
0.060 Hz) and a trio (C5, 0.302 Hz) beat at their detuning, +2.0 % and
+0.75 %.

## The body

A few fixed resonances on the voice's output: the direct sound plus five
bandpass biquads in parallel (constant 0 dB peak, Bristow-Johnson's
cookbook), at 90, 200, 450, 1000 and 2200 Hz with Q of 4–6 and gains
falling from 1 to 0.3: soundboard-like coloring, **our choice** (a
soundboard's lowest modes are near 50–100 Hz and get denser upward; these
are not a measured soundboard). Commuted synthesis (a measured body
response folded into the excitation) is out of scope.

**Measured:** 2–6 dB peaks at each resonance over the points between
them, flat (0.003 dB) at 15 kHz where only the direct sound is left, the
ring gone within a second, and `f32` within 10⁻⁵ of `f64`.

## The piano in the synth (A3.5)

- **`Model::Piano`** beside the loop and the waveguide. Each of the 16
  voices holds three strings sized for A0, allocated once, re-struck for
  any key without allocating.
- **The design table.** A key's dispersion takes milliseconds to design,
  so the first switch to the piano designs all 88 at once (a one-time
  pause, measured below), and every strike looks its key up. A key's
  strings, a cent apart, share its design: their tuning allpasses absorb
  the cent.
- **A fixed decay per key.** A design depends on the loop lowpass's
  stretch, which the decay sets, so the piano doesn't take the pages'
  decay setting: its fundamental's T60 falls from 20 s at A0 to 1.5 s at
  C8, geometrically (**our choice**, the shape of a piano's, not a
  measured curve).
- **Velocity per note:** `strike(key, m/s)`, `synth_note_on_velocity` in
  the ABI, an optional `velocity` on the worklet's note message; a plain
  note on is mf (1.58 m/s).
- **The stiffness toggle:** off, the strings are A2's ideal ones (no
  cascade), from the next strike.
- **One body** on the piano voices' summed bridge force (linear, so one on
  the sum is one per voice), scaled to output by `PIANO_SCALE` = 0.014
  (**our choice**: the loudest case tried, a ff cluster of seven treble
  keys, peaks at 0.77 at the default gain; a ff chord at 0.46).

**Measured:** in tune within 0.0027 cents (the strings' mean); louder
when harder; C4's 10th partial at −0.01 cents with stiffness off and
+26.15 on (`B` predicts +26.19); nothing clipped; a released note frees
its voice.

## The page (A3.6)

`site/demos/a3-piano/`: the piano in the browser.

- **Velocity from where a key is pressed:** the top of a key is pp (0.5
  m/s), the bottom ff (5 m/s), geometrically between, as on a real key
  (pressing deeper is pressing harder). The computer keyboard uses a
  velocity slider; songs play at mf.
- **Stiff or ideal strings**, from the next strike.
- **The spectrum:** gray lines at the harmonics `k f₁`, short yellow
  ticks at the stiff string's partials `k F₀ √(1 + B k²)`: they drift
  apart up the spectrum.
- **The hammer:** the latest strike's force against time (12 ms), with
  its peak and how long the felt pushed; the near end's reflection shows
  as a second hump mid-blow (C4 at mf: 5.3 N, 1.88 ms).
- **The string:** the middle string's shape, scaled to its peak (a
  fraction of a millimetre), the hammer's point marked.
- **The readout:** the key's strings, `B`, and how sharp its 10th partial
  runs. `B` and the string count come from two pure exports, read from
  the module's own instance on the page, so the constants live only in
  Rust.
- **Smoke:** C4 at mf rendered offline; its 10th partial is 69.9 dB
  louder at the stretched frequency than at the harmonic one.

## Cost

Per voice: up to three strings, each a waveguide with up to 16 biquads
more than A2; the hammer while in contact; the body (once, on the sum).
Measured (A3.5), 16 voices of three-string keys at 48 kHz, against the
2.67 ms of a 128-frame quantum:

| | native | wasm (V8, the browser build) |
|---|---|---|
| a quantum, the hammers gone | 54 µs (2 %) | 78 µs (3 %) |
| a quantum, all 48 hammers in contact | | 456 µs (17 %) |
| designing all 88 keys, once | 177 ms | 230 ms |

The hammer's per-sample force solve is the costly part, and only while a
hammer is on its string (a few milliseconds a strike).

## Tests

- **Stretched partials:** low and middle notes' partials, measured with
  `measure::partial` per harmonic, at `k f₀ √(1 + B k²)` within cents; the
  fundamental in tune at all 88 keys with stiffness on.
- **The hammer:** contact time in the measured range per register and
  shorter for harder strikes; brightness (the spectral centroid of the
  force on the bridge, which drives the soundboard) and level rising
  monotonically with velocity, where the blow is shorter than a period;
  no energy from nowhere (the string's energy after contact plus the
  hammer's is bounded by the hammer's at impact, in joules). A rigid-wall
  bounce against Hertz's closed form.
- **String groups:** beating at the detuning's rate; a group struck like
  `N` strings under one hammer; no energy from nowhere.
- **The body:** its response peaks at its resonances; stable.
- **Determinism:** goldens, native and wasm, for a stiff waveguide
  performance and a piano one (mixed velocities, a release).

## References

Full entries in `references.md`.

- Fletcher (1964), *Normal Vibration Frequencies of a Stiff Piano
  String*: `f_k = k F₀ √(1 + B k²)`.
- Young (1952), *Inharmonicity of Plain Wire Piano Strings*.
- Rigaud, David & Daudet (2011), *A Parametric Model of Piano Tuning*:
  `B` along the keyboard, the treble line's constants.
- Ortiz-Berenguer, Casajús-Quirós, Torres-Guijarro & Beracoechea (2004),
  *Piano Transcription Using Pattern Recognition: Aspects on Parameter
  Extraction*: A0's `B` on a Steinway grand.
- Dalmont (2021), *Piano bass strings with reduced inharmonicity*:
  the order of `B` in the bass.
- Van Duyne & Smith (1994), *A Simplified Approach to Modeling Dispersion
  Caused by Stiffness in Strings and Plates*: the first-order cascade.
- Rauhala & Välimäki (2006), *Tunable Dispersion Filter Design for Piano
  Synthesis*.
- Abel, Välimäki & Smith (2010), *Robust, Efficient Design of Allpass
  Filters for Dispersive String Sound Synthesis*: the biquads' placement
  (`adf.m`).
- Chaigne & Askenfelt (1994), *Numerical Simulations of Piano Strings*,
  parts I and II: the hammer model.
- Russell, *The piano hammer as a nonlinear spring* (Penn State): `p`'s
  measured ranges.
- Askenfelt, *From touch to string vibrations* (KTH lecture notes):
  contact times.
- Weinreich (1977), *Coupled Piano Strings*: double decay, coupling.
- Bristow-Johnson, *Audio EQ Cookbook*: the body's bandpasses.
- Chabassier, Chaigne & Joly (2013), *Modeling and simulation of a grand
  piano*: energy-preserving schemes for the hammer and string.
