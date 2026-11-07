// M3: the solver duel. `01-solvers.md`'s pendulum (Rust:
// engine::scenarios::pendulum), stepped by XPBD and by sequential impulses
// side by side under the same settings, with rod-error and energy plots.

import { loadEngine, positionsView } from "../../js/wasm.ts";
import { View, clear, drawPoints, drawSegment, drawCircle, cssColor } from "../../js/canvas.ts";
import { COORDS_PER_PARTICLE, DEMO_PENDULUM, MAX_SUBSTEPS, SOLVER_IMPULSE, SOLVER_XPBD } from "../../js/abi.ts";
import { SCALAR_CODES, isScalar, readScalar } from "../../js/scalars.ts";
import { buildPanels, demoHandle, panelSeries, replaceDemo, requireAccepted } from "../../js/panels.ts";
import { FPS_OPTION, RATE_OPTION, pageFailed, plotColors, rateSlider, runDemo } from "../../js/page.ts";
import { byId } from "../../js/dom.ts";
import { readInt, optionsTableHtml } from "../../js/options.ts";
import { LinePlot } from "../../js/plot.ts";
import { Trail } from "../../js/trail.ts";
import { slider, select, button } from "../../js/controls.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";

/** The two panels: solver code, name, CSS color variable. */
const PANELS = [
  { code: SOLVER_XPBD, name: "XPBD", colorVar: "--series-1" },
  { code: SOLVER_IMPULSE, name: "impulse", colorVar: "--series-3" },
];

/** Rod length, m (engine::scenarios::PENDULUM_LENGTH): the rest circle. */
const ROD_LENGTH_M = 1;
const PCT = 100;
/** Rod errors read out in millimeters. */
const MM_PER_M = 1000;
/** β slider step: 1/20, so 0.2 (the default) and 0 are both on it. */
const BETA_STEP = 0.05;

const OPTIONS: {
  scalar: ChoiceOption; beta_pct: IntOption; substeps: IntOption; iterations: IntOption; rate: IntOption;
  fps: IntOption;
} = {
  scalar: { kind: "choice", values: ["f64", "f32"], default: "f64", help: "engine number type (f32 + many substeps: XPBD gains energy)" },
  // 20%: engine::DEFAULT_BAUMGARTE (Box2D v2), the β in 01's table.
  beta_pct: { kind: "int", min: 0, max: PCT, default: 20, help: "impulse solver's Baumgarte β × 100; 0 = no feedback" },
  substeps: { kind: "int", min: 1, max: MAX_SUBSTEPS, default: 1, help: "substeps per physics step (01's table: 1, 20, 100)" },
  iterations: { kind: "int", min: 1, max: 10, default: 1, help: "solver passes per substep (one rod converges in one; matters for chains)" },
  rate: RATE_OPTION,
  fps: FPS_OPTION,
};

/** One preset per row of 01-solvers.md's table (both solvers show at
 *  once), plus the f32 finding. */
const PRESETS: [string, string][] = [
  ["β = 0", "?beta_pct=0"],
  ["β = 0.2 (default)", ""],
  ["β = 0.2, 20 substeps", "?substeps=20"],
  ["100 substeps", "?substeps=100"],
  ["f32, 100 substeps", "?scalar=f32&substeps=100"],
];

/** Pin and bob squares, rod and circle widths, CSS pixels. */
const PIN_PX = 6;
const BOB_PX = 10;
const ROD_WIDTH_PX = 2;
const CIRCLE_WIDTH_PX = 1;
const TRAIL_WIDTH_PX = 1.5;
/** Trail length in frames: about one full swing at 60 fps (period ≈ 2.4 s
 *  for a 1 m pendulum released horizontally). */
const TRAIL_POINTS = 150;
/** Plot history in frames: 30 s at 60 fps. */
const PLOT_SAMPLES = 1800;

/** The swing spans x ∈ [−1, 1], y ∈ [−1, 0]; margin above for the pin and
 *  below for a stretching rod (47 cm at β = 0 within 10 s). */
const VIEW = new View({ xMin: -1.6, xMax: 1.6, yMin: -1.7, yMax: 0.5 });

const params = new URLSearchParams(location.search);
const state = {
  scalar: readScalar(params, OPTIONS.scalar),
  beta: readInt(params, "beta_pct", OPTIONS.beta_pct) / PCT,
  substeps: readInt(params, "substeps", OPTIONS.substeps),
  iterations: readInt(params, "iterations", OPTIONS.iterations),
  rate: readInt(params, "rate", OPTIONS.rate),
};
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = {
  ...plotColors(css),
  pin: cssColor(css, "--star"),
  bob: cssColor(css, "--particle"),
  rest: cssColor(css, "--grid"),
};

const panels = buildPanels(byId("panels", HTMLElement), PANELS, css).map((p) => ({
  ...p,
  trail: new Trail(TRAIL_POINTS),
  /** Energy at release: the reference for "energy lost". */
  e0: 0,
  /** Largest rod error since the last reset, m. */
  worst: 0,
}));
type Panel = (typeof panels)[number];

