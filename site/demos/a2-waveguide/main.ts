// A2: a waveguide string (Rust: crates/acoustic Waveguide) in the synth
// worklet: its shape, its spectrum, and the harmonics its pluck and pickup
// positions silence (docs/13-waveguide.md).

import { byId } from "../../js/dom.ts";
import { cssColor, setupCanvas } from "../../js/canvas.ts";
import { button, select, slider } from "../../js/controls.ts";
import { midiToHz, noteName } from "../../js/ks.ts";
import { EXCITATION_NOISE, EXCITATION_TRIANGLE, MODEL_WAVEGUIDE } from "../../js/acoustic-abi.ts";
import { errorText, reportSmoke, smokeMode } from "../../js/smoke.ts";
import { liveSynth, renderOffline } from "../../js/synth-live.ts";
import { pianoUi } from "../../js/piano-ui.ts";
import { drawSpectrum, drawWave } from "../../js/audio-draw.ts";
import { amplitudeAt, silencedBy } from "../../js/tone.ts";
import type { ToWorklet } from "../../js/synth-worklet.ts";

/** Settings. Positions are fractions of the string from the bridge. */
const settings = { triangle: true, beta: 0.2, pickup: 0.1, t60: 3, gain: 0.25 };
const POSITION_RANGE: [number, number] = [0.02, 0.98];
const POSITION_STEP = 0.01;
const T60_LOG_RANGE: [number, number] = [-0.7, 1]; // 0.2 s … 10 s
const T60_LOG_STEP = 0.05;
const GAIN_STEP = 0.05;
const PERCENT = 100;
/** The quick pluck positions: 1/n for these n. */
const PRESET_N = [2, 3, 4, 5];
/** Harmonics checked for silence in the readout and on the spectrum. */
const HARMONICS = 12;

/** Smoke: A4 plucked at ½, heard at 0.1, rendered offline; harmonics 1–3
 *  measured in the audio (after the attack), the 2nd should be missing. */
const SMOKE_RATE = 48000;
const SMOKE_SECONDS = 0.5;
const SMOKE_KEY = 69;
const SMOKE_PLUCK = 0.5;
const SMOKE_MEASURE: [number, number] = [0.1, 0.45]; // s
const SMOKE_DRAWN = 2048;
const DB = 20;

const stringCtx = setupCanvas(byId("string", HTMLCanvasElement));
const spectrumCtx = setupCanvas(byId("spectrum", HTMLCanvasElement));
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = {
  background: cssColor(css, "--stage-bg"), line: cssColor(css, "--accent"), grid: cssColor(css, "--grid"),
  text: cssColor(css, "--muted"), missing: cssColor(css, "--series-1"),
};

/** The last note, and how it was plucked (the pluck applies per note). */
let last: { midi: number; beta: number | null } | null = null;

function settingsMessages(): ToWorklet[] {
  return [
    { type: "model", code: MODEL_WAVEGUIDE },
    { type: "tuned", tuned: true },
    { type: "t60", seconds: settings.t60 },
    { type: "excitation", code: settings.triangle ? EXCITATION_TRIANGLE : EXCITATION_NOISE, peak: settings.beta },
    { type: "pickup", at: settings.pickup },
    { type: "gain", gain: settings.gain },
  ];
}

const marks = () => [
  ...(last?.beta != null ? [{ at: last.beta, label: "pluck" }] : []),
  { at: settings.pickup, label: "pickup" },
];

/** Which harmonics the last note's pluck and the pickup silence (noise
 *  has no position, so then only the pickup's). */
function missing(): number[] {
  const beta = last?.beta;
  return silencedBy(HARMONICS, beta == null ? [settings.pickup] : [beta, settings.pickup]);
}

const pct = (x: number) => `${Math.round(x * PERCENT)}%`;

const synth = liveSynth({
  initial: settingsMessages,
  spectrum: true,
  onError: (message) => (hud.textContent = `audio error: ${message}`),
  onSnapshot: (m, live) => {
    drawWave(stringCtx, new Float32Array(m.buf, 0, m.len), colors, marks());
    const db = new Float32Array(m.buf, m.len * Float32Array.BYTES_PER_ELEMENT, m.bins);
    const f0 = last === null ? null : midiToHz(last.midi);
    const gone = missing();
    drawSpectrum(spectrumCtx, db, live.ctx.sampleRate, f0, gone, colors);
    hud.textContent = last === null ? "no note yet" :
      `${noteName(last.midi)} (${f0?.toFixed(1)} Hz): ${m.len} cells a rail · ` +
      `plucked ${last.beta === null ? "with noise" : `at ${pct(last.beta)}`}, pickup at ${pct(settings.pickup)} · ` +
      `silenced: ${gone.length > 0 ? gone.join(", ") : "none of the first " + HARMONICS}`;
  },
});

