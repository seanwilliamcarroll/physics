// S2: the Vicsek model (swarm::vicsek through swarm.wasm; docs/15-swarm.md,
// S2). The live box, its order over time, and a Fig. 2a sweep.

import { loadSwarm, swarmStepBudget } from "../../js/swarm-wasm.ts";
import { blit, countOtherThan, pixelCanvas } from "../../js/pixels.ts";
import { FIG_2A, cases, etaGrid, sideFor } from "../../js/vicsek-sweep.ts";
import { DEFAULT_RATE_HZ, MAX_PARTICLES, MAX_RATE_HZ } from "../../js/swarm-abi.ts";
import { RateMeter, Smoothed, runLoop } from "../../js/loop.ts";
import { slider } from "../../js/controls.ts";
import { byId } from "../../js/dom.ts";
import { FPS_OPTION, pageFailed, plotColors } from "../../js/page.ts";
import { readInt, optionsTableHtml } from "../../js/options.ts";
import { reportSmoke, smokeMode } from "../../js/smoke.ts";
import { LinePlot } from "../../js/plot.ts";
import { cssColor } from "../../js/canvas.ts";
import type { IntOption } from "../../js/options.ts";

const OPTIONS: { n: IntOption; rho: IntOption; eta: IntOption; seed: IntOption; rate: IntOption; fps: IntOption } = {
  n: { kind: "int", min: 1, max: MAX_PARTICLES, default: 4000, help: "particles" },
  rho: { kind: "int", min: 1, max: 64, default: 4, help: "density N/L² (the paper's Fig. 2a: 4); sets the box side" },
  eta: { kind: "int", min: 0, max: 628, default: 200, help: "noise η, hundredths (0–628: 0 to 2π)" },
  seed: { kind: "int", min: 0, max: 2 ** 32 - 1, default: 1, help: "positions, headings and the noise's stream" },
  rate: { kind: "int", min: 1, max: MAX_RATE_HZ, default: DEFAULT_RATE_HZ, help: "steps per second (a step moves a particle v = 0.03)" },
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["4000 at ρ = 4, η = 2 (default)", ""],
  ["ordered: η = 0.5", "?eta=50"],
  ["disordered: η = 5", "?eta=500"],
  ["Fig. 1d: 300, dense, low noise", "?n=300&rho=12&eta=10"],
  ["Fig. 1b: 300, sparse, low noise", "?n=300&rho=1&eta=10"],
  ["40 particles (Fig. 2a's smallest)", "?n=40"],
];

/** Drawn pixels a side. */
const VIEW = 720;
const PLOT_SAMPLES = 1800;
const SMOKE_STEPS = 30;
const BACKGROUND_RGB = [0x16, 0x1a, 0x22];
/** The sweep: steps discarded, then averaged (the native sweep uses
 *  3,000 + 3,000 and 5 seeds; this is one seed, quicker). */
const TRANSIENT = 1000;
const WINDOW = 1000;
const SERIES_VARS = ["--series-1", "--series-2", "--series-3", "--series-4"];

const params = new URLSearchParams(location.search);
const n = readInt(params, "n", OPTIONS.n);
const rho = readInt(params, "rho", OPTIONS.rho);
let eta = readInt(params, "eta", OPTIONS.eta) / 100;
const seed = readInt(params, "seed", OPTIONS.seed);
const rate = readInt(params, "rate", OPTIONS.rate);
const maxFps = readInt(params, "fps", OPTIONS.fps);
const side = sideFor(n, rho);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const canvas = byId("view", HTMLCanvasElement);

