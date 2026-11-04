// Unit tests for site/js/ks.ts: the A1 page's pure helpers.
import { test } from "node:test";
import assert from "node:assert/strict";
import { KEY_CODES, keyToMidi, midiToHz, noteName } from "../../site/js/ks.ts";

test("equal temperament around A4", () => {
  assert.equal(midiToHz(69), 440);
  assert.ok(Math.abs(midiToHz(60) - 261.6256) < 1e-4);
  assert.equal(noteName(60), "C4");
  assert.equal(noteName(61), "C♯4");
  assert.equal(noteName(21), "A0");
});

test("the home row is the white keys, the row above the black ones", () => {
  // Base C4 (MIDI 60).
  assert.equal(keyToMidi("KeyA", 60), 60); // C
  assert.equal(keyToMidi("KeyW", 60), 61); // C♯
  assert.equal(keyToMidi("KeyJ", 60), 71); // B
  assert.equal(keyToMidi("KeyK", 60), 72); // C5
  assert.equal(keyToMidi("Semicolon", 60), 76); // E5
  assert.equal(keyToMidi("KeyQ", 60), undefined);
  assert.equal(keyToMidi("KeyA", 120), 120);
  assert.equal(keyToMidi("Semicolon", 120), undefined, "past MIDI 127");
  assert.equal(new Set(Object.values(KEY_CODES)).size, Object.keys(KEY_CODES).length, "no two keys share a note");
});