const rodPlot = new LinePlot(byId("rod", HTMLCanvasElement), {
  series: panelSeries(panels),
  capacity: PLOT_SAMPLES,
  scale: "log",
  colors,
});
const energyPlot = new LinePlot(byId("energy", HTMLCanvasElement), {
  series: panelSeries(panels),
  capacity: PLOT_SAMPLES,
  scale: "linear",
  colors,
});

try {
  const engine = await loadEngine();
  /** Simulated seconds since the last (re)start. */
  let simTime = 0;

  /** Pushes the shared settings to both demos (each setter is checked:
   *  a 0 status means the page passed something the engine rejects). */
  const applySettings = () => {
    for (const p of panels) {
      const d = demoHandle(p);
      requireAccepted([
        engine.demo_set_solver(d, p.code),
        engine.demo_set_beta(d, state.beta),
        engine.demo_set_substeps(d, state.substeps),
        engine.demo_set_iterations(d, state.iterations),
        engine.demo_set_rate(d, state.rate),
      ]);
    }
  };

  /** (Re)creates both pendulums with the current scalar and settings. */
  const restart = () => {
    for (const p of panels) {
      const demo = replaceDemo(engine, p.demo, engine.demo_new(DEMO_PENDULUM, SCALAR_CODES[state.scalar], 0, 0), "demo_new");
      p.demo = demo;
      p.e0 = engine.demo_energy(demo);
      p.worst = 0;
      p.trail.clear();
    }
    applySettings();
    rodPlot.clear();
    energyPlot.clear();
    simTime = 0;
  };
  restart();

  /** `pos`: pin then bob, interleaved. */
  const drawPanel = (p: Panel, pos: Float32Array): void => {
    clear(p.ctx, colors.background);
    VIEW.apply(p.ctx);
    const pin: [number, number] = [pos[0] ?? 0, pos[1] ?? 0];
    const bob: [number, number] = [pos[COORDS_PER_PARTICLE] ?? 0, pos[COORDS_PER_PARTICLE + 1] ?? 0];
    drawCircle(p.ctx, VIEW, pin, ROD_LENGTH_M, CIRCLE_WIDTH_PX, colors.rest);
    p.trail.draw(p.ctx, VIEW, p.color, TRAIL_WIDTH_PX);
    drawSegment(p.ctx, VIEW, pin, bob, ROD_WIDTH_PX, p.color);
    drawPoints(p.ctx, VIEW, pos.subarray(0, COORDS_PER_PARTICLE), PIN_PX, colors.pin);
    drawPoints(p.ctx, VIEW, pos.subarray(COORDS_PER_PARTICLE), BOB_PX, colors.bob);
  };

  // Controls: shared by both panels, so each 01 row is one setting.
  const controls = byId("controls", HTMLElement);
  slider(controls, {
    label: "β",
    min: 0,
    max: 1,
    step: BETA_STEP,
    value: state.beta,
    format: (b) => `${b.toFixed(2)} (impulse only)`,
    onInput: (b) => {
      state.beta = b;
      applySettings();
    },
  });
  slider(controls, {
    label: "substeps",
    min: OPTIONS.substeps.min,
    max: OPTIONS.substeps.max,
    value: state.substeps,
    onInput: (n) => {
      state.substeps = n;
      applySettings();
    },
  });
  slider(controls, {
    label: "iterations",
    min: OPTIONS.iterations.min,
    max: OPTIONS.iterations.max,
    value: state.iterations,
    onInput: (n) => {
      state.iterations = n;
      applySettings();
    },
  });
  rateSlider(controls, state.rate, (hz) => {
    state.rate = hz;
    applySettings();
  });
  select(controls, {
    label: "scalar",
    choices: [["f64", "f64"], ["f32", "f32"]],
    value: state.scalar,
    onChange: (v) => {
      if (isScalar(v)) state.scalar = v;
      restart();
    },
  });
  button(controls, { label: "reset", onClick: restart });

  runDemo(engine, hud, {
    panels,
    draw: (p) => drawPanel(p, positionsView(engine, demoHandle(p))),
    particleColor: colors.bob,
    maxFps,
    frame: (elapsed) => {
      let steps = 0;
      for (const p of panels) steps = engine.demo_advance(demoHandle(p), elapsed);
      // Views after all stepping (memory growth would detach earlier ones).
      const readings = panels.map((p) => {
        const demo = demoHandle(p);
        const pos = positionsView(engine, demo);
        p.trail.push(pos);
        drawPanel(p, pos);
        const rod = engine.demo_constraint_error(demo);
        const lost = p.e0 - engine.demo_energy(demo);
        p.worst = Math.max(p.worst, rod);
        p.readout.textContent =
          `rod error ${(rod * MM_PER_M).toFixed(3)} mm (worst ${(p.worst * MM_PER_M).toFixed(3)}) · ` +
          `energy lost ${lost.toFixed(3)} J`;
        return { rod, lost };
      });
      simTime += steps / state.rate;
      rodPlot.push(simTime, readings.map((r) => r.rod));
      energyPlot.push(simTime, readings.map((r) => r.lost));
      rodPlot.draw();
      energyPlot.draw();
      return { steps, status: `${state.scalar} · t = ${simTime.toFixed(1)} s` };
    },
  });
} catch (err) {
  pageFailed(hud, err);
}
