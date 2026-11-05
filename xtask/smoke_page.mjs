// One smoke-test load, for `cargo xtask smoke` (xtask/src/smoke.rs):
// headless Chrome driven over the DevTools protocol. It navigates, waits
// for the page's `SMOKE …` console line (or the timeout), then captures
// the screenshot.
//
// Chrome's own `--screenshot` captures at the page's load event and quits
// (about 0.5 s), without waiting for async work: an audio page's offline
// render (A3 designs all 88 keys first) reported after Chrome had gone.
// Waiting for the line itself makes the timeout a real "wait up to".
//
// Prints every console message and uncaught exception to stderr the way
// Chrome logs them (`"<text>", source: <where>`), then Chrome's own log,
// so the judges in smoke.rs parse it unchanged. Node 22's built-in
// WebSocket and fetch: no dependencies.
//
//   node xtask/smoke_page.mjs <chrome> <url> <screenshot.png> <wait ms> <width>,<height>

import { spawn } from "node:child_process";
import { mkdtempSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";

const [chrome, url, shot, waitMs, size] = process.argv.slice(2);
if (size === undefined) {
  process.stderr.write("usage: smoke_page.mjs <chrome> <url> <screenshot> <wait ms> <width>,<height>\n");
  process.exit(2);
}
const [width, height] = size.split(",").map(Number);
// A fresh profile: a reused one can serve stale JS from cache.
const profile = mkdtempSync(join(tmpdir(), "physics-smoke-"));
const child = spawn(chrome, [
  "--headless=new", `--user-data-dir=${profile}`, `--window-size=${size}`, "--hide-scrollbars",
  "--remote-debugging-port=0", "--mute-audio", "--enable-logging=stderr", "--v=0", "about:blank",
], { stdio: ["ignore", "ignore", "pipe"] });

let chromeLog = "";
const lines = [];
const exited = new Promise((resolve) => child.on("exit", resolve));
/** Prints the log, stops Chrome, and (once it has exited, so it isn't
 *  still writing there) removes the profile: best effort. */
const finish = async (code) => {
  for (const l of lines) process.stderr.write(`${l}\n`);
  process.stderr.write(chromeLog);
  child.kill();
  await exited;
  try {
    rmSync(profile, { recursive: true, force: true, maxRetries: 3 });
  } catch {
    // A leftover temp profile is harmless.
  }
  process.exit(code);
};

try {
  const browser = await new Promise((resolve, reject) => {
    child.stderr.on("data", (d) => {
      chromeLog += d;
      const m = /DevTools listening on (ws:\/\/\S+)/.exec(chromeLog);
      if (m) resolve(m[1]);
    });
    child.on("exit", () => reject(new Error("Chrome exited before DevTools started")));
  });
  const targets = await (await fetch(`http://127.0.0.1:${new URL(browser).port}/json/list`)).json();
  const page = targets.find((t) => t.type === "page");
  if (page === undefined) throw new Error("no page target");
  const ws = new WebSocket(page.webSocketDebuggerUrl);
  await new Promise((resolve, reject) => {
    ws.addEventListener("open", resolve);
    ws.addEventListener("error", () => reject(new Error("DevTools connection failed")));
  });

  let nextId = 0;
  const replies = new Map();
  let reported;
  const smoke = new Promise((resolve) => (reported = resolve));
  ws.addEventListener("message", (e) => {
    const msg = JSON.parse(e.data);
    if (msg.id !== undefined) {
      replies.get(msg.id)?.(msg);
      replies.delete(msg.id);
    } else if (msg.method === "Runtime.consoleAPICalled") {
      const text = msg.params.args.map((a) => a.value ?? a.description ?? "").join(" ");
      lines.push(`"${text}", source: console.${msg.params.type}`);
      if (text.startsWith("SMOKE ")) reported();
    } else if (msg.method === "Runtime.exceptionThrown") {
      const d = msg.params.exceptionDetails;
      lines.push(`"Uncaught ${d.exception?.description ?? d.text}", source: ${d.url ?? "page"}`);
    }
  });
  const send = (method, params = {}) =>
    new Promise((resolve) => {
      const id = ++nextId;
      replies.set(id, resolve);
      ws.send(JSON.stringify({ id, method, params }));
    });

  await send("Runtime.enable");
  await send("Page.enable");
  await send("Emulation.setDeviceMetricsOverride", { width, height, deviceScaleFactor: 1, mobile: false });
  await send("Page.navigate", { url });
  await Promise.race([smoke, new Promise((resolve) => setTimeout(resolve, Number(waitMs)))]);
  const capture = await send("Page.captureScreenshot", { format: "png" });
  if (capture.result?.data !== undefined) writeFileSync(shot, Buffer.from(capture.result.data, "base64"));
  ws.close();
  await finish(0);
} catch (err) {
  lines.push(`smoke_page.mjs: ${err instanceof Error ? err.message : String(err)}`);
  await finish(1);
}
