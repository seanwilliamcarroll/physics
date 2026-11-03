// Unit tests for site/js/divergence.ts.
import { test } from "node:test";
import assert from "node:assert/strict";
import { rmsDistance } from "../../site/js/divergence.ts";

test("rmsDistance is 0 for identical layouts", () => {
  const a = new Float32Array([1, 2, 3, 4]);
  assert.equal(rmsDistance(a, a), 0);
});

test("rmsDistance averages squared distances per body, not per coordinate", () => {
  // Body 0 moved 3-4-5 (distance 5), body 1 not at all: sqrt((25 + 0) / 2).
  const a = new Float32Array([0, 0, 1, 1]);
  const b = new Float32Array([3, 4, 1, 1]);
  assert.equal(rmsDistance(a, b), Math.sqrt(12.5));
});

test("rmsDistance of mismatched or empty layouts is NaN", () => {
  assert.ok(Number.isNaN(rmsDistance(new Float32Array(2), new Float32Array(4))));
  assert.ok(Number.isNaN(rmsDistance(new Float32Array(0), new Float32Array(0))));
});
