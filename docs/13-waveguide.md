# 13 — Waveguide String

Status: **Adopted** (A2.1). Depends on `12-acoustic-foundations.md` (the
loop, tuning, decay, voices, the worklet). Reference: Smith, *Physical
Audio Signal Processing* (PASP), "Digital Waveguide Models".

A1's Karplus–Strong loop is one round trip of the signal, observed at one
point: it has a pitch and a decay, but no *where*. A2 keeps the string's
length. Two traveling waves run along it and reflect at its ends; you can
pluck it anywhere and listen anywhere, and the page can draw its shape.
Where you pluck and where you listen decide which harmonics exist, and a
spectrum (from an FFT we write) shows it.

## The ideal string, exactly

The ideal string's wave equation, `y_tt = c² y_xx`, has d'Alembert's
solution: any displacement is the sum of a shape moving right and a shape
moving left at speed `c`,

```
y(x, t) = y⁺(x − ct) + y⁻(x + ct)
```

Sample time at `fs` and space at `c / fs` (one sample of travel per
sample of time), and each traveling wave is just a **delay line**: every
sample, each value moves one cell along. That's the *digital waveguide*
(Smith). It's not an approximation of the wave equation like a finite
difference scheme (A4): at the sample points it is the exact solution,
with no numerical dispersion. All the modeling is in what happens at the
ends, and in the losses, which we lump into one place.

## Rails and ends

```
          nut (x = 0)                           bridge (x = L)
            │  r: → → → → → → → → → → → → → → →  │
      × −1  │                                    │  × −1, lowpass, loss, allpass
            │  l: ← ← ← ← ← ← ← ← ← ← ← ← ← ← ←  │
```

- **Two rails** of `M` samples each: `r` (right-going) and `l`
  (left-going). Cell `i` is the string at `x = (i + ½) L / M`.
- **Fixed ends reflect with −1**: a displacement wave arriving at a rigid
  end comes back inverted (the end can't move, so the two waves cancel
  there).
- **The bridge** also carries everything A1's loop had: the lowpass
  `(1 − S) + S z⁻¹` with the loss `ρ`, and the allpass fractional delay.
  Lumping them at one end is exact for a linear, time-invariant string:
  filters commute, so where around the loop they sit doesn't change the
  output, only the signal inside (Smith: "commuted" losses).

**The loop budget is A1's.** A round trip is `2M` samples of rail plus the
bridge's filters, and the pitch is the round trip's inverse. A1 chose an
integer `N` and a fractional `Δ` so that `N + τ_lowpass + Δ = fs / f₀`;
here `N` is shared as `2M` plus, when `N` is odd, **one more sample of
delay inside the bridge**. So the rails stay the same length and every
position on the string maps symmetrically onto both, and the loop is
still exactly `N` samples. Tuning and `T₆₀` carry over unchanged, and so
do their tests (88 keys, both rates, both scalars).

## Karplus–Strong is the special case

Fold the string at the bridge: the right rail followed by the left rail,
the nut's −1 in between, is one loop of `2M` samples with the bridge's
filters in it. That's A1's delay line. The two −1 reflections multiply to
+1, so nothing is inverted overall.

So a waveguide started from the state of an A1 loop (its delay line laid
out along the right rail, then on to the left rail, negated by the nut's
reflection, in order) must produce **the same samples at the bridge as
the loop**, sample for sample. In that configuration the two models do
the same arithmetic in the same order, so the test is bit-exact in both
scalars. It isn't a design constraint: it pins down the shared machinery
(the rail lengths, the reflection signs, where the filter sits, the odd
sample). With that checked, whatever sounds different when you move the
pluck or the pickup comes from position, the new physics, not a bug.

## Plucking at a point

A pluck pulls the string aside at `βL` and lets go: the initial
displacement is a **triangle** peaked at `β`, with zero velocity. Zero
velocity means the two traveling waves start equal, each half the
shape: `r[i] = l[i] = y(xᵢ) / 2`.

The triangle's Fourier series on a string fixed at both ends gives mode
`k` an amplitude

```
a_k ∝ sin(k π β) / k²
```

So **plucking at `β = 1/n` leaves out every `n`th harmonic**: those modes
have a node exactly where the string was pulled, so the pluck can't excite
them. At the middle (`n = 2`) only odd harmonics sound: hollow, like a
clarinet. Near the end (small `β`): many harmonics, bright, like a guitar
plucked by the bridge.

Noise stays available as an excitation: it has no position (every cell
random), so it excites every mode, and sounds like A1.

## Listening at a point

The output is the **displacement at the pickup**, `p`: `r(p) + l(p)`,
read between cells by linear interpolation (positions are continuous on
the page). A pickup at `p` hears mode `k` in proportion to its shape
there:

```
pickup weight ∝ sin(k π p)
```

so it's deaf to every `n`th harmonic at `p = 1/n`, the same rule. Together,
harmonic `k` sounds as `sin(kπβ) sin(kπp) / k²` (times the decay each
harmonic gets at the bridge). Displacement only: a magnetic guitar pickup
senses velocity, which weights harmonics by another `k` (out of scope).

## The spectrum: an FFT we write

`acoustic::fft`: radix-2 Cooley–Tukey, in place, iterative (bit-reversal
permutation, then `log₂ n` passes of butterflies), generic over `Scalar`,
with twiddle factors from `libm` (bit-identical on wasm, A1's
reasoning). Tested against a naive `O(n²)` DFT, and on known tones.

The synth keeps its last 4096 output samples. When the worklet asks for a
snapshot, a Hann-windowed FFT turns them into dB magnitudes (11.7 Hz per
bin at 48 kHz), sent with the string's shape. The page draws 0–5 kHz,
with ticks at the note's harmonics and the ones the pluck and pickup
predict missing marked, so you can watch them vanish as the slider
passes 1/n.

## One synth, two models

A voice holds either A1's `KsString` or the new `Waveguide` (an enum),
set by `synth_set_model`. The A1 page keeps the loop; the A2 page uses the
waveguide. Voicing (tuning, decay), voices, the worklet, the keyboard and
the songs are shared as they are.

## Tests

- **KS equivalence**: bit-identical to A1's loop from the same state, both
  scalars, odd and even `N`.
- **Tuning and decay** on the waveguide: the 88-key sweep and the `T₆₀`
  targets, as in A1.
- **Missing harmonics**: pluck at `1/n` (several `n`, several notes): the
  `n`th harmonic, measured with `measure::partial` at `n f₀`, at least a
  measured margin below its neighbors; the same for the pickup.
- **The shape**: the first harmonics' measured amplitudes follow
  `sin(kπβ)/k²` within a measured tolerance.
- **FFT**: against the naive DFT; known tones land in their bins.
- **Determinism**: a golden hash of a waveguide performance, native and
  wasm.

## Out of scope

Stiffness and dispersion, a hammer that interacts with the string, string
groups, a body (A3); two-dimensional strings and membranes (A4–A5);
velocity and acceleration pickups.

## References

Full entries in `references.md`.

- Smith, *Physical Audio Signal Processing*: digital waveguides,
  traveling waves, commuted losses, Karplus–Strong as a waveguide.
- Karplus & Strong (1983), Jaffe & Smith (1983): the loop and its
  filters (`12`).
- Cooley & Tukey (1965), *An Algorithm for the Machine Calculation of
  Complex Fourier Series*: the FFT.
