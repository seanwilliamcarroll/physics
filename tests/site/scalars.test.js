// Unit tests for site/js/scalars.ts (run by `node --test`, pre-push).
import { test } from "node:test";
import assert from "node:assert/strict";
import { SCALAR_CODES, isScalar, readScalar } from "../../site/js/scalars.ts";
import { SCALAR_F32, SCALAR_F64 } from "../../site/js/abi.ts";

/** @type {import("../../site/js/options.ts").ChoiceOption} */
const F64_FIRST = { kind: "choice", values: ["f64", "f32"], default: "f64", help: "type" };

const q = (s) => new URLSearchParams(s);

test("SCALAR_CODES maps names to abi codes", () => {
  assert.equal(SCALAR_CODES.f32, SCALAR_F32);
  assert.equal(SCALAR_CODES.f64, SCALAR_F64);
});

test("isScalar: names only, not prototype keys or null", () => {
  assert.ok(isScalar("f32"));
  assert.ok(isScalar("f64"));
  assert.ok(!isScalar("f16"));
  assert.ok(!isScalar(""));
  assert.ok(!isScalar(null));
  assert.ok(!isScalar("toString"), "inherited keys aren't scalars (Object.hasOwn)");
});

test("readScalar: from the URL, else the option's default", () => {
  assert.equal(readScalar(q("scalar=f32"), F64_FIRST), "f32");
  assert.equal(readScalar(q(""), F64_FIRST), "f64");
  assert.equal(readScalar(q("scalar=f16"), F64_FIRST), "f64", "unknown value: default");
});

test("readScalar: an option listing a non-scalar is a page bug and throws", () => {
  /** @type {import("../../site/js/options.ts").ChoiceOption} */
  const bad = { kind: "choice", values: ["f32", "f128"], default: "f32", help: "" };
  assert.throws(() => readScalar(q("scalar=f128"), bad), /f128/);
});
