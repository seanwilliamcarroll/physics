// A3: the piano (Rust: crates/acoustic Model::Piano) in the synth worklet:
// stiff strings' stretched partials on the spectrum, the hammer's force,
// velocity from where a key is pressed (docs/14-piano.md).

import { byId } from "../../js/dom.ts";
import { cssColor, setupCanvas } from "../../js/canvas.ts";
import { select, slider } from "../../js/controls.ts";
import { midiToHz, noteName } from "../../js/ks.ts";
import { MODEL_PIANO } from "../../js/acoustic-abi.ts";
import type { AcousticExports } from "../../js/acoustic";
import { errorText, reportSmoke, smokeMode } from "../../js/smoke.ts";
import { compileAcoustic, liveSynth, renderOffline } from "../../js/synth-live.ts";
import { pianoUi } from "../../js/piano-ui.ts";
import { drawSpectrum, drawTrace, drawWave } from "../../js/audio-draw.ts";
import { amplitudeAt } from "../../js/tone.ts";
import type { ToWorklet } from "../../js/synth-worklet.ts";

/** The hammer's speed, m/s: pp to ff (crates/acoustic hammer), mf their
 *  geometric mean. */
const PIANISSIMO = 0.5;
const FORTISSIMO = 5;
const MEZZO_FORTE = Math.sqrt(PIANISSIMO * FORTISSIMO);
const VELOCITY_STEP = 0.05;
const GAIN_STEP = 0.05;
const PERCENT = 100;
/** Where the hammer strikes, from the bridge (an eighth from the nut). */
const STRIKE_FROM_BRIDGE = 1 - 1 / 8;
/** Partials ticked on the spectrum, and the one the readout reports. */
const PARTIALS = 40;
const READOUT_PARTIAL = 10;
const CENTS_PER_OCTAVE = 1200;
const MM_PER_M = 1000;

/** Smoke: C4 struck at mf, rendered offline; its 10th partial measured at
 *  the stretched frequency and at the harmonic one. */
const SMOKE_RATE = 48000;
const SMOKE_SECONDS = 0.7;
const SMOKE_KEY = 60;
const SMOKE_MEASURE: [number, number] = [0.1, 0.65]; // s
const SMOKE_DRAWN = 2048;
const DB = 20;
/** An amplitude floor before taking the log: a silent component reads
 *  −240 dB, not −∞. */
const SILENT_AMPLITUDE = 1e-12;

const settings = { stiff: true, velocity: MEZZO_FORTE, gain: 0.25 };

const spectrumCtx = setupCanvas(byId("spectrum", HTMLCanvasElement));
const forceCtx = setupCanvas(byId("force", HTMLCanvasElement));
const stringCtx = setupCanvas(byId("string", HTMLCanvasElement));
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = {
  background: cssColor(css, "--stage-bg"), line: cssColor(css, "--accent"), grid: cssColor(css, "--grid"),
  text: cssColor(css, "--muted"), missing: cssColor(css, "--series-1"), stretched: cssColor(css, "--series-2"),
};

/** The module's per-key facts (B, strings a key), from its own instance on
 *  the page: the worklet runs another. */
let keys: Pick<AcousticExports, "piano_inharmonicity" | "piano_strings"> | null = null;
async function loadKeys(): Promise<void> {
  const instance = await WebAssembly.instantiate(await compileAcoustic(), { env: { console_error: () => {} } });
  keys = instance.exports as unknown as AcousticExports;
}

/** Partial `k` of key `midi` (pitch f₁, its lowest partial), Hz: with B,
 *  k·F₀·√(1 + Bk²), F₀ = f₁ / √(1 + B). */
function partialHz(midi: number, k: number, b: number): number {
  return k * (midiToHz(midi) / Math.sqrt(1 + b)) * Math.sqrt(1 + b * k * k);
}

/** The last strike: its key, velocity, and whether its strings were stiff. */
let last: { midi: number; velocity: number; stiff: boolean } | null = null;

const settingsMessages = (): ToWorklet[] => [
  { type: "model", code: MODEL_PIANO },
  { type: "stiffness", on: settings.stiff },
  { type: "gain", gain: settings.gain },
];

const pct = (x: number) => `${Math.round(x * PERCENT)}%`;

/** The middle string's shape (metres: a fraction of a millimetre), scaled
 *  to its own peak so it fills the plot; returns the peak, m. */
function drawString(shape: Float32Array): number {
  let peak = 0;
  for (const v of shape) peak = Math.max(peak, Math.abs(v));
  drawWave(stringCtx, peak > 0 ? shape.map((v) => v / peak) : shape, colors, [{ at: STRIKE_FROM_BRIDGE, label: "hammer" }]);
  return peak;
}

