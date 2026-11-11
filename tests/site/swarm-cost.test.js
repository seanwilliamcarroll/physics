// Unit tests for site/js/swarm-cost.js.
import { test } from "node:test";
import assert from "node:assert/strict";
import { DEFAULT_N, WORLD, costHtml, nsPerBoid, worldFor } from "../../site/js/swarm-cost.ts";
import { CostTable } from "../../site/js/perf.ts";

test("the default flock gets the default world, others the same density", () => {
  assert.deepEqual(worldFor(DEFAULT_N), WORLD);
  const [w, h] = worldFor(4 * DEFAULT_N);
  assert.deepEqual([w, h], [2 * WORLD[0], 2 * WORLD[1]]);
  const density = (n) => n / worldFor(n).reduce((a, b) => a * b);
  assert.ok(Math.abs(density(1000) / density(DEFAULT_N) - 1) < 0.01);
  assert.deepEqual(worldFor(1), [64, 64], "never below 64 px");
});

test("ns per boid, and the table's cells", () => {
  assert.equal(nsPerBoid(2.5, 10_000), 250);
  assert.ok(Number.isNaN(nsPerBoid(1, 0)));
  const t = new CostTable(2, 1);
  t.record(1000, 0, 1.5);
  const html = costHtml(t, ["brute", "sorted"]);
  assert.match(html, /<th>brute ms\/step<\/th>/);
  assert.match(html, /<td>1,000<\/td><td>1\.50<\/td><td>1500<\/td><td>–<\/td><td>–<\/td>/);
});
