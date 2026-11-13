// Unit tests for site/js/vicsek-sweep.ts.
import { test } from "node:test";
import assert from "node:assert/strict";
import { FIG_2A, cases, etaGrid, sideFor } from "../../site/js/vicsek-sweep.ts";

test("Fig. 2a's sizes are at density ~4", () => {
  for (const [n, l] of FIG_2A) assert.ok(Math.abs(n / (l * l) - 4) < 0.2, `${n} ${l}`);
});

test("the eta grid runs 0 to 5 in quarters, exactly", () => {
  const g = etaGrid();
  assert.equal(g.length, 21);
  assert.deepEqual([g[0], g[4], g.at(-1)], [0, 1, 5]);
});

test("a side for a density, and the cases by eta then size", () => {
  assert.equal(sideFor(400, 4), 10);
  const c = cases([[40, 3.1], [100, 5]], [0, 0.5]);
  assert.deepEqual(c.map((x) => [x.eta, x.n]), [[0, 40], [0, 100], [0.5, 40], [0.5, 100]]);
  assert.deepEqual(c.map((x) => x.i), [0, 1, 0, 1]);
});
