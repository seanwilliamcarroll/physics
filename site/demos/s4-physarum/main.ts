// S4: Physarum (swarm::Slime through swarm.wasm; docs/15-swarm.md, S4).
// Rust owns the agents and the field and draws the field; this page adds
// nodes and wires the constants.

import { loadSwarm, swarmStepBudget } from "../../js/swarm-wasm.ts";
import { blit, cellAt, pixelCanvas } from "../../js/pixels.ts";
import {
  DEFAULT_RATE_HZ, MAX_AGENTS, MAX_RATE_HZ, SLIME_DECAY, SLIME_DEPOSIT, SLIME_DIFFUSION, SLIME_SENSOR_ANGLE,
  SLIME_SENSOR_OFFSET, SLIME_STEP, SLIME_TURN,
} from "../../js/swarm-abi.ts";
import { RateMeter, Smoothed, runLoop } from "../../js/loop.ts";
import { button, checkbox, slider } from "../../js/controls.ts";
import { byId } from "../../js/dom.ts";
import { FPS_OPTION, pageFailed } from "../../js/page.ts";
import { readInt, optionsTableHtml } from "../../js/options.ts";
import { reportSmoke, smokeMode } from "../../js/smoke.ts";
import type { IntOption } from "../../js/options.ts";
import type { SlimeHandle, SwarmExports } from "../../js/swarm";

const OPTIONS: {
  agents: IntOption; side: IntOption; sa: IntOption; ra: IntOption; nodes: IntOption;
  seed: IntOption; rate: IntOption; fps: IntOption;
} = {
  agents: { kind: "int", min: 1, max: MAX_AGENTS, default: 100_000, help: "agents" },
  side: { kind: "int", min: 32, max: 1024, default: 512, help: "the field's side, cells (wrapped around)" },
  sa: { kind: "int", min: 0, max: 180, default: 22, help: "sensor angle SA, degrees (22: 22.5°)" },
  ra: { kind: "int", min: 0, max: 180, default: 45, help: "turn RA, degrees" },
  nodes: { kind: "int", min: 0, max: 1, default: 0, help: "1: start with three strong nodes" },
  seed: { kind: "int", min: 0, max: 2 ** 32 - 1, default: 1, help: "positions, headings, random turns" },
  rate: { kind: "int", min: 1, max: MAX_RATE_HZ, default: DEFAULT_RATE_HZ, help: "steps per second" },
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["100k agents (default)", ""],
  ["spread: SA 45°, RA 45°", "?sa=45&ra=45"],
  ["three nodes, fewer agents", "?nodes=1&agents=20000"],
  ["250k agents", "?agents=250000"],
  ["a small world", "?side=128&agents=6000"],
];

const DEG = Math.PI / 180;
/** A node's deposit a step (S4.3's strong nodes). */
const NODE = 1000;
const SMOKE_STEPS = 30;
const BACKGROUND_RGB = [0x16, 0x1a, 0x22];
/** Frames between concentration readings (a pass over the field). */
const EVERY = 30;

/** Sliders: code, label, min, max, step, in degrees? */
const SLIDERS: [number, string, number, number, number, boolean][] = [
  [SLIME_SENSOR_ANGLE, "sensor angle SA", 0, 90, 0.5, true],
  [SLIME_SENSOR_OFFSET, "sensor offset SO", 1, 30, 1, false],
  [SLIME_TURN, "turn RA", 0, 90, 0.5, true],
  [SLIME_STEP, "step SS", 0.5, 3, 0.1, false],
  [SLIME_DEPOSIT, "deposit", 0, 20, 0.5, false],
  [SLIME_DIFFUSION, "diffusion", 0, 1, 0.01, false],
  [SLIME_DECAY, "decay", 0, 0.5, 0.01, false],
];

const params = new URLSearchParams(location.search);
const agents = readInt(params, "agents", OPTIONS.agents);
const side = readInt(params, "side", OPTIONS.side);
const sa = readInt(params, "sa", OPTIONS.sa);
const ra = readInt(params, "ra", OPTIONS.ra);
const withNodes = readInt(params, "nodes", OPTIONS.nodes) === 1;
const seed = readInt(params, "seed", OPTIONS.seed);
const rate = readInt(params, "rate", OPTIONS.rate);
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const canvas = byId("view", HTMLCanvasElement);

/** A fresh system: the URL's angles (22 means the default 22.5°), and
 *  the three nodes if asked. */
