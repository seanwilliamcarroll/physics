// Unit tests for the pure helpers in site/js/pixels.js.
import { test } from "node:test";
import assert from "node:assert/strict";
import { cellAt, countOtherThan, strokeCells } from "../../site/js/pixels.ts";

test("cellAt maps CSS points to cells at any scale", () => {
  // 640 × 360 cells shown 1280 × 720: 2 px a cell.
  assert.deepEqual(cellAt(0, 0, 1280, 720, 640, 360), [0, 0]);
  assert.deepEqual(cellAt(1.9, 1.9, 1280, 720, 640, 360), [0, 0]);
  assert.deepEqual(cellAt(2, 3, 1280, 720, 640, 360), [1, 1]);
  assert.deepEqual(cellAt(1279.9, 719.9, 1280, 720, 640, 360), [639, 359]);
  // Off the canvas: outside the grid, not clamped (the brush clips).
  assert.deepEqual(cellAt(-3, 721, 1280, 720, 640, 360), [-2, 360]);
});

test("a stroke includes both ends and has no gaps wider than the spacing", () => {
  const pts = strokeCells([0, 0], [30, 40], 4);
  assert.deepEqual(pts[0], [0, 0]);
  assert.deepEqual(pts.at(-1), [30, 40]);
  for (let i = 1; i < pts.length; i++) {
    const [[ax, ay], [bx, by]] = [pts[i - 1], pts[i]];
    assert.ok(Math.hypot(bx - ax, by - ay) <= 4 + 1, `gap at ${i}`);
  }
});

test("a click (no movement) is one dab, twice", () => {
  assert.deepEqual(strokeCells([5, 5], [5, 5], 3), [[5, 5], [5, 5]]);
});

test("countOtherThan counts the pixels that aren't the background", () => {
  const bg = [10, 20, 30];
  // Four pixels: background, one channel off (each of r, g, b), and a
  // background pixel with a different alpha (ignored).
  const data = [10, 20, 30, 255, 11, 20, 30, 255, 10, 21, 30, 255, 10, 20, 31, 255, 10, 20, 30, 0];
  assert.equal(countOtherThan(data, bg), 3);
  assert.equal(countOtherThan([], bg), 0);
  // A trailing partial pixel isn't read.
  assert.equal(countOtherThan([10, 20, 30, 255, 99], bg), 0);
});
