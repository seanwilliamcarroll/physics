// M0: the pipeline itself. Rust simulates, JS draws, positions are read
// straight out of wasm memory (no copying across the boundary).

import { loadEngine, positionsView } from "../../js/wasm.js";
import { runLoop, RateMeter } from "../../js/loop.js";
import { setupCanvas, View, clear, drawPoints, drawHorizon } from "../../js/canvas.js";

const DEMO_FOUNTAIN = 0; // demo kind codes: crates/web/src/demo.rs
const SCALAR_CODES = { f32: 0, f64: 1 };

// The fountain reaches ~7.3 m high and ~4.9 m sideways (v ≤ 12 m/s up,
// ≤ 2 m/s sideways), so this frames the whole arc with a little ground.
const VIEW = new View({ xMin: -6, xMax: 6, yMin: -0.5, yMax: 8 });

const params = new URLSearchParams(location.search);
const scalar = params.get("scalar") === "f64" ? "f64" : "f32";
const n = clampInt(params.get("n"), 300, 1, 100_000);
const seed = clampInt(params.get("seed"), 1, 0, 2 ** 32 - 1);
const maxFps = clampInt(params.get("fps"), Infinity, 1, 1000); // emulate a slower display

const hud = document.getElementById("hud");
const ctx = setupCanvas(document.getElementById("view"));

try {
  const engine = await loadEngine();
  const demo = engine.demo_new(DEMO_FOUNTAIN, SCALAR_CODES[scalar], n, seed);
  if (demo === 0) throw new Error("demo_new returned null (bad kind or scalar code)");

  const fps = new RateMeter();
  const sps = new RateMeter();
  runLoop((elapsed, now) => {
    const steps = engine.demo_advance(demo, elapsed);
    fps.add(now);
    sps.add(now, steps);

    clear(ctx, "#161a22");
    VIEW.apply(ctx);
    drawHorizon(ctx, VIEW, 0, 1, "#2a2f3a");
    drawPoints(ctx, VIEW, positionsView(engine, demo), 3, "#6cb6ff");

    hud.textContent =
      `display  ${fps.perSecond} fps\n` +
      `physics  ${sps.perSecond} steps/s\n` +
      `${n} particles · ${scalar} · seed ${seed}`;
  }, { maxFps });
} catch (err) {
  hud.textContent = `error: ${err.message}`;
  throw err;
}

function clampInt(text, fallback, min, max) {
  const v = Number.parseInt(text ?? "", 10);
  return Number.isFinite(v) ? Math.min(Math.max(v, min), max) : fallback;
}