function build(s: SwarmExports): SlimeHandle {
  const d = s.slime_new(side, agents, 1, seed);
  if (d === 0) throw new Error(`slime_new(${side}, ${agents}) refused`);
  s.slime_set_rate(d, rate);
  if (sa !== 22) s.slime_set_param(d, SLIME_SENSOR_ANGLE, sa * DEG);
  s.slime_set_param(d, SLIME_TURN, ra * DEG);
  if (withNodes) {
    for (const [fx, fy] of [[0.25, 0.25], [0.75, 0.32], [0.45, 0.78]]) s.slime_add_node(d, fx * side, fy * side, NODE);
  }
  return d;
}

try {
  const s = await loadSwarm();
  let d = build(s);
  const view = s.slime_view(d);
  const ctx = pixelCanvas(canvas, view, view);

  if (smokeMode) {
    let steps = 0;
    for (let i = 0; i < SMOKE_STEPS; i++) steps += s.slime_advance(d, 1 / DEFAULT_RATE_HZ + 1e-9);
    blit(ctx, s.memory, s.slime_render(d), view, view);
    const c = s.slime_concentration(d);
    const { data } = ctx.getImageData(0, 0, view, view);
    let px = 0;
    for (let i = 0; i < data.length; i += 4) {
      if (data[i] !== BACKGROUND_RGB[0] || data[i + 1] !== BACKGROUND_RGB[1] || data[i + 2] !== BACKGROUND_RGB[2]) px += 1;
    }
    reportSmoke(Number.isFinite(c) && c > 0.1 ? `ok steps=${steps} particle_px=${px}` : `error concentration ${c}`);
  } else {
    const controls = byId("controls", HTMLElement);
    const sliders: { input: HTMLInputElement; code: number; degrees: boolean }[] = [];
    const shown = (code: number, degrees: boolean) => (degrees ? s.slime_param(d, code) / DEG : s.slime_param(d, code));
    for (const [code, label, min, max, step, degrees] of SLIDERS) {
      const input = slider(controls, {
        label, min, max, step,
        value: shown(code, degrees),
        format: degrees ? (v) => `${v}°` : undefined,
        onInput: (v) => {
          if (s.slime_set_param(d, code, degrees ? v * DEG : v) === 0) {
            input.value = String(shown(code, degrees));
            input.dispatchEvent(new Event("input"));
          }
        },
      });
      sliders.push({ input, code, degrees });
    }
    const sensing = checkbox(controls, { label: "sensing", checked: true, onChange: (on) => void s.slime_set_sensing(d, on ? 1 : 0) });
    button(controls, { label: "clear nodes", onClick: () => s.slime_clear_nodes(d) });
    button(controls, {
      label: "restart",
      onClick: () => {
        s.slime_free(d);
        d = build(s);
        // Keep what the sliders say.
        for (const { input, code, degrees } of sliders) s.slime_set_param(d, code, degrees ? input.valueAsNumber * DEG : input.valueAsNumber);
        s.slime_set_sensing(d, sensing.checked ? 1 : 0);
      },
    });
    canvas.addEventListener("pointerdown", (e) => {
      if (!e.isPrimary || e.button !== 0) return;
      const r = canvas.getBoundingClientRect();
      const [x, y] = cellAt(e.clientX - r.left, e.clientY - r.top, r.width, r.height, side, side);
      s.slime_add_node(d, x + 0.5, y + 0.5, NODE);
    });

    const fps = new RateMeter();
    const sps = new RateMeter();
    const stepMs = new Smoothed();
    let frames = 0;
    let concentration = Number.NaN;
    runLoop((elapsed, now) => {
      const t0 = performance.now();
      const steps = s.slime_advance(d, elapsed);
      const t1 = performance.now();
      blit(ctx, s.memory, s.slime_render(d), view, view);
      if (steps > 0) stepMs.add((t1 - t0) / steps);
      if (frames++ % EVERY === 0) concentration = s.slime_concentration(d);
      fps.add(now);
      sps.add(now, steps);
      const slow = swarmStepBudget.limited ? " (slow motion: step budget)" : "";
      hud.textContent =
        `display ${fps.perSecond} fps · ${sps.perSecond} steps/s${slow}` +
        (Number.isFinite(maxFps) ? ` · capped at ${maxFps} fps` : "") + "\n" +
        `step ${stepMs.value.toFixed(2)} ms · concentration ${concentration.toFixed(2)} · ` +
        `${s.slime_len(d).toLocaleString()} agents on ${side}²`;
    }, { maxFps });
  }
} catch (err) {
  pageFailed(hud, err);
}
