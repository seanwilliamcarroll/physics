// M7: a pool table (Rust: engine::scenarios::pool_rack), the cue, the
// cloth's slide and roll, pockets, and a speculative-contacts switch with a
// tunnel counter (docs/09-billiards.md).

import { loadEngine, pocketsView, positionsView, pottedView, radiiOf, segmentsView } from "../../js/wasm.ts";
import { View, clear, cssColor, devicePx } from "../../js/canvas.ts";
import { MAX_POOL_SPEED, MAX_SUBSTEPS, MAX_TIP, SCALAR_F64, SOLVER_IMPULSE, SOLVER_XPBD } from "../../js/abi.ts";
import { byId } from "../../js/dom.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { LinePlot } from "../../js/plot.ts";
import { button, checkbox, select, slider } from "../../js/controls.ts";
import { buildPanels, demoHandle, panelSeries, replaceDemo, requireAccepted } from "../../js/panels.ts";
import { FPS_OPTION, RATE_OPTION, pageFailed, plotColors, rateSlider, runDemo } from "../../js/page.ts";
import { attachPointer } from "../../js/pointer.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";

const PANELS = [{ name: "table", colorVar: "--series-2" }];

/** Tip height in tenths of a radius, −5 … 5. */
const TIP_STEPS = 10;
const TIP_VALUES = Array.from({ length: 2 * MAX_TIP * TIP_STEPS + 1 }, (_, i) =>
  String((i - MAX_TIP * TIP_STEPS) / TIP_STEPS));

const OPTIONS: {
  tip: ChoiceOption; solver: ChoiceOption; substeps: IntOption; speculative: ChoiceOption;
  break: IntOption; rate: IntOption; fps: IntOption;
} = {
  tip: { kind: "choice", values: TIP_VALUES, default: "0", help: "cue tip height in radii: 0 stun, 0.4 natural roll, + follow, − draw" },
  solver: { kind: "choice", values: ["impulse", "xpbd"], default: "impulse", help: "contact solver" },
  // 10: crates/web demo/pool.rs (tests/billiards.rs measured the break there).
  substeps: { kind: "int", min: 1, max: MAX_SUBSTEPS, default: 10, help: "substeps per physics step" },
  speculative: { kind: "choice", values: ["on", "off"], default: "on", help: "speculative contacts (off: fast balls tunnel at low substeps)" },
  break: { kind: "int", min: 0, max: MAX_POOL_SPEED, default: 0, help: "break at load at this speed, m/s (0: wait for the cue)" },
  rate: RATE_OPTION,
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["the rack, your break (default)", ""],
  ["a hard break", "?break=12"],
  ["tunneling: no speculation, one substep", "?speculative=off&substeps=1&break=12"],
  ["the same at three substeps", "?speculative=off&substeps=3&break=12"],
  ["follow", "?tip=0.5"],
  ["draw", "?tip=-0.5"],
];

/** engine::scenarios::POOL_LENGTH / POOL_WIDTH, m. */
const LENGTH = 2.54;
const WIDTH = 1.27;
/** The rail drawn around the cushions, m (looks only). */
const RAIL = 0.1;
/** Pull to speed: a full speed at this drag, m. */
const FULL_PULL_M = 0.6;
/** The aim line's length, m. */
const AIM_M = 1.5;
const CUSHION_PX = 3;
const AIM_PX = 1.5;
const LABEL_FONT_PX = 10;
const PLOT_SAMPLES = 1800;
/** The plot's floor, J: below it the table counts as still on the log axis. */
const ENERGY_FLOOR_J = 1e-6;

/** WPA §16's ball colours, 1–8 solids and 9–15 the same as stripes. */
const BALL_COLORS = ["#f5c400", "#1d4fd6", "#d11f1f", "#5b2a86", "#f07a12", "#0f7b3a", "#7a1c1c", "#111111"];
const CUE_COLOR = "#f4f4f0";
const FELT = "#0d4a2e";
const RAIL_COLOR = "#4a2d16";
const POCKET_COLOR = "#050505";

const VIEW = new View({
  xMin: -LENGTH / 2 - RAIL, xMax: LENGTH / 2 + RAIL, yMin: -WIDTH / 2 - RAIL, yMax: WIDTH / 2 + RAIL,
});

