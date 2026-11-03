// M5: a jelly (Rust: engine::scenarios::jelly) as force springs, XPBD
// constraints and impulse constraints side by side, under one log
// stiffness slider that reaches rigid (docs/07-soft-bodies.md).

import { loadEngine, positionsView, linksView } from "../../js/wasm.ts";
import { runLoop, RateMeter, MS_PER_SECOND } from "../../js/loop.ts";
import { View, clear, devicePx, drawPoints, drawLinks, drawHorizon, cssColor } from "../../js/canvas.ts";
import { DEFAULT_RATE_HZ, JELLY_IMPULSE, JELLY_SPRINGS, JELLY_XPBD, SCALAR_F64 } from "../../js/abi.ts";
import { smokeMode, runSmoke, smokeError, errorText } from "../../js/smoke.ts";
import { byId } from "../../js/dom.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { LinePlot } from "../../js/plot.ts";
import { slider, button } from "../../js/controls.ts";
import { buildPanels, demoHandle } from "../../js/panels.ts";
import { enableDrag } from "../../js/drag.ts";
import {
  JELLY_BLOWUP_FRACTION, RIGID_STOP, allWithin, SLIDER_MAX, SLIDER_MIN, kCrit, sliderToStiffness, stiffnessLabel,
} from "../../js/stiffness.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";
import type { DemoHandle } from "../../js/engine";

const PANELS = [
  { body: JELLY_SPRINGS, name: "force springs", colorVar: "--series-1" },
  { body: JELLY_XPBD, name: "XPBD constraints", colorVar: "--series-2" },
  { body: JELLY_IMPULSE, name: "impulse constraints", colorVar: "--series-3" },
];

/** Slider step, in decades: k moves by factors of √10. */
const LOG_K_STEP = 0.5;
/** URL spellings of the slider positions: "1" … "7", then "rigid". */
const RIGID = "rigid";
const LOG_K_VALUES = Array.from(
  { length: (SLIDER_MAX - SLIDER_MIN) / LOG_K_STEP + 1 },
  (_, i) => String(SLIDER_MIN + i * LOG_K_STEP),
).concat(RIGID);
const logKFromParam = (s: string): number => (s === RIGID ? RIGID_STOP : Number(s));

/** Damping c in N·s/m: 0 to 2 in tenths. Values are `i / 10`, not
 *  `i * 0.1`, so they print as "0.3", not "0.30000000000000004". */
const DAMPING_PER_UNIT = 10;
const DAMPING_STEP = 1 / DAMPING_PER_UNIT;
const DAMPING_MAX = 2;
const DAMPING_VALUES = Array.from({ length: DAMPING_MAX * DAMPING_PER_UNIT + 1 }, (_, i) =>
  String(i / DAMPING_PER_UNIT));

const OPTIONS: {
  logk: ChoiceOption; damping: ChoiceOption; grid: IntOption; substeps: IntOption; rate: IntOption; fps: IntOption;
} = {
  // 3: k = 1000 N/m, below where the 8 × 8 force jelly blows up (~2 250).
  logk: { kind: "choice", values: LOG_K_VALUES, default: "3", help: "log10 of the stiffness k (N/m), or rigid (constraints only)" },
  // 0.5: the damping M5.5 measured the jelly with.
  damping: { kind: "choice", values: DAMPING_VALUES, default: "0.5", help: "spring damping c, N·s/m" },
  // 8: engine::scenarios::JELLY_COLS / JELLY_ROWS.
  grid: { kind: "int", min: 2, max: 16, default: 8, help: "particles per side (the jelly's mass stays 1 kg)" },
  // 10: the web demo's starting substeps (crates/web demo/jelly.rs).
  substeps: { kind: "int", min: 1, max: 50, default: 10, help: "substeps per physics step" },
  rate: { kind: "int", min: 1, max: 240, default: DEFAULT_RATE_HZ, help: "physics steps per second" },
  fps: { kind: "int", min: 1, max: 1000, default: Infinity, help: "cap the display rate to emulate a slower monitor" },
};

const PRESETS: [string, string][] = [
  ["stable, k = 1 000 (default)", ""],
  ["force springs blow up", "?logk=3.5"],
  ["very stiff", "?logk=6"],
  ["rigid", "?logk=rigid"],
  ["more substeps hold it", "?logk=3.5&substeps=20"],
  ["no damping", "?damping=0"],
  ["fine grid", "?grid=16"],
];

/** Particle squares, spring width, ground width, CSS pixels. */
const PARTICLE_PX = 4;
const SPRING_WIDTH_PX = 1;
const GROUND_WIDTH_PX = 2;
/** engine::scenarios::JELLY_GROUND, m. */
const GROUND_Y = 0;
/** engine::scenarios::JELLY_MASS: shared by every particle, kg. */
const JELLY_MASS_KG = 1;
/** Kinetic energy past which a panel counts as exploded and freezes, J:
 *  20× the drop's ~5 J peak, which no throw reaches. */
