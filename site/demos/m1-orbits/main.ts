// M1: why integrator choice matters. One star–planet orbit (Rust:
// engine::scenarios::orbit) per panel, each stepped by a different
// integrator at the same rate, plus their energy errors on one plot.

import { loadEngine, positionsView } from "../../js/wasm.ts";
import { runLoop, RateMeter, MS_PER_SECOND } from "../../js/loop.ts";
import { View, clear, drawPoints, cssColor } from "../../js/canvas.ts";
import {
  COORDS_PER_PARTICLE, DEFAULT_RATE_HZ, DEMO_ORBIT, INTEGRATOR_EXPLICIT_EULER, INTEGRATOR_SYMPLECTIC_EULER,
  INTEGRATOR_VELOCITY_VERLET,
} from "../../js/abi.ts";
import { SCALAR_CODES, isScalar, readScalar } from "../../js/scalars.ts";
import type { ScalarName } from "../../js/scalars.ts";
import { buildPanels, demoHandle } from "../../js/panels.ts";
import { smokeMode, runSmoke, smokeError, errorText } from "../../js/smoke.ts";
import { byId } from "../../js/dom.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { LinePlot } from "../../js/plot.ts";
import { Trail } from "../../js/trail.ts";
import { slider, select, button } from "../../js/controls.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";
import type { DemoHandle } from "../../js/engine";

/** The three panels: integrator code, display name, and the CSS variable
 *  holding its color (title, trail, plot line). */
const PANELS = [
  { code: INTEGRATOR_EXPLICIT_EULER, name: "explicit Euler", colorVar: "--series-1" },
  { code: INTEGRATOR_SYMPLECTIC_EULER, name: "symplectic Euler", colorVar: "--series-2" },
  { code: INTEGRATOR_VELOCITY_VERLET, name: "velocity Verlet", colorVar: "--series-3" },
];

const OPTIONS: { scalar: ChoiceOption; rate: IntOption; scale: ChoiceOption; fps: IntOption } = {
  scalar: { kind: "choice", values: Object.keys(SCALAR_CODES), default: "f64", help: "engine number type (f32 shows Verlet hitting f32's rounding floor)" },
  rate: { kind: "int", min: 1, max: 240, default: DEFAULT_RATE_HZ, help: "physics steps per second; dt = 1 / rate" },
  scale: { kind: "choice", values: ["log", "linear"], default: "log", help: "energy plot's y axis" },
  fps: { kind: "int", min: 1, max: 1000, default: Infinity, help: "cap the display rate to emulate a slower monitor" },
};

const PRESETS: [string, string][] = [
  ["default", ""],
  ["f32", "?scalar=f32"],
  ["20 Hz", "?rate=20"],
  ["10 Hz (precession)", "?rate=10"],
  ["4 Hz", "?rate=4"],
  ["linear plot", "?scale=linear"],
];

/** Star and planet squares, trail width, CSS pixels. */
const STAR_PX = 9;
const PLANET_PX = 5;
const TRAIL_WIDTH_PX = 1.5;
/** Trail length in frames: about 1.3 orbits at 60 fps (period ≈ 3 s). */
const TRAIL_POINTS = 240;
/** Plot history in frames: 30 s at 60 fps. */
const PLOT_SAMPLES = 1800;

/** ±3 m around the center of mass: the 2 m orbit with margin, so explicit
 *  Euler visibly spirals out of frame. */
const VIEW = new View({ xMin: -3, xMax: 3, yMin: -3, yMax: 3 });

const params = new URLSearchParams(location.search);
const state: { scalar: ScalarName; rate: number } = {
  scalar: readScalar(params, OPTIONS.scalar),
  rate: readInt(params, "rate", OPTIONS.rate),
};
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = {
  background: cssColor(css, "--stage-bg"),
  star: cssColor(css, "--star"),
  planet: cssColor(css, "--particle"),
  grid: cssColor(css, "--grid"),
  text: cssColor(css, "--muted"),
};

// Panel markup, generated from PANELS so the three stay identical.
const panels = buildPanels(byId("panels", HTMLElement), PANELS, css).map(({ cfg, ...base }) => ({
  ...cfg,
  ...base,
  trail: new Trail(TRAIL_POINTS),
  demo: null as DemoHandle | null,
  /** Energy at the start: the reference for ΔE/E. */
  e0: 0,
}));

