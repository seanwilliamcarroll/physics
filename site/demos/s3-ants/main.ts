// S3: ant foraging (swarm::Colony through swarm.wasm; docs/15-swarm.md,
// S3). Rust owns the world and draws it; this page paints into it.

import { loadSwarm, swarmStepBudget } from "../../js/swarm-wasm.ts";
import { blit, cellAt, pixelCanvas, strokeCells } from "../../js/pixels.ts";
import { SCENES, WORLD } from "../../js/ant-scenes.ts";
import {
  ANT_DECAY, ANT_DEPOSIT, ANT_DIFFUSION, ANT_FALLOFF, ANT_SENSOR_ANGLE, ANT_SENSOR_DISTANCE, ANT_TURN,
  ANT_WIGGLE, DEFAULT_RATE_HZ, MAX_ANTS, MAX_ANT_BRUSH, MAX_RATE_HZ, TOOL_ERASE, TOOL_FOOD, TOOL_NEST, TOOL_WALL,
} from "../../js/swarm-abi.ts";
import { RateMeter, runLoop } from "../../js/loop.ts";
import { button, checkbox, select, slider } from "../../js/controls.ts";
import { byId } from "../../js/dom.ts";
import { FPS_OPTION, pageFailed } from "../../js/page.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { reportSmoke, smokeMode } from "../../js/smoke.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";
import type { AntHandle, SwarmExports } from "../../js/swarm";

const OPTIONS: { scene: ChoiceOption; ants: IntOption; seed: IntOption; rate: IntOption; fps: IntOption } = {
  scene: { kind: "choice", values: Object.keys(SCENES), default: "open", help: "starting scene" },
  ants: { kind: "int", min: 1, max: MAX_ANTS, default: 1500, help: "ants (the world is 200 × 120 cells)" },
  seed: { kind: "int", min: 0, max: 2 ** 32 - 1, default: 1, help: "headings and every random turn" },
  rate: { kind: "int", min: 1, max: MAX_RATE_HZ, default: DEFAULT_RATE_HZ, help: "steps per second" },
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["the open field (default)", ""],
  ["the double bridge", "?scene=bridge"],
  ["barriers", "?scene=barriers"],
  ["many ants", "?ants=6000"],
];

/** The tools, as the select shows them. */
const TOOLS: [string, number][] = [["food", TOOL_FOOD], ["wall", TOOL_WALL], ["erase", TOOL_ERASE], ["nest", TOOL_NEST]];
const FOOD_PER_CELL = 100;
/** Drawn pixels per cell. */
const SCALE = 5;
const SMOKE_STEPS = 30;
const BACKGROUND_RGB = [0x16, 0x1a, 0x22];
const DEG = Math.PI / 180;

/** Sliders: code, label, min, max, step, shown in degrees? */
const SLIDERS: [number, string, number, number, number, boolean][] = [
  [ANT_SENSOR_ANGLE, "sensor angle", 0, 90, 1, true],
  [ANT_SENSOR_DISTANCE, "sensor distance", 1, 30, 1, false],
  [ANT_TURN, "turn", 0, 90, 1, true],
  [ANT_WIGGLE, "wiggle", 0, 90, 1, true],
  [ANT_DEPOSIT, "deposit", 0, 5, 0.1, false],
  [ANT_FALLOFF, "fall-off", 0, 0.2, 0.005, false],
  [ANT_DIFFUSION, "diffusion", 0, 0.5, 0.01, false],
  [ANT_DECAY, "decay", 0, 0.05, 0.001, false],
];

const params = new URLSearchParams(location.search);
const scene = readChoice(params, "scene", OPTIONS.scene);
const ants = readInt(params, "ants", OPTIONS.ants);
const seed = readInt(params, "seed", OPTIONS.seed);
const rate = readInt(params, "rate", OPTIONS.rate);
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const canvas = byId("view", HTMLCanvasElement);

/** A fresh colony with `name`'s scene painted in. */
function build(s: SwarmExports, name: string): AntHandle {
  const d = s.ant_new(WORLD[0], WORLD[1], ants, SCALE, seed);
  if (d === 0) throw new Error(`ant_new(${ants}) refused`);
  s.ant_set_rate(d, rate);
  SCENES[name]?.((tool, x, y, r, amount) => void s.ant_paint(d, tool, x, y, r, amount), ...WORLD);
  return d;
}

