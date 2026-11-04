// The acoustic pages' audio worklet: runs acoustic.wasm on the browser's
// audio thread (docs/12-acoustic-foundations.md, "How wasm makes sound";
// A2's waveguide, pickup and spectrum: docs/13-waveguide.md).
//
// Self-contained (no imports): loaded with audioWorklet.addModule, into a
// global scope that has no DOM, no fetch, and (in some browsers) no
// TextDecoder. The page compiles the module and passes it in
// processorOptions, so the constructor instantiates it synchronously:
// no handshake, no window where a note could arrive before the synth.

import type { AcousticExports, SynthHandle } from "./acoustic";

// The AudioWorkletGlobalScope's globals, which TypeScript's DOM library
// doesn't describe. Declared here, not globally, so pages can't use them.
declare const sampleRate: number;
/** The frame (sample index) the next render quantum starts at. */
declare const currentFrame: number;
declare class AudioWorkletProcessor {
  readonly port: MessagePort;
  constructor(options?: AudioWorkletNodeOptions);
}
declare function registerProcessor(
  name: string,
  ctor: new (options: AudioWorkletNodeOptions) => AudioWorkletProcessor,
): void;

/** A key event `at` seconds from a song's start. */
export type TimedKey = { at: number; on: boolean; key: number };

/** What the page passes at construction: the module, the noise seed,
 *  notes to start at once, and optionally a song to schedule (smoke mode
 *  renders one offline to check the timing). */
export type ProcessorInit = {
  module: WebAssembly.Module;
  seed: number;
  notes: number[];
  song?: TimedKey[];
  /** Set before the notes (smoke renders a waveguide offline). */
  model?: number;
  excitation?: { code: number; peak: number };
  pickup?: number;
};

/** Messages from the page. */
export type ToWorklet =
  | { type: "on"; key: number }
  | { type: "off"; key: number }
  | { type: "tuned"; tuned: boolean }
  | { type: "t60"; seconds: number }
  | { type: "excitation"; code: number; peak: number }
  | { type: "gain"; gain: number }
  | { type: "buffer"; buf: ArrayBuffer }
  /** A song: key events `at` seconds from now (plus a short lead),
   *  scheduled to the frame. Replaces any song playing. */
  | { type: "play"; events: TimedKey[] }
  | { type: "stop" }
  | { type: "model"; code: number }
  | { type: "pickup"; at: number }
  /** Include the output's spectrum in each snapshot (A2). */
  | { type: "spectrum"; on: boolean };

/** Messages to the page. */
export type FromWorklet =
  | { type: "ready"; sampleRate: number }
  /** `buf` holds the string's samples (`len`), then, if asked for, the
   *  spectrum's dB bins (`bins`, 0 otherwise). */
  | { type: "snapshot"; buf: ArrayBuffer; len: number; bins: number; clipped: number; cents: number; frames: number }
  | { type: "error"; message: string };

/** Snapshots per second (display rate; the page draws each one). */
const SNAPSHOTS_PER_SECOND = 30;

/** A song starts this long after the message arrives, s: room for the
 *  first quantum, so its first note isn't late. */
const SONG_LEAD_S = 0.05;

/** A scheduled key event, in frames. */
type Scheduled = { frame: number; on: boolean; key: number };

class KsProcessor extends AudioWorkletProcessor {
  private readonly x: AcousticExports;
  private readonly synth: SynthHandle;
  /** Buffers the page has handed back, to fill with the next snapshot. */
  private readonly pool: ArrayBuffer[] = [];
  private sinceSnapshot = 0;
  /** A view onto the synth's output, rebuilt only if memory grows or the
   *  quantum size changes, so `process` allocates nothing. */
  private view: Float32Array | null = null;
  private viewPtr = 0;
  /** The song playing: its events by frame, the next one's index, and the
   *  keys it holds down (released if it's stopped mid-note). */
  private song: Scheduled[] = [];
  private songNext = 0;
  private readonly songHeld = new Set<number>();
  private spectrumOn = false;

  constructor(options: AudioWorkletNodeOptions) {
    super(options);
    const init = options.processorOptions as ProcessorInit;
    const memory: { buffer?: ArrayBuffer } = {};
    const instance = new WebAssembly.Instance(init.module, {
      env: {
        // The Rust panic hook's text, decoded by hand (no TextDecoder here).
        console_error: (ptr: number, len: number) => {
          const bytes = new Uint8Array(memory.buffer ?? new ArrayBuffer(0), ptr, len);
          const text = String.fromCharCode(...bytes);
          console.error(text);
          this.port.postMessage({ type: "error", message: text } satisfies FromWorklet);
        },
      },
    });
    this.x = instance.exports as unknown as AcousticExports;
    memory.buffer = this.x.memory.buffer;
    this.synth = this.x.synth_new(sampleRate, init.seed);
    if (init.model !== undefined) this.x.synth_set_model(this.synth, init.model);
    if (init.excitation !== undefined) this.x.synth_set_excitation(this.synth, init.excitation.code, init.excitation.peak);
    if (init.pickup !== undefined) this.x.synth_set_pickup(this.synth, init.pickup);
    for (const key of init.notes) this.x.synth_note_on(this.synth, key);
    if (init.song !== undefined) this.play(init.song);
    this.port.onmessage = (e: MessageEvent<ToWorklet>) => this.handle(e.data);
    this.port.postMessage({ type: "ready", sampleRate } satisfies FromWorklet);
  }

