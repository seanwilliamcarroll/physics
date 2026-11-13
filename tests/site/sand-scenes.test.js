// Unit tests for site/js/sand-scenes.ts: every scene, painted into an
// array at several sizes, stays in the grid and paints what it says.
import { test } from "node:test";
import assert from "node:assert/strict";
import { SCENES } from "../../site/js/sand-scenes.ts";
import { MATERIAL_EMPTY, MATERIAL_LAVA, MATERIAL_SAND, MATERIAL_STONE, MATERIAL_WATER } from "../../site/js/sand-abi.ts";

/** A grid as sand_paint fills it: discs, clipped. */
function painted(name, w, h) {
  const cells = new Array(w * h).fill(MATERIAL_EMPTY);
  let outside = 0;
  const paint = (x, y, r, code) => {
    for (let dy = -r; dy <= r; dy++) {
      for (let dx = -r; dx <= r; dx++) {
        if (dx * dx + dy * dy > r * r) continue;
        const [cx, cy] = [x + dx, y + dy];
        if (cx < 0 || cy < 0 || cx >= w || cy >= h) {
          if (r === 0) outside += 1;
          continue;
        }
        cells[cy * w + cx] = code;
      }
    }
  };
  SCENES[name](paint, w, h);
  const count = (m) => cells.filter((c) => c === m).length;
  return { cells, count, outside };
}

const SIZES = [[640, 360], [200, 120], [1920, 1080]];

test("fills never reach outside the grid", () => {
  for (const name of Object.keys(SCENES)) {
    for (const [w, h] of SIZES) assert.equal(painted(name, w, h).outside, 0, `${name} ${w}x${h}`);
  }
});

test("each scene paints its materials", () => {
  for (const [w, h] of SIZES) {
    const at = (name) => painted(name, w, h).count;
    assert.ok(at("hourglass")(MATERIAL_SAND) > 0 && at("hourglass")(MATERIAL_STONE) > 0);
    assert.ok(at("dam")(MATERIAL_WATER) > 0 && at("dam")(MATERIAL_STONE) > 0);
    assert.ok(at("lava")(MATERIAL_LAVA) > 0 && at("lava")(MATERIAL_WATER) > 0);
    assert.equal(painted("empty", w, h).count(MATERIAL_EMPTY), w * h);
  }
});

test("the hourglass's sand is all in the top bulb, inside its walls", () => {
  const [w, h] = [640, 360];
  const { cells } = painted("hourglass", w, h);
  for (let y = 0; y < h; y++) {
    const row = cells.slice(y * w, (y + 1) * w);
    const sand = row.flatMap((c, x) => (c === MATERIAL_SAND ? [x] : []));
    if (sand.length === 0) continue;
    assert.ok(y < h / 2, `sand at row ${y}`);
    // Stone on both sides of the row's sand: it's enclosed.
    assert.ok(row.slice(0, sand[0]).includes(MATERIAL_STONE), `row ${y} open left`);
    assert.ok(row.slice(sand.at(-1)).includes(MATERIAL_STONE), `row ${y} open right`);
  }
});
