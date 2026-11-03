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

import { lastPanicMessage } from "./wasm.ts";
import { TEST_PANIC_MESSAGE } from "./abi.ts";
import type { DemoHandle, EngineExports } from "./engine";

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

function report(text: string): void {
  console.log(`SMOKE ${text}`);
}

/** One demo on its own canvas, as the smoke test sees it.
 */
export type SmokePanel = { demo: DemoHandle; ctx: CanvasRenderingContext2D; draw: () => void };

/** Runs the smoke sequence on every panel: advance, draw once, count pixels
 *  of `particleColor` ("#rrggbb"), report. Reports the *minimum* steps and
 *  pixel count across panels, so one blank or frozen panel fails the test
 *  even if the others are fine. With `checkEnergy`, every panel's
 *  `demo_energy` must also be finite. */
export function runSmoke(
  engine: EngineExports,
  panels: SmokePanel[],
  particleColor: string,
  { checkEnergy = false }: { checkEnergy?: boolean } = {},
): void {
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
 *  hook passed the message to JS through the console_error import. */
function runPanicSmoke(engine: EngineExports): void {
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
 *  thrown in JS, not just Errors, hence `unknown`. */
export function smokeError(err: unknown): void {
  if (smokeMode) report(`error ${errorText(err)}`);
}

/** A thrown value's message: `.message` for Errors, else its string form. */
export function errorText(err: unknown): string {
  return err instanceof Error ? err.message : String(err);
}

function countPixels(ctx: CanvasRenderingContext2D, [r, g, b]: [number, number, number]): number {
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
function parseHexColor(hex: string): [number, number, number] {
  const v = Number.parseInt(hex.replace("#", ""), 16);
  return [(v >> 16) & 0xff, (v >> 8) & 0xff, v & 0xff];
}
