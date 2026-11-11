// S1: boids (crates/swarm through swarm.wasm; docs/15-swarm.md). Rust
// owns the flock and draws it into an RGBA buffer; this page wires the
// controls, the pointer predator, the plot and the cost table.

import { loadSwarm, swarmStepBudget } from "../../js/swarm-wasm.ts";
import { blit, pixelCanvas } from "../../js/pixels.ts";
import { DEFAULT_N, WORLD, costHtml, nsPerBoid, worldFor } from "../../js/swarm-cost.ts";
import {
  DEFAULT_RATE_HZ, MAX_BOIDS, MAX_BRUTE, MAX_RATE_HZ, NEIGHBOURS_BRUTE, NEIGHBOURS_GRID,
  NEIGHBOURS_SORTED, PARAM_AVOID, PARAM_CENTERING, PARAM_MATCHING, PARAM_MAX_SPEED, PARAM_MIN_SPEED,
  PARAM_PROTECTED_RANGE, PARAM_TURN, PARAM_VISUAL_RANGE,
} from "../../js/swarm-abi.ts";
import { RateMeter, Smoothed, runLoop } from "../../js/loop.ts";
import { select, slider } from "../../js/controls.ts";
import { byId } from "../../js/dom.ts";
import { FPS_OPTION, pageFailed, plotColors } from "../../js/page.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { reportSmoke, smokeMode } from "../../js/smoke.ts";
import { LinePlot } from "../../js/plot.ts";
import { CostTable } from "../../js/perf.ts";
import { cssColor } from "../../js/canvas.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";
import type { SwarmExports, SwarmHandle } from "../../js/swarm";

/** The ways of finding neighbours, by name. */
const MODES: Record<string, number> = { sorted: NEIGHBOURS_SORTED, grid: NEIGHBOURS_GRID, brute: NEIGHBOURS_BRUTE };

const OPTIONS: { n: IntOption; neighbours: ChoiceOption; seed: IntOption; rate: IntOption; fps: IntOption } = {
  n: { kind: "int", min: 1, max: MAX_BOIDS, default: DEFAULT_N, help: "boids (the world is 2560 × 1440, drawn at half scale)" },
  neighbours: { kind: "choice", values: Object.keys(MODES), default: "sorted", help: "how neighbours are found (brute force: at most 16,384 boids)" },
  seed: { kind: "int", min: 0, max: 2 ** 32 - 1, default: 1, help: "the random start; same seed, same flock" },
  rate: { kind: "int", min: 1, max: MAX_RATE_HZ, default: DEFAULT_RATE_HZ, help: "steps per second (a step moves a boid its speed in pixels)" },
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["10k boids, sorted (default)", ""],
  ["the same, brute force", "?neighbours=brute"],
  ["the same, the grid", "?neighbours=grid"],
  ["1,000 boids", "?n=1000"],
  ["100k boids", "?n=100000"],
  ["250k boids (near the cap)", "?n=250000"],
];

/** The sliders: rule constant code, label, range, step. Defaults are read
 *  from Rust (ECE 4760's values), not repeated here. */
const SLIDERS: [number, string, number, number, number][] = [
  [PARAM_VISUAL_RANGE, "visual range", 5, 100, 1],
  [PARAM_PROTECTED_RANGE, "protected range", 0, 40, 1],
  [PARAM_MATCHING, "matching", 0, 0.2, 0.005],
  [PARAM_CENTERING, "centering", 0, 0.005, 0.0001],
  [PARAM_AVOID, "avoid", 0, 0.2, 0.005],
  [PARAM_TURN, "turn", 0, 1, 0.05],
  [PARAM_MIN_SPEED, "min speed", 0.5, 12, 0.5],
  [PARAM_MAX_SPEED, "max speed", 0.5, 12, 0.5],
];