function sendSettings(): void {
  for (const m of settingsMessages()) synth.send(m);
}

async function start(): Promise<void> {
  await synth.start();
  byId("start", HTMLButtonElement).hidden = true;
}

/** Smoke: the 2nd harmonic of a string plucked at ½ is missing. */
async function smoke(): Promise<void> {
  const data = await renderOffline(
    { notes: [SMOKE_KEY], model: MODEL_WAVEGUIDE, excitation: { code: EXCITATION_TRIANGLE, peak: SMOKE_PLUCK }, pickup: settings.pickup },
    SMOKE_SECONDS,
    SMOKE_RATE,
  );
  let peak = 0;
  let finite = true;
  for (const v of data) {
    finite &&= Number.isFinite(v);
    peak = Math.max(peak, Math.abs(v));
  }
  const part = data.subarray(Math.round(SMOKE_MEASURE[0] * SMOKE_RATE), Math.round(SMOKE_MEASURE[1] * SMOKE_RATE));
  const f0 = midiToHz(SMOKE_KEY);
  const [h1, h2, h3] = [1, 2, 3].map((k) => DB * Math.log10(Math.max(amplitudeAt(part, SMOKE_RATE, k * f0), 1e-12)));
  const missingDb = Math.min(h1 ?? 0, h3 ?? 0) - (h2 ?? 0);
  // The output heard at the pickup (a trapezoid, for a string plucked in
  // the middle), not the string's shape: no position marks.
  drawWave(stringCtx, data.subarray(0, SMOKE_DRAWN), colors);
  hud.textContent =
    `offline render: A4 plucked at ½: harmonics 1–3 at ${h1?.toFixed(1)} / ${h2?.toFixed(1)} / ${h3?.toFixed(1)} dB, ` +
    `the 2nd ${missingDb.toFixed(1)} dB under its neighbors`;
  reportSmoke(
    finite
      ? `ok audio_peak=${peak.toFixed(4)} samples=${data.length} missing_db=${missingDb.toFixed(1)}`
      : "error non-finite sample",
  );
}

function buildControls(): void {
  const controls = byId("controls", HTMLElement);
  select(controls, {
    label: "pluck",
    choices: [["triangle", "a pluck at a point"], ["noise", "noise (no position)"]],
    value: settings.triangle ? "triangle" : "noise",
    onChange: (v) => {
      settings.triangle = v === "triangle";
      sendSettings();
    },
  });
  const pluck = slider(controls, {
    label: "pluck at",
    min: POSITION_RANGE[0],
    max: POSITION_RANGE[1],
    step: POSITION_STEP,
    value: settings.beta,
    format: (v) => `${pct(v)} from the bridge`,
    onInput: (v) => {
      settings.beta = v;
      sendSettings();
    },
  });
  slider(controls, {
    label: "pickup at",
    min: POSITION_RANGE[0],
    max: POSITION_RANGE[1],
    step: POSITION_STEP,
    value: settings.pickup,
    format: (v) => `${pct(v)} from the bridge`,
    onInput: (v) => {
      settings.pickup = v;
      synth.send({ type: "pickup", at: v });
    },
  });
  slider(controls, {
    label: "decay",
    min: T60_LOG_RANGE[0],
    max: T60_LOG_RANGE[1],
    step: T60_LOG_STEP,
    value: Math.log10(settings.t60),
    format: (v) => `T60 ${(10 ** v).toFixed(2)} s`,
    onInput: (v) => {
      settings.t60 = 10 ** v;
      sendSettings();
    },
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
  const presets = byId("presets", HTMLElement);
  for (const n of PRESET_N) {
    button(presets, {
      label: `pluck at 1/${n}`,
      onClick: () => {
        settings.beta = 1 / n;
        settings.triangle = true;
        pluck.value = String(settings.beta);
        pluck.dispatchEvent(new Event("input"));
      },
    });
  }
}

try {
  drawWave(stringCtx, new Float32Array(0), colors, marks());
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
      onNote: (midi) => (last = { midi, beta: settings.triangle ? settings.beta : null }),
    });
    byId("start", HTMLButtonElement).addEventListener("click", () => void start());
  }
} catch (err) {
  hud.textContent = `error: ${errorText(err)}`;
  if (smokeMode) reportSmoke(`error ${errorText(err)}`);
  throw err;
}
