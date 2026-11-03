// Unit tests for the pure parts of site/js/loop.js.
import { test } from "node:test";
import assert from "node:assert/strict";
import { RateMeter, Smoothed } from "../../site/js/loop.ts";

test("RateMeter counts events in the last second only", () => {
  const m = new RateMeter();
  m.add(0, 3);
  m.add(500);
  assert.equal(m.perSecond, 4);
  m.add(1600); // the events at 0 and 500 ms are now > 1 s old
  assert.equal(m.perSecond, 1);
});

test("Smoothed starts at its first sample and moves alpha of the way", () => {
  const s = new Smoothed(0.5);
  assert.equal(s.value, 0, "no samples yet");
  s.add(10);
  assert.equal(s.value, 10);
  s.add(20);
  assert.equal(s.value, 15);
});
