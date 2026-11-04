# 12 — Acoustic Foundations

Status: **Adopted** (A1.1). Depends on `03-wasm-shell.md` (the raw C ABI)
and `00-scope.md` ("Acoustic track"). Numbered 12 because `05-roadmap.md`
reserves 08–11 for the core track and the sand branch.

A1 is the Piano Gloves core redone properly: a Karplus–Strong string in
Rust, compiled to its own small `.wasm`, run on the browser's audio
thread. This doc fixes how sound gets out (threading, buffers, sample
rates), the string's loop and its two tuning problems (pitch and decay),
and how tests measure both offline.

## How wasm makes sound

Wasm never touches the audio hardware; the browser's Web Audio API does.
Wasm computes samples, fast:

```
AudioContext ─► AudioWorkletNode ──────────────────────► speakers
                  │ runs on the browser's audio thread
                  └ process(outputs), once per render quantum:
                      wasm render(frames) → f32 samples in wasm memory
                      copy into outputs[0][0]           (range −1…1)
```

- **The render quantum** is 128 frames by default (Web Audio API 1.1;
  an `AudioContext` may ask for another size with `renderSizeHint`, so
  the processor reads the size from the output buffer, not a constant).
  At 48 kHz that's 2.67 ms per call, and **a deadline**: if `process`
  takes longer, the output gets a gap (an underrun, heard as a click).
  So the render path never allocates, locks, or waits. Rust has no
  garbage collector to pause it; the JS side keeps its own work per call
  to one copy.
- **Loading.** `AudioWorkletGlobalScope` has no `fetch`. The page fetches
  and compiles the `WebAssembly.Module` (a `Module` is structured-
  cloneable) and posts it to the processor through the node's `port`; the
  processor instantiates it synchronously and answers "ready".
- **Messages, not shared memory.** Note on/off and settings arrive on
  the `port`; delay-line snapshots go back on it at display rate (~30 Hz),
  in buffers transferred back and forth (two, ping-ponged) so the audio
  thread doesn't allocate a new one per snapshot. No `SharedArrayBuffer`,
  so the host needs no cross-origin isolation headers (`hosting.md`).
- **Starting.** Browsers keep an `AudioContext` suspended until a user
  gesture (autoplay policy). The page starts it on the first click or key
  press, and says so until then.
