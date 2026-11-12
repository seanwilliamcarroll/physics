// The loader on its own, against the real engine.wasm (built by `cargo
// xtask site`): Node has WebAssembly and Response, so no browser needed.
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { instantiate } from "../../site/js/engine-loader.ts";
import { DEMO_FOUNTAIN, SCALAR_F32, TEST_PANIC_MESSAGE } from "../../site/js/abi.ts";

const WASM = new URL("../../site/pkg/engine.wasm", import.meta.url);
let bytes;
try {
  bytes = readFileSync(WASM);
} catch {
  throw new Error("site/pkg/engine.wasm is missing: run `cargo xtask site` first");
}

/** Runs `f` with console.error and console.warn collected, not printed. */
async function quietly(f) {
  const [error, warn] = [console.error, console.warn];
  const said = [];
  console.error = (...a) => said.push(["error", a.join(" ")]);
  console.warn = (...a) => said.push(["warn", a.join(" ")]);
  try {
    return [await f(), said];
  } finally {
    [console.error, console.warn] = [error, warn];
  }
}

const wasmResponse = (type) => new Response(bytes, { headers: { "content-type": type } });

test("bytes instantiate, and the fountain runs through the raw exports", async () => {
  const { exports, memory } = await instantiate(bytes, "engine.wasm");
  assert.equal(exports.memory, memory);
  const demo = exports.demo_new(DEMO_FOUNTAIN, SCALAR_F32, 50, 1);
  assert.notEqual(demo, 0);
  let steps = 0;
  for (let i = 0; i < 30; i++) steps += exports.demo_advance(demo, 1 / 60 + 1e-9);
  assert.equal(steps, 30);
  assert.equal(exports.demo_positions_len(demo), 100);
  exports.demo_free(demo);
});

test("two instances share nothing: a panic in one isn't the other's", async () => {
  const a = await instantiate(bytes, "a");
  const b = await instantiate(bytes, "b");
  assert.notEqual(a.memory, b.memory);
  assert.equal(a.lastPanic(), null);
  const [, said] = await quietly(() => {
    assert.throws(() => a.exports.demo_panic_for_test(), WebAssembly.RuntimeError);
  });
  assert.ok(a.lastPanic()?.includes(TEST_PANIC_MESSAGE), a.lastPanic());
  assert.equal(b.lastPanic(), null, "b never panicked");
  // Logged once, under a's name.
  assert.equal(said.length, 1);
  assert.ok(said[0][1].startsWith("a ") && said[0][1].includes(TEST_PANIC_MESSAGE), said[0][1]);
  // b still works after a trapped.
  const demo = b.exports.demo_new(DEMO_FOUNTAIN, SCALAR_F32, 5, 1);
  assert.equal(b.exports.demo_advance(demo, 1 / 60 + 1e-9), 1);
});

test("a Response served as application/wasm is compiled while streaming", async () => {
  const [loaded, said] = await quietly(() => instantiate(wasmResponse("application/wasm"), "engine.wasm"));
  assert.equal(typeof loaded.exports.demo_new, "function");
  assert.deepEqual(said, [], "no fallback");
});

test("a Response with the wrong content type falls back to compiling the bytes", async () => {
  const [loaded, said] = await quietly(() => instantiate(wasmResponse("text/plain"), "engine.wasm"));
  assert.equal(typeof loaded.exports.demo_new, "function");
  assert.equal(said.length, 1);
  assert.equal(said[0][0], "warn");
  assert.match(said[0][1], /^engine\.wasm: streaming compile refused/);
});

test("a failed fetch and a file that isn't wasm are errors, not fallbacks to nothing", async () => {
  await assert.rejects(
    instantiate(new Response("not found", { status: 404 }), "engine.wasm"),
    /fetching engine\.wasm: HTTP 404/,
  );
  // HTML with a 200 (a server's catch-all page): streaming refuses it,
  // and compiling the bytes fails for real.
  const html = new Response("<!doctype html>", { headers: { "content-type": "text/html" } });
  const [, said] = await quietly(() => assert.rejects(instantiate(html, "engine.wasm"), WebAssembly.CompileError));
  assert.equal(said.length, 1);
});

test("a module with no memory export is refused", async () => {
  // The smallest module: the magic number and version, nothing else.
  const empty = new Uint8Array([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00]);
  await assert.rejects(instantiate(empty, "empty.wasm"), /empty\.wasm exports no memory/);
});
