// A1: a Karplus–Strong string (Rust: crates/acoustic) in an AudioWorklet
// (worklet.ts), played from the computer keyboard or the on-screen piano
// (docs/12-acoustic-foundations.md).

import { byId } from "../../js/dom.ts";
import { MS_PER_SECOND } from "../../js/loop.ts";
import { cssColor, setupCanvas } from "../../js/canvas.ts";
import { button, checkbox, select, slider } from "../../js/controls.ts";
import { SONGS, songEvents } from "../../js/songs.ts";
import type { Song } from "../../js/songs.ts";
import { KEY_CODES, OCTAVE_DOWN, OCTAVE_UP, keyToMidi, midiToHz, noteName } from "../../js/ks.ts";
import { EXCITATION_NOISE, EXCITATION_TRIANGLE } from "../../js/acoustic-abi.ts";
import { errorText, reportSmoke, smokeMode } from "../../js/smoke.ts";
import type { FromWorklet, ProcessorInit, ToWorklet } from "./worklet.ts";

const WORKLET_URL = new URL("./worklet.js", import.meta.url);
const WASM_URL = new URL("../../pkg/acoustic.wasm", import.meta.url);
const PROCESSOR = "ks-string";
/** Seeds the excitation noise: the same session plays the same plucks. */
const SEED = 1;
/** The lowest note a voice holds (crates/acoustic LOWEST_HZ, A0): sizes
 *  the snapshot buffers, the longest delay line plus slack. */
const LOWEST_HZ = 27.5;
/** Two snapshot buffers ping-pong between page and worklet. */
const SNAPSHOT_BUFFERS = 2;

/** The keyboard's C: C4 (MIDI 60), shifted by octaves within C1–C7. */
const BASE_DEFAULT = 60;
const BASE_MIN = 24;
const BASE_MAX = 96;
const OCTAVE = 12;

/** Settings, and their slider ranges. Decay is a log slider over T60. */
const settings = { tuned: true, t60: 3, triangle: false, peak: 0.1, gain: 0.25 };
const T60_LOG_RANGE: [number, number] = [-0.7, 1]; // 0.2 s … 10 s
const T60_LOG_STEP = 0.05; // 12% per step
const PEAK_RANGE: [number, number] = [0.02, 0.5];
const PEAK_STEP = 0.01;
const GAIN_STEP = 0.05;
const PERCENT = 100;

/** The waveform's ±1 fills this much of the canvas's half height. */
const WAVE_FILL = 0.9;
/** A black key's width as a fraction of a white key's; it's centered on
 *  the boundary between two white keys. */
const BLACK_KEY_WIDTH = 0.6;

/** Smoke mode: the start of the first song, rendered offline; its onsets
 *  are found in the audio and compared with its schedule. */
const SMOKE_RATE = 48000;
const SMOKE_SECONDS = 2.5;
/** Onset detection: RMS over 5 ms windows; an onset is a window at least
 *  this many times louder than the one before. */
const ONSET_WINDOW_S = 0.005;
const ONSET_RISE = 3;
/** Quieter than this is silence, not an onset. */
const SILENCE_RMS = 0.01;
/** worklet.ts SONG_LEAD_S: a song starts this long after it's scheduled. */
const SONG_LEAD_S = 0.05;
/** Samples drawn from the offline render, for the screenshot. */
const SMOKE_DRAWN = 4096;

const canvas = byId("loop", HTMLCanvasElement);
const ctx2d = setupCanvas(canvas);
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = { background: cssColor(css, "--stage-bg"), line: cssColor(css, "--accent"), grid: cssColor(css, "--grid") };

async function compileModule(): Promise<WebAssembly.Module> {
  const res = await fetch(WASM_URL);
  if (!res.ok) throw new Error(`fetching ${WASM_URL}: ${res.status}`);
  return WebAssembly.compile(await res.arrayBuffer());
}

/** Draws `samples` as a waveform across the canvas (±1 fills the height). */
function drawWave(samples: Float32Array): void {
  const { width: w, height: h } = canvas;
  ctx2d.setTransform(1, 0, 0, 1, 0, 0);
  ctx2d.fillStyle = colors.background;
  ctx2d.fillRect(0, 0, w, h);
  ctx2d.strokeStyle = colors.grid;
  ctx2d.beginPath();
  ctx2d.moveTo(0, h / 2);
  ctx2d.lineTo(w, h / 2);
  ctx2d.stroke();
  if (samples.length < 2) return;
  ctx2d.strokeStyle = colors.line;
  ctx2d.lineWidth = Math.max(1, window.devicePixelRatio);
  ctx2d.beginPath();
  samples.forEach((v, i) => {
    const x = (i / (samples.length - 1)) * w;
    const y = h / 2 - v * (h / 2) * WAVE_FILL;
    if (i === 0) ctx2d.moveTo(x, y);
    else ctx2d.lineTo(x, y);
  });
  ctx2d.stroke();
}

