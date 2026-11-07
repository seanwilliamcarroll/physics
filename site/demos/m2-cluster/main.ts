// M2: many bodies under mutual gravity, and how float precision diverges.
// The same seeded scene (Rust: engine::scenarios::{cluster, disk, collapse})
// runs in f32 and in f64 side by side; plots show their divergence and
// energy errors, and a table shows step cost growing with N.

import { loadEngine, positionsView } from "../../js/wasm.ts";
import { Smoothed } from "../../js/loop.ts";
import { View, clear, drawPoints, cssColor } from "../../js/canvas.ts";
import { DEMO_CLUSTER, DEMO_COLLAPSE, DEMO_DISK, MAX_GRAVITY_BODIES, SCALAR_F32, SCALAR_F64 } from "../../js/abi.ts";
import { buildPanels, demoHandle, panelSeries, replaceDemo, requireAccepted } from "../../js/panels.ts";
import { FPS_OPTION, RATE_OPTION, pageFailed, plotColors, rateSlider, runDemo } from "../../js/page.ts";
import { byId } from "../../js/dom.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { LinePlot } from "../../js/plot.ts";
import { slider, select, button } from "../../js/controls.ts";
import { rmsDistance } from "../../js/divergence.ts";
import { CostTable, costTableHtml, timeMs } from "../../js/perf.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";

/** Scene names on the URL and in the menu → abi.ts codes. */
const SCENES = { disk: DEMO_DISK, cluster: DEMO_CLUSTER, collapse: DEMO_COLLAPSE };
type SceneName = keyof typeof SCENES;
function isScene(s: string): s is SceneName {
  return Object.hasOwn(SCENES, s);
}

/** Body counts offered: powers of two, so the cost table's rows double. 4096
 *  costs ~17 ms per step per panel natively (M2.3: ~2 ns per pair). */
const N_CHOICES = [16, 64, 128, 256, 512, 1024, 2048, 4096];

/** Softening slider range, m. 0 is allowed on purpose (pure 1/r²); 0.5 is
 *  a quarter of the scene radius, where gravity is visibly mushy. The
 *  scenes' own default is CLUSTER_SOFTENING (0.1 m). */
const SOFTENING_MAX_M = 0.5;
const SOFTENING_STEP_M = 0.005;
const SOFTENING_DEFAULT_MM = 100;
const MM_PER_M = 1000;

/** Barnes–Hut opening-angle slider. 0 is exact (direct summation through
 *  the tree); Barnes & Hut used about 1; past 1.5 the approximation is
 *  crude (docs/barnes-hut.md: max error / RMS |a| was 0.3 at θ = 1). The
 *  default 0.5 is a common accuracy/cost compromise. */
const THETA_MAX = 1.5;
const THETA_STEP = 0.05;
const THETA_DEFAULT_PCT = 50;
const PCT = 100;

/** The panels: scalar code, label, CSS color variable, and whether it runs
 *  Barnes–Hut. f64 (index REFERENCE) is the reference the others are
 *  compared against. */
const PANELS = [
  { code: SCALAR_F32, name: "f32", colorVar: "--series-1", barnesHut: false },
  { code: SCALAR_F64, name: "f64", colorVar: "--series-3", barnesHut: false },
  { code: SCALAR_F64, name: "f64 Barnes–Hut", colorVar: "--series-2", barnesHut: true },
];
const REFERENCE = 1;

