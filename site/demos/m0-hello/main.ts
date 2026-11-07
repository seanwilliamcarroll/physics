// M0: the pipeline itself. Rust simulates, JS draws, positions are read
// straight out of wasm memory (no copying across the boundary).

import { loadEngine, positionsView } from "../../js/wasm.ts";
import { runLoop, RateMeter, Smoothed } from "../../js/loop.ts";
import { setupCanvas, View, clear, drawPoints, drawHorizon, cssColor } from "../../js/canvas.ts";
import { DEMO_FOUNTAIN, MAX_PARTICLES } from "../../js/abi.ts";
import { SCALAR_CODES, readScalar } from "../../js/scalars.ts";
import { smokeMode, runSmoke } from "../../js/smoke.ts";
import { FPS_OPTION, pageFailed } from "../../js/page.ts";
import { byId } from "../../js/dom.ts";
import { readInt, optionsTableHtml } from "../../js/options.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";

/** Particle squares and ground line, CSS pixels. */
const POINT_SIZE_PX = 3;
const GROUND_WIDTH_PX = 1;

/** Every URL option, its legal values, and its default. The single source of
 *  truth: parsing below and the options table on the page both read it.
 */
const OPTIONS: { scalar: ChoiceOption; n: IntOption; seed: IntOption; fps: IntOption } = {
  scalar: { kind: "choice", values: Object.keys(SCALAR_CODES), default: "f32", help: "engine number type" },
  n: { kind: "int", min: 1, max: MAX_PARTICLES, default: 300, help: "particle count" },
  seed: { kind: "int", min: 0, max: 2 ** 32 - 1, default: 1, help: "launch randomness; same seed, same fountain" },
  fps: FPS_OPTION,
};

/** Preset links shown under the table: [label, query string].
 */
const PRESETS: [string, string][] = [
  ["default", ""],
  ["f64", "?scalar=f64"],
  ["10k", "?n=10000"],
  ["100k", "?n=100000"],
  ["500k", "?n=500000"],
  ["1M", "?n=1000000"],
  ["2M (max)", "?n=2000000"],
  ["30 fps", "?fps=30"],
  ["10 fps", "?fps=10"],
  ["1M at 30 fps", "?n=1000000&fps=30"],
];

// Framing, from the scene's launch ranges (engine::scenarios): apex
// vy²/2g ≈ 12²/(2·9.81) ≈ 7.3 m; reach vx·(2 vy/g) ≈ 2·2.45 ≈ 4.9 m. A
// framing choice with margin, so not derived at runtime.
const VIEW = new View({ xMin: -6, xMax: 6, yMin: -0.5, yMax: 8 });

const params = new URLSearchParams(location.search);
const scalar = readScalar(params, OPTIONS.scalar);
const n = readInt(params, "n", OPTIONS.n);
const seed = readInt(params, "seed", OPTIONS.seed);
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const canvas = byId("view", HTMLCanvasElement);
const ctx = setupCanvas(canvas);
// Colors live in site.css (--stage-bg, --ground, --particle).
const colors = {
  background: cssColor(canvas, "--stage-bg"),
  ground: cssColor(canvas, "--ground"),
  particle: cssColor(canvas, "--particle"),
};

try {
  const engine = await loadEngine();
  const demo = engine.demo_new(DEMO_FOUNTAIN, SCALAR_CODES[scalar], n, seed);
  if (demo === 0) throw new Error("demo_new returned null (bad kind or scalar code)");

  const drawFrame = () => {
    clear(ctx, colors.background);
    VIEW.apply(ctx);
    drawHorizon(ctx, VIEW, 0, GROUND_WIDTH_PX, colors.ground);
    drawPoints(ctx, VIEW, positionsView(engine, demo), POINT_SIZE_PX, colors.particle);
  };

  if (smokeMode) {
    runSmoke(engine, [{ demo, ctx, draw: drawFrame }], colors.particle);
  } else {
    const fps = new RateMeter();
    const sps = new RateMeter();
    const physicsMs = new Smoothed();
    const drawMs = new Smoothed();
    runLoop((elapsed, now) => {
      const t0 = performance.now();
      const steps = engine.demo_advance(demo, elapsed);
      const t1 = performance.now();
      drawFrame();
      // Measures issuing the draw calls; the browser may rasterize later, so
      // a falling display fps can also reflect GPU/compositor time.
      const t2 = performance.now();

      fps.add(now);
      sps.add(now, steps);
      physicsMs.add(t1 - t0);
      drawMs.add(t2 - t1);
      hud.textContent =
        `display  ${fps.perSecond} fps\n` +
        `physics  ${sps.perSecond} steps/s\n` +
        `cost     physics ${physicsMs.value.toFixed(2)} ms · draw ${drawMs.value.toFixed(2)} ms per frame\n` +
        `${n.toLocaleString()} particles · ${scalar} · seed ${seed}` +
        (Number.isFinite(maxFps) ? ` · capped at ${maxFps} fps` : "");
    }, { maxFps });
  }
} catch (err) {
  pageFailed(hud, err);
}
