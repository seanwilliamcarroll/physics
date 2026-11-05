// The acoustic pages' keyboard: an on-screen piano, the computer keyboard
// (ks.ts's layout), and the preset songs (songs.ts), scheduled in the
// worklet; the page lights the keys.

import { button } from "./controls.ts";
import { KEY_CODES, OCTAVE_DOWN, OCTAVE_UP, keyToMidi, noteName } from "./ks.ts";
import { MS_PER_SECOND } from "./loop.ts";
import { SONGS, songEvents } from "./songs.ts";
import type { Song } from "./songs.ts";
import type { ToWorklet } from "./synth-worklet.ts";
import { SONG_LEAD_S } from "./synth-live.ts";

/** The keyboard's C: C4 (MIDI 60), shifted by octaves within C1–C7. */
const BASE_DEFAULT = 60;
const BASE_MIN = 24;
const BASE_MAX = 96;
const OCTAVE = 12;
const BLACK = new Set([1, 3, 6, 8, 10]);
/** A black key's width as a fraction of a white key's; it's centered on
 *  the boundary between two white keys. */
const BLACK_KEY_WIDTH = 0.6;
const PERCENT = 100;

export type PianoOptions = {
  piano: HTMLElement;
  songs: HTMLElement;
  /** Starts audio if needed (the first gesture), then resolves. */
  start: () => Promise<unknown>;
  send: (m: ToWorklet) => void;
  /** Told of every note played, by hand or by a song (the page's readout),
   *  with its velocity if it has one (a song's notes don't). */
  onNote: (midi: number, velocity?: number) => void;
  /** A piano strike's velocity (m/s) for a key pressed `depth` of the way
   *  down it (0 the top, 1 the bottom; `null` from the computer keyboard).
   *  Without it, notes have none (the model's own note on). */
  velocity?: (depth: number | null) => number;
};

/** Builds the piano and songs into the page and listens to the keyboard. */
export function pianoUi(o: PianoOptions): void {
  let base = BASE_DEFAULT;
  const labelFor = new Map(Object.entries(KEY_CODES).map(([code, off]) => [off, code.replace("Key", "").replace("Semicolon", ";")]));
  const keyEl = (midi: number): HTMLElement | null => o.piano.querySelector(`[data-midi="${midi}"]`);

  const noteOn = async (midi: number, depth: number | null): Promise<void> => {
    await o.start();
    const velocity = o.velocity?.(depth);
    o.onNote(midi, velocity);
    o.send(velocity === undefined ? { type: "on", key: midi } : { type: "on", key: midi, velocity });
    keyEl(midi)?.classList.add("down");
  };
  const noteOff = (midi: number): void => {
    o.send({ type: "off", key: midi });
    keyEl(midi)?.classList.remove("down");
  };

  const build = (): void => {
    o.piano.replaceChildren();
    const offsets = [...labelFor.keys()].sort((a, b) => a - b);
    const whiteWidth = PERCENT / offsets.filter((x) => !BLACK.has(x % OCTAVE)).length;
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
      el.style.left = `${black ? white * whiteWidth - width / 2 : white * whiteWidth}%`;
      el.style.width = `${width}%`;
      if (!black) white++;
      el.addEventListener("pointerdown", (e) => {
        el.setPointerCapture(e.pointerId);
        const box = el.getBoundingClientRect();
        void noteOn(midi, box.height > 0 ? Math.min(1, Math.max(0, (e.clientY - box.top) / box.height)) : null);
      });
      el.addEventListener("pointerup", () => noteOff(midi));
      el.addEventListener("pointercancel", () => noteOff(midi));
      o.piano.append(el);
    }
  };

  /** Held physical keys and the note each started (so an octave shift
   *  mid-note still releases the right one). */
  const held = new Map<string, number>();
  window.addEventListener("keydown", (e) => {
    if (e.repeat || e.metaKey || e.ctrlKey || e.altKey) return;
    if (e.target instanceof HTMLInputElement || e.target instanceof HTMLSelectElement) return;
    if (e.code === OCTAVE_DOWN || e.code === OCTAVE_UP) {
      base = Math.min(BASE_MAX, Math.max(BASE_MIN, base + (e.code === OCTAVE_UP ? OCTAVE : -OCTAVE)));
      build();
      return;
    }
    const midi = keyToMidi(e.code, base);
    if (midi === undefined) return;
    e.preventDefault();
    held.set(e.code, midi);
    void noteOn(midi, null);
  });
  window.addEventListener("keyup", (e) => {
    const midi = held.get(e.code);
    if (midi === undefined) return;
    held.delete(e.code);
    noteOff(midi);
  });

  /** Timers lighting the keys for the song playing (visual only: the
   *  sound is scheduled to the frame in the worklet). */
  let timers: number[] = [];
  const stop = (): void => {
    o.send({ type: "stop" });
    for (const t of timers) clearTimeout(t);
    timers = [];
    for (const el of o.piano.querySelectorAll(".down")) el.classList.remove("down");
  };
  const play = async (song: Song): Promise<void> => {
    await o.start();
    stop();
    const events = songEvents(song);
    o.send({ type: "play", events });
    timers = events.map((e) =>
      window.setTimeout(() => {
        if (e.on) o.onNote(e.key);
        keyEl(e.key)?.classList.toggle("down", e.on);
      }, (SONG_LEAD_S + e.at) * MS_PER_SECOND),
    );
  };
  for (const song of SONGS) button(o.songs, { label: `▶ ${song.name}`, onClick: () => void play(song) });
  button(o.songs, { label: "■ stop", onClick: stop });
  build();
}
