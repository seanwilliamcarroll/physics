// M6: Newton's cradle (Rust: engine::scenarios::cradle), XPBD and
// impulse side by side under the same substeps and restitution
// (docs/08-collision.md, "Newton's cradle").

import { linksView, loadEngine, positionsView, radiiOf } from "../../js/wasm.ts";
import { View, clear, cssColor, drawDisks, drawLinks, drawPoints } from "../../js/canvas.ts";
import { MAX_CRADLE_BALLS, SCALAR_F64, SOLVER_IMPULSE, SOLVER_XPBD } from "../../js/abi.ts";
import { byId } from "../../js/dom.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { LinePlot } from "../../js/plot.ts";
import { button, slider } from "../../js/controls.ts";
import { buildPanels, demoHandle, panelSeries, replaceDemo, requireAccepted } from "../../js/panels.ts";
import { FPS_OPTION, RATE_OPTION, pageFailed, plotColors, rateSlider, runDemo } from "../../js/page.ts";
import { enableDrag } from "../../js/drag.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";

const PANELS = [
  { solver: SOLVER_XPBD, name: "XPBD", colorVar: "--series-1" },
  { solver: SOLVER_IMPULSE, name: "impulse", colorVar: "--series-3" },
];

/** Restitution in twentieths, as the collisions page. */
const E_STEPS = 20;
const E_VALUES = Array.from({ length: E_STEPS + 1 }, (_, i) => String(i / E_STEPS));

const OPTIONS: {
  balls: IntOption; pulled: IntOption; substeps: IntOption; e: ChoiceOption; rate: IntOption; fps: IntOption;
} = {
  // 5: engine::scenarios::CRADLE_BALLS.
  balls: { kind: "int", min: 2, max: MAX_CRADLE_BALLS, default: 5, help: "balls in the row" },
  pulled: { kind: "int", min: 1, max: MAX_CRADLE_BALLS, default: 1, help: "balls pulled back together (at most all)" },
  // 10: the setting tests/impacts.rs measured.
  substeps: { kind: "int", min: 1, max: 50, default: 10, help: "substeps per physics step (XPBD's shortfall ~ 1 / substeps)" },
  e: { kind: "choice", values: E_VALUES, default: "1", help: "restitution: 1 elastic, 0 perfectly inelastic" },
  rate: RATE_OPTION,
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["one ball (default)", ""],
  ["two balls", "?pulled=2"],
  ["one substep: XPBD 12% short", "?substeps=1"],
  ["40 substeps", "?substeps=40"],
  ["inelastic: the row moves as one", "?e=0"],
  ["eight balls, three pulled", "?balls=8&pulled=3"],
];

/** Pin squares and rod widths, CSS pixels. */
const PIN_PX = 4;
const ROD_WIDTH_PX = 1.5;
/** Plot history in frames: 30 s at 60 fps. */
const PLOT_SAMPLES = 1800;
/** Rod errors read out in millimeters. */
const MM_PER_M = 1000;

/** Pins at y = 0, rods 0.5 m (engine::scenarios::CRADLE_LENGTH); eight
 *  balls span ±0.4 m, and a pulled ball swings 0.3 m out from its pin. */
const VIEW = new View({ xMin: -0.75, xMax: 0.75, yMin: -0.65, yMax: 0.15 });

const params = new URLSearchParams(location.search);
const state = {
  balls: readInt(params, "balls", OPTIONS.balls),
  pulled: readInt(params, "pulled", OPTIONS.pulled),
  substeps: readInt(params, "substeps", OPTIONS.substeps),
  e: Number(readChoice(params, "e", OPTIONS.e)),
  rate: readInt(params, "rate", OPTIONS.rate),
};
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = {
  ...plotColors(css),
  ball: cssColor(css, "--particle"),
  pin: cssColor(css, "--muted"),
};

const panels = buildPanels(byId("panels", HTMLElement), PANELS, css).map((p) => ({
  ...p,
  radii: new Float64Array(0),
  e0: 0,
}));
type Panel = (typeof panels)[number];

const energyPlot = new LinePlot(byId("energy", HTMLCanvasElement), {
  series: panelSeries(panels),
  capacity: PLOT_SAMPLES,
  colors,
});

try {
  const engine = await loadEngine();
  let simTime = 0;

  const applySettings = () => {
    for (const p of panels) {
      const d = demoHandle(p);
      requireAccepted([
        engine.demo_set_solver(d, p.solver),
        engine.demo_set_substeps(d, state.substeps),
        engine.demo_set_rate(d, state.rate),
        engine.demo_set_restitution(d, state.e),
      ]);
    }
  };

  /** (Re)creates both cradles with the current settings. */
  const restart = () => {
    for (const p of panels) {
      const created = engine.demo_new_cradle(SCALAR_F64, state.balls, state.pulled);
      const demo = replaceDemo(engine, p.demo, created, "demo_new_cradle");
      Object.assign(p, { demo, radii: radiiOf(engine, demo), e0: engine.demo_energy(demo) });
    }
    applySettings();
    energyPlot.clear();
    simTime = 0;
  };
  restart();

  const drawPanel = (p: Panel): void => {
    const demo = demoHandle(p);
    const pos = positionsView(engine, demo);
    clear(p.ctx, colors.background);
    VIEW.apply(p.ctx);
    drawLinks(p.ctx, VIEW, pos, linksView(engine, demo), ROD_WIDTH_PX, p.color);
    // Pins are the even particles, radius 0: drawDisks skips them.
    drawPoints(p.ctx, VIEW, pos.filter((_, i) => i % 4 < 2), PIN_PX, colors.pin);
    drawDisks(p.ctx, pos, p.radii, colors.ball);
  };

  const energy = (p: Panel): number => engine.demo_energy(demoHandle(p)) / p.e0;

  const readout = (p: Panel): string => {
    const rod = engine.demo_constraint_error(demoHandle(p)) * MM_PER_M;
    return `energy ${energy(p).toFixed(4)} of its start · rod error ${rod.toFixed(2)} mm`;
  };

  for (const p of panels) enableDrag(engine, p.ctx.canvas, VIEW, () => demoHandle(p));

  const controls = byId("controls", HTMLElement);
  slider(controls, {
    label: "balls",
    min: OPTIONS.balls.min,
    max: OPTIONS.balls.max,
    value: state.balls,
    onInput: (n) => {
      state.balls = n;
      restart();
    },
  });
  slider(controls, {
    label: "pulled",
    min: OPTIONS.pulled.min,
    max: OPTIONS.pulled.max,
    value: state.pulled,
    format: (n) => (n >= state.balls ? "all" : String(n)),
    onInput: (n) => {
      state.pulled = n;
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
    label: "restitution",
    min: 0,
    max: 1,
    step: 1 / E_STEPS,
    value: state.e,
    format: (e) => `e = ${e.toFixed(2)}`,
    onInput: (e) => {
      state.e = e;
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
    particleColor: colors.ball,
    maxFps,
    frame: (elapsed) => {
      let steps = 0;
      for (const p of panels) steps = engine.demo_advance(demoHandle(p), elapsed);
      for (const p of panels) {
        drawPanel(p);
        p.readout.textContent = readout(p);
      }
      simTime += steps / state.rate;
      energyPlot.push(simTime, panels.map(energy));
      energyPlot.draw();
      const status = `${state.balls} balls, ${Math.min(state.pulled, state.balls)} pulled, ` +
        `${state.substeps} substeps, e = ${state.e.toFixed(2)} · t = ${simTime.toFixed(1)} s`;
      return { steps, status };
    },
  });
} catch (err) {
  pageFailed(hud, err);
}
