// A1: a Karplus–Strong string (Rust: crates/acoustic) in the synth worklet
// (site/js/synth-worklet.ts), played from the computer keyboard, the
// on-screen piano, or a song (docs/12-acoustic-foundations.md).

import { byId } from "../../js/dom.ts";
import { MS_PER_SECOND } from "../../js/loop.ts";
import { cssColor, setupCanvas } from "../../js/canvas.ts";
import { checkbox, select, slider } from "../../js/controls.ts";
import { SONGS, songEvents } from "../../js/songs.ts";
import { midiToHz, noteName } from "../../js/ks.ts";
import { EXCITATION_NOISE, EXCITATION_TRIANGLE, MODEL_LOOP } from "../../js/acoustic-abi.ts";
import { reportSmoke } from "../../js/smoke.ts";
import { runAudioPage } from "../../js/page.ts";
import { SONG_LEAD_S, liveSynth, renderOffline } from "../../js/synth-live.ts";
import { pianoUi } from "../../js/piano-ui.ts";
import { drawWave } from "../../js/audio-draw.ts";
import { onsets, peakOf } from "../../js/tone.ts";
import type { ToWorklet } from "../../js/synth-worklet.ts";

/** Settings, and their slider ranges. Decay is a log slider over T60. */
const settings = { tuned: true, t60: 3, triangle: false, peak: 0.1, gain: 0.25 };
const T60_LOG_RANGE: [number, number] = [-0.7, 1]; // 0.2 s … 10 s
const T60_LOG_STEP = 0.05; // 12% per step
const PEAK_RANGE: [number, number] = [0.02, 0.5];
const PEAK_STEP = 0.01;
const GAIN_STEP = 0.05;
const PERCENT = 100;

/** Smoke mode: the start of the first song, rendered offline; its onsets
 *  are found in the audio and compared with its schedule. */
const SMOKE_RATE = 48000;
const SMOKE_SECONDS = 2.5;
/** Samples drawn from the offline render, for the screenshot. */
const SMOKE_DRAWN = 4096;

const ctx2d = setupCanvas(byId("loop", HTMLCanvasElement));
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = {
  background: cssColor(css, "--stage-bg"), line: cssColor(css, "--accent"), grid: cssColor(css, "--grid"),
  text: cssColor(css, "--muted"), missing: cssColor(css, "--series-1"),
};
let lastMidi: number | null = null;

function settingsMessages(): ToWorklet[] {
  return [
    { type: "model", code: MODEL_LOOP },
    { type: "tuned", tuned: settings.tuned },
    { type: "t60", seconds: settings.t60 },
    { type: "excitation", code: settings.triangle ? EXCITATION_TRIANGLE : EXCITATION_NOISE, peak: settings.peak },
    { type: "gain", gain: settings.gain },
  ];
}

const synth = liveSynth({
  initial: settingsMessages,
  spectrum: false,
  onError: (message) => (hud.textContent = `audio error: ${message}`),
  onSnapshot: (m, live) => {
    drawWave(ctx2d, new Float32Array(m.buf, 0, m.len), colors);
    const sr = live.ctx.sampleRate;
    const note = lastMidi === null ? "no note yet" :
      `${noteName(lastMidi)} (${midiToHz(lastMidi).toFixed(1)} Hz): loop ${m.len} samples, ` +
      `${m.cents >= 0 ? "+" : ""}${m.cents.toFixed(2)} cents ${settings.tuned ? "(tuned)" : "(integer loop)"}`;
    hud.textContent =
      `${sr} Hz · render quantum ${m.frames} frames (${((m.frames / sr) * MS_PER_SECOND).toFixed(2)} ms) · ` +
      `${note}${m.clipped > 0 ? ` · clipped ${m.clipped}` : ""}`;
  },
});

/** Smoke: render the start of a song offline; check its onsets. */
async function smoke(): Promise<void> {
  const song = SONGS[0];
  if (song === undefined) throw new Error("no songs");
  // The song's events within the render (an off past the end is moot).
  const scheduled = songEvents(song).filter((e) => e.at < SMOKE_SECONDS - 0.2);
  const data = await renderOffline({ notes: [], song: scheduled }, SMOKE_SECONDS, SMOKE_RATE);
  const { peak, finite } = peakOf(data);
  drawWave(ctx2d, data.subarray(0, SMOKE_DRAWN), colors);
  const expected = scheduled.filter((e) => e.on).map((e) => SONG_LEAD_S + e.at);
  const found = onsets(data, SMOKE_RATE);
  // Each expected onset against the nearest one found, ms.
  const worstMs = Math.max(...expected.map((t) => Math.min(...found.map((f) => Math.abs(f - t))))) * MS_PER_SECOND;
  hud.textContent =
    `offline render: ${data.length} samples, peak ${peak.toFixed(3)}; ${song.name}: ` +
    `${expected.length} notes scheduled, ${found.length} onsets found, worst ${worstMs.toFixed(1)} ms off`;
  reportSmoke(
    finite
      ? `ok audio_peak=${peak.toFixed(4)} samples=${data.length} song_notes=${expected.length} onsets=${found.length} onset_worst_ms=${worstMs.toFixed(1)}`
      : "error non-finite sample",
  );
}

function buildControls(): void {
  const controls = byId("controls", HTMLElement);
  checkbox(controls, {
    label: "fractional delay (allpass tuning)",
    checked: settings.tuned,
    onChange: (on) => {
      settings.tuned = on;
      synth.resend();
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
      synth.resend();
    },
  });
  select(controls, {
    label: "pluck",
    choices: [["noise", "noise (Karplus–Strong)"], ["triangle", "triangle (Piano Gloves)"]],
    value: settings.triangle ? "triangle" : "noise",
    onChange: (v) => {
      settings.triangle = v === "triangle";
      synth.resend();
    },
  });
  slider(controls, {
    label: "triangle peak",
    min: PEAK_RANGE[0],
    max: PEAK_RANGE[1],
    step: PEAK_STEP,
    value: settings.peak,
    format: (v) => `${Math.round(v * PERCENT)}% along`,
    onInput: (v) => {
      settings.peak = v;
      synth.resend();
    },
  });
  slider(controls, {
    label: "volume",
    min: 0,
    max: 1,
    step: GAIN_STEP,
    value: settings.gain,
    format: (v) => `${Math.round(v * PERCENT)}%`,
    onInput: (v) => {
      settings.gain = v;
      synth.resend();
    },
  });
}

drawWave(ctx2d, new Float32Array(0), colors);
await runAudioPage(hud, {
  start: synth.start,
  smoke,
  live: (begin) => {
    buildControls();
    pianoUi({
      piano: byId("piano", HTMLElement),
      songs: byId("songs", HTMLElement),
      start: begin,
      send: (m) => synth.send(m),
      onNote: (midi) => (lastMidi = midi),
    });
  },
});
