// Unit tests for the pure fade math in site/js/trail.js.
import { test } from "node:test";
import assert from "node:assert/strict";
import { fadeBands } from "../../site/js/trail.ts";

test("bands cover the history once, overlapping by one point so lines join", () => {
  const bands = fadeBands(10, 3);
  assert.deepEqual(bands.map(([a, b]) => [a, b]), [[0, 4], [3, 7], [6, 10]]);
});

test("opacity rises from oldest to newest, newest fully opaque", () => {
  const alphas = fadeBands(100, 4).map(([, , alpha]) => alpha);
  for (let i = 1; i < alphas.length; i++) assert.ok(alphas[i] > alphas[i - 1]);
  assert.equal(alphas.at(-1), 1);
});

test("short histories don't produce empty or one-point bands", () => {
  assert.deepEqual(fadeBands(0, 4), []);
  assert.deepEqual(fadeBands(1, 4), []);
  for (const [a, b] of fadeBands(3, 8)) assert.ok(b - a >= 2, `[${a}, ${b})`);
});
