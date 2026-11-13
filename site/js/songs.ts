// Preset songs for the acoustic pages: traditional tunes as data, turned into
// timed note events the worklet schedules sample-accurately. Pure, so
// node --test covers them.

/** One step of a track: the keys struck together (MIDI; none = a rest),
 *  and how long it lasts, in beats. */
export type SongNote = { keys: number[]; beats: number };
/** A song: one or more tracks (a hand each) played at once, each a
 *  sequence of steps, so notes can overlap with different lengths (a
 *  held melody note over a moving bass). */
export type Song = { name: string; bpm: number; tracks: SongNote[][] };

/** A note sounds for this fraction of its length, then releases: so a
 *  repeated key re-plucks audibly instead of running into itself. */
export const ARTICULATION = 0.9;

const SECONDS_PER_MINUTE = 60;

// MIDI keys (♯ written s).
const E2 = 40, A2 = 45, E3 = 52, Gs3 = 56, A3 = 57, B3 = 59;
const C4 = 60, D4 = 62, E4 = 64, F4 = 65, G4 = 67, Gs4 = 68, A4 = 69, B4 = 71;
const C5 = 72, D5 = 74, Ds5 = 75, E5 = 76;

const n = (beats: number, ...keys: number[]): SongNote => ({ keys, beats });
const times = (count: number, note: SongNote): SongNote[] => Array<SongNote>(count).fill(note);
/** One note per step, each `beats` long. */
const run = (beats: number, ...keys: number[]): SongNote[] => keys.map((k) => n(beats, k));

// Für Elise (Beethoven, 1810), the opening section: 3/8, one beat per
// sixteenth note, six to a bar. The right hand's turn (E D♯ E D♯ E B D C)
// and its answering arpeggios; the left hand's broken chords under the
// held notes (A minor, E major, A minor).
const S = 1; // a sixteenth
const turn = run(S, E5, Ds5, E5, B4, D5, C5);
const amArp = run(S, A2, E3, A3);
const eArp = run(S, E2, E3, Gs3);
const rest = (beats: number): SongNote => n(beats);
const furEliseRight: SongNote[] = [
  ...run(S, E5, Ds5), // pickup
  ...turn,
  n(2 * S, A4), rest(S), ...run(S, C4, E4, A4),
  n(2 * S, B4), rest(S), ...run(S, E4, Gs4, B4),
  n(2 * S, C5), rest(S), ...run(S, E4, E5, Ds5),
  ...turn,
  n(2 * S, A4), rest(S), ...run(S, C4, E4, A4),
  n(2 * S, B4), rest(S), ...run(S, E4, C5, B4),
  n(6 * S, A4),
];
const furEliseLeft: SongNote[] = [
  rest(2 * S), // the pickup
  rest(6 * S), // under the turn
  ...amArp, rest(3 * S),
  ...eArp, rest(3 * S),
  ...amArp, rest(3 * S),
  rest(6 * S),
  ...amArp, rest(3 * S),
  ...eArp, rest(3 * S),
  ...run(S, A2, E3), n(4 * S, A3),
];

// The Entertainer (Scott Joplin, 1902): the introduction and the first
// strain, 2/4, one beat per sixteenth note. Converted from the Mutopia
// Project's LilyPond engraving of the 1902 original edition (public
// domain; piece 263, https://www.mutopiaproject.org) by a script that
// checked every bar's length; the first ending's lead-back is replaced by
// a held final chord. Each step is [sixteenths, ...MIDI keys].
type Step = [beats: number, ...keys: number[]];
const steps = (list: Step[]): SongNote[] => list.map(([beats, ...keys]) => ({ beats, keys }));
const entertainerRight: SongNote[] = steps([
  [1, 86], [1, 88], [1, 84], [2, 81], [1, 83], [2, 79], [1, 74], [1, 76],
  [1, 72], [2, 69], [1, 71], [2, 67], [1, 62], [1, 64], [1, 60], [2, 57],
  [1, 59], [1, 57], [1, 56], [2, 55], [2], [2, 79, 74, 71, 67], [1, 62],
  [1, 63], [1, 64], [2, 72], [1, 64], [2, 72], [1, 64], [6, 72],
  [1, 84, 76, 72], [1, 86, 77, 74], [1, 87, 78, 75], [1, 88, 79, 76],
  [1, 84, 76, 72], [1, 86, 77, 74], [2, 88, 79, 76], [1, 83, 74, 71],
  [2, 86, 77, 74], [6, 84, 76, 72], [1, 62], [1, 63], [1, 64], [2, 72],
  [1, 64], [2, 72], [1, 64], [7, 72], [1, 81, 72, 69], [1, 79, 72, 67],
  [1, 78, 72, 66], [1, 81, 69], [1, 84, 72], [2, 88, 76], [1, 86, 74],
  [1, 84, 72], [1, 81, 69], [6, 86, 77, 74], [1, 62], [1, 63], [1, 64],
  [2, 72], [1, 64], [2, 72], [1, 64], [6, 72], [1, 84, 76, 72],
  [1, 86, 77, 74], [1, 87, 78, 75], [1, 88, 79, 76], [1, 84, 76, 72],
  [1, 86, 77, 74], [2, 88, 79, 76], [1, 83, 74, 71], [2, 86, 77, 74],
  [6, 84, 76, 72], [1, 84, 72], [1, 86, 74], [1, 88, 76], [1, 84, 72],
  [1, 86, 74], [2, 88, 76], [1, 84, 72], [1, 86, 74], [1, 84, 72],
  [1, 88, 76], [1, 84, 72], [1, 86, 74], [2, 88, 76], [1, 84, 72],
  [1, 86, 74], [1, 84, 72], [1, 88, 79, 76], [1, 84, 76, 72],
  [1, 86, 77, 74], [2, 88, 79, 76], [1, 83, 74, 71], [2, 86, 77, 74],
  [6, 84, 76, 72], [2],
]);