- **Sample rate.** Whatever the `AudioContext` runs at (44.1 or 48 kHz,
  usually the hardware's). Every delay length is computed from it at note
  on; tests run at both.
- **Scalar.** `f32` at run time (audio needs ~24 bits at most, and it
  halves memory traffic); the `acoustic` crate is generic over
  `math::Scalar`, so tests run in `f32` and `f64` alike, and fixed point
  (M8) can follow.

## The Karplus–Strong loop

Karplus & Strong (1983): fill a delay line with noise, and feed its
output back through a two-point average. The noise repeats every loop
(a pitch), and the average takes a little off the high frequencies each
time round (the decay, faster for higher partials, like a real string):

```
y[n] = x[n] + ρ · ½ (y[n − N] + y[n − N − 1])
```

`x` is the excitation (the initial noise), `N` the delay line's length,
`ρ ≤ 1` a loss factor. The delay line isn't the string's shape (that's
A2's waveguide, two traveling waves); it's one loop of the signal. The
page draws it anyway: you can watch the noise smooth into a tone.

### Pitch: the loop delay

The average `½ (1 + z⁻¹)` is a linear-phase filter: it delays every
frequency by exactly **half a sample**. So the loop is `N + ½` samples,
and the pitch is

```
f₀ = fs / (N + ½)
```

With `N` an integer, only those pitches are available. At the bottom of
the keyboard that's fine (A0 at 48 kHz needs 1745.45 samples; an error of
½ sample is 0.5 cents), but at the top it isn't: C8 needs 11.47 samples,
and half a sample there is about **75 cents**, three quarters of a
semitone. That's the integer loop's known failure; the page's toggle
makes it audible.

### Tuning: the allpass fractional delay

Jaffe & Smith (1983): add a first-order **allpass** filter to the loop.
It passes every frequency at full gain (so the decay is unchanged) and
adds a delay that can be any fraction of a sample:

```
H(z) = (C + z⁻¹) / (1 + C z⁻¹)          y[n] = C x[n] + x[n − 1] − C y[n − 1]
C = (1 − Δ) / (1 + Δ)                    delay ≈ Δ samples at low frequencies
```

For a target period `P = fs / f₀`: `N + ½ + Δ = P`. As `Δ → 0`, `C → 1`,
which puts the allpass's pole (at `z = −C`) next to the unit circle, where
it rings at high frequencies (Jaffe & Smith); so we keep `Δ ≥ 0.1`:
`N = ⌊P − ½ − 0.1⌋`, giving `Δ ∈ [0.1, 1.1)` and `C ∈ (−0.05, 0.82]`. The allpass delay is exact only as frequency → 0; at
the fundamental of the top notes it's a few percent off, so the tests
measure the result rather than trust the formula.

### Decay: loss and stretching

Per trip round the loop the fundamental loses a factor

```
g = ρ · |cos(π f₀ / fs)|          (the average's gain at f₀)
```

and there are `f₀` trips per second, so its 60 dB decay time is

```
T₆₀ = −3 / (f₀ · log₁₀ g)
```

Two problems, both in Jaffe & Smith:

- **High notes die too fast.** More trips per second, and the average
  cuts more at higher `f₀`: at C8 the natural `T₆₀` is a fraction of a
  second. **Decay stretching** replaces the average by
  `(1 − S) + S z⁻¹` (`S = ½` is the original): its gain at `f₀`,
  `√(1 − 4 S (1 − S) sin²(π f₀ / fs))`, rises toward 1 as `S` moves away
  from ½, so the note rings longer. Its delay is about `S` samples (not
  ½), which the tuning accounts for.
- **Low notes ring too long.** `ρ < 1` shortens them (decay shortening).

**Decay control** on the page is a single target `T₆₀` (at the
fundamental). From it: `ρ` where the natural decay is too long, `S`
where it's too short, each computed at note on. The tests check the
measured `T₆₀` against the setting.

### Release

Note off can't just stop the loop (a click). It raises the loss for that
voice (a short `T₆₀`, ~0.1 s), so the note fades in a few tens of
milliseconds; the voice is free once it's below −80 dB.

## Excitation

What fills the delay line at note on:

- **Noise**: uniform in ±1 from a seeded `SplitMix64` (the engine's
  generator), with its mean subtracted. The average passes DC at full
  gain, so a DC offset would sit in the loop and decay only by `ρ`.
- **Triangle**: the Piano Gloves hit, a triangle peaking near one end of
  the line: a smoother, rounder tone than noise (fewer high partials).

## Voices

A fixed pool of 8 voices, each a string. Note on takes a free voice, or
steals the oldest. All are summed into one output, times a master gain;
with 8 noise-plucked strings at full level the sum can exceed 1, so the
gain defaults to ¼ and the output is clamped to ±1 (and clamping is
counted in tests, which keep it at 0 for a chord at the default gain).

## Measuring, offline, in Rust

Tests render audio with no browser and measure it:

- **Pitch, by autocorrelation.** Skip the first few periods (the noise
  transient), compute the normalized autocorrelation over lags near the
  expected period, take the peak, and refine it by parabolic
  interpolation to a fraction of a sample. Error in **cents**,
  `1200 · log₂(f_measured / f_target)`; a cent is a hundredth of a
  semitone, and a few cents is the threshold of hearing for most
  listeners. Checked across the 88 keys at 44.1 and 48 kHz.
- **Decay, by envelope.** RMS over consecutive windows of whole periods;
  fit the slope of its log against time; `T₆₀` is where that line falls
  60 dB.
- **Determinism.** A golden hash of rendered audio (a chord from seeded
  noise), checked native and on wasm (`cargo xtask test-wasm`), as the
  engine's scenes are.

In the browser the smoke test renders one second with an
`OfflineAudioContext` (no speakers; headless Chrome can't be trusted to
play real-time audio) and checks it's audible and finite.

## References

Full entries in `references.md`.

- Karplus & Strong (1983), *Digital Synthesis of Plucked-String and Drum
  Timbres*: the loop.
- Jaffe & Smith (1983), *Extensions of the Karplus-Strong Plucked-String
  Algorithm*: allpass tuning, decay stretching and shortening.
- Smith, *Physical Audio Signal Processing*: KS as a waveguide special
  case (A2), and the allpass interpolation.
- W3C, *Web Audio API 1.1*: render quantum, `AudioWorklet`.