/** World pixels per drawn pixel. */
const SCALE = 2;
const PLOT_SAMPLES = 1800;
/** Smoke: frames of 1/60 s before the check. */
const SMOKE_FRAMES = 30;
/** The background (swarm-web demo.rs BACKGROUND, the site's --stage-bg). */
const BACKGROUND_RGB = [0x16, 0x1a, 0x22];
/** The crossover's flock sizes, and brute force's last. */
const COST_SIZES = [300, 1_000, 3_000, 10_000, 30_000, 100_000];
const COST_BRUTE_MAX = 10_000;

const params = new URLSearchParams(location.search);
const n = readInt(params, "n", OPTIONS.n);
const seed = readInt(params, "seed", OPTIONS.seed);
const maxFps = readInt(params, "fps", OPTIONS.fps);
let mode = readChoice(params, "neighbours", OPTIONS.neighbours);
const rate = readInt(params, "rate", OPTIONS.rate);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const canvas = byId("view", HTMLCanvasElement);

/** Advances `steps` fixed steps exactly, bypassing the clock's pacing. */
function stepExactly(s: SwarmExports, d: SwarmHandle, steps: number): number {
  let done = 0;
  // 1/60 s and a hair, at the default rate: one step each.
  for (let i = 0; i < steps; i++) done += s.swarm_advance(d, 1 / DEFAULT_RATE_HZ + 1e-9);
  return done;
}

/** The smoke check: steps, a drawn canvas, a finite polarization. */
function smoke(s: SwarmExports, d: SwarmHandle, ctx: CanvasRenderingContext2D, w: number, h: number): void {
  const steps = stepExactly(s, d, SMOKE_FRAMES);
  blit(ctx, s.memory, s.swarm_render(d), w, h);
  const p = s.swarm_polarization(d);
  if (!Number.isFinite(p)) {
    reportSmoke(`error polarization ${p}`);
    return;
  }
  const { data } = ctx.getImageData(0, 0, w, h);
  let px = 0;
  for (let i = 0; i < data.length; i += 4) {
    if (data[i] !== BACKGROUND_RGB[0] || data[i + 1] !== BACKGROUND_RGB[1] || data[i + 2] !== BACKGROUND_RGB[2]) px += 1;
  }
  reportSmoke(`ok steps=${steps} particle_px=${px}`);
}

/** Times each mode at each size in COST_SIZES, one case per task so the
 *  page stays responsive; fills `table` (series: brute, grid, sorted). */
async function measureCost(s: SwarmExports, table: CostTable, onCase: (label: string) => void): Promise<void> {
  const order: [string, number][] = [["brute", 0], ["grid", 1], ["sorted", 2]];
  for (const size of COST_SIZES) {
    for (const [name, i] of order) {
      if (name === "brute" && size > COST_BRUTE_MAX) continue;
      onCase(`${name}, ${size.toLocaleString()} boids…`);
      await new Promise((r) => setTimeout(r, 0));
      const [w, h] = worldFor(size);
      const d = s.swarm_new(size, w, h, SCALE, 1);
      if (d === 0) continue;
      // Warm up (sorted: fast) into a flocking state, then time the mode.
      s.swarm_set_neighbours(d, NEIGHBOURS_SORTED);
      stepExactly(s, d, 100);
      s.swarm_set_neighbours(d, MODES[name] ?? NEIGHBOURS_SORTED);
      const steps = size * (name === "brute" ? size : 300) > 3e8 ? 2 : 10;
      const t0 = performance.now();
      stepExactly(s, d, steps);
      table.record(size, i, (performance.now() - t0) / steps);
      s.swarm_free(d);
    }
  }
}

