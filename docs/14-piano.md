# 14 — Piano Voice

Status: **Adopted** (A3.1). Depends on `12-acoustic-foundations.md` (the
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

**A cascade of identical first-order allpasses** (Van Duyne & Smith
1994): each section `(a + z⁻¹) / (1 + a z⁻¹)` has a phase delay that
falls with frequency for `a < 0`, and `M` of them in series give a
smooth, monotonic dispersion with two numbers to choose. Rauhala &
Välimäki (2006) give closed-form designs tunable by `B`; we fit `(a, M)`
numerically at note on instead (a few dozen evaluations in `f64`, with
`libm`: still bit-identical on wasm), minimizing the error of the first
partials against `f_k`, so the filter is checked against the formula it's
meant to reproduce. All its delay at `f₀` goes into the **tuning budget**
(`N + τ_lowpass + τ_dispersion + Δ = fs / f₀`), so the fundamental stays
in tune: the 88-key sweep runs again with stiffness on.

A toggle turns stiffness off (`B = 0`: A2's waveguide).

## The hammer

Chaigne & Askenfelt (1994) model the hammer as a **mass on a nonlinear
felt spring**: while the felt is compressed by `c` (the hammer's position
minus the string's at the strike point), it pushes with

```
F = K c^p          (c > 0; no force once it leaves)
```

and each sample the hammer decelerates by `F / M_h` while the force
enters the string at the strike point. In the waveguide, a force at a
point launches equal waves both ways (displacement waves, each
`F / 2Z` in velocity, `Z` the string's wave impedance), at A2's
positions. The hammer leaves when it falls behind the string; the force
is then zero for good (no second strike in A3).

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
  in Chaigne & Askenfelt's table, not open), so **we choose** `M_h` and
  `K` per register to **reproduce those contact times**, and the tests
  measure them. The constants are ours; the behavior is the measured one.
- **The strike point:** **our choice**, 1/8 of A2's effective length. A
  strike point near an eighth is the commonly cited piano design (it sits
  near the nodes of the 7th–9th harmonics, which A2 showed a strike there
  weakens); not checked against a measurement for this doc.
- **Velocity** is the hammer's speed at impact. **Our choice:** 0.5 m/s
  (pp) to 5 m/s (ff), mapped from the on-screen key's press height or a
  slider. Whatever the range, the tests require brightness and loudness
  to rise monotonically with it.

Why it's brighter when harder: the felt stiffens as it compresses
(`p > 1`), so a faster hammer meets a stiffer spring and a shorter
contact, a shorter pulse with more high-frequency energy. That's the
monotonic-brightness test, and the shorter contact is the other.

## String groups

Most piano notes have two or three strings, tuned a few cents apart.
**Our choice by register:** 1 string from A0 to about E1, 2 to about
G#2, 3 above; detuned by a couple of cents (spread symmetrically).
**Uncoupled**: each string is its own waveguide and the outputs sum, so
two strings `Δf` apart beat at `Δf`. Real strings couple through the
bridge, which is what gives a piano's two-stage "double decay" (a fast
initial drop, then a long aftersound) and its polarization effects
(Weinreich 1977); A3 leaves coupling out (a stretch, measured if
attempted).

## The body

A few fixed resonances (biquad bandpasses summed with the direct sound)
on the voice's output: soundboard-like coloring, **our choice** of
frequencies and gains (not a measured soundboard). Commuted synthesis (a
measured body response folded into the excitation) is out of scope.

## Cost

Per voice: up to three strings, each a waveguide with `M` allpass
sections more than A2; the hammer while in contact; the body. 16 voices
× 3 strings is measured in a bench before the page, against a 128-frame
render quantum.

## Tests

- **Stretched partials:** low and middle notes' partials, measured with
  `measure::partial` per harmonic, at `k f₀ √(1 + B k²)` within cents; the
  fundamental in tune at all 88 keys with stiffness on.
- **The hammer:** contact time in the measured range per register and
  shorter for harder strikes; brightness (energy above the first few
  partials, relative to the total) and level rising monotonically with
  velocity; no energy from nowhere (the string's energy after contact is
  bounded by the hammer's kinetic energy at impact, in the model's
  units).
- **String groups:** beating at the detuning's rate.
- **The body:** its response peaks at its resonances.
- **Determinism:** goldens, native and wasm.

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
  Caused by Stiffness in Strings and Plates*: the allpass cascade.
- Rauhala & Välimäki (2006), *Tunable Dispersion Filter Design for Piano
  Synthesis*.
- Chaigne & Askenfelt (1994), *Numerical Simulations of Piano Strings*,
  parts I and II: the hammer model.
- Russell, *The piano hammer as a nonlinear spring* (Penn State): `p`'s
  measured ranges.
- Askenfelt, *From touch to string vibrations* (KTH lecture notes):
  contact times.
- Weinreich (1977), *Coupled Piano Strings*: double decay, coupling.
