// M4: a heavy bob on a light chain (Rust: engine::scenarios::chain),
// XPBD and sequential impulses side by side under the same settings, with
// pointer dragging in either panel.

import { loadEngine, positionsView, linksView } from "../../js/wasm.ts";
import { View, clear, drawPoints, drawLinks, cssColor } from "../../js/canvas.ts";
import {
  COORDS_PER_PARTICLE, ORDER_ALTERNATING, ORDER_FORWARD, ORDER_REVERSE, SCALAR_F64,
  SOLVER_IMPULSE, SOLVER_XPBD, STABILIZATION_BAUMGARTE, STABILIZATION_SPLIT,
} from "../../js/abi.ts";
import { byId } from "../../js/dom.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { LinePlot } from "../../js/plot.ts";
import { slider, select, button } from "../../js/controls.ts";
import { buildPanels, demoHandle, panelSeries, replaceDemo, requireAccepted } from "../../js/panels.ts";
import { FPS_OPTION, RATE_OPTION, pageFailed, plotColors, rateSlider, runDemo } from "../../js/page.ts";
import { enableDrag } from "../../js/drag.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";

const PANELS = [
  { code: SOLVER_XPBD, name: "XPBD", colorVar: "--series-1" },
  { code: SOLVER_IMPULSE, name: "impulse", colorVar: "--series-3" },
];

/** The impulse panel's position correction (XPBD ignores it). */
const STABILIZATIONS = { split: STABILIZATION_SPLIT, classic: STABILIZATION_BAUMGARTE };
type StabName = keyof typeof STABILIZATIONS;
const isStab = (s: string): s is StabName => Object.hasOwn(STABILIZATIONS, s);

const ORDERS = { forward: ORDER_FORWARD, reverse: ORDER_REVERSE, alternating: ORDER_ALTERNATING };
type OrderName = keyof typeof ORDERS;
function isOrder(s: string): s is OrderName {
  return Object.hasOwn(ORDERS, s);
}

/** Bob-to-link mass ratios offered: the roadmap's 1:100, and around it. */
const MASS_RATIOS = ["1", "10", "100", "1000"];

const OPTIONS: {
  ratio: ChoiceOption; stab: ChoiceOption; links: IntOption; substeps: IntOption; iterations: IntOption;
  order: ChoiceOption; rate: IntOption; fps: IntOption;
} = {
  ratio: { kind: "choice", values: MASS_RATIOS, default: "100", help: "bob mass / link mass" },
  stab: { kind: "choice", values: Object.keys(STABILIZATIONS), default: "split", help: "impulse panel: split impulses, or classic Baumgarte (blows up on heavy chains)" },
  // 10: engine::scenarios::CHAIN_LINKS.
  links: { kind: "int", min: 1, max: 40, default: 10, help: "links in the chain (1 m total)" },
  // 20: the substeps M4.4 measured the chain at (and both demos start with).
  substeps: { kind: "int", min: 1, max: 100, default: 20, help: "substeps per physics step" },
  iterations: { kind: "int", min: 1, max: 20, default: 1, help: "solver passes per substep" },
  order: { kind: "choice", values: Object.keys(ORDERS), default: "forward", help: "the order each pass visits the links in" },
  rate: RATE_OPTION,
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["1:100 (default)", ""],
  ["classic Baumgarte blows up", "?stab=classic"],
  ["classic, 2 substeps (milder)", "?stab=classic&substeps=2"],
  ["equal masses", "?ratio=1"],
  ["1:1000", "?ratio=1000"],
  ["1 substep", "?substeps=1"],
  ["10 iterations", "?iterations=10"],
  ["long chain", "?links=40"],
];

/** Link and bob squares, rod width, CSS pixels. */
const LINK_PX = 4;
const BOB_PX = 10;
const ROD_WIDTH_PX = 2;
/** Link errors read out in millimeters. */
const MM_PER_M = 1000;
/** Plot history in frames: 30 s at 60 fps. */
const PLOT_SAMPLES = 1800;

/** The 1 m chain swings within ±1 m of the pin; the impulse panel's chain
 *  can stretch to about twice its length, so room below. */
const VIEW = new View({ xMin: -2, xMax: 2, yMin: -2.6, yMax: 1 });