const synth = liveSynth({
  initial: settingsMessages,
  spectrum: true,
  trace: true,
  onError: (message) => (hud.textContent = `audio error: ${message}`),
  onSnapshot: (m, live) => {
    const floats = Float32Array.BYTES_PER_ELEMENT;
    const stringPeak = drawString(new Float32Array(m.buf, 0, m.len));
    const db = new Float32Array(m.buf, m.len * floats, m.bins);
    const force = new Float32Array(m.buf, (m.len + m.bins) * floats, m.trace);
    const rate = live.ctx.sampleRate;
    drawTrace(forceCtx, force, rate, colors);
    if (last === null) {
      drawSpectrum(spectrumCtx, db, rate, null, [], colors);
      hud.textContent = "no note yet";
      return;
    }
    const { midi, velocity, stiff } = last;
    const b = stiff ? (keys?.piano_inharmonicity(midi) ?? 0) : 0;
    const partials = b > 0 ? Array.from({ length: PARTIALS }, (_, i) => partialHz(midi, i + 1, b)) : [];
    drawSpectrum(spectrumCtx, db, rate, midiToHz(midi), [], colors, partials);
    const sharp = CENTS_PER_OCTAVE * Math.log2(partialHz(midi, READOUT_PARTIAL, b) / (READOUT_PARTIAL * midiToHz(midi)));
    const strings = keys?.piano_strings(midi) ?? 0;
    hud.textContent =
      `${noteName(midi)} (${midiToHz(midi).toFixed(1)} Hz) at ${velocity.toFixed(2)} m/s · ` +
      `${strings} string${strings === 1 ? "" : "s"} · ` +
      (stiff ? `B = ${b.toExponential(2)}: partial ${READOUT_PARTIAL} is ${sharp.toFixed(1)} cents sharp` : "stiffness off: harmonic partials") +
      ` · the string (drawn to its peak) moves ${(stringPeak * MM_PER_M).toFixed(3)} mm`;
  },
});

async function start(): Promise<void> {
  await Promise.all([synth.start(), keys === null ? loadKeys() : Promise.resolve()]);
  byId("start", HTMLButtonElement).hidden = true;
}

/** Smoke: a stiff C4's 10th partial is at k·F₀·√(1 + Bk²), not 10·f₀: the
 *  audio's level there beats the harmonic frequency's by `stretch_db`. */
async function smoke(): Promise<void> {
  await loadKeys();
  const data = await renderOffline({ notes: [SMOKE_KEY], model: MODEL_PIANO }, SMOKE_SECONDS, SMOKE_RATE);
  let peak = 0;
  let finite = true;
  for (const v of data) {
    finite &&= Number.isFinite(v);
    peak = Math.max(peak, Math.abs(v));
  }
  const part = data.subarray(Math.round(SMOKE_MEASURE[0] * SMOKE_RATE), Math.round(SMOKE_MEASURE[1] * SMOKE_RATE));
  const b = keys?.piano_inharmonicity(SMOKE_KEY) ?? 0;
  const level = (hz: number) => DB * Math.log10(Math.max(amplitudeAt(part, SMOKE_RATE, hz), SILENT_AMPLITUDE));
  const stretched = level(partialHz(SMOKE_KEY, READOUT_PARTIAL, b));
  const harmonic = level(READOUT_PARTIAL * midiToHz(SMOKE_KEY));
  const stretchDb = stretched - harmonic;
  drawWave(stringCtx, data.subarray(0, SMOKE_DRAWN), colors);
  hud.textContent =
    `offline render: C4 at mf: its ${READOUT_PARTIAL}th partial ${stretched.toFixed(1)} dB at the stretched frequency, ` +
    `${harmonic.toFixed(1)} dB at the harmonic one (B = ${b.toExponential(2)})`;
  reportSmoke(
    finite
      ? `ok audio_peak=${peak.toFixed(4)} samples=${data.length} stretch_db=${stretchDb.toFixed(1)}`
      : "error non-finite sample",
  );
}

function sendSettings(): void {
  for (const m of settingsMessages()) synth.send(m);
}

function buildControls(): void {
  const controls = byId("controls", HTMLElement);
  select(controls, {
    label: "strings",
    choices: [["stiff", "stiff (a piano's)"], ["ideal", "ideal (no stiffness)"]],
    value: settings.stiff ? "stiff" : "ideal",
    onChange: (v) => {
      settings.stiff = v === "stiff";
      sendSettings();
    },
  });
  slider(controls, {
    label: "velocity (keyboard)",
    min: Math.log10(PIANISSIMO),
    max: Math.log10(FORTISSIMO),
    step: VELOCITY_STEP,
    value: Math.log10(settings.velocity),
    format: (v) => `${(10 ** v).toFixed(2)} m/s`,
    onInput: (v) => (settings.velocity = 10 ** v),
  });
  slider(controls, {
    label: "volume",
    min: 0,
    max: 1,
    step: GAIN_STEP,
    value: settings.gain,
    format: (v) => pct(v),
    onInput: (v) => {
      settings.gain = v;
      sendSettings();
    },
  });
}

/** A key pressed `depth` of the way down (0 top, 1 bottom) strikes from
 *  pp to ff, geometrically; the computer keyboard, the slider's. */
function velocityFor(depth: number | null): number {
  return depth === null ? settings.velocity : PIANISSIMO * (FORTISSIMO / PIANISSIMO) ** depth;
}

try {
  drawString(new Float32Array(0));
  drawTrace(forceCtx, new Float32Array(0), SMOKE_RATE, colors);
  if (smokeMode) {
    byId("start", HTMLButtonElement).hidden = true;
    await smoke();
  } else {
    buildControls();
    pianoUi({
      piano: byId("piano", HTMLElement),
      songs: byId("songs", HTMLElement),
      start,
      send: (m) => synth.send(m),
      velocity: velocityFor,
      // A song's notes come without a velocity: mf.
      onNote: (midi, velocity = MEZZO_FORTE) => (last = { midi, velocity, stiff: settings.stiff }),
    });
    byId("start", HTMLButtonElement).addEventListener("click", () => void start());
  }
} catch (err) {
  hud.textContent = `error: ${errorText(err)}`;
  if (smokeMode) reportSmoke(`error ${errorText(err)}`);
  throw err;
}
