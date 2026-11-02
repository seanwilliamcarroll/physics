// Smoke-test mode for `cargo xtask smoke` (headless Chrome), enabled by
// `?smoke` in the page URL.
//
// Headless Chrome paces requestAnimationFrame unpredictably (a few frames,
// then stalls, slower with more particles), so smoke mode skips the rAF
// loop: it advances the demo a fixed amount synchronously, draws once, and
// checks the pixels. It also can't tell console.error from console.log and
// may not log uncaught exceptions, so the page reports one positive line:
//   SMOKE ok steps=<n> particle_px=<n>
//   SMOKE error <message>
// A missing line (crash, hang) is itself a failure.
//
// `?smoke&panic` instead calls the deliberate-panic export and checks that
// the Rust panic hook delivered TEST_PANIC_MESSAGE through the wasm import:
//   SMOKE ok panic_logged=1

import { lastPanicMessage } from "./wasm.js";
import { TEST_PANIC_MESSAGE } from "./abi.js";

/** Frames of 1/60 s to advance before drawing: half a second of flight,
 *  so the fountain has spread out from the origin. */
const SMOKE_FRAMES = 30;
const SMOKE_FRAME_S = 1 / 60;

/** Per-channel tolerance when matching the particle color: square edges
 *  are antialiased, cores are exact. */
const COLOR_TOLERANCE = 16;

const params = new URLSearchParams(location.search);
export const smokeMode = params.has("smoke");
const panicMode = smokeMode && params.has("panic");

if (smokeMode) {
  window.addEventListener("error", (e) => report(`error ${e.message}`));
  window.addEventListener("unhandledrejection", (e) => report(`error ${e.reason}`));
}

function report(text) {
  console.log(`SMOKE ${text}`);
}

/** Runs the smoke sequence: advance, draw once via `drawFrame()`, count
 *  pixels of `particleColor` ("#rrggbb") on the canvas, report. */
export function runSmoke(engine, demo, ctx, drawFrame, particleColor) {
  if (panicMode) {
    runPanicSmoke(engine);
    return;
  }
  let steps = 0;
  for (let i = 0; i < SMOKE_FRAMES; i++) steps += engine.demo_advance(demo, SMOKE_FRAME_S);
  drawFrame();
  const px = countPixels(ctx, parseHexColor(particleColor));
  report(`ok steps=${steps} particle_px=${px}`);
}

/** Calls the deliberate-panic export. Expected: the call traps
 *  (WebAssembly.RuntimeError, "unreachable") and, before that, the panic
 *  hook passed the message to JS through the console_error import. */
function runPanicSmoke(engine) {
  try {
    engine.demo_panic_for_test();
    report("error demo_panic_for_test returned instead of trapping");
  } catch (err) {
    const msg = lastPanicMessage();
    if (!(err instanceof WebAssembly.RuntimeError)) {
      report(`error expected a wasm trap, got ${err}`);
    } else if (msg?.includes(TEST_PANIC_MESSAGE)) {
      report("ok panic_logged=1");
    } else {
      report(`error hook did not report the panic (got ${JSON.stringify(msg)})`);
    }
  }
}

/** Reports a caught error (the page's own try/catch). */
export function smokeError(err) {
  if (smokeMode) report(`error ${err.message}`);
}

function countPixels(ctx, [r, g, b]) {
  const { data } = ctx.getImageData(0, 0, ctx.canvas.width, ctx.canvas.height);
  let count = 0;
  for (let i = 0; i < data.length; i += 4) {
    if (Math.abs(data[i] - r) <= COLOR_TOLERANCE
      && Math.abs(data[i + 1] - g) <= COLOR_TOLERANCE
      && Math.abs(data[i + 2] - b) <= COLOR_TOLERANCE) count += 1;
  }
  return count;
}

/** "#rrggbb" -> [r, g, b]. */
function parseHexColor(hex) {
  const v = Number.parseInt(hex.replace("#", ""), 16);
  return [(v >> 16) & 0xff, (v >> 8) & 0xff, v & 0xff];
}
