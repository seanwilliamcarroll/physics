// Unit tests for site/js/songs.ts: the A1 page's preset songs.
import { test } from "node:test";
import assert from "node:assert/strict";
import { ARTICULATION, SONGS, songEvents } from "../../site/js/songs.ts";

test("every song is playable: keys in the MIDI range, positive beats", () => {
  assert.ok(SONGS.length >= 3);
  for (const song of SONGS) {
    assert.ok(song.bpm > 0, song.name);
    assert.ok(song.notes.length > 0, song.name);
    for (const n of song.notes) {
      assert.ok(n.beats > 0, `${song.name}: ${JSON.stringify(n)}`);
      for (const k of n.keys) assert.ok(Number.isInteger(k) && k >= 21 && k <= 108, `${song.name}: ${k}`);
    }
  }
});

test("events: each key on at its beat, off before the next note", () => {
  // Two quarter notes and a rest at 120 bpm: 0.5 s per beat.
  const song = { name: "t", bpm: 120, notes: [{ keys: [60], beats: 1 }, { keys: [], beats: 1 }, { keys: [62, 65], beats: 2 }] };
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
  assert.deepEqual(new Set(buns.notes.flatMap((n) => n.keys)), new Set([60, 62, 64]));
});