  private handle(m: ToWorklet): void {
    const { x, synth } = this;
    switch (m.type) {
      case "on": x.synth_note_on(synth, m.key); break;
      case "off": x.synth_note_off(synth, m.key); break;
      case "tuned": x.synth_set_tuned(synth, m.tuned ? 1 : 0); break;
      case "t60": x.synth_set_t60(synth, m.seconds); break;
      case "excitation": x.synth_set_excitation(synth, m.code, m.peak); break;
      case "gain": x.synth_set_gain(synth, m.gain); break;
      case "buffer": this.pool.push(m.buf); break;
      case "play": this.play(m.events); break;
      case "stop": this.stopSong(); break;
      case "model": x.synth_set_model(synth, m.code); break;
      case "pickup": x.synth_set_pickup(synth, m.at); break;
      case "spectrum": this.spectrumOn = m.on; break;
    }
  }

  private play(events: TimedKey[]): void {
    this.stopSong();
    const start = currentFrame + SONG_LEAD_S * sampleRate;
    this.song = events.map((e) => ({ frame: Math.round(start + e.at * sampleRate), on: e.on, key: e.key }));
    this.songNext = 0;
  }

  private stopSong(): void {
    for (const key of this.songHeld) this.x.synth_note_off(this.synth, key);
    this.songHeld.clear();
    this.song = [];
    this.songNext = 0;
  }

  /** Applies the song's events that fall in the quantum starting now: at
   *  its start, so to within one quantum (2.7 ms at 128 frames). */
  private runSong(frames: number): void {
    const end = currentFrame + frames;
    for (let e = this.song[this.songNext]; e !== undefined && e.frame < end; e = this.song[++this.songNext]) {
      if (e.on) {
        this.x.synth_note_on(this.synth, e.key);
        this.songHeld.add(e.key);
      } else {
        this.x.synth_note_off(this.synth, e.key);
        this.songHeld.delete(e.key);
      }
    }
  }

  process(_inputs: Float32Array[][], outputs: Float32Array[][]): boolean {
    const channels = outputs[0];
    const first = channels?.[0];
    if (first === undefined) return true;
    const frames = first.length;
    this.runSong(frames);
    const ptr = this.x.synth_render(this.synth, frames);
    if (ptr === 0) {
      first.fill(0);
    } else {
      if (this.view === null || this.viewPtr !== ptr || this.view.length !== frames || this.view.buffer !== this.x.memory.buffer) {
        this.view = new Float32Array(this.x.memory.buffer, ptr, frames);
        this.viewPtr = ptr;
      }
      first.set(this.view);
    }
    for (let c = 1; c < channels.length; c++) channels[c]?.set(first);
    this.sinceSnapshot += frames;
    if (this.sinceSnapshot >= sampleRate / SNAPSHOTS_PER_SECOND) this.snapshot(frames);
    return true;
  }

  /** Sends the latest string's delay line, in a buffer the page handed
   *  back (skipped if none is free, or it's too small). */
  private snapshot(frames: number): void {
    const buf = this.pool.pop();
    if (buf === undefined) return;
    this.sinceSnapshot = 0;
    const { x, synth } = this;
    const len = x.synth_snapshot(synth);
    const bins = this.spectrumOn ? x.synth_spectrum(synth) : 0;
    if ((len + bins) * Float32Array.BYTES_PER_ELEMENT > buf.byteLength) {
      this.pool.push(buf);
      return;
    }
    new Float32Array(buf, 0, len).set(new Float32Array(x.memory.buffer, x.synth_snapshot_ptr(synth), len));
    if (bins > 0) {
      new Float32Array(buf, len * Float32Array.BYTES_PER_ELEMENT, bins)
        .set(new Float32Array(x.memory.buffer, x.synth_spectrum_ptr(synth), bins));
    }
    const msg: FromWorklet = {
      type: "snapshot", buf, len, bins, frames,
      clipped: x.synth_clipped(synth),
      cents: x.synth_latest_cents(synth),
    };
    this.port.postMessage(msg, [buf]);
  }
}

registerProcessor("ks-string", KsProcessor);
