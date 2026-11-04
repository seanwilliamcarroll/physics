// Preset songs for the A1 page: traditional tunes as data, turned into
// timed note events the worklet schedules sample-accurately. Pure, so
// node --test covers them.

/** One step of a song: the keys struck together (MIDI; none = a rest),
 *  and how long it lasts, in beats. */
export type SongNote = { keys: number[]; beats: number };
export type Song = { name: string; bpm: number; notes: SongNote[] };

/** A note sounds for this fraction of its length, then releases: so a
 *  repeated key re-plucks audibly instead of running into itself. */
export const ARTICULATION = 0.9;

const SECONDS_PER_MINUTE = 60;

// MIDI keys, around middle C.
const B3 = 59, C4 = 60, D4 = 62, E4 = 64, F4 = 65, G4 = 67, B4 = 71, C5 = 72, D5 = 74;

const n = (beats: number, ...keys: number[]): SongNote => ({ keys, beats });
const times = (count: number, note: SongNote): SongNote[] => Array<SongNote>(count).fill(note);

export const SONGS: Song[] = [
  {
    name: "Hot Cross Buns",
    bpm: 100,
    notes: [
      n(1, E4), n(1, D4), n(2, C4),
      n(1, E4), n(1, D4), n(2, C4),
      ...times(4, n(0.5, C4)), ...times(4, n(0.5, D4)),
      n(1, E4), n(1, D4), n(2, C4),
    ],
  },
  {
    name: "Mary Had a Little Lamb",
    bpm: 120,
    notes: [
      n(1, E4), n(1, D4), n(1, C4), n(1, D4), n(1, E4), n(1, E4), n(2, E4),
      n(1, D4), n(1, D4), n(2, D4), n(1, E4), n(1, G4), n(2, G4),
      n(1, E4), n(1, D4), n(1, C4), n(1, D4), n(1, E4), n(1, E4), n(1, E4), n(1, E4),
      n(1, D4), n(1, D4), n(1, E4), n(1, D4), n(4, C4),
    ],
  },
  {
    // The opening phrase, a waltz in two-note chords whose fingers spread
    // apart: seconds, then thirds, then sixths.
    name: "Chopsticks",
    bpm: 160,
    notes: [
      ...times(6, n(1, F4, G4)),
      ...times(6, n(1, E4, G4)),
      ...times(4, n(1, D4, B4)),
      n(1, E4, C5), n(1, F4, D5),
      ...times(3, n(1, E4, C5)),
      n(3),
      n(3, B3, G4),
    ],
  },
];

/** A key going on or off, `at` seconds from the song's start. */
export type SongEvent = { at: number; on: boolean; key: number };

/** The song as timed events, sorted by time (ons before offs at the same
 *  instant don't occur: every off is `ARTICULATION` into its note). */
export function songEvents(song: Song): SongEvent[] {
  const beat = SECONDS_PER_MINUTE / song.bpm;
  const events: SongEvent[] = [];
  let t = 0;
  for (const note of song.notes) {
    const length = note.beats * beat;
    for (const key of note.keys) events.push({ at: t, on: true, key });
    for (const key of note.keys) events.push({ at: t + length * ARTICULATION, on: false, key });
    t += length;
  }
  return events.sort((a, b) => a.at - b.at);
}

/** How long the song lasts, s. */
export function songLength(song: Song): number {
  return (song.notes.reduce((s, x) => s + x.beats, 0) * SECONDS_PER_MINUTE) / song.bpm;
}
