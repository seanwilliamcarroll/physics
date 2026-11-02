// Unit tests for site/js/ring.js.
import { test } from "node:test";
import assert from "node:assert/strict";
import { Ring } from "../../site/js/ring.js";

test("fills up to capacity, oldest first", () => {
  const r = new Ring(3);
  assert.equal(r.length, 0);
  r.push(1);
  r.push(2);
  assert.equal(r.length, 2);
  assert.deepEqual([...r], [1, 2]);
  assert.equal(r.at(0), 1);
  assert.equal(r.at(1), 2);
});

test("wraps around, overwriting the oldest", () => {
  const r = new Ring(3);
  for (const v of [1, 2, 3, 4, 5]) r.push(v);
  assert.equal(r.length, 3);
  assert.deepEqual([...r], [3, 4, 5]);
  assert.equal(r.at(0), 3);
  assert.equal(r.at(2), 5);
  assert.equal(r.last(), 5);
});

test("clear empties it", () => {
  const r = new Ring(2);
  r.push(1);
  r.clear();
  assert.equal(r.length, 0);
  assert.deepEqual([...r], []);
  assert.equal(r.last(), undefined);
});

test("rejects a capacity that can't hold anything", () => {
  assert.throws(() => new Ring(0), RangeError);
  assert.throws(() => new Ring(2.5), RangeError);
});