try {
  const s = await loadSwarm();
  let d = build(s, scene);
  const [w, h] = [s.ant_view_width(d), s.ant_view_height(d)];
  const ctx = pixelCanvas(canvas, w, h);

  if (smokeMode) {
    let steps = 0;
    for (let i = 0; i < SMOKE_STEPS; i++) steps += s.ant_advance(d, 1 / DEFAULT_RATE_HZ + 1e-9);
    blit(ctx, s.memory, s.ant_render(d), w, h);
    const { data } = ctx.getImageData(0, 0, w, h);
    let px = 0;
    for (let i = 0; i < data.length; i += 4) {
      if (data[i] !== BACKGROUND_RGB[0] || data[i + 1] !== BACKGROUND_RGB[1] || data[i + 2] !== BACKGROUND_RGB[2]) px += 1;
    }
    const food = s.ant_food(d);
    reportSmoke(Number.isFinite(food) && food > 0 ? `ok steps=${steps} particle_px=${px}` : `error no food (${food})`);
  } else {
    const controls = byId("controls", HTMLElement);
    const brush = { tool: TOOL_FOOD, radius: 4 };
    let current = scene;
    select(controls, {
      label: "paint",
      choices: TOOLS.map(([name, code]) => [String(code), name]),
      value: String(brush.tool),
      onChange: (v) => { brush.tool = Number(v); },
    });
    slider(controls, { label: "brush", min: 1, max: MAX_ANT_BRUSH, value: brush.radius, format: (r) => `${r} cells`, onInput: (r) => { brush.radius = r; } });
    select(controls, {
      label: "scene",
      choices: Object.keys(SCENES).map((n) => [n, n]),
      value: scene,
      onChange: (v) => { current = v; s.ant_free(d); d = build(s, v); },
    });
    button(controls, { label: "reset", onClick: () => { s.ant_free(d); d = build(s, current); } });
    checkbox(controls, { label: "sensing", checked: true, onChange: (on) => void s.ant_set_sensing(d, on ? 1 : 0) });
    for (const [code, label, min, max, step, degrees] of SLIDERS) {
      const toShown = (v: number) => (degrees ? v / DEG : v);
      const input = slider(controls, {
        label, min, max, step,
        value: toShown(s.ant_param(d, code)),
        format: degrees ? (v) => `${v}°` : undefined,
        onInput: (v) => {
          if (s.ant_set_param(d, code, degrees ? v * DEG : v) === 0) {
            input.value = String(toShown(s.ant_param(d, code)));
            input.dispatchEvent(new Event("input"));
          }
        },
      });
    }

    // Painting: press and drag; the nest tool moves the nest.
    canvas.style.touchAction = "none";
    let active: number | null = null;
    let last: [number, number] = [0, 0];
    const cell = (e: PointerEvent): [number, number] => {
      const r = canvas.getBoundingClientRect();
      return cellAt(e.clientX - r.left, e.clientY - r.top, r.width, r.height, WORLD[0], WORLD[1]);
    };
    const dab = (to: [number, number]) => {
      const pts = brush.tool === TOOL_NEST ? [to] : strokeCells(last, to, Math.max(1, brush.radius / 2));
      for (const [x, y] of pts) s.ant_paint(d, brush.tool, x + 0.5, y + 0.5, brush.radius, FOOD_PER_CELL);
      last = to;
    };
    canvas.addEventListener("pointerdown", (e) => {
      if (active !== null || !e.isPrimary || e.button !== 0) return;
      active = e.pointerId;
      canvas.setPointerCapture(e.pointerId);
      last = cell(e);
      dab(last);
    });
    canvas.addEventListener("pointermove", (e) => { if (e.pointerId === active) dab(cell(e)); });
    const end = (e: PointerEvent) => { if (e.pointerId === active) active = null; };
    canvas.addEventListener("pointerup", end);
    canvas.addEventListener("pointercancel", end);

    const fps = new RateMeter();
    const sps = new RateMeter();
    /** Deliveries over the last minute of simulated time. */
    const history: [number, number][] = [];
    let simTime = 0;
    runLoop((elapsed, now) => {
      const steps = s.ant_advance(d, elapsed);
      blit(ctx, s.memory, s.ant_render(d), w, h);
      simTime += steps / rate;
      fps.add(now);
      sps.add(now, steps);
      const delivered = s.ant_delivered(d);
      history.push([simTime, delivered]);
      while (history.length > 1 && (history[0]?.[0] ?? simTime) < simTime - 60) history.shift();
      const [t0, d0] = history[0] ?? [simTime, delivered];
      const perMin = simTime > t0 ? ((delivered - d0) / (simTime - t0)) * 60 : 0;
      const slow = swarmStepBudget.limited ? " (slow motion: step budget)" : "";
      hud.textContent =
        `display ${fps.perSecond} fps · ${sps.perSecond} steps/s${slow}` +
        (Number.isFinite(maxFps) ? ` · capped at ${maxFps} fps` : "") + "\n" +
        `delivered ${delivered.toLocaleString()} (${perMin.toFixed(0)} a minute) · carrying ${s.ant_carrying(d)} · ` +
        `food left ${s.ant_food(d).toLocaleString()} · ${s.ant_len(d).toLocaleString()} ants`;
    }, { maxFps });
  }
} catch (err) {
  pageFailed(hud, err);
}
