// Unit tests for site/js/canvas.ts: the pure view math (the inverse that
// View.toWorld uses for pointer input) and drawLinks against a recording
// context. The DOM wrappers (View.apply, View.toWorld) are covered by
// `cargo xtask smoke` and the pages.
import { test } from "node:test";
import assert from "node:assert/strict";
import { View, drawLinks, viewTransform, worldToDevice, deviceToWorld } from "../../site/js/canvas.ts";

/** 4 m x 2 m, aspect 2:1. */
const BOX = { xMin: -2, xMax: 2, yMin: -1, yMax: 1 };

function close(actual, expected, msg) {
  for (let i = 0; i < expected.length; i++) {
    assert.ok(Math.abs(actual[i] - expected[i]) < 1e-9, `${msg}: ${actual} vs ${expected}`);
  }
}

test("world -> device -> world round-trips on any canvas shape", () => {
  for (const [w, h] of [[800, 400], [1000, 300], [300, 900]]) {
    const t = viewTransform(BOX, w, h);
    for (const [x, y] of [[0, 0], [1.5, -0.7], [-2, 1], [10, -10]]) {
      close(deviceToWorld(t, ...worldToDevice(t, x, y)), [x, y], `${w}x${h}`);
    }
  }
});

test("y flips: world up is screen up (smaller py)", () => {
  const t = viewTransform(BOX, 800, 400);
  assert.ok(worldToDevice(t, 0, 1)[1] < worldToDevice(t, 0, 0)[1]);
  close(deviceToWorld(t, 400, 0), [0, 1], "top center");
  close(deviceToWorld(t, 400, 400), [0, -1], "bottom center");
});

test("matching aspect: canvas corners are the box corners", () => {
  const t = viewTransform(BOX, 800, 400);
  close(deviceToWorld(t, 0, 0), [-2, 1], "top left");
  close(deviceToWorld(t, 800, 400), [2, -1], "bottom right");
});

test("wide canvas letterboxes in x: height fits, extra world left and right", () => {
  const t = viewTransform(BOX, 1200, 400); // 3:1 canvas, 2:1 box
  assert.equal(t.s, 200);
  close(deviceToWorld(t, 0, 0), [-3, 1], "top left");
  close(deviceToWorld(t, 1200, 400), [3, -1], "bottom right");
});

test("tall canvas letterboxes in y: width fits, extra world above and below", () => {
  const t = viewTransform(BOX, 400, 400); // 1:1 canvas, 2:1 box
  assert.equal(t.s, 100);
  close(deviceToWorld(t, 0, 0), [-2, 2], "top left");
  close(deviceToWorld(t, 400, 400), [2, -2], "bottom right");
});

test("off-center box: its center maps to the canvas center", () => {
  const t = viewTransform({ xMin: 3, xMax: 5, yMin: -10, yMax: -6 }, 600, 600);
  close(worldToDevice(t, 4, -8), [300, 300], "center");
});

/** A 2D context stand-in that records path calls. */
function recordingCtx() {
  const calls = [];
  return {
    calls,
    canvas: { width: 400, height: 400 },
    beginPath: () => calls.push(["begin"]),
    moveTo: (x, y) => calls.push(["move", x, y]),
    lineTo: (x, y) => calls.push(["line", x, y]),
    stroke: () => calls.push(["stroke"]),
  };
}

test("drawLinks: one path, a segment per index pair, bad indices skipped", () => {
  globalThis.window ??= { devicePixelRatio: 1 }; // devicePx reads it
  const ctx = recordingCtx();
  const pos = new Float32Array([0, 0, 1, 2, 3, 4]); // 3 particles
  // [0-1], [1-2], an out-of-range link, then a dangling index.
  const links = new Uint32Array([0, 1, 1, 2, 2, 3, 0]);
  drawLinks(/** @type {any} */ (ctx), new View(BOX), pos, links, 2, "#fff");
  assert.deepEqual(ctx.calls, [
    ["begin"],
    ["move", 0, 0], ["line", 1, 2],
    ["move", 1, 2], ["line", 3, 4],
    ["stroke"],
  ]);
});