const EXPLODED_J = 100;
/** A frame counts as sane (worth freezing on) while every particle is
 *  within this many meters of the origin: a few views across. */
const SANE_LIMIT_M = 10;
/** The "exploded" label over a frozen panel, CSS pixels. */
const LABEL_FONT_PX = 16;
const LABEL_MARGIN_PX = 12;
/** Plot history in frames: 30 s at 60 fps. */
const PLOT_SAMPLES = 1800;

/** The 16 × 16 jelly is 1.5 m wide and stands 0.5 m above the ground. */
const VIEW = new View({ xMin: -1.5, xMax: 1.5, yMin: -0.2, yMax: 2.3 });

const params = new URLSearchParams(location.search);
const state = {
  logK: logKFromParam(readChoice(params, "logk", OPTIONS.logk)),
  damping: Number(readChoice(params, "damping", OPTIONS.damping)),
  grid: readInt(params, "grid", OPTIONS.grid),
  substeps: readInt(params, "substeps", OPTIONS.substeps),
  rate: readInt(params, "rate", OPTIONS.rate),
};
const maxFps = readInt(params, "fps", OPTIONS.fps);
/** The stiffness the slider asks for (∞ at the rigid stop). */
const wantedK = (): number => sliderToStiffness(state.logK);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const hint = byId("hint", HTMLElement);
const css = document.documentElement;
const colors = {
  background: cssColor(css, "--stage-bg"),
  body: cssColor(css, "--particle"),
  ground: cssColor(css, "--muted"),
  grid: cssColor(css, "--grid"),
  text: cssColor(css, "--muted"),
};

const panels = buildPanels(byId("panels", HTMLElement), PANELS, css).map(({ cfg, ...base }) => ({
  ...cfg,
  ...base,
  demo: null as DemoHandle | null,
  /** The stiffness this panel runs at: the slider's, except that force
   *  springs keep their last finite one when the slider asks for rigid. */
  k: 0,
  /** Frozen once its kinetic energy passes EXPLODED_J. */
  exploded: false,
  ke: 0,
  /** Positions from the last sane frame; drawn once the panel explodes,
   *  since by then the live particles are off at ~10¹⁰ m or NaN. */
  sane: new Float32Array(0),
}));
type Panel = (typeof panels)[number];

const energyPlot = new LinePlot(byId("energy", HTMLCanvasElement), {
  series: panels.map((p) => ({ label: p.name, color: p.color })),
  capacity: PLOT_SAMPLES,
  scale: "log",
  colors: { background: colors.background, grid: colors.grid, text: colors.text },
});

/** The force jelly's stability hint for the current grid and substeps. */
function updateHint(): void {
  const m = JELLY_MASS_KG / (state.grid * state.grid);
  const h = 1 / (state.rate * state.substeps);
  const crit = kCrit(m, h);
  const [lo, hi] = JELLY_BLOWUP_FRACTION.map((f) => f * crit);
  hint.textContent =
    `Force springs: one spring on one of these particles is stable up to k_crit = 4m/h² = ` +
    `${Math.round(crit).toLocaleString("en-US")} N/m; the whole grid, with its faster vibrations, ` +
    `blows up around ${Math.round(lo).toLocaleString("en-US")}–${Math.round(hi).toLocaleString("en-US")} N/m ` +
    `(measured on the 8 × 8 grid). More substeps raise both as 1/h².`;
}