try {
  const s = await loadSwarm();
  const d = s.vicsek_new(n, side, eta, VIEW, seed);
  if (d === 0) throw new Error(`vicsek_new(${n}, L = ${side.toFixed(2)}) refused`);
  s.vicsek_set_rate(d, rate);
  const view = s.vicsek_view(d);
  const ctx = pixelCanvas(canvas, view, view);

  if (smokeMode) {
    let steps = 0;
    for (let i = 0; i < SMOKE_STEPS; i++) steps += s.vicsek_advance(d, 1 / DEFAULT_RATE_HZ + 1e-9);
    blit(ctx, s.memory, s.vicsek_render(d), view, view);
    const va = s.vicsek_order(d);
    const measured = s.vicsek_mean_order(d, 10, 10);
    if (!Number.isFinite(va) || !Number.isFinite(measured)) {
      reportSmoke(`error v_a ${va}, mean ${measured}`);
    } else {
      const px = countOtherThan(ctx.getImageData(0, 0, view, view).data, BACKGROUND_RGB);
      reportSmoke(`ok steps=${steps} particle_px=${px}`);
    }
  } else {
    const controls = byId("controls", HTMLElement);
    slider(controls, {
      label: "noise η", min: 0, max: 2 * Math.PI, step: 0.05, value: eta,
      onInput: (v) => { if (s.vicsek_set_noise(d, v) === 1) eta = v; },
    });
    slider(controls, {
      label: "speed v", min: 0.003, max: 0.3, step: 0.003, value: 0.03,
      onInput: (v) => void s.vicsek_set_speed(d, v),
    });
    slider(controls, {
      label: "rate", min: 1, max: MAX_RATE_HZ, value: rate,
      format: (hz) => `${hz} steps/s`,
      onInput: (hz) => void s.vicsek_set_rate(d, hz),
    });

    const colors = plotColors(canvas);
    const orderPlot = new LinePlot(byId("order", HTMLCanvasElement), {
      series: [{ label: "v_a", color: cssColor(canvas, "--series-1") }],
      capacity: PLOT_SAMPLES,
      colors,
    });
    const transition = new LinePlot(byId("transition", HTMLCanvasElement), {
      series: FIG_2A.map(([size], i) => ({ label: `N = ${size}`, color: cssColor(canvas, SERIES_VARS[i] ?? "--series-1") })),
      capacity: 64,
      colors,
    });

    // The sweep: one (η, N) case per task, so the page stays live; a
    // column of points is drawn once every size has its value.
    const sweepButton = byId("sweep", HTMLButtonElement);
    const sweeping = byId("sweeping", HTMLElement);
    sweepButton.addEventListener("click", () => {
      sweepButton.disabled = true;
      transition.clear();
      const todo = cases(FIG_2A, etaGrid());
      const column: number[] = [];
      const next = (k: number) => {
        const c = todo[k];
        if (c === undefined) {
          sweeping.textContent = "done";
          sweepButton.disabled = false;
          return;
        }
        sweeping.textContent = `η = ${c.eta.toFixed(2)}, N = ${c.n}…`;
        const h = s.vicsek_new(c.n, c.side, c.eta, 1, seed);
        column[c.i] = h === 0 ? Number.NaN : s.vicsek_mean_order(h, TRANSIENT, WINDOW);
        if (h !== 0) s.vicsek_free(h);
        if (c.i === FIG_2A.length - 1) {
          transition.push(c.eta, column.slice());
          transition.draw();
        }
        setTimeout(() => next(k + 1), 0);
      };
      next(0);
    });

    const fps = new RateMeter();
    const sps = new RateMeter();
    const stepMs = new Smoothed();
    let simTime = 0;
    runLoop((elapsed, now) => {
      const t0 = performance.now();
      const steps = s.vicsek_advance(d, elapsed);
      const t1 = performance.now();
      blit(ctx, s.memory, s.vicsek_render(d), view, view);
      if (steps > 0) stepMs.add((t1 - t0) / steps);
      simTime += steps / rate;
      fps.add(now);
      sps.add(now, steps);
      const va = s.vicsek_order(d);
      if (steps > 0) {
        orderPlot.push(simTime, [va]);
        orderPlot.draw();
      }
      const slow = swarmStepBudget.limited ? " (slow motion: step budget)" : "";
      hud.textContent =
        `display ${fps.perSecond} fps · ${sps.perSecond} steps/s${slow}` +
        (Number.isFinite(maxFps) ? ` · capped at ${maxFps} fps` : "") + "\n" +
        `step ${stepMs.value.toFixed(2)} ms · v_a ${va.toFixed(3)} · 0/0 so far ${s.vicsek_annihilations(d)}\n` +
        `${n.toLocaleString()} particles · L ${side.toFixed(2)} (ρ = ${rho}) · η ${eta.toFixed(2)}`;
    }, { maxFps });
  }
} catch (err) {
  pageFailed(hud, err);
}