const OPTIONS: {
  scene: ChoiceOption; n: IntOption; seed: IntOption; eps_mm: IntOption; theta_pct: IntOption;
  rate: IntOption; fps: IntOption;
} = {
  scene: { kind: "choice", values: Object.keys(SCENES), default: "disk", help: "starting configuration" },
  n: { kind: "int", min: 2, max: MAX_GRAVITY_BODIES, default: 256, help: "body count (the menu offers powers of two)" },
  seed: { kind: "int", min: 0, max: 2 ** 32 - 1, default: 1, help: "scene randomness; same seed, same scene" },
  eps_mm: { kind: "int", min: 0, max: SOFTENING_MAX_M * MM_PER_M, default: SOFTENING_DEFAULT_MM, help: "softening ε in millimeters; 0 = pure 1/r²" },
  theta_pct: { kind: "int", min: 0, max: THETA_MAX * PCT, default: THETA_DEFAULT_PCT, help: "Barnes–Hut opening angle θ × 100; 0 = exact" },
  rate: RATE_OPTION,
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["default", ""],
  ["cluster", "?scene=cluster"],
  ["collapse", "?scene=collapse"],
  ["no softening", "?scene=collapse&eps_mm=0"],
  ["1024 bodies", "?n=1024"],
  ["4096 bodies", "?n=4096"],
  ["crude Barnes–Hut", "?n=1024&theta_pct=150"],
  ["10 Hz", "?rate=10"],
];

/** Body squares, CSS pixels. */
const BODY_PX = 3;
/** How often the cost table is rebuilt: twice a second is enough to read,
 *  and rebuilding DOM every frame would show up in the ms/draw it reports
 *  next to. */
const COST_REFRESH_MS = 500;
/** Plot history in frames: 30 s at 60 fps. */
const PLOT_SAMPLES = 1800;

/** ±3 m: the 2 m scenes with margin for bodies flung outward. */
const VIEW = new View({ xMin: -3, xMax: 3, yMin: -3, yMax: 3 });

const params = new URLSearchParams(location.search);
const sceneParam = readChoice(params, "scene", OPTIONS.scene);
const state = {
  scene: (isScene(sceneParam) ? sceneParam : "disk") as SceneName,
  n: readInt(params, "n", OPTIONS.n),
  seed: readInt(params, "seed", OPTIONS.seed),
  softening: readInt(params, "eps_mm", OPTIONS.eps_mm) / MM_PER_M,
  theta: readInt(params, "theta_pct", OPTIONS.theta_pct) / PCT,
  rate: readInt(params, "rate", OPTIONS.rate),
};
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const costEl = byId("cost", HTMLElement);
const css = document.documentElement;
const colors = { ...plotColors(css), body: cssColor(css, "--particle") };

const panels = buildPanels(byId("panels", HTMLElement), PANELS, css).map((p) => ({
  ...p,
  /** Energy at the start (or the last softening change): ΔE/E's reference. */
  e0: 0,
  msPerStep: new Smoothed(),
  msPerDraw: new Smoothed(),
}));
type Panel = (typeof panels)[number];

/** Divergence series: every panel except the reference, against it. */
const compared = panels.filter((_, i) => i !== REFERENCE);
const divergencePlot = new LinePlot(byId("divergence", HTMLCanvasElement), {
  series: compared.map((p) => ({ label: `${p.name} vs f64`, color: p.color })),
  capacity: PLOT_SAMPLES,
  scale: "log",
  colors,
});
const energyPlot = new LinePlot(byId("energy", HTMLCanvasElement), {
  series: panelSeries(panels),
  capacity: PLOT_SAMPLES,
  scale: "log",
  colors,
});
const cost = new CostTable(panels.length);

