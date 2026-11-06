// Unit tests for site/js/panels.ts's pure part (run by `node --test`,
// pre-push). buildPanels needs a DOM; `cargo xtask smoke` covers it.
import { test } from "node:test";
import assert from "node:assert/strict";
import { demoHandle, panelSeries, replaceDemo, requireAccepted } from "../../site/js/panels.ts";

test("demoHandle: returns the demo once created", () => {
  assert.equal(demoHandle({ demo: /** @type {any} */ (7) }), 7);
});

test("demoHandle: throws before the demo exists", () => {
  assert.throws(() => demoHandle({ demo: null }), /demo not created/);
});

/** An engine stand-in that records which demos were freed. */
function fakeEngine() {
  const freed = [];
  return { freed, engine: /** @type {any} */ ({ demo_free: (d) => freed.push(d) }) };
}

test("replaceDemo: frees the old demo and returns the new one", () => {
  const { freed, engine } = fakeEngine();
  assert.equal(replaceDemo(engine, /** @type {any} */ (3), /** @type {any} */ (4), "demo_new"), 4);
  assert.deepEqual(freed, [3]);
});

test("replaceDemo: nothing to free the first time", () => {
  const { freed, engine } = fakeEngine();
  assert.equal(replaceDemo(engine, null, /** @type {any} */ (4), "demo_new"), 4);
  assert.deepEqual(freed, []);
});

test("replaceDemo: a null handle (0) throws, naming the constructor", () => {
  const { engine } = fakeEngine();
  assert.throws(() => replaceDemo(engine, null, /** @type {any} */ (0), "demo_new_chain"), /demo_new_chain returned null/);
});

test("requireAccepted: passes when every status is 1, names what was rejected otherwise", () => {
  requireAccepted([1, 1, 1]);
  requireAccepted([]);
  assert.throws(() => requireAccepted([1, 0, 1]), /a setting was rejected/);
  assert.throws(() => requireAccepted([0], "damping"), /damping was rejected/);
});

test("panelSeries: one series per panel, labeled by name, in its color", () => {
  assert.deepEqual(panelSeries([{ name: "f32", color: "#f00" }, { name: "f64", color: "#00f" }]), [
    { label: "f32", color: "#f00" },
    { label: "f64", color: "#00f" },
  ]);
});
