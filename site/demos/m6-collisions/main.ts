// M6: balls colliding (Rust: engine::scenarios::{ball_box, break_shot}),
// XPBD and impulse side by side; the box's energy, the break's momentum,
// and the broadphase overlay (docs/08-collision.md).

import { linksView, loadEngine, pairsView, positionsView, radiiOf } from "../../js/wasm.ts";
import { View, clear, cssColor, devicePx, drawDisks, drawGrid, drawLinks } from "../../js/canvas.ts";
import { MAX_BOX_BALLS, MAX_BREAK_GAP, SCALAR_F64, SOLVER_IMPULSE, SOLVER_XPBD } from "../../js/abi.ts";
import { byId } from "../../js/dom.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { LinePlot } from "../../js/plot.ts";
import { button, checkbox, select, slider } from "../../js/controls.ts";
import { buildPanels, demoHandle, panelSeries, replaceDemo, requireAccepted } from "../../js/panels.ts";
import { FPS_OPTION, RATE_OPTION, pageFailed, plotColors, rateSlider, runDemo } from "../../js/page.ts";
import { enableDrag } from "../../js/drag.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";
import type { DemoHandle } from "../../js/engine";

const PANELS = [
  { solver: SOLVER_XPBD, name: "XPBD", colorVar: "--series-1" },
  { solver: SOLVER_IMPULSE, name: "impulse", colorVar: "--series-3" },
];

type Scene = "box" | "break";
const SCENES: [Scene, string][] = [["box", "box (gravity, walls)"], ["break", "break (free space)"]];

/** Restitution in twentieths: 0, 0.05, … 1. `i / 20`, so values print
 *  as "0.85", not "0.8500000000000001". */
const E_STEPS = 20;
const E_VALUES = Array.from({ length: E_STEPS + 1 }, (_, i) => String(i / E_STEPS));
/** The rack's gap in millimeters, up to abi.ts MAX_BREAK_GAP. */
const MM_PER_M = 1000;

const OPTIONS: {
  scene: ChoiceOption; e: ChoiceOption; balls: IntOption; gap_mm: IntOption; substeps: IntOption;
  overlay: ChoiceOption; rate: IntOption; fps: IntOption;
} = {
  scene: { kind: "choice", values: SCENES.map(([s]) => s), default: "box", help: "the box (energy) or the break (momentum)" },
  e: { kind: "choice", values: E_VALUES, default: "1", help: "restitution: 1 elastic, 0 perfectly inelastic" },
  // 20: engine::scenarios::BOX_BALLS.
  balls: { kind: "int", min: 1, max: MAX_BOX_BALLS, default: 20, help: "balls in the box" },
  gap_mm: { kind: "int", min: 0, max: MAX_BREAK_GAP * MM_PER_M, default: 0, help: "the rack's gap, mm (0: touching)" },
  // 10: the setting tests/impacts.rs measured (crates/web demo/collisions.rs).
  substeps: { kind: "int", min: 1, max: 50, default: 10, help: "substeps per physics step" },
  overlay: { kind: "choice", values: ["off", "on"], default: "off", help: "draw the broadphase grid and its candidate pairs" },
  rate: RATE_OPTION,
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["the box, elastic (default)", ""],
  ["the box runs down, e = 0.8", "?e=0.8"],
  ["a full box with the broadphase", "?balls=60&overlay=on"],
  ["the break, touching", "?scene=break"],
  ["the break, 5 mm gaps", "?scene=break&gap_mm=5"],
  ["the break, inelastic", "?scene=break&e=0"],
];

/** Wall and pair widths, CSS pixels. */
const WALL_WIDTH_PX = 2;
const GRID_WIDTH_PX = 1;
const PAIR_WIDTH_PX = 1;
/** engine::scenarios::BOX_HALF_WIDTH and BOX_HEIGHT, m. */
const BOX_HALF_WIDTH = 1;
const BOX_HEIGHT = 2;
/** Plot history in frames: 30 s at 60 fps. */
const PLOT_SAMPLES = 1800;
/** The seed every box starts from (both panels alike). */
const SEED = 1;

const VIEWS: Record<Scene, View> = {
  box: new View({ xMin: -1.15, xMax: 1.15, yMin: -0.1, yMax: 2.1 }),
  // The cue starts at −0.5 m; the rack spreads out over the next seconds.
  break: new View({ xMin: -1.2, xMax: 1.6, yMin: -1, yMax: 1 }),
};

const params = new URLSearchParams(location.search);
const state = {
  scene: readChoice(params, "scene", OPTIONS.scene) as Scene,
  e: Number(readChoice(params, "e", OPTIONS.e)),
  balls: readInt(params, "balls", OPTIONS.balls),
  gap: readInt(params, "gap_mm", OPTIONS.gap_mm) / MM_PER_M,
  substeps: readInt(params, "substeps", OPTIONS.substeps),
  overlay: readChoice(params, "overlay", OPTIONS.overlay) === "on",
  rate: readInt(params, "rate", OPTIONS.rate),
};
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = {
  ...plotColors(css),
  ball: cssColor(css, "--particle"),
  wall: cssColor(css, "--muted"),
};

const panels = buildPanels(byId("panels", HTMLElement), PANELS, css).map((p) => ({
  ...p,
  radii: new Float64Array(0),
  /** Detaches the drag: re-attached per scene, whose view it converts by. */
  undrag: () => {},
  e0: 0,
  p0: [0, 0] as [number, number],
}));
type Panel = (typeof panels)[number];

/** The box plots energy over its start (linear); the break, how far the
 *  momentum has drifted from its start (log: it's rounding). */
