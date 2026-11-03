// M4: a heavy bob on a light chain (Rust: engine::scenarios::chain),
// XPBD and sequential impulses side by side under the same settings, with
// pointer dragging in either panel.

import { loadEngine, positionsView, linksView } from "../../js/wasm.ts";
import { runLoop, RateMeter, MS_PER_SECOND } from "../../js/loop.ts";
import { View, clear, drawPoints, drawLinks, cssColor } from "../../js/canvas.ts";
import {
  COORDS_PER_PARTICLE, DEFAULT_RATE_HZ, ORDER_ALTERNATING, ORDER_FORWARD, ORDER_REVERSE, SCALAR_F64,
  SOLVER_IMPULSE, SOLVER_XPBD,
} from "../../js/abi.ts";
import { smokeMode, runSmoke, smokeError, errorText } from "../../js/smoke.ts";
import { byId } from "../../js/dom.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { LinePlot } from "../../js/plot.ts";
import { slider, select, button } from "../../js/controls.ts";
import { buildPanels, demoHandle } from "../../js/panels.ts";
import { enableDrag } from "../../js/drag.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";
import type { DemoHandle } from "../../js/engine";

const PANELS = [
  { code: SOLVER_XPBD, name: "XPBD", colorVar: "--series-1" },
  { code: SOLVER_IMPULSE, name: "impulse", colorVar: "--series-3" },
];

const ORDERS = { forward: ORDER_FORWARD, reverse: ORDER_REVERSE, alternating: ORDER_ALTERNATING };
type OrderName = keyof typeof ORDERS;
function isOrder(s: string): s is OrderName {
  return Object.hasOwn(ORDERS, s);
}

/** Bob-to-link mass ratios offered: the roadmap's 1:100, and around it. */
const MASS_RATIOS = ["1", "10", "100", "1000"];

const OPTIONS: {
  ratio: ChoiceOption; links: IntOption; substeps: IntOption; iterations: IntOption; order: ChoiceOption;
  rate: IntOption; fps: IntOption;
} = {
  ratio: { kind: "choice", values: MASS_RATIOS, default: "100", help: "bob mass / link mass" },
  // 10: engine::scenarios::CHAIN_LINKS.
  links: { kind: "int", min: 1, max: 40, default: 10, help: "links in the chain (1 m total)" },
  // 20: the substeps M4.4 measured the chain at (and both demos start with).
  substeps: { kind: "int", min: 1, max: 100, default: 20, help: "substeps per physics step" },
  iterations: { kind: "int", min: 1, max: 20, default: 1, help: "solver passes per substep" },
  order: { kind: "choice", values: Object.keys(ORDERS), default: "forward", help: "the order each pass visits the links in" },
  rate: { kind: "int", min: 1, max: 240, default: DEFAULT_RATE_HZ, help: "physics steps per second" },
  fps: { kind: "int", min: 1, max: 1000, default: Infinity, help: "cap the display rate to emulate a slower monitor" },
};

const PRESETS: [string, string][] = [
  ["1:100 (default)", ""],
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
  rate: readInt(params, "rate", OPTIONS.rate),
};
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = {
  background: cssColor(css, "--stage-bg"),
  pin: cssColor(css, "--star"),
  body: cssColor(css, "--particle"),
  grid: cssColor(css, "--grid"),
  text: cssColor(css, "--muted"),
};

const panels = buildPanels(byId("panels", HTMLElement), PANELS, css).map(({ cfg, ...base }) => ({
  ...cfg,
  ...base,
  demo: null as DemoHandle | null,
}));
type Panel = (typeof panels)[number];

const errorPlot = new LinePlot(byId("error", HTMLCanvasElement), {
  series: panels.map((p) => ({ label: p.name, color: p.color })),
  capacity: PLOT_SAMPLES,
  scale: "log",
  colors: { background: colors.background, grid: colors.grid, text: colors.text },
});

try {
  const engine = await loadEngine();
  let simTime = 0;

  const applySettings = () => {
    for (const p of panels) {
      const d = demoHandle(p);
      const statuses = [
        engine.demo_set_solver(d, p.code),
        engine.demo_set_substeps(d, state.substeps),
        engine.demo_set_iterations(d, state.iterations),
        engine.demo_set_order(d, ORDERS[state.order]),
        engine.demo_set_rate(d, state.rate),
      ];
      if (!statuses.every((s) => s === 1)) throw new Error("a setting was rejected");
    }
  };

  /** (Re)creates both chains with the current links and mass ratio. */
  const restart = () => {
    for (const p of panels) {
      if (p.demo !== null) engine.demo_free(p.demo);
      const demo = engine.demo_new_chain(SCALAR_F64, state.links, state.ratio);
      if (demo === 0) throw new Error("demo_new_chain returned null");
      p.demo = demo;
    }
    applySettings();
    errorPlot.clear();
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
    label: "order",
    choices: Object.keys(ORDERS).map((o) => [o, o]),
    value: state.order,
    onChange: (v) => {
      if (isOrder(v)) state.order = v;
      applySettings();
    },
  });
  slider(controls, {
    label: "rate",
    min: OPTIONS.rate.min,
    max: OPTIONS.rate.max,
    value: state.rate,
    format: (hz) => `${hz} Hz · dt ${(MS_PER_SECOND / hz).toFixed(1)} ms`,
    onInput: (hz) => {
      state.rate = hz;
      applySettings();
    },
  });
  button(controls, { label: "reset", onClick: restart });

  if (smokeMode) {
    runSmoke(
      engine,
      panels.map((p) => ({ demo: demoHandle(p), ctx: p.ctx, draw: () => drawPanel(p) })),
      colors.body,
      { checkEnergy: true },
    );
  } else {
    const fps = new RateMeter();
    const sps = new RateMeter();
    runLoop((elapsed, now) => {
      let steps = 0;
      for (const p of panels) steps = engine.demo_advance(demoHandle(p), elapsed);
      const errors = panels.map((p) => {
        drawPanel(p);
        const err = engine.demo_constraint_error(demoHandle(p));
        p.readout.textContent = `worst link off by ${(err * MM_PER_M).toFixed(2)} mm`;
        return err;
      });
      simTime += steps / state.rate;
      errorPlot.push(simTime, errors);
      errorPlot.draw();
      fps.add(now);
      sps.add(now, steps);
      hud.textContent =
        `display ${fps.perSecond} fps · physics ${sps.perSecond} steps/s · 1:${state.ratio}, ` +
        `${state.links} links · t = ${simTime.toFixed(1)} s` +
        (Number.isFinite(maxFps) ? ` · capped at ${maxFps} fps` : "");
    }, { maxFps });
  }
} catch (err) {
  hud.textContent = `error: ${errorText(err)}`;
  smokeError(err);
  throw err;
}
