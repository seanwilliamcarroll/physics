// Unit tests for site/js/stiffness.ts.
import { test } from "node:test";
import assert from "node:assert/strict";
import { RIGID_STOP, kCrit, sliderToStiffness, stiffnessLabel } from "../../site/js/stiffness.ts";

test("the slider is log10 k, with a rigid stop at the top", () => {
  assert.equal(sliderToStiffness(3), 1000);
  assert.equal(sliderToStiffness(RIGID_STOP), Infinity);
  assert.equal(stiffnessLabel(Infinity), "rigid (k = ∞)");
  assert.equal(stiffnessLabel(2500), "k = 2,500 N/m");
});

test("kCrit is 4 m / h² for one spring", () => {
  // 64 particles of 1 kg total, 60 Hz × 10 substeps: 22 500 N/m.
  assert.equal(Math.round(kCrit(1 / 64, 1 / 600)), 22500);
});
