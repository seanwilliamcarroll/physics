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
/** @typedef {import("./engine").EngineExports} EngineExports */
/** @typedef {import("./engine").DemoHandle} DemoHandle */
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

/** @param {string} text */
function report(text) {
  console.log(`SMOKE ${text}`);
}

/** One demo on its own canvas, as the smoke test sees it.
 *  @typedef {{ demo: DemoHandle, ctx: CanvasRenderingContext2D, draw: () => void }} SmokePanel */

/** Runs the smoke sequence on every panel: advance, draw once, count pixels
 *  of `particleColor` ("#rrggbb"), report. Reports the *minimum* steps and
 *  pixel count across panels, so one blank or frozen panel fails the test
 *  even if the others are fine. With `checkEnergy`, every panel's
 *  `demo_energy` must also be finite.
 *  @param {EngineExports} engine
 *  @param {SmokePanel[]} panels
 *  @param {string} particleColor
 *  @param {{ checkEnergy?: boolean }} [options] */
export function runSmoke(engine, panels, particleColor, { checkEnergy = false } = {}) {
  if (panicMode) {
    runPanicSmoke(engine);
    return;
  }
  const rgb = parseHexColor(particleColor);
  let minSteps = Infinity;
  let minPx = Infinity;
  for (const { demo, ctx, draw } of panels) {
    let steps = 0;
    for (let i = 0; i < SMOKE_FRAMES; i++) steps += engine.demo_advance(demo, SMOKE_FRAME_S);
    draw();
    minSteps = Math.min(minSteps, steps);
    minPx = Math.min(minPx, countPixels(ctx, rgb));
    if (checkEnergy && !Number.isFinite(engine.demo_energy(demo))) {
      report(`error demo_energy is not finite`);
      return;
    }
  }
  report(`ok steps=${minSteps} particle_px=${minPx}`);
}

/** Calls the deliberate-panic export. Expected: the call traps
 *  (WebAssembly.RuntimeError, "unreachable") and, before that, the panic
 *  hook passed the message to JS through the console_error import.
 *  @param {EngineExports} engine */
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

/** Reports a caught error (the page's own try/catch). Anything can be
 *  thrown in JS, not just Errors, hence `unknown`.
 *  @param {unknown} err */
export function smokeError(err) {
  if (smokeMode) report(`error ${errorText(err)}`);
}

/** A thrown value's message: `.message` for Errors, else its string form.
 *  @param {unknown} err
 *  @returns {string} */
export function errorText(err) {
  return err instanceof Error ? err.message : String(err);
}

/** @param {CanvasRenderingContext2D} ctx
 *  @param {[number, number, number]} rgb
 *  @returns {number} */
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

/** "#rrggbb" -> [r, g, b].
 *  @param {string} hex
 *  @returns {[number, number, number]} */
function parseHexColor(hex) {
  const v = Number.parseInt(hex.replace("#", ""), 16);
  return [(v >> 16) & 0xff, (v >> 8) & 0xff, v & 0xff];
}
