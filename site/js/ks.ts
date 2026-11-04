// The A1 page's pure helpers (docs/12-acoustic-foundations.md): note
// numbers and names, and the computer keyboard's piano layout. Pure, so
// node --test covers them. (The integer loop's error comes from the synth,
// `synth_latest_cents`: it depends on the decay setting's filter.)

/** Equal temperament, A4 = 440 Hz, MIDI note numbers. */
export function midiToHz(midi: number): number {
  return 440 * 2 ** ((midi - 69) / 12);
}

const NAMES = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"];

/** "C4", "F♯5": scientific pitch notation (MIDI 60 = C4). */
export function noteName(midi: number): string {
  return `${NAMES[midi % 12]}${Math.floor(midi / 12) - 1}`;
}

/** Physical keys (`KeyboardEvent.code`, so the layout doesn't matter) to
 *  semitones above the base C: the home row is the white keys, the row
 *  above the black ones, as DAWs lay out a computer keyboard. */
export const KEY_CODES: Record<string, number> = {
  KeyA: 0, KeyW: 1, KeyS: 2, KeyE: 3, KeyD: 4, KeyF: 5, KeyT: 6, KeyG: 7,
  KeyY: 8, KeyH: 9, KeyU: 10, KeyJ: 11, KeyK: 12, KeyO: 13, KeyL: 14, KeyP: 15,
  Semicolon: 16,
};

/** Octave shift keys. */
export const OCTAVE_DOWN = "KeyZ";
export const OCTAVE_UP = "KeyX";

/** The highest MIDI note. */
const MIDI_MAX = 127;

/** The MIDI note a physical key plays with the keyboard's C at `base`, or
 *  undefined (not a piano key, or past the MIDI range). */
export function keyToMidi(code: string, base: number): number | undefined {
  const offset = KEY_CODES[code];
  if (offset === undefined) return undefined;
  const midi = base + offset;
  return midi >= 0 && midi <= MIDI_MAX ? midi : undefined;
}
