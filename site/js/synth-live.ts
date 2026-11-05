// Running acoustic.wasm in the synth worklet (synth-worklet.ts): the page
// side, shared by the acoustic pages. Compiles the module, starts audio on
// the first gesture, keeps the snapshot buffers circulating, and renders
// offline for smoke tests (docs/12-acoustic-foundations.md).

import type { FromWorklet, ProcessorInit, ToWorklet } from "./synth-worklet.ts";
import { SPECTRUM_SIZE } from "./acoustic-abi.ts";

const WORKLET_URL = new URL("./synth-worklet.js", import.meta.url);
const WASM_URL = new URL("../pkg/acoustic.wasm", import.meta.url);
const PROCESSOR = "ks-string";
/** Seeds the excitation noise: the same session plays the same plucks. */
export const SEED = 1;
/** synth-worklet.ts SONG_LEAD_S: a song starts this long after it's sent. */
export const SONG_LEAD_S = 0.05;
/** The lowest note a voice holds (crates/acoustic LOWEST_HZ, A0): sizes
 *  the snapshot buffers (the longest line plus slack). */
const LOWEST_HZ = 27.5;
/** The latest strike's hammer force, s (crates/acoustic TRACE_SECONDS):
 *  sizes the snapshot buffers when a page asks for it. */
const TRACE_SECONDS = 0.012;
/** Two snapshot buffers ping-pong between page and worklet. */
const SNAPSHOT_BUFFERS = 2;

export async function compileAcoustic(): Promise<WebAssembly.Module> {
  const res = await fetch(WASM_URL);
  if (!res.ok) throw new Error(`fetching ${WASM_URL}: ${res.status}`);
  return WebAssembly.compile(await res.arrayBuffer());
}

/** What a page gets once audio runs. */
export type Live = { ctx: AudioContext; send: (m: ToWorklet, transfer?: Transferable[]) => void };

export type LiveOptions = {
  /** Messages sent right after the worklet starts (the page's settings). */
  initial: () => ToWorklet[];
  /** Whether snapshots carry the spectrum (and so buffer room for it). */
  spectrum: boolean;
  /** Whether snapshots carry the latest strike's hammer force (A3). */
  trace?: boolean;
  onSnapshot: (m: Extract<FromWorklet, { type: "snapshot" }>, live: Live) => void;
  onError: (message: string) => void;
};

/** A synth that starts on the first call to `start` (a user gesture is
 *  required: autoplay policy), then forwards `send`. Snapshot buffers are
 *  handed back to the worklet after `onSnapshot` returns. */
export function liveSynth(o: LiveOptions): { start: () => Promise<Live>; send: Live["send"] } {
  let live: Live | null = null;
  let starting: Promise<Live> | null = null;
  const send: Live["send"] = (m, transfer = []) => live?.send(m, transfer);
  const start = (): Promise<Live> => {
    starting ??= (async () => {
      const ctx = new AudioContext({ latencyHint: "interactive" });
      await ctx.audioWorklet.addModule(WORKLET_URL);
      const init: ProcessorInit = { module: await compileAcoustic(), seed: SEED, notes: [] };
      const node = new AudioWorkletNode(ctx, PROCESSOR, {
        numberOfInputs: 0, outputChannelCount: [1], processorOptions: init,
      });
      node.connect(ctx.destination);
      const l: Live = { ctx, send: (m, transfer = []) => node.port.postMessage(m, transfer) };
      node.port.onmessage = (e: MessageEvent<FromWorklet>) => {
        const m = e.data;
        if (m.type === "error") o.onError(m.message);
        if (m.type !== "snapshot") return;
        o.onSnapshot(m, l);
        l.send({ type: "buffer", buf: m.buf }, [m.buf]);
      };
      await ctx.resume();
      live = l;
      for (const m of o.initial()) l.send(m);
      l.send({ type: "spectrum", on: o.spectrum });
      l.send({ type: "trace", on: o.trace ?? false });
      const floats = Math.ceil(ctx.sampleRate / LOWEST_HZ) + 2 + (o.spectrum ? SPECTRUM_SIZE / 2 : 0) +
        (o.trace === true ? Math.ceil(ctx.sampleRate * TRACE_SECONDS) + 1 : 0);
      for (let i = 0; i < SNAPSHOT_BUFFERS; i++) {
        const buf = new ArrayBuffer(floats * Float32Array.BYTES_PER_ELEMENT);
        l.send({ type: "buffer", buf }, [buf]);
      }
      return l;
    })();
    return starting;
  };
  return { start, send };
}

/** Renders `seconds` offline through the real worklet and module (no
 *  speakers: the smoke tests), mono at `rate`. */
export async function renderOffline(
  init: Omit<ProcessorInit, "module" | "seed">,
  seconds: number,
  rate: number,
): Promise<Float32Array> {
  const ctx = new OfflineAudioContext(1, Math.round(rate * seconds), rate);
  await ctx.audioWorklet.addModule(WORKLET_URL);
  const full: ProcessorInit = { ...init, module: await compileAcoustic(), seed: SEED };
  const node = new AudioWorkletNode(ctx, PROCESSOR, {
    numberOfInputs: 0, outputChannelCount: [1], processorOptions: full,
  });
  node.connect(ctx.destination);
  return (await ctx.startRendering()).getChannelData(0);
}