const params = new URLSearchParams(location.search);
const state = {
  tip: Number(readChoice(params, "tip", OPTIONS.tip)),
  solver: readChoice(params, "solver", OPTIONS.solver),
  substeps: readInt(params, "substeps", OPTIONS.substeps),
  speculative: readChoice(params, "speculative", OPTIONS.speculative) === "on",
  break: readInt(params, "break", OPTIONS.break),
  rate: readInt(params, "rate", OPTIONS.rate),
};
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const css = document.documentElement;
const colors = { ...plotColors(css), cushion: cssColor(css, "--muted"), aim: cssColor(css, "--fg") };
const panels = buildPanels(byId("panels", HTMLElement), PANELS, css).map((p) => ({
  ...p,
  radii: new Float64Array(0),
  numbers: [] as number[],
}));
type Panel = (typeof panels)[number];
const energyPlot = new LinePlot(byId("energy", HTMLCanvasElement), {
  series: panelSeries(panels), capacity: PLOT_SAMPLES, scale: "log", colors,
});

/** The pull in progress: where the drag is, in world m. */
let pull: [number, number] | null = null;

try {
  const engine = await loadEngine();
  let simTime = 0;
  const table = panels[0];

  const applySettings = () => {
    const d = demoHandle(table);
    requireAccepted([
      engine.demo_set_solver(d, state.solver === "xpbd" ? SOLVER_XPBD : SOLVER_IMPULSE),
      engine.demo_set_substeps(d, state.substeps),
      engine.demo_set_rate(d, state.rate),
      engine.demo_set_speculative(d, state.speculative ? 1 : 0),
    ]);
  };

  const rack = () => {
    const demo = replaceDemo(engine, table.demo, engine.demo_new_pool(SCALAR_F64), "demo_new_pool");
    const radii = radiiOf(engine, demo);
    const numbers = Array.from(radii, (_, i) => engine.demo_ball_number(demo, i));
    Object.assign(table, { demo, radii, numbers });
    applySettings();
    energyPlot.clear();
    simTime = 0;
  };
  rack();

  const cue = (): [number, number] => {
    const pos = positionsView(engine, demoHandle(table));
    return [pos[0], pos[1]];
  };
  const cueInPlay = () => table.radii[0] > 0 && engine.demo_particle_radius(demoHandle(table), 0) > 0;
  const ready = () => engine.demo_at_rest(demoHandle(table)) === 1 && cueInPlay();

  /** The shot a pull at `p` makes: aim from the pull through the cue ball,
   *  speed in proportion to the pull. */
  const shot = (p: [number, number]): { aim: [number, number]; speed: number } => {
    const [cx, cy] = cue();
    const aim: [number, number] = [cx - p[0], cy - p[1]];
    const speed = Math.min(Math.hypot(...aim) / FULL_PULL_M, 1) * MAX_POOL_SPEED;
    return { aim, speed };
  };

  const strike = (aim: [number, number], speed: number) => {
    requireAccepted([engine.demo_strike(demoHandle(table), aim[0], aim[1], speed, state.tip)], "the strike");
  };
  if (state.break > 0) strike([1, 0], state.break);

  attachPointer(table.ctx.canvas, VIEW, {
    onGrab: (x, y) => {
      if (!ready()) return false;
      pull = [x, y];
      return true;
    },
    onDrag: (x, y) => {
      pull = [x, y];
    },
    onRelease: () => {
      if (pull === null) return;
      const { aim, speed } = shot(pull);
      pull = null;
      if (speed > 0 && Math.hypot(...aim) > 0) strike(aim, speed);
    },
  });

  const drawBall = (ctx: CanvasRenderingContext2D, x: number, y: number, r: number, n: number) => {
    const color = n === 0 ? CUE_COLOR : BALL_COLORS[(n - 1) % 8];
    ctx.beginPath();
    ctx.arc(x, y, r, 0, 2 * Math.PI);
    ctx.fillStyle = n > 8 ? CUE_COLOR : color;
    ctx.fill();
    if (n > 8) {
      // A stripe: the colour across the middle half.
      ctx.save();
      ctx.clip();
      ctx.fillStyle = color;
      ctx.fillRect(x - r, y - r / 2, 2 * r, r);
      ctx.restore();
    }
    if (n === 8) {
      ctx.strokeStyle = colors.cushion;
      ctx.lineWidth = devicePx(1) / VIEW.scale(ctx.canvas);
      ctx.stroke();
    }
  };

  const drawTable = (p: Panel): void => {
    const demo = demoHandle(p);
    const ctx = p.ctx;
    clear(ctx, RAIL_COLOR);
    VIEW.apply(ctx);
    ctx.fillStyle = FELT;
    ctx.fillRect(-LENGTH / 2, -WIDTH / 2, LENGTH, WIDTH);
    const pockets = pocketsView(engine, demo);
    ctx.fillStyle = POCKET_COLOR;
    for (let i = 0; i + 2 < pockets.length; i += 3) {
      ctx.beginPath();
      ctx.arc(pockets[i], pockets[i + 1], pockets[i + 2], 0, 2 * Math.PI);
      ctx.fill();
    }
    const segs = segmentsView(engine, demo);
    ctx.strokeStyle = colors.cushion;
    ctx.lineWidth = devicePx(CUSHION_PX) / VIEW.scale(ctx.canvas);
    ctx.lineCap = "round";
    ctx.beginPath();
    for (let i = 0; i + 3 < segs.length; i += 4) {
      ctx.moveTo(segs[i], segs[i + 1]);
      ctx.lineTo(segs[i + 2], segs[i + 3]);
    }
    ctx.stroke();
    const pos = positionsView(engine, demo);
    for (let i = 0; i < p.radii.length; i++) {
      const r = engine.demo_particle_radius(demo, i);
      if (r > 0) drawBall(ctx, pos[2 * i], pos[2 * i + 1], r, p.numbers[i]);
    }
    if (pull !== null && ready()) {
      const { aim, speed } = shot(pull);
      const len = Math.hypot(...aim);
      if (len > 0) {
        const [cx, cy] = cue();
        ctx.strokeStyle = colors.aim;
        ctx.lineWidth = devicePx(AIM_PX) / VIEW.scale(ctx.canvas);
        ctx.setLineDash([0.03, 0.03]);
        ctx.beginPath();
        ctx.moveTo(cx, cy);
        ctx.lineTo(cx + (aim[0] / len) * AIM_M, cy + (aim[1] / len) * AIM_M);
        ctx.stroke();
        ctx.setLineDash([]);
        drawLabel(ctx, `${speed.toFixed(1)} m/s · tip ${state.tip.toFixed(1)} R`);
      }
    }
  };

  const drawLabel = (ctx: CanvasRenderingContext2D, text: string): void => {
    ctx.setTransform(1, 0, 0, 1, 0, 0);
    ctx.fillStyle = colors.aim;
    ctx.font = `${devicePx(LABEL_FONT_PX + 2)}px sans-serif`;
    ctx.textBaseline = "top";
    ctx.fillText(text, devicePx(8), devicePx(6));
  };

  const readout = (p: Panel): string => {
    const d = demoHandle(p);
    const potted = pottedView(engine, d);
    const balls: number[] = [];
    for (let i = 0; i + 1 < potted.length; i += 2) balls.push(p.numbers[potted[i]]);
    const tray = balls.length ? balls.map((n) => (n === 0 ? "cue" : String(n))).join(" ") : "none";
    const tunnels = engine.demo_tunnels(d);
    const still = engine.demo_at_rest(d) === 1 ? "at rest" : "rolling";
    return `potted: ${tray} · tunnels ${tunnels} · ${still} · energy ${engine.demo_energy(d).toExponential(2)} J`;
  };

  const controls = byId("controls", HTMLElement);
  slider(controls, {
    label: "tip",
    min: -MAX_TIP,
    max: MAX_TIP,
    step: 1 / TIP_STEPS,
    value: state.tip,
    format: (t) => `${t.toFixed(1)} R ${t === 0 ? "(stun)" : t === 0.4 ? "(natural roll)" : t > 0 ? "(follow)" : "(draw)"}`,
    onInput: (t) => {
      state.tip = t;
    },
  });
  select(controls, {
    label: "solver",
    choices: [["impulse", "impulse"], ["xpbd", "XPBD"]],
    value: state.solver,
    onChange: (s) => {
      state.solver = s;
      applySettings();
    },
  });
  slider(controls, {
    label: "substeps",
    min: OPTIONS.substeps.min,
    max: 50,
    value: state.substeps,
    onInput: (n) => {
      state.substeps = n;
      applySettings();
    },
  });
  checkbox(controls, {
    label: "speculative contacts",
    checked: state.speculative,
    onChange: (on) => {
      state.speculative = on;
      applySettings();
    },
  });
  rateSlider(controls, state.rate, (hz) => {
    state.rate = hz;
    applySettings();
  });
  button(controls, { label: "rack", onClick: rack });

  runDemo(engine, hud, {
    panels,
    draw: (p) => drawTable(p),
    particleColor: CUE_COLOR,
    maxFps,
    frame: (elapsed) => {
      const d = demoHandle(table);
      const steps = engine.demo_advance(d, elapsed);
      // A scratched cue ball comes back once the table is still.
      if (!cueInPlay() && engine.demo_at_rest(d) === 1) engine.demo_respot_cue(d);
      drawTable(table);
      table.readout.textContent = readout(table);
      simTime += steps / state.rate;
      energyPlot.push(simTime, [Math.max(engine.demo_energy(d), ENERGY_FLOOR_J)]);
      energyPlot.draw();
      const ready_ = ready() ? "drag back to shoot" : "wait for the table to stop";
      return { steps, status: `${state.substeps} substeps, ${state.speculative ? "speculative" : "no speculation"} · ${ready_}` };
    },
  });
} catch (err) {
  pageFailed(hud, err);
}
