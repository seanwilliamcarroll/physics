// Unit tests for the pure parts of site/js/perf.ts.
import { test } from "node:test";
import assert from "node:assert/strict";
import { CostTable, nsPerPair } from "../../site/js/perf.ts";

test("nsPerPair divides a step's time by the n(n-1)/2 pairs", () => {
  // 1 ms over 1000 bodies: 499,500 pairs, ~2.002 ns each.
  assert.equal(nsPerPair(1, 1000), 1e6 / 499_500);
  assert.ok(Number.isNaN(nsPerPair(1, 1)), "no pairs");
});

test("CostTable keeps one smoothed row per N, sorted, per series", () => {
  const t = new CostTable(2, 0.5);
  t.record(1024, 1, 8);
  t.record(256, 0, 1);
  t.record(256, 0, 3); // smoothed halfway: 2
  assert.deepEqual(t.rows(), [
    [256, [2, null]],
    [1024, [null, 8]],
  ]);
});

test("CostTable ignores non-finite samples", () => {
  const t = new CostTable(1);
  t.record(16, 0, Number.NaN);
  t.record(16, 0, Infinity);
  assert.deepEqual(t.rows(), []);
});