const params = new URLSearchParams(location.search);
const orderParam = readChoice(params, "order", OPTIONS.order);
const state = {
  ratio: Number(readChoice(params, "ratio", OPTIONS.ratio)),
  links: readInt(params, "links", OPTIONS.links),
  substeps: readInt(params, "substeps", OPTIONS.substeps),
  iterations: readInt(params, "iterations", OPTIONS.iterations),
  order: (isOrder(orderParam) ? orderParam : "forward") as OrderName,
  stab: ((s) => (isStab(s) ? s : "split"))(readChoice(params, "stab", OPTIONS.stab)) as StabName,
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

const panels = buildPanels(byId("panels", HTMLElement), PANELS, css).map((p) => ({
  ...p,
  /** Energy at the start: the reference for "energy gained". */
  e0: 0,
}));
type Panel = (typeof panels)[number];

const energyPlot = new LinePlot(byId("energy", HTMLCanvasElement), {
  series: panelSeries(panels),
  capacity: PLOT_SAMPLES,
  scale: "linear",
  colors,
});
const errorPlot = new LinePlot(byId("error", HTMLCanvasElement), {
  series: panelSeries(panels),
  capacity: PLOT_SAMPLES,
  scale: "log",
  colors,
});

try {
  const engine = await loadEngine();
  let simTime = 0;

  const applySettings = () => {
    for (const p of panels) {
      const d = demoHandle(p);
      requireAccepted([
        engine.demo_set_solver(d, p.code),
        engine.demo_set_substeps(d, state.substeps),
        engine.demo_set_iterations(d, state.iterations),
        engine.demo_set_order(d, ORDERS[state.order]),
        engine.demo_set_stabilization(d, STABILIZATIONS[state.stab]),
        engine.demo_set_rate(d, state.rate),
      ]);
    }
  };

  /** (Re)creates both chains with the current links and mass ratio. */
  const restart = () => {
    for (const p of panels) {
      const demo = replaceDemo(engine, p.demo, engine.demo_new_chain(SCALAR_F64, state.links, state.ratio), "demo_new_chain");
      p.demo = demo;
      p.e0 = engine.demo_energy(demo);
    }
    applySettings();
    errorPlot.clear();
    energyPlot.clear();
    simTime = 0;
  };
  restart();

  /** Pin first, then links, the bob at index `state.links`; while dragged,
   *  the anchor is the last particle. */
  const drawPanel = (p: Panel): void => {
    const demo = demoHandle(p);
    const pos = positionsView(engine, demo);
    clear(p.ctx, colors.background);
    VIEW.apply(p.ctx);
    drawLinks(p.ctx, VIEW, pos, linksView(engine, demo), ROD_WIDTH_PX, p.color);
    const bob = state.links * COORDS_PER_PARTICLE;
    drawPoints(p.ctx, VIEW, pos.subarray(COORDS_PER_PARTICLE, bob), LINK_PX, colors.body);
    drawPoints(p.ctx, VIEW, pos.subarray(bob, bob + COORDS_PER_PARTICLE), BOB_PX, colors.body);
    drawPoints(p.ctx, VIEW, pos.subarray(0, COORDS_PER_PARTICLE), LINK_PX, colors.pin);
  };

  for (const p of panels) enableDrag(engine, p.ctx.canvas, VIEW, () => demoHandle(p));

  const controls = byId("controls", HTMLElement);
  select(controls, {
    label: "mass ratio",
    choices: MASS_RATIOS.map((r) => [r, `1:${r}`]),
    value: String(state.ratio),
    onChange: (v) => {
      state.ratio = Number(v);
      restart();
    },
  });
  slider(controls, {
    label: "links",
    min: OPTIONS.links.min,
    max: OPTIONS.links.max,
    value: state.links,
    onInput: (n) => {
      state.links = n;
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
  select(controls, {
    label: "impulse uses",
    choices: [["split", "split impulses"], ["classic", "classic Baumgarte"]],
    value: state.stab,
    onChange: (v) => {
      if (isStab(v)) state.stab = v;
      restart();
    },
  });
  select(controls, {
    label: "order",
    choices: Object.keys(ORDERS).map((o) => [o, o]),
    value: state.order,
    onChange: (v) => {
      if (isOrder(v)) state.order = v;
      applySettings();
    },
  });
  rateSlider(controls, state.rate, (hz) => {
    state.rate = hz;
    applySettings();
  });
  button(controls, { label: "reset", onClick: restart });

  runDemo(engine, hud, {
    panels,
    draw: (p) => drawPanel(p),
    particleColor: colors.body,
    maxFps,
    frame: (elapsed) => {
      let steps = 0;
      for (const p of panels) steps = engine.demo_advance(demoHandle(p), elapsed);
      const readings = panels.map((p) => {
        drawPanel(p);
        const demo = demoHandle(p);
        const err = engine.demo_constraint_error(demo);
        const gained = engine.demo_energy(demo) - p.e0;
        p.readout.textContent =
          `worst link off by ${(err * MM_PER_M).toFixed(2)} mm · energy ${gained >= 0 ? "+" : ""}${gained.toFixed(2)} J`;
        return { err, gained };
      });
      simTime += steps / state.rate;
      errorPlot.push(simTime, readings.map((r) => r.err));
      energyPlot.push(simTime, readings.map((r) => r.gained));
      errorPlot.draw();
      energyPlot.draw();
      return { steps, status: `1:${state.ratio}, ${state.links} links · t = ${simTime.toFixed(1)} s` };
    },
  });
} catch (err) {
  pageFailed(hud, err);
}