type Panel = (typeof panels)[number];

const plot = new LinePlot(byId("plot", HTMLCanvasElement), {
  series: panels.map((p) => ({ label: p.name, color: p.color })),
  capacity: PLOT_SAMPLES,
  scale: readChoice(params, "scale", OPTIONS.scale) === "linear" ? "linear" : "log",
  colors: { background: colors.background, grid: colors.grid, text: colors.text },
});

try {
  const engine = await loadEngine();
  /** Simulated seconds since the last (re)start. */
  let simTime = 0;

  /** (Re)creates all three demos with the current scalar and rate. */
  const restart = () => {
    for (const p of panels) {
      if (p.demo !== null) engine.demo_free(p.demo);
      const demo = engine.demo_new(DEMO_ORBIT, SCALAR_CODES[state.scalar], 0, 0);
      if (demo === 0) throw new Error("demo_new returned null");
      engine.demo_set_integrator(demo, p.code);
      engine.demo_set_rate(demo, state.rate);
      p.demo = demo;
      p.e0 = engine.demo_energy(demo);
      p.trail.clear();
    }
    plot.clear();
    simTime = 0;
  };
  restart();

  /** `pos`: star then planet, interleaved. */
  const drawPanel = (p: Panel, pos: Float32Array): void => {
    clear(p.ctx, colors.background);
    VIEW.apply(p.ctx);
    p.trail.draw(p.ctx, VIEW, p.color, TRAIL_WIDTH_PX);
    drawPoints(p.ctx, VIEW, pos.subarray(0, COORDS_PER_PARTICLE), STAR_PX, colors.star);
    drawPoints(p.ctx, VIEW, pos.subarray(COORDS_PER_PARTICLE), PLANET_PX, colors.planet);
  };

  // Controls.
  const controls = byId("controls", HTMLElement);
  slider(controls, {
    label: "rate",
    min: OPTIONS.rate.min,
    max: OPTIONS.rate.max,
    value: state.rate,
    format: (hz) => `${hz} Hz · dt ${(MS_PER_SECOND / hz).toFixed(1)} ms`,
    onInput: (hz) => {
      state.rate = hz;
      for (const p of panels) engine.demo_set_rate(demoHandle(p), hz);
    },
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
  select(controls, {
    label: "plot",
    choices: [["log", "log |ΔE/E|"], ["linear", "linear ΔE/E"]],
    value: plot.scale,
    onChange: (v) => {
      plot.scale = v === "linear" ? "linear" : "log";
    },
  });
  button(controls, { label: "reset", onClick: restart });

  if (smokeMode) {
    runSmoke(
      engine,
      panels.map((p) => ({
        demo: demoHandle(p),
        ctx: p.ctx,
        draw: () => drawPanel(p, positionsView(engine, demoHandle(p))),
      })),
      colors.planet,
      { checkEnergy: true },
    );
  } else {
    const fps = new RateMeter();
    const sps = new RateMeter();
    runLoop((elapsed, now) => {
      let steps = 0;
      const errors = panels.map((p) => {
        const demo = demoHandle(p);
        // Same rate and elapsed time, so every panel takes the same steps.
        steps = engine.demo_advance(demo, elapsed);
        const pos = positionsView(engine, demo);
        p.trail.push(pos);
        drawPanel(p, pos);
        const err = (engine.demo_energy(demo) - p.e0) / Math.abs(p.e0);
        p.readout.textContent = `ΔE/E ${err.toExponential(2)}`;
        return err;
      });
      simTime += steps / state.rate;
      plot.push(simTime, errors);
      plot.draw();
      fps.add(now);
      sps.add(now, steps);
      hud.textContent =
        `display ${fps.perSecond} fps · physics ${sps.perSecond} steps/s · ` +
        `${state.scalar} · t = ${simTime.toFixed(1)} s` +
        (Number.isFinite(maxFps) ? ` · capped at ${maxFps} fps` : "");
    }, { maxFps });
  }
} catch (err) {
  hud.textContent = `error: ${errorText(err)}`;
  smokeError(err);
  throw err;
}