try {
  const engine = await loadEngine();
  let simTime = 0;
  /** The force panel's fallback when the slider starts at rigid. */
  const firstFiniteK = Number.isFinite(wantedK()) ? wantedK() : sliderToStiffness(Number(OPTIONS.logk.default));

  const applySettings = () => {
    for (const p of panels) {
      const d = demoHandle(p);
      const ok = engine.demo_set_substeps(d, state.substeps) === 1 && engine.demo_set_rate(d, state.rate) === 1;
      if (!ok) throw new Error("a setting was rejected");
    }
    updateHint();
  };

  /** Live stiffness: every panel that can take it; force springs refuse
   *  rigid and keep their k. An exploded panel stays frozen until reset:
   *  its particles are already scattered. */
  const applyStiffness = () => {
    for (const p of panels) {
      if (engine.demo_set_stiffness(demoHandle(p), wantedK()) === 1) p.k = wantedK();
    }
  };

  const applyDamping = () => {
    for (const p of panels) {
      if (engine.demo_set_damping(demoHandle(p), state.damping) !== 1) throw new Error("damping was rejected");
    }
  };

  /** (Re)creates the three jellies with the current grid and settings. */
  const restart = () => {
    for (const p of panels) {
      if (p.demo !== null) engine.demo_free(p.demo);
      const k = p.body === JELLY_SPRINGS && !Number.isFinite(wantedK()) ? (p.k || firstFiniteK) : wantedK();
      const demo = engine.demo_new_jelly(SCALAR_F64, p.body, state.grid, state.grid, k, state.damping);
      if (demo === 0) throw new Error("demo_new_jelly returned null");
      // The start is sane: at k ≥ 10⁴ the first step already explodes.
      const sane = positionsView(engine, demo).slice();
      Object.assign(p, { demo, k, exploded: false, ke: 0, sane });
    }
    applySettings();
    energyPlot.clear();
    simTime = 0;
  };
  restart();

  const drawPanel = (p: Panel): void => {
    const demo = demoHandle(p);
    const pos = p.exploded ? p.sane : positionsView(engine, demo);
    clear(p.ctx, colors.background);
    VIEW.apply(p.ctx);
    drawHorizon(p.ctx, VIEW, GROUND_Y, GROUND_WIDTH_PX, colors.ground);
    drawLinks(p.ctx, VIEW, pos, linksView(engine, demo), SPRING_WIDTH_PX, p.color);
    drawPoints(p.ctx, VIEW, pos, PARTICLE_PX, colors.body);
    if (p.exploded) drawLabel(p.ctx, "exploded: the last frame before it left the view");
  };

  /** Text in the panel's top-left corner, in device pixels. */
  const drawLabel = (ctx: CanvasRenderingContext2D, text: string): void => {
    ctx.setTransform(1, 0, 0, 1, 0, 0);
    ctx.fillStyle = colors.text;
    ctx.font = `${devicePx(LABEL_FONT_PX)}px sans-serif`;
    ctx.textBaseline = "top";
    ctx.fillText(text, devicePx(LABEL_MARGIN_PX), devicePx(LABEL_MARGIN_PX));
  };

  const readout = (p: Panel): string => {
    if (p.exploded) return `exploded at ${stiffnessLabel(p.k)}: lower k and reset`;
    const refused = p.k !== wantedK() ? " (springs can't be rigid)" : "";
    return `${stiffnessLabel(p.k)}${refused} · kinetic ${p.ke.toExponential(2)} J`;
  };

  for (const p of panels) enableDrag(engine, p.ctx.canvas, VIEW, () => demoHandle(p));

  const controls = byId("controls", HTMLElement);
  slider(controls, {
    label: "stiffness",
    min: SLIDER_MIN,
    max: RIGID_STOP,
    step: LOG_K_STEP,
    value: state.logK,
    format: (v) => stiffnessLabel(sliderToStiffness(v)),
    onInput: (v) => {
      state.logK = v;
      applyStiffness();
    },
  });
  slider(controls, {
    label: "damping",
    min: 0,
    max: DAMPING_MAX,
    step: DAMPING_STEP,
    value: state.damping,
    format: (c) => `c = ${c.toFixed(1)} N·s/m`,
    onInput: (c) => {
      state.damping = c;
      applyDamping();
    },
  });
  slider(controls, {
    label: "grid",
    min: OPTIONS.grid.min,
    max: OPTIONS.grid.max,
    value: state.grid,
    format: (n) => `${n} × ${n}`,
    onInput: (n) => {
      state.grid = n;
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
      for (const p of panels) {
        if (p.exploded) continue;
        steps = engine.demo_advance(demoHandle(p), elapsed);
        p.ke = engine.demo_kinetic_energy(demoHandle(p));
        const pos = positionsView(engine, demoHandle(p));
        // `!(<=)` also catches NaN.
        if (!(p.ke <= EXPLODED_J) || !allWithin(pos, SANE_LIMIT_M)) {
          p.exploded = true;
          p.ke = Math.min(p.ke, EXPLODED_J) || EXPLODED_J;
        } else {
          p.sane = pos.slice();
        }
      }
      for (const p of panels) {
        drawPanel(p);
        p.readout.textContent = readout(p);
      }
      simTime += steps / state.rate;
      energyPlot.push(simTime, panels.map((p) => p.ke));
      energyPlot.draw();
      fps.add(now);
      sps.add(now, steps);
      hud.textContent =
        `display ${fps.perSecond} fps · physics ${sps.perSecond} steps/s · ${state.grid} × ${state.grid}, ` +
        `${state.substeps} substeps · t = ${simTime.toFixed(1)} s` +
        (Number.isFinite(maxFps) ? ` · capped at ${maxFps} fps` : "");
    }, { maxFps });
  }
} catch (err) {
  hud.textContent = `error: ${errorText(err)}`;
  smokeError(err);
  throw err;
}