try {
  const engine = await loadEngine();
  /** Simulated seconds since the last (re)start. */
  let simTime = 0;

  const resetEnergy = () => {
    for (const p of panels) p.e0 = engine.demo_energy(demoHandle(p));
    energyPlot.clear();
  };

  /** (Re)creates both demos from the current scene, N, seed, ε, rate. */
  const restart = () => {
    for (const p of panels) {
      const demo = replaceDemo(engine, p.demo, engine.demo_new(SCENES[state.scene], p.code, state.n, state.seed), "demo_new");
      requireAccepted([
        engine.demo_set_softening(demo, state.softening),
        p.barnesHut ? engine.demo_set_theta(demo, state.theta) : 1,
        engine.demo_set_rate(demo, state.rate),
      ]);
      p.demo = demo;
    }
    resetEnergy();
    divergencePlot.clear();
    simTime = 0;
  };
  restart();

  const drawPanel = (p: Panel, pos: Float32Array): void => {
    clear(p.ctx, colors.background);
    VIEW.apply(p.ctx);
    drawPoints(p.ctx, VIEW, pos, BODY_PX, colors.body);
  };

  // Controls.
  const controls = byId("controls", HTMLElement);
  select(controls, {
    label: "scene",
    choices: Object.keys(SCENES).map((s) => [s, s]),
    value: state.scene,
    onChange: (v) => {
      if (isScene(v)) state.scene = v;
      restart();
    },
  });
  // The URL may ask for any N in range; the menu offers powers of two plus
  // that value if it isn't one.
  const nChoices = [...new Set([...N_CHOICES, state.n])].sort((a, b) => a - b);
  select(controls, {
    label: "N",
    choices: nChoices.map((n) => [String(n), n.toLocaleString()]),
    value: String(state.n),
    onChange: (v) => {
      state.n = Number(v);
      restart();
    },
  });
  slider(controls, {
    label: "softening",
    min: 0,
    max: SOFTENING_MAX_M,
    step: SOFTENING_STEP_M,
    value: state.softening,
    format: (m) => `ε ${m.toFixed(3)} m`,
    onInput: (m) => {
      state.softening = m;
      for (const p of panels) engine.demo_set_softening(demoHandle(p), m);
      resetEnergy();
    },
  });
  slider(controls, {
    label: "Barnes–Hut",
    min: 0,
    max: THETA_MAX,
    step: THETA_STEP,
    value: state.theta,
    format: (t) => `θ ${t.toFixed(2)}`,
    onInput: (t) => {
      state.theta = t;
      for (const p of panels) if (p.barnesHut) engine.demo_set_theta(demoHandle(p), t);
    },
  });
  rateSlider(controls, state.rate, (hz) => {
    state.rate = hz;
    for (const p of panels) engine.demo_set_rate(demoHandle(p), hz);
  });
  button(controls, { label: "reset", onClick: restart });

  let costShownAt = -Infinity;
  runDemo(engine, hud, {
    panels,
    draw: (p) => drawPanel(p, positionsView(engine, demoHandle(p))),
    particleColor: colors.body,
    maxFps,
    frame: (elapsed, now) => {
      // Advance both first, then read positions: a fresh view per frame,
      // taken after all stepping, because memory growth during either step
      // would detach a view taken earlier.
      let steps = 0;
      panels.forEach((p, i) => {
        // Same rate and elapsed time, so both panels take the same steps.
        const ms = timeMs(() => { steps = engine.demo_advance(demoHandle(p), elapsed); });
        if (steps > 0) {
          p.msPerStep.add(ms / steps);
          cost.record(state.n, i, ms / steps);
        }
      });
      const views = panels.map((p) => {
        const demo = demoHandle(p);
        const pos = positionsView(engine, demo);
        p.msPerDraw.add(timeMs(() => drawPanel(p, pos)));
        const err = Math.abs((engine.demo_energy(demo) - p.e0) / p.e0);
        p.readout.textContent =
          `|ΔE/E| ${err.toExponential(2)} · ${p.msPerStep.value.toFixed(3)} ms/step · ` +
          `${p.msPerDraw.value.toFixed(2)} ms/draw`;
        return { pos, err };
      });
      simTime += steps / state.rate;
      const ref = views[REFERENCE];
      if (ref !== undefined) {
        divergencePlot.push(simTime, views.filter((_, i) => i !== REFERENCE).map((v) => rmsDistance(v.pos, ref.pos)));
      }
      energyPlot.push(simTime, views.map((v) => v.err));
      divergencePlot.draw();
      energyPlot.draw();
      if (now - costShownAt >= COST_REFRESH_MS) {
        costEl.innerHTML = costTableHtml(cost, panels.map((p) => p.name));
        costShownAt = now;
      }
      return { steps, status: `${state.scene}, N = ${state.n.toLocaleString()} · t = ${simTime.toFixed(1)} s` };
    },
  });
} catch (err) {
  pageFailed(hud, err);
}
