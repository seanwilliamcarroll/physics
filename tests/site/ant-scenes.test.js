// Unit tests for site/js/ant-scenes.ts: every scene, painted into a fake
// world, stays inside it, places a nest and food, and keeps the food
// within ~130 cells of the nest.
import { test } from "node:test";
import assert from "node:assert/strict";
import { SCENES, WORLD } from "../../site/js/ant-scenes.ts";
import { TOOL_FOOD, TOOL_NEST, TOOL_WALL, TOOL_ERASE } from "../../site/js/swarm-abi.ts";

function record(name) {
  const calls = [];
  SCENES[name]((tool, x, y, r, amount) => calls.push({ tool, x, y, r, amount }), ...WORLD);
  return calls;
}

test("every scene has a nest and food, all within the world", () => {
  for (const name of Object.keys(SCENES)) {
    const calls = record(name);
    const nests = calls.filter((c) => c.tool === TOOL_NEST);
    const food = calls.filter((c) => c.tool === TOOL_FOOD);
    assert.equal(nests.length, 1, name);
    assert.ok(food.length > 0, name);
    for (const c of [...nests, ...food]) {
      assert.ok(c.x >= 0 && c.x < WORLD[0] && c.y >= 0 && c.y < WORLD[1], `${name}: ${JSON.stringify(c)}`);
    }
    const [n] = nests;
    for (const f of food) assert.ok(Math.hypot(f.x - n.x, f.y - n.y) <= 130, `${name}: food too far`);
    assert.ok(calls.every((c) => [TOOL_FOOD, TOOL_NEST, TOOL_WALL, TOOL_ERASE].includes(c.tool)));
  }
});

test("the bridge's chambers and arms are cut after the walls", () => {
  const calls = record("bridge");
  const lastWall = calls.map((c) => c.tool).lastIndexOf(TOOL_WALL);
  const firstErase = calls.findIndex((c) => c.tool === TOOL_ERASE);
  assert.ok(firstErase > lastWall);
});
