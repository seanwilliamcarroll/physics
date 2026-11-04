// Unit tests for site/js/tone.ts: the acoustic pages' pure measurements.
import { test } from "node:test";
import assert from "node:assert/strict";
import { amplitudeAt, harmonicWeight, onsets, silenced, silencedBy } from "../../site/js/tone.ts";

const RATE = 48000;

test("amplitudeAt reads a sine between bins, and its octave apart", () => {
  const n = 9600;
  const x = new Float32Array(n);
  for (let i = 0; i < n; i++) x[i] = 0.3 * Math.sin((2 * Math.PI * 441.3 * i) / RATE) + 0.1 * Math.sin((2 * Math.PI * 882.6 * i) / RATE);
  assert.ok(Math.abs(amplitudeAt(x, RATE, 441.3) - 0.3) < 1e-3);
  assert.ok(Math.abs(amplitudeAt(x, RATE, 882.6) - 0.1) < 1e-3);
});

test("a pluck or pickup at 1/n silences every nth harmonic", () => {
  // sin(kπβ) sin(kπp): β = 1/2 kills the even harmonics.
  assert.ok(Math.abs(harmonicWeight(2, 0.5, 0.1)) < 1e-12);
  assert.ok(Math.abs(harmonicWeight(3, 0.5, 0.1)) > 0.1);
  assert.deepEqual(silenced(10, 0.5, 0.13), [2, 4, 6, 8, 10]);
  assert.deepEqual(silenced(10, 0.13, 1 / 3), [3, 6, 9]);
  assert.deepEqual(silenced(6, 0.13, 0.37), []);
  assert.deepEqual(silencedBy(9, [1 / 3]), [3, 6, 9], "one position: a pickup alone");
});

test("onsets finds where the level jumps", () => {
  const x = new Float32Array(RATE);
  for (const start of [0.1, 0.5]) for (let i = 0; i < 2400; i++) x[Math.round(start * RATE) + i] = 0.5 * Math.sin(i / 3);
  const found = onsets(x, RATE);
  assert.deepEqual(found.map((t) => Math.round(t * 100) / 100), [0.1, 0.5]);
});
