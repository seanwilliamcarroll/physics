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

**As built (A2.3,** `acoustic::Waveguide`**):** A1's loop filter became a
shared `Bridge` type that both models call (A1's golden hash unchanged by
the refactor, native and wasm), so the equivalent configuration really is
the same arithmetic in the same order. Measured: from a loop's state, the
waveguide reproduces the loop **bit for bit** over 20,000 samples for
five notes (55 Hz to 1 kHz, odd and even loops, tuned and untuned), in
both scalars. And A1's bar, rerun on the waveguide read at a pickup: all
88 keys within **±0.0073 cents** (the loop: ±0.0056), `T₆₀` within
**0.1%** at every note tried. Positions are fractions of the length
measured **from the bridge** (so "near the bridge" is small, as players
say it); the physics is symmetric (`|sin kπβ| = |sin kπ(1 − β)|`).

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

**As built (A2.4,** `tests/positions.rs`**): the effective length.** The
first measurements put the nulls at only about −40 dB under the
fundamental, and moving the pluck 0.05 off `1/n` raised the harmonic only
10–20 dB: something filled them in. The bridge. Its filters (the
lowpass's half sample, the allpass's `Δ`, the odd sample) delay the
reflection, so to the waves the string is longer than its `M` cells: a
round trip costs `τ_b` extra samples, as if the string reached `τ_b / 2`
cells past the bridge. Measuring "1/n" on the bare cells put it a few
thousandths of the length off the real node (≈ 0.004 at `n = 2`), enough
to leave −40 dB. The effective length is exactly half the loop's period,
`fs / 2f₀` cells; with positions measured on it, the nulls fall to about
**−73 dB**, moving onto `1/n` drops harmonic `n` by **45–46 dB** (pluck)
and **50–51 dB** (pickup) against `1/n ± 0.05`, `n` = 2–5, and the first
harmonics follow `sin(kπβ) sin(kπp) / k²` within **0.5 dB** (β = 0.2,
p = 0.1; the remainder is the bridge taking a little more from the
higher ones). Both scalars alike; a golden hash of a waveguide render
matches on wasm.

(A measurement lesson on the way: `partial` must span several periods of
the *fundamental*, not of the harmonic, or the Hann window's main lobe
can't separate partials `f₀` apart.)

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

**As built (A2.2,** `acoustic::fft`**):** butterflies through
`chunks_exact_mut` and `split_at_mut` (each pass's two halves without an
index); twiddles and the bit-reversal table built once in `Fft::new`, so
`forward` never allocates. Against the naive DFT at 1024 points: worst
error 9.6e-12 (f64; much of it the naive DFT's own `cos` of large
arguments) and 5.7e-6 (f32). Cost (`cargo bench -p acoustic --bench
fft`, f32, Apple silicon): 4.4 µs at 1024 points, 20.5 µs at 4096,
101 µs at 16384 (N log N); the page's whole spectrum (window, FFT, dB)
26.1 µs, so even a few times slower in wasm it's well under a tenth of a
render quantum.

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
