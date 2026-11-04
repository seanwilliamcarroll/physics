// Unit tests for site/js/songs.ts: the A1 page's preset songs.
import { test } from "node:test";
import assert from "node:assert/strict";
import { ARTICULATION, SONGS, songEvents, songLength } from "../../site/js/songs.ts";

test("every song is playable: keys in the MIDI range, positive beats", () => {
  assert.ok(SONGS.length >= 3);
  for (const song of SONGS) {
    assert.ok(song.bpm > 0, song.name);
    assert.ok(song.tracks.length > 0 && song.tracks.every((t) => t.length > 0), song.name);
    for (const n of song.tracks.flat()) {
      assert.ok(n.beats > 0, `${song.name}: ${JSON.stringify(n)}`);
      for (const k of n.keys) assert.ok(Number.isInteger(k) && k >= 21 && k <= 108, `${song.name}: ${k}`);
    }
  }
});

test("events: each key on at its beat, off before the next note", () => {
  // Two quarter notes and a rest at 120 bpm: 0.5 s per beat.
  const song = { name: "t", bpm: 120, tracks: [[{ keys: [60], beats: 1 }, { keys: [], beats: 1 }, { keys: [62, 65], beats: 2 }]] };
  const ev = songEvents(song);
  assert.deepEqual(ev, [
    { at: 0, on: true, key: 60 },
    { at: 0.5 * ARTICULATION, on: false, key: 60 },
    { at: 1, on: true, key: 62 },
    { at: 1, on: true, key: 65 },
    { at: 1 + ARTICULATION, on: false, key: 62 },
    { at: 1 + ARTICULATION, on: false, key: 65 },
  ]);
});

test("events come sorted by time", () => {
  for (const song of SONGS) {
    const ev = songEvents(song);
    assert.ok(ev.every((e, i) => i === 0 || ev[i - 1].at <= e.at), song.name);
    assert.equal(ev.filter((e) => e.on).length, ev.filter((e) => !e.on).length, `${song.name}: every on has an off`);
  }
});

test("hot cross buns is three notes", () => {
  const buns = SONGS.find((s) => s.name === "Hot Cross Buns");
  assert.deepEqual(new Set(buns.tracks.flat().flatMap((n) => n.keys)), new Set([60, 62, 64]));
});

test("tracks play at once: a held note over a moving one", () => {
  // Track 1 holds C for 2 beats; track 2 plays E then G under it.
  const song = { name: "t", bpm: 60, tracks: [[{ keys: [60], beats: 2 }], [{ keys: [64], beats: 1 }, { keys: [67], beats: 1 }]] };
  const ev = songEvents(song).filter((e) => e.on);
  assert.deepEqual(ev.map((e) => [e.at, e.key]), [[0, 60], [0, 64], [1, 67]]);
  assert.equal(songLength(song), 2);
});

test("Für Elise: the hands line up bar for bar, and end together", () => {
  const elise = SONGS.find((s) => s.name === "Für Elise");
  const [right, left] = elise.tracks.map((t) => t.reduce((s, x) => s + x.beats, 0));
  assert.equal(right, left, "both hands last the same");
  // A two-sixteenth pickup, then eight bars of six.
  assert.equal(right, 2 + 8 * 6);
  // It opens on the famous E–D♯ turn.
  assert.deepEqual(elise.tracks[0].slice(0, 4).map((x) => x.keys[0]), [76, 75, 76, 75]);
});

test("The Entertainer: 20 bars of 2/4 in both hands, from the famous intro", () => {
  const e = SONGS.find((s) => s.name === "The Entertainer");
  const [right, left] = e.tracks.map((t) => t.reduce((s, x) => s + x.beats, 0));
  assert.equal(right, 20 * 8);
  assert.equal(left, right);
  // D6 E6 C6 A5 (tied) B5 G5: the opening run.
  assert.deepEqual(e.tracks[0].slice(0, 6).map((x) => x.keys[0]), [86, 88, 84, 81, 83, 79]);
});
