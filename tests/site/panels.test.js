// Unit tests for site/js/panels.ts's pure part (run by `node --test`,
// pre-push). buildPanels needs a DOM; `cargo xtask smoke` covers it.
import { test } from "node:test";
import assert from "node:assert/strict";
import { demoHandle } from "../../site/js/panels.ts";

test("demoHandle: returns the demo once created", () => {
  assert.equal(demoHandle({ demo: /** @type {any} */ (7) }), 7);
});

test("demoHandle: throws before the demo exists", () => {
  assert.throws(() => demoHandle({ demo: null }), /demo not created/);
});
