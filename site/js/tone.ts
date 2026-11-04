// The acoustic pages' pure measurements and predictions: a partial's
// amplitude, note onsets, and which harmonics a pluck and pickup silence
// (docs/13-waveguide.md). Pure, so node --test covers them.

/** The amplitude of `data`'s component at `f` Hz: a Hann-windowed DFT at
 *  exactly `f`, scaled so a sine of amplitude `a` reads `a` (the Rust
 *  `measure::amplitude`, for the page's smoke check). */
export function amplitudeAt(data: Float32Array, rate: number, f: number): number {
  const n = data.length;
  const w = (2 * Math.PI * f) / rate;
  let re = 0;
  let im = 0;
  for (let i = 0; i < n; i++) {
    const hann = 0.5 - 0.5 * Math.cos((2 * Math.PI * i) / n);
    const x = (data[i] ?? 0) * hann;
    re += x * Math.cos(w * i);
    im -= x * Math.sin(w * i);
  }
  return (Math.hypot(re, im) * 4) / n;
}

/** How loudly harmonic `k` sounds, relative, plucked at `beta` and heard
 *  at `pickup` (both from the bridge): `sin(kπβ) sin(kπp)`, before the
 *  pluck shape's `1/k²`. */
export function harmonicWeight(k: number, beta: number, pickup: number): number {
  return Math.sin(k * Math.PI * beta) * Math.sin(k * Math.PI * pickup);
}

/** Below this |sin| a harmonic counts as silenced on the page. */
const SILENT = 0.05;

/** The harmonics up to `count` that the pluck or the pickup silences. */
export function silenced(count: number, beta: number, pickup: number): number[] {
  const out: number[] = [];
  for (let k = 1; k <= count; k++) {
    const quiet = Math.abs(Math.sin(k * Math.PI * beta)) < SILENT || Math.abs(Math.sin(k * Math.PI * pickup)) < SILENT;
    if (quiet) out.push(k);
  }
  return out;
}

/** Onset detection: RMS over 5 ms windows; an onset is a window at least
 *  this many times louder than the one before, and not silence. */
const ONSET_WINDOW_S = 0.005;
const ONSET_RISE = 3;
const SILENCE_RMS = 0.01;

/** Times (s) where the level jumps (the A1 song check). */
export function onsets(data: Float32Array, rate: number): number[] {
  const w = Math.round(ONSET_WINDOW_S * rate);
  const times: number[] = [];
  let prev = 0;
  for (let i = 0; i + w <= data.length; i += w) {
    let sum = 0;
    for (let j = i; j < i + w; j++) sum += (data[j] ?? 0) ** 2;
    const rms = Math.sqrt(sum / w);
    if (rms > ONSET_RISE * prev && rms > SILENCE_RMS) times.push(i / rate);
    prev = rms;
  }
  return times;
}
