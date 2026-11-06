// M4: chaos. Two double pendulums (Rust: engine::scenarios::double_pendulum)
// that start 1e-9 m apart, or identically in f32 and f64, with tip trails
// and a log plot of their divergence.

import { loadEngine, positionsView, linksView } from "../../js/wasm.ts";
import { View, clear, drawPoints, drawLinks, cssColor } from "../../js/canvas.ts";
import {
  COORDS_PER_PARTICLE, SCALAR_F32, SCALAR_F64, SOLVER_IMPULSE, SOLVER_XPBD,
  START_HORIZONTAL, START_RAISED,
} from "../../js/abi.ts";
import { byId } from "../../js/dom.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { LinePlot } from "../../js/plot.ts";
import { Trail } from "../../js/trail.ts";
import { slider, select, button } from "../../js/controls.ts";
import { buildPanels, demoHandle, panelSeries, replaceDemo, requireAccepted } from "../../js/panels.ts";
import { FPS_OPTION, RATE_OPTION, pageFailed, plotColors, runDemo } from "../../js/page.ts";
import { enableDrag } from "../../js/drag.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";

/** The two comparisons: what differs between the panels. */
const MODES = {
  nudge: { label: "1e-9 m apart", scalars: [SCALAR_F64, SCALAR_F64], offsets: [0, 1e-9], names: ["f64", "f64, tip +1e-9 m"] },
  scalar: { label: "f32 vs f64", scalars: [SCALAR_F32, SCALAR_F64], offsets: [0, 0], names: ["f32", "f64"] },
};
type ModeName = keyof typeof MODES;
const isMode = (s: string): s is ModeName => Object.hasOwn(MODES, s);

const STARTS = { raised: START_RAISED, horizontal: START_HORIZONTAL };
type StartName = keyof typeof STARTS;
const isStart = (s: string): s is StartName => Object.hasOwn(STARTS, s);

const SOLVERS = { impulse: SOLVER_IMPULSE, xpbd: SOLVER_XPBD };
type SolverName = keyof typeof SOLVERS;
const isSolver = (s: string): s is SolverName => Object.hasOwn(SOLVERS, s);

const PANEL_COLORS = ["--series-1", "--series-3"];

const OPTIONS: {
  mode: ChoiceOption; start: ChoiceOption; solver: ChoiceOption; substeps: IntOption; rate: IntOption;
  fps: IntOption;
} = {
  mode: { kind: "choice", values: Object.keys(MODES), default: "nudge", help: "what differs between the two panels" },
  // Raised separates in 11 s, horizontal in 24 s (engine tests/chains.rs).
  start: { kind: "choice", values: Object.keys(STARTS), default: "raised", help: "release position (raised: both rods at 135°)" },
  solver: { kind: "choice", values: Object.keys(SOLVERS), default: "impulse", help: "impulse keeps the energy; XPBD's damping kills the chaos" },
  // 20: the substeps M4.4 measured (energy within 0.04 J over 30 s).
  substeps: { kind: "int", min: 1, max: 100, default: 20, help: "substeps per physics step" },
  rate: RATE_OPTION,
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["1e-9 apart (default)", ""],
  ["f32 vs f64", "?mode=scalar"],
  ["horizontal start", "?start=horizontal"],
  ["XPBD (no chaos)", "?solver=xpbd"],
];

/** Bobs and rods, CSS pixels. */
const BOB_PX = 9;
const ROD_WIDTH_PX = 2;
const TRAIL_WIDTH_PX = 1.5;
/** Tip trail in frames: about 4 s at 60 fps, a few swings. */
const TRAIL_POINTS = 240;
/** Plot history in frames: 60 s at 60 fps, enough to see separation. */
const PLOT_SAMPLES = 3600;
/** The tip is particle 2 (pin 0, elbow 1). */
const TIP_INDEX = 2;
const TIP = TIP_INDEX * COORDS_PER_PARTICLE;

/** Two 1 m rods: everything within 2 m of the pin, and a margin. */
const VIEW = new View({ xMin: -2.3, xMax: 2.3, yMin: -2.3, yMax: 2.3 });

const params = new URLSearchParams(location.search);
const pick = <T extends string>(name: string, opt: ChoiceOption, is: (s: string) => s is T, fallback: T): T => {
  const v = readChoice(params, name, opt);
  return is(v) ? v : fallback;
};
const state = {
  mode: pick("mode", OPTIONS.mode, isMode, "nudge"),
  start: pick("start", OPTIONS.start, isStart, "raised"),
  solver: pick("solver", OPTIONS.solver, isSolver, "impulse"),
  substeps: readInt(params, "substeps", OPTIONS.substeps),
  rate: readInt(params, "rate", OPTIONS.rate),
};
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = {
  ...plotColors(css),
  pin: cssColor(css, "--star"),
  body: cssColor(css, "--particle"),
};

