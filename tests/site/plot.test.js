// Unit tests for the pure scale math in site/js/plot.js.
import { test } from "node:test";
import assert from "node:assert/strict";
import { LOG_FLOOR, plotValue, yRange, decadeTicks } from "../../site/js/plot.js";

test("linear range always includes zero, with padding", () => {
  const [lo, hi] = yRange([[2, 3, 4]], "linear");
  assert.ok(lo < 0 && lo > -1, `lo ${lo}`);
  assert.ok(hi > 4, `hi ${hi}`);
});

test("a flat linear series still gets a nonzero span", () => {
  const [lo, hi] = yRange([[0, 0]], "linear");
  assert.ok(hi > lo);
});

test("log plots log10|v|, flooring zero at LOG_FLOOR", () => {
  assert.equal(plotValue(-1e-3, "log"), -3);
  assert.equal(plotValue(0, "log"), Math.log10(LOG_FLOOR));
  assert.equal(plotValue(-2.5, "linear"), -2.5);
});

test("log range spans the decades of all series, padded to whole decades", () => {
  const [lo, hi] = yRange([[1e-7, 3e-7], [2e-3], [0.5]], "log");
  assert.equal(lo, -7);
  assert.equal(hi, 0);
});

test("decade ticks are the integer exponents in range", () => {
  assert.deepEqual(decadeTicks(-7, -4), [-7, -6, -5, -4]);
  assert.deepEqual(decadeTicks(-2.5, -0.5), [-2, -1]);
});

test("empty series give a usable default range", () => {
  const [lo, hi] = yRange([[], []], "log");
  assert.ok(Number.isFinite(lo) && Number.isFinite(hi) && hi > lo);
});
