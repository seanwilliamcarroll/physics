// Unit tests for the pure part of site/js/controls.js.
import { test } from "node:test";
import assert from "node:assert/strict";
import { decimalsOf } from "../../site/js/controls.ts";

test("a step's decimal places, however JS writes it", () => {
  assert.equal(decimalsOf(1), 0);
  assert.equal(decimalsOf(0.5), 1);
  assert.equal(decimalsOf(0.005), 3);
  assert.equal(decimalsOf(0.0001), 4);
  assert.equal(decimalsOf(1e-7), 7, "exponent form");
  assert.equal(decimalsOf(2.5e-7), 8, "exponent form with a mantissa");
});

test("so a readout of a widened f32 is short", () => {
  const f32 = Math.fround(0.0005);
  assert.notEqual(String(f32), "0.0005");
  assert.equal(f32.toFixed(decimalsOf(0.0001)), "0.0005");
  assert.equal((0.1 + 0.2).toFixed(decimalsOf(0.05)), "0.30");
});