const configs = PANEL_COLORS.map((colorVar, i) => ({ index: i, name: MODES[state.mode].names[i] ?? "", colorVar }));
const panels = buildPanels(byId("panels", HTMLElement), configs, css).map((p) => ({
  ...p,
  trail: new Trail(TRAIL_POINTS),
  e0: 0,
}));
type Panel = (typeof panels)[number];

const divergencePlot = new LinePlot(byId("divergence", HTMLCanvasElement), {
  series: [{ label: "tip distance, m", color: cssColor(css, "--series-2") }],
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
  let simTime = 0;

  const applySettings = () => {
    for (const p of panels) {
      const d = demoHandle(p);
      requireAccepted([
        engine.demo_set_solver(d, SOLVERS[state.solver]),
        engine.demo_set_substeps(d, state.substeps),
        engine.demo_set_rate(d, state.rate),
      ]);
    }
  };

  /** (Re)creates both pendulums for the current mode and start. */
  const restart = () => {
    const mode = MODES[state.mode];
    for (const p of panels) {
      const demo = replaceDemo(
        engine,
        p.demo,
        engine.demo_new_double_pendulum(mode.scalars[p.index] ?? SCALAR_F64, STARTS[state.start], mode.offsets[p.index] ?? 0),
        "demo_new_double_pendulum",
      );
      p.demo = demo;
      p.e0 = engine.demo_energy(demo);
      p.trail.clear();
      const title = p.ctx.canvas.parentElement?.querySelector("h3");
      if (title) title.textContent = mode.names[p.index] ?? "";
    }
    applySettings();
    divergencePlot.clear();
    energyPlot.clear();
    simTime = 0;
  };
  restart();

  const drawPanel = (p: Panel, pos: Float32Array): void => {
    const demo = demoHandle(p);
    clear(p.ctx, colors.background);
    VIEW.apply(p.ctx);
    p.trail.draw(p.ctx, VIEW, p.color, TRAIL_WIDTH_PX);
    drawLinks(p.ctx, VIEW, pos, linksView(engine, demo), ROD_WIDTH_PX, p.color);
    drawPoints(p.ctx, VIEW, pos.subarray(COORDS_PER_PARTICLE), BOB_PX, colors.body);
    drawPoints(p.ctx, VIEW, pos.subarray(0, COORDS_PER_PARTICLE), BOB_PX / 2, colors.pin);
  };

  for (const p of panels) enableDrag(engine, p.ctx.canvas, VIEW, () => demoHandle(p));

  const controls = byId("controls", HTMLElement);
  select(controls, {
    label: "compare",
    choices: Object.entries(MODES).map(([k, m]) => [k, m.label]),
    value: state.mode,
    onChange: (v) => {
      if (isMode(v)) state.mode = v;
      restart();
    },
  });
  select(controls, {
    label: "start",
    choices: Object.keys(STARTS).map((s) => [s, s]),
    value: state.start,
    onChange: (v) => {
      if (isStart(v)) state.start = v;
      restart();
    },
  });
  select(controls, {
    label: "solver",
    choices: Object.keys(SOLVERS).map((s) => [s, s]),
    value: state.solver,
    onChange: (v) => {
      if (isSolver(v)) state.solver = v;
      restart();
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
  button(controls, { label: "reset", onClick: restart });

  runDemo(engine, hud, {
    panels,
    draw: (p) => drawPanel(p, positionsView(engine, demoHandle(p))),
    particleColor: colors.body,
    maxFps,
    frame: (elapsed) => {
      let steps = 0;
      for (const p of panels) steps = engine.demo_advance(demoHandle(p), elapsed);
      const tips = panels.map((p) => {
        const pos = positionsView(engine, demoHandle(p));
        p.trail.push(pos.subarray(TIP, TIP + COORDS_PER_PARTICLE));
        drawPanel(p, pos);
        const demo = demoHandle(p);
        const lost = p.e0 - engine.demo_energy(demo);
        p.readout.textContent = `energy lost ${lost.toFixed(3)} J`;
        // Exact tip position: the f32 render buffer can't resolve 1e-9 m.
        return { x: engine.demo_particle_x(demo, TIP_INDEX), y: engine.demo_particle_y(demo, TIP_INDEX), lost };
      });
      const [a, b] = tips;
      simTime += steps / state.rate;
      if (a !== undefined && b !== undefined) {
        divergencePlot.push(simTime, [Math.hypot(a.x - b.x, a.y - b.y)]);
        energyPlot.push(simTime, tips.map((t) => t.lost));
      }
      divergencePlot.draw();
      energyPlot.draw();
      const status = `${MODES[state.mode].label}, ${state.start} start, ${state.solver} · t = ${simTime.toFixed(1)} s`;
      return { steps, status };
    },
  });
} catch (err) {
  pageFailed(hud, err);
}