/** Smoke: render one second offline and report its peak. */
async function smoke(): Promise<void> {
  const ctx = new OfflineAudioContext(1, SMOKE_RATE * SMOKE_SECONDS, SMOKE_RATE);
  await ctx.audioWorklet.addModule(WORKLET_URL);
  const song = SONGS[0];
  if (song === undefined) throw new Error("no songs");
  // The song's events within the render (an off past the end is moot).
  const scheduled = songEvents(song).filter((e) => e.at < SMOKE_SECONDS - 0.2);
  const init: ProcessorInit = { module: await compileModule(), seed: SEED, notes: [], song: scheduled };
  const node = new AudioWorkletNode(ctx, PROCESSOR, {
    numberOfInputs: 0, outputChannelCount: [1], processorOptions: init,
  });
  node.connect(ctx.destination);
  const data = (await ctx.startRendering()).getChannelData(0);
  let peak = 0;
  let finite = true;
  for (const v of data) {
    finite &&= Number.isFinite(v);
    peak = Math.max(peak, Math.abs(v));
  }
  drawWave(data.subarray(0, SMOKE_DRAWN));
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

/** Times (s) where the level jumps: RMS per `ONSET_WINDOW_S` window rising
 *  `ONSET_RISE` times over the previous window's. */
function onsets(data: Float32Array, rate: number): number[] {
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

/** The live page: everything after the first click or key. */
type Live = { ctx: AudioContext; node: AudioWorkletNode };
let live: Live | null = null;
let starting: Promise<Live> | null = null;
let base = BASE_DEFAULT;
let lastMidi: number | null = null;

function send(m: ToWorklet, transfer: Transferable[] = []): void {
  live?.node.port.postMessage(m, transfer);
}

function sendSettings(): void {
  send({ type: "tuned", tuned: settings.tuned });
  send({ type: "t60", seconds: settings.t60 });
  send({ type: "excitation", code: settings.triangle ? EXCITATION_TRIANGLE : EXCITATION_NOISE, peak: settings.peak });
  send({ type: "gain", gain: settings.gain });
}

/** Starts audio once (a user gesture is required: autoplay policy). */
function start(): Promise<Live> {
  starting ??= (async () => {
    const ctx = new AudioContext({ latencyHint: "interactive" });
    await ctx.audioWorklet.addModule(WORKLET_URL);
    const init: ProcessorInit = { module: await compileModule(), seed: SEED, notes: [] };
    const node = new AudioWorkletNode(ctx, PROCESSOR, {
      numberOfInputs: 0, outputChannelCount: [1], processorOptions: init,
    });
    node.connect(ctx.destination);
    node.port.onmessage = (e: MessageEvent<FromWorklet>) => onMessage(e.data);
    await ctx.resume();
    live = { ctx, node };
    sendSettings();
    const floats = Math.ceil(ctx.sampleRate / LOWEST_HZ) + 2;
    for (let i = 0; i < SNAPSHOT_BUFFERS; i++) {
      const buf = new ArrayBuffer(floats * Float32Array.BYTES_PER_ELEMENT);
      send({ type: "buffer", buf }, [buf]);
    }
    byId("start", HTMLButtonElement).hidden = true;
    return live;
  })();
  return starting;
}

function onMessage(m: FromWorklet): void {
  if (m.type === "error") {
    hud.textContent = `audio error: ${m.message}`;
    return;
  }
  if (m.type !== "snapshot" || live === null) return;
  drawWave(new Float32Array(m.buf, 0, m.len));
  const sr = live.ctx.sampleRate;
  const note = lastMidi === null ? "no note yet" :
    `${noteName(lastMidi)} (${midiToHz(lastMidi).toFixed(1)} Hz): loop ${m.len} samples, ` +
    `${m.cents >= 0 ? "+" : ""}${m.cents.toFixed(2)} cents ${settings.tuned ? "(tuned)" : "(integer loop)"}`;
  hud.textContent =
    `${sr} Hz · render quantum ${m.frames} frames (${((m.frames / sr) * MS_PER_SECOND).toFixed(2)} ms) · ` +
    `${note}${m.clipped > 0 ? ` · clipped ${m.clipped}` : ""}`;
  send({ type: "buffer", buf: m.buf }, [m.buf]);
}

async function noteOn(midi: number): Promise<void> {
  await start();
  lastMidi = midi;
  send({ type: "on", key: midi });
  keyEl(midi)?.classList.add("down");
}

function noteOff(midi: number): void {
  send({ type: "off", key: midi });
  keyEl(midi)?.classList.remove("down");
}

// --- The on-screen piano: the 17 notes the computer keys reach. ---

const piano = byId("piano", HTMLElement);
const BLACK = new Set([1, 3, 6, 8, 10]);
const labelFor = new Map(Object.entries(KEY_CODES).map(([code, off]) => [off, code.replace("Key", "").replace("Semicolon", ";")]));

function keyEl(midi: number): HTMLElement | null {
  return piano.querySelector(`[data-midi="${midi}"]`);
}

function buildPiano(): void {
  piano.replaceChildren();
  const offsets = [...labelFor.keys()].sort((a, b) => a - b);
  const whites = offsets.filter((o) => !BLACK.has(o % OCTAVE)).length;
  const whiteWidth = 100 / whites;
  let white = 0;
  for (const off of offsets) {
    const midi = base + off;
    const black = BLACK.has(off % OCTAVE);
    const el = document.createElement("div");
    el.className = `key ${black ? "black" : "white"}`;
    el.dataset.midi = String(midi);
    el.textContent = labelFor.get(off) ?? "";
    el.title = noteName(midi);
    const width = black ? whiteWidth * BLACK_KEY_WIDTH : whiteWidth;
    const left = black ? white * whiteWidth - width / 2 : white * whiteWidth;
    el.style.left = `${left}%`;
    el.style.width = `${width}%`;
    if (!black) white++;
    el.addEventListener("pointerdown", (e) => {
      el.setPointerCapture(e.pointerId);
      void noteOn(midi);
    });
    const up = () => noteOff(midi);
    el.addEventListener("pointerup", up);
    el.addEventListener("pointercancel", up);
    piano.append(el);
  }
}

// --- The computer keyboard. ---

/** Held physical keys and the note each started (so an octave shift
 *  mid-note still releases the right one). */
const held = new Map<string, number>();

function onKeyDown(e: KeyboardEvent): void {
  if (e.repeat || e.metaKey || e.ctrlKey || e.altKey) return;
  if (e.target instanceof HTMLInputElement || e.target instanceof HTMLSelectElement) return;
  if (e.code === OCTAVE_DOWN || e.code === OCTAVE_UP) {
    base = Math.min(BASE_MAX, Math.max(BASE_MIN, base + (e.code === OCTAVE_UP ? OCTAVE : -OCTAVE)));
    buildPiano();
    return;
  }
  const midi = keyToMidi(e.code, base);
  if (midi === undefined) return;
  e.preventDefault();
  held.set(e.code, midi);
  void noteOn(midi);
}

function onKeyUp(e: KeyboardEvent): void {
  const midi = held.get(e.code);
  if (midi === undefined) return;
  held.delete(e.code);
  noteOff(midi);
}

// --- Songs: scheduled in the worklet; the page only lights the keys. ---

/** Timers lighting the keys for the song playing (visual only: the sound
 *  is scheduled to the frame in the worklet). */
let songTimers: number[] = [];
/** The worklet starts a song this long after it's asked (worklet.ts
 *  SONG_LEAD_S), so the key lights wait as long. */
const SONG_LEAD_MS = SONG_LEAD_S * MS_PER_SECOND;

function stopSong(): void {
  send({ type: "stop" });
  for (const t of songTimers) clearTimeout(t);
  songTimers = [];
  for (const el of piano.querySelectorAll(".down")) el.classList.remove("down");
}

async function playSong(song: Song): Promise<void> {
  await start();
  stopSong();
  const events = songEvents(song);
  send({ type: "play", events });
  songTimers = events.map((e) =>
    window.setTimeout(() => {
      if (e.on) lastMidi = e.key;
      keyEl(e.key)?.classList.toggle("down", e.on);
    }, SONG_LEAD_MS + e.at * MS_PER_SECOND),
  );
}

function buildSongs(): void {
  const songs = byId("songs", HTMLElement);
  for (const song of SONGS) button(songs, { label: `▶ ${song.name}`, onClick: () => void playSong(song) });
  button(songs, { label: "■ stop", onClick: stopSong });
}

// --- Controls. ---

function buildControls(): void {
  const controls = byId("controls", HTMLElement);
  checkbox(controls, {
    label: "fractional delay (allpass tuning)",
    checked: settings.tuned,
    onChange: (on) => {
      settings.tuned = on;
      sendSettings();
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
  select(controls, {
    label: "pluck",
    choices: [["noise", "noise (Karplus–Strong)"], ["triangle", "triangle (Piano Gloves)"]],
    value: settings.triangle ? "triangle" : "noise",
    onChange: (v) => {
      settings.triangle = v === "triangle";
      sendSettings();
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
      sendSettings();
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
      sendSettings();
    },
  });
}

try {
  drawWave(new Float32Array(0));
  if (smokeMode) {
    byId("start", HTMLButtonElement).hidden = true;
    await smoke();
  } else {
    buildControls();
    buildSongs();
    buildPiano();
    byId("start", HTMLButtonElement).addEventListener("click", () => void start());
    window.addEventListener("keydown", onKeyDown);
    window.addEventListener("keyup", onKeyUp);
  }
} catch (err) {
  hud.textContent = `error: ${errorText(err)}`;
  if (smokeMode) reportSmoke(`error ${errorText(err)}`);
  throw err;
}
