// M0: the pipeline itself. Rust simulates, JS draws, positions are read
// straight out of wasm memory (no copying across the boundary).

import { loadEngine, positionsView } from "../../js/wasm.js";
import { runLoop, RateMeter, Smoothed } from "../../js/loop.js";
import { setupCanvas, View, clear, drawPoints, drawHorizon } from "../../js/canvas.js";

const DEMO_FOUNTAIN = 0; // demo kind codes: crates/web/src/demo.rs
const SCALAR_CODES = { f32: 0, f64: 1 };

/** Every URL option, its legal values, and its default. The single source of
 *  truth: parsing below and the options table on the page both read it. */
const OPTIONS = {
  scalar: { values: ["f32", "f64"], default: "f32", help: "engine number type" },
  n: { min: 1, max: 2_000_000, default: 300, help: "particle count" },
  seed: { min: 0, max: 2 ** 32 - 1, default: 1, help: "launch randomness; same seed, same fountain" },
  fps: { min: 1, max: 1000, default: Infinity, help: "cap the display rate to emulate a slower monitor" },
};

/** Preset links shown under the table: [label, query string]. */
const PRESETS = [
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

// The fountain reaches ~7.3 m high and ~4.9 m sideways (v ≤ 12 m/s up,
// ≤ 2 m/s sideways), so this frames the whole arc with a little ground.
const VIEW = new View({ xMin: -6, xMax: 6, yMin: -0.5, yMax: 8 });

const params = new URLSearchParams(location.search);
const scalar = OPTIONS.scalar.values.includes(params.get("scalar"))
  ? params.get("scalar")
  : OPTIONS.scalar.default;
const n = intOption("n");
const seed = intOption("seed");
const maxFps = intOption("fps");

renderOptionsTable(document.getElementById("options"));
const hud = document.getElementById("hud");
const ctx = setupCanvas(document.getElementById("view"));

try {
  const engine = await loadEngine();
  const demo = engine.demo_new(DEMO_FOUNTAIN, SCALAR_CODES[scalar], n, seed);
  if (demo === 0) throw new Error("demo_new returned null (bad kind or scalar code)");

  const fps = new RateMeter();
  const sps = new RateMeter();
  const physicsMs = new Smoothed();
  const drawMs = new Smoothed();
  runLoop((elapsed, now) => {
    const t0 = performance.now();
    const steps = engine.demo_advance(demo, elapsed);
    const t1 = performance.now();

    clear(ctx, "#161a22");
    VIEW.apply(ctx);
    drawHorizon(ctx, VIEW, 0, 1, "#2a2f3a");
    drawPoints(ctx, VIEW, positionsView(engine, demo), 3, "#6cb6ff");
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
} catch (err) {
  hud.textContent = `error: ${err.message}`;
  throw err;
}

/** Reads an integer option, clamped to its legal range (default if absent). */
function intOption(name) {
  const { min, max, default: fallback } = OPTIONS[name];
  const v = Number.parseInt(params.get(name) ?? "", 10);
  return Number.isFinite(v) ? Math.min(Math.max(v, min), max) : fallback;
}

/** Fills the options table and preset links from OPTIONS and PRESETS. */
function renderOptionsTable(section) {
  const rows = Object.entries(OPTIONS).map(([name, o]) => {
    const legal = o.values ? o.values.join(" | ") : `${o.min.toLocaleString()} – ${o.max.toLocaleString()}`;
    const dflt = Number.isFinite(o.default) || typeof o.default === "string" ? o.default.toLocaleString() : "uncapped";
    return `<tr><td><code>${name}</code></td><td>${legal}</td><td>${dflt}</td><td>${o.help}</td></tr>`;
  });
  const links = PRESETS.map(([label, q]) => `<a href="./${q}">${label}</a>`).join(" · ");
  section.innerHTML = `
    <h2>Options</h2>
    <p class="muted">Add to the URL, e.g. <code>?scalar=f64&amp;n=100000</code>.
      Out-of-range numbers are clamped to the nearest legal value.</p>
    <table>
      <thead><tr><th>option</th><th>legal values</th><th>default</th><th>effect</th></tr></thead>
      <tbody>${rows.join("")}</tbody>
    </table>
    <p>Try: ${links}</p>`;
}