const entertainerLeft: SongNote[] = steps([
  [1, 74], [1, 76], [1, 72], [2, 69], [1, 71], [2, 67], [1, 62], [1, 64],
  [1, 60], [2, 57], [1, 59], [2, 55], [1, 50], [1, 52], [1, 48], [2, 45],
  [1, 47], [1, 45], [1, 44], [2, 43], [2], [2, 43, 31], [2, 59, 55], [2, 48],
  [2, 60, 55, 52], [2, 55, 43], [2, 60, 58, 55], [2, 53, 41], [2, 60, 57],
  [2, 52, 40], [2, 60, 55], [2, 43], [2, 60, 55, 52], [2, 43],
  [2, 59, 55, 53], [2, 48], [2, 60, 55, 52], [2, 60, 55, 52], [2, 59, 55],
  [2, 48], [2, 60, 55, 52], [2, 55, 43], [2, 60, 58, 55], [2, 53, 41],
  [2, 60, 57], [2, 52, 40], [2, 51, 39], [2, 50, 38], [2, 60, 57, 54, 50],
  [2, 50], [2, 60, 57, 54], [2, 59, 55], [2, 55, 43], [2, 57, 45],
  [2, 59, 47], [2, 48], [2, 60, 55, 52], [2, 55, 43], [2, 60, 58, 55],
  [2, 53, 41], [2, 60, 57], [2, 52, 40], [2, 60, 55], [2, 43],
  [2, 60, 55, 52], [2, 43], [2, 59, 55, 53], [2, 48], [2, 60, 55, 52],
  [2, 64, 60, 55], [2], [2, 60, 48], [2, 64, 60, 55], [2, 58, 46],
  [2, 64, 60, 55], [2, 57, 45], [2, 65, 60, 57], [2, 56, 44],
  [2, 65, 60, 56], [2, 55, 43], [2, 64, 60, 55], [2, 43], [2, 59, 55],
  [2, 60, 55, 48], [6],
]);

export const SONGS: Song[] = [
  {
    name: "Hot Cross Buns",
    bpm: 100,
    tracks: [[
      n(1, E4), n(1, D4), n(2, C4),
      n(1, E4), n(1, D4), n(2, C4),
      ...times(4, n(0.5, C4)), ...times(4, n(0.5, D4)),
      n(1, E4), n(1, D4), n(2, C4),
    ]],
  },
  {
    name: "Mary Had a Little Lamb",
    bpm: 120,
    tracks: [[
      n(1, E4), n(1, D4), n(1, C4), n(1, D4), n(1, E4), n(1, E4), n(2, E4),
      n(1, D4), n(1, D4), n(2, D4), n(1, E4), n(1, G4), n(2, G4),
      n(1, E4), n(1, D4), n(1, C4), n(1, D4), n(1, E4), n(1, E4), n(1, E4), n(1, E4),
      n(1, D4), n(1, D4), n(1, E4), n(1, D4), n(4, C4),
    ]],
  },
  {
    // The opening phrase, a waltz in two-note chords whose fingers spread
    // apart: seconds, then thirds, then sixths.
    name: "Chopsticks",
    bpm: 160,
    tracks: [[
      ...times(6, n(1, F4, G4)),
      ...times(6, n(1, E4, G4)),
      ...times(4, n(1, D4, B4)),
      n(1, E4, C5), n(1, F4, D5),
      ...times(3, n(1, E4, C5)),
      n(3),
      n(3, B3, G4),
    ]],
  },
  {
    name: "Für Elise",
    // Poco moto: a sixteenth at 300 per minute (a dotted quarter at 50).
    bpm: 300,
    tracks: [furEliseRight, furEliseLeft],
  },
  {
    name: "The Entertainer",
    // "Not fast": a quarter at 80, so 320 sixteenths a minute.
    bpm: 320,
    tracks: [entertainerRight, entertainerLeft],
  },
];

/** A key going on or off, `at` seconds from the song's start. */
export type SongEvent = { at: number; on: boolean; key: number };

/** The song as timed events, sorted by time (ons before offs at the same
 *  instant don't occur: every off is `ARTICULATION` into its note). */
export function songEvents(song: Song): SongEvent[] {
  const beat = SECONDS_PER_MINUTE / song.bpm;
  const events: SongEvent[] = [];
  for (const track of song.tracks) {
    let t = 0;
    for (const note of track) {
      const length = note.beats * beat;
      for (const key of note.keys) events.push({ at: t, on: true, key });
      for (const key of note.keys) events.push({ at: t + length * ARTICULATION, on: false, key });
      t += length;
    }
  }
  // A stable sort: same-instant events keep their track order.
  return events.sort((a, b) => a.at - b.at);
}

/** How long the song lasts, s: its longest track. */
export function songLength(song: Song): number {
  const beats = Math.max(...song.tracks.map((t) => t.reduce((s, x) => s + x.beats, 0)));
  return (beats * SECONDS_PER_MINUTE) / song.bpm;
}
