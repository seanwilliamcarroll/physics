// Unit tests for site/js/options.js (run by `node --test`, pre-push).
import { test } from "node:test";
import assert from "node:assert/strict";
import { readChoice, readInt, optionsTableHtml } from "../../site/js/options.ts";

/** @type {import("../../site/js/options.ts").IntOption} */
const N = { kind: "int", min: 1, max: 100, default: 10, help: "count" };
/** @type {import("../../site/js/options.ts").IntOption} */
const FPS = { kind: "int", min: 1, max: 1000, default: Infinity, help: "cap" };
/** @type {import("../../site/js/options.ts").ChoiceOption} */
const SCALAR = { kind: "choice", values: ["f32", "f64"], default: "f32", help: "type" };

const q = (s) => new URLSearchParams(s);

test("readInt: in range, clamped, missing, and garbage", () => {
  assert.equal(readInt(q("n=42"), "n", N), 42);
  assert.equal(readInt(q("n=0"), "n", N), 1, "clamped up to min");
  assert.equal(readInt(q("n=1e9"), "n", N), 1, "parseInt reads 1e9 as 1");
  assert.equal(readInt(q("n=999"), "n", N), 100, "clamped down to max");
  assert.equal(readInt(q(""), "n", N), 10, "missing: default");
  assert.equal(readInt(q("n=lots"), "n", N), 10, "garbage: default");
  assert.equal(readInt(q(""), "fps", FPS), Infinity, "Infinity default survives");
});

test("readChoice: listed values only", () => {
  assert.equal(readChoice(q("scalar=f64"), "scalar", SCALAR), "f64");
  assert.equal(readChoice(q("scalar=f16"), "scalar", SCALAR), "f32");
  assert.equal(readChoice(q(""), "scalar", SCALAR), "f32");
});

test("optionsTableHtml: one row per option, readable defaults, preset links", () => {
  const html = optionsTableHtml({ scalar: SCALAR, n: N, fps: FPS }, [["fast", "?fps=120"]]);
  assert.equal(html.match(/<tr><td>/g)?.length, 3);
  assert.match(html, /f32 \| f64/);
  assert.match(html, /1 – 100/);
  assert.match(html, /uncapped/, "Infinity default reads as 'uncapped'");
  assert.match(html, /<a href="\.\/\?fps=120">fast<\/a>/);
});