const plots: Record<Scene, LinePlot> = {
  box: new LinePlot(byId("plot", HTMLCanvasElement), {
    series: panelSeries(panels), capacity: PLOT_SAMPLES, colors,
  }),
  break: new LinePlot(byId("plot", HTMLCanvasElement), {
    series: panelSeries(panels), capacity: PLOT_SAMPLES, scale: "log", colors,
  }),
};
const PLOT_TEXT: Record<Scene, [string, string]> = {
  box: ["Energy", "Total energy (kinetic + gravity) over its start. Flat at e = 1; below 1 it settles near a quarter, the balls' resting potential energy."],
  break: ["Momentum drift", "|p − p₀| in kg·m/s (log scale), against a start of 5 kg·m/s: rounding, about 1e-15. Walls would push; free space can't."],
};

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

  const momentum = (d: DemoHandle): [number, number] =>
    [engine.demo_momentum_x(d), engine.demo_momentum_y(d)];

  /** (Re)creates both panels' scenes with the current settings. */
  const restart = () => {
    for (const p of panels) {
      const created = state.scene === "box"
        ? engine.demo_new_ball_box(SCALAR_F64, state.balls, SEED)
        : engine.demo_new_break_shot(SCALAR_F64, state.gap);
      const demo = replaceDemo(engine, p.demo, created, `demo_new_${state.scene}`);
      Object.assign(p, { demo, radii: radiiOf(engine, demo), e0: engine.demo_energy(demo), p0: momentum(demo) });
      p.undrag();
      p.undrag = enableDrag(engine, p.ctx.canvas, VIEWS[state.scene], () => demoHandle(p));
    }
    applySettings();
    const [title, note] = PLOT_TEXT[state.scene];
    byId("plot-title", HTMLElement).textContent = title;
    byId("plot-note", HTMLElement).textContent = note;
    plots[state.scene].clear();
    simTime = 0;
  };
  restart();

  const drift = (p: Panel): number => {
    const [px, py] = momentum(demoHandle(p));
    return Math.hypot(px - p.p0[0], py - p.p0[1]);
  };

  const drawPanel = (p: Panel): void => {
    const demo = demoHandle(p);
    const view = VIEWS[state.scene];
    const pos = positionsView(engine, demo);
    clear(p.ctx, colors.background);
    view.apply(p.ctx);
    if (state.overlay) {
      const cell = engine.demo_update_pairs(demo);
      drawGrid(p.ctx, view, cell, GRID_WIDTH_PX, colors.grid);
      drawLinks(p.ctx, view, pos, pairsView(engine, demo), PAIR_WIDTH_PX, p.color);
    }
    if (state.scene === "box") drawBox(p.ctx, view);
    // The drag's rod, while a ball is held (no other constraints here).
    drawLinks(p.ctx, view, pos, linksView(engine, demo), WALL_WIDTH_PX, colors.wall);
    drawDisks(p.ctx, pos, p.radii, colors.ball);
  };

  const drawBox = (ctx: CanvasRenderingContext2D, view: View): void => {
    ctx.strokeStyle = colors.wall;
    ctx.lineWidth = devicePx(WALL_WIDTH_PX) / view.scale(ctx.canvas);
    ctx.strokeRect(-BOX_HALF_WIDTH, 0, 2 * BOX_HALF_WIDTH, BOX_HEIGHT);
  };

  const readout = (p: Panel): string => {
    const d = demoHandle(p);
    const pairs = state.overlay ? ` · ${engine.demo_pairs_len(d) / 2} candidate pairs` : "";
    if (state.scene === "box") {
      return `energy ${(engine.demo_energy(d) / p.e0).toFixed(4)} of its start${pairs}`;
    }
    const kept = engine.demo_energy(d) / p.e0;
    return `|p − p₀| ${drift(p).toExponential(1)} kg·m/s · energy ${kept.toFixed(6)} of its start${pairs}`;
  };

  const controls = byId("controls", HTMLElement);
  select(controls, {
    label: "scene",
    choices: SCENES,
    value: state.scene,
    onChange: (s) => {
      state.scene = s as Scene;
      restart();
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
  slider(controls, {
    label: "box balls",
    min: OPTIONS.balls.min,
    max: OPTIONS.balls.max,
    value: state.balls,
    onInput: (n) => {
      state.balls = n;
      if (state.scene === "box") restart();
    },
  });
  slider(controls, {
    label: "rack gap",
    min: OPTIONS.gap_mm.min,
    max: OPTIONS.gap_mm.max,
    value: state.gap * MM_PER_M,
    format: (mm) => (mm === 0 ? "touching" : `${mm} mm`),
    onInput: (mm) => {
      state.gap = mm / MM_PER_M;
      if (state.scene === "break") restart();
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
  rateSlider(controls, state.rate, (hz) => {
    state.rate = hz;
    applySettings();
  });
  checkbox(controls, {
    label: "broadphase",
    checked: state.overlay,
    onChange: (on) => {
      state.overlay = on;
    },
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
      const values = panels.map((p) =>
        state.scene === "box" ? engine.demo_energy(demoHandle(p)) / p.e0 : drift(p));
      plots[state.scene].push(simTime, values);
      plots[state.scene].draw();
      const what = state.scene === "box" ? `${state.balls} balls` : "the break";
      return { steps, status: `${what}, e = ${state.e.toFixed(2)}, ${state.substeps} substeps · t = ${simTime.toFixed(1)} s` };
    },
  });
} catch (err) {
  pageFailed(hud, err);
}