try {
  const s = await loadSwarm();
  const d = s.swarm_new(n, WORLD[0], WORLD[1], SCALE, seed);
  if (d === 0) throw new Error(`swarm_new(${n}) refused`);
  s.swarm_set_rate(d, rate);
  if (s.swarm_set_neighbours(d, MODES[mode] ?? NEIGHBOURS_SORTED) === 0) {
    mode = "sorted";
    s.swarm_set_neighbours(d, NEIGHBOURS_SORTED);
  }
  const [w, h] = [s.swarm_view_width(d), s.swarm_view_height(d)];
  const ctx = pixelCanvas(canvas, w, h);

  if (smokeMode) {
    smoke(s, d, ctx, w, h);
  } else {
    const controls = byId("controls", HTMLElement);
    select(controls, {
      label: "neighbours",
      choices: Object.keys(MODES).map((m) => [m, m === "brute" && n > MAX_BRUTE ? "brute (too many)" : m]),
      value: mode,
      onChange: (v) => {
        if (s.swarm_set_neighbours(d, MODES[v] ?? NEIGHBOURS_SORTED) === 1) mode = v;
      },
    });
    for (const [code, label, min, max, step] of SLIDERS) {
      const input = slider(controls, {
        label, min, max, step,
        value: s.swarm_param(d, code),
        onInput: (v) => {
          // Refused (protected ≥ visual, min > max): back to what's set.
          if (s.swarm_set_param(d, code, v) === 0) input.value = String(s.swarm_param(d, code));
        },
      });
    }
    // The predator follows the pointer while it's over the canvas.
    canvas.style.touchAction = "none";
    const toWorld = (e: PointerEvent): [number, number] => {
      const r = canvas.getBoundingClientRect();
      return [((e.clientX - r.left) / r.width) * WORLD[0], ((e.clientY - r.top) / r.height) * WORLD[1]];
    };
    canvas.addEventListener("pointermove", (e) => {
      const [x, y] = toWorld(e);
      s.swarm_set_predator(d, x, y, 1);
    });
    canvas.addEventListener("pointerleave", () => void s.swarm_set_predator(d, 0, 0, 0));

    const plot = new LinePlot(byId("order", HTMLCanvasElement), {
      series: [{ label: "polarization", color: cssColor(canvas, "--series-1") }],
      capacity: PLOT_SAMPLES,
      colors: plotColors(canvas),
    });
    const cost = new CostTable(3, 1);
    const costEl = byId("cost", HTMLElement);
    const measuring = byId("measuring", HTMLElement);
    const measureButton = byId("measure", HTMLButtonElement);
    measureButton.addEventListener("click", () => {
      measureButton.disabled = true;
      void measureCost(s, cost, (label) => {
        measuring.textContent = label;
        costEl.innerHTML = costHtml(cost, ["brute", "grid", "sorted"]);
      }).then(() => {
        measuring.textContent = "done";
        costEl.innerHTML = costHtml(cost, ["brute", "grid", "sorted"]);
        measureButton.disabled = false;
      });
    });

    const fps = new RateMeter();
    const sps = new RateMeter();
    const stepMs = new Smoothed();
    const drawMs = new Smoothed();
    let simTime = 0;
    runLoop((elapsed, now) => {
      const t0 = performance.now();
      const steps = s.swarm_advance(d, elapsed);
      const t1 = performance.now();
      blit(ctx, s.memory, s.swarm_render(d), w, h);
      drawMs.add(performance.now() - t1);
      if (steps > 0) stepMs.add((t1 - t0) / steps);
      simTime += steps / rate;
      fps.add(now);
      sps.add(now, steps);
      const pol = s.swarm_polarization(d);
      if (steps > 0) {
        plot.push(simTime, [pol]);
        plot.draw();
      }
      const slow = swarmStepBudget.limited ? " (slow motion: step budget)" : "";
      hud.textContent =
        `display ${fps.perSecond} fps · ${sps.perSecond} steps/s${slow}` +
        (Number.isFinite(maxFps) ? ` · capped at ${maxFps} fps` : "") + "\n" +
        `step ${stepMs.value.toFixed(2)} ms (${nsPerBoid(stepMs.value, n).toFixed(0)} ns per boid) · ` +
        `draw ${drawMs.value.toFixed(2)} ms · ${mode}\n` +
        `${n.toLocaleString()} boids · polarization ${pol.toFixed(2)}`;
    }, { maxFps });
  }
} catch (err) {
  pageFailed(hud, err);
}
