// M9: falling sand (crates/sand through sand.wasm; docs/11-falling-sand.md).
// Rust owns the grid and writes an RGBA buffer; this page paints with the
// brush, blits the buffer (pixels.ts) and reports what a step costs.

import { loadSand, sandStepBudget } from "../../js/sand-wasm.ts";
import { blit, cellAt, pixelCanvas, strokeCells } from "../../js/pixels.ts";
import { SCENES } from "../../js/sand-scenes.ts";
import {
  DEFAULT_RATE_HZ, MATERIAL_EMPTY, MATERIAL_LAVA, MATERIAL_SAND, MATERIAL_STEAM, MATERIAL_STONE,
  MATERIAL_WATER, MAX_BRUSH, MAX_RATE_HZ, MAX_SIDE,
} from "../../js/sand-abi.ts";
import { MS_PER_SECOND, RateMeter, Smoothed, runLoop } from "../../js/loop.ts";
import { checkbox, select, slider, button } from "../../js/controls.ts";
import { byId } from "../../js/dom.ts";
import { FPS_OPTION, pageFailed } from "../../js/page.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { reportSmoke, smokeMode } from "../../js/smoke.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";
import type { SandExports, SandHandle } from "../../js/sand";

const OPTIONS: {
  scene: ChoiceOption; w: IntOption; h: IntOption; seed: IntOption;
  chunks: ChoiceOption; rate: IntOption; fps: IntOption;
} = {
  scene: { kind: "choice", values: Object.keys(SCENES), default: "hourglass", help: "starting scene" },
  // 640 × 360: TASKS M9 decision 7 (2 px a cell across a 1280 px page).
  w: { kind: "int", min: 1, max: MAX_SIDE, default: 640, help: "grid width, cells" },
  h: { kind: "int", min: 1, max: MAX_SIDE, default: 360, help: "grid height, cells" },
  seed: { kind: "int", min: 0, max: 2 ** 32 - 1, default: 1, help: "the rules' random choices; same seed, same run" },
  chunks: { kind: "choice", values: ["on", "off"], default: "on", help: "update only awake 32 × 32 chunks (exact either way)" },
  rate: { kind: "int", min: 1, max: MAX_RATE_HZ, default: DEFAULT_RATE_HZ, help: "steps per second" },
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["hourglass (default)", ""],
  ["a dam with a slot", "?scene=dam"],
  ["lava into water", "?scene=lava"],
  ["an empty box to paint", "?scene=empty"],
  ["the same, every cell every step", "?scene=hourglass&chunks=off"],
  ["1920 × 1080 (stress)", "?w=1920&h=1080"],
  ["1920 × 1080, lava", "?w=1920&h=1080&scene=lava"],
];

/** The brush's materials, as the select shows them. */
const BRUSH: [string, number][] = [
  ["sand", MATERIAL_SAND],
  ["water", MATERIAL_WATER],
  ["stone", MATERIAL_STONE],
  ["lava", MATERIAL_LAVA],
  ["steam", MATERIAL_STEAM],
  ["erase", MATERIAL_EMPTY],
];
const COUNTED: [string, number][] = BRUSH.filter(([, code]) => code !== MATERIAL_EMPTY);
const DEFAULT_RADIUS = 6;

/** Smoke: frames of 1/60 s before the check (the hourglass is pouring). */
const SMOKE_FRAMES = 30;
const SMOKE_FRAME_S = 1 / 60;
/** The empty cell's colour (sand-web demo.rs `base`), which the smoke test
 *  must see other colours against. */
const EMPTY_RGB = [0x16, 0x1a, 0x22];

const params = new URLSearchParams(location.search);
const scene = readChoice(params, "scene", OPTIONS.scene);
const [w, h] = [readInt(params, "w", OPTIONS.w), readInt(params, "h", OPTIONS.h)];
const seed = readInt(params, "seed", OPTIONS.seed);
const maxFps = readInt(params, "fps", OPTIONS.fps);
let chunked = readChoice(params, "chunks", OPTIONS.chunks) === "on";
let rate = readInt(params, "rate", OPTIONS.rate);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const canvas = byId("view", HTMLCanvasElement);
const ctx = pixelCanvas(canvas, w, h);

/** The three quantities only painting changes (docs/11-falling-sand.md,
 *  "Lava and steam as built"): sand; water + steam; lava + stone. */
function accounts(sand: SandExports, d: SandHandle): [number, number, number] {
  const n = (code: number) => sand.sand_count(d, code);
  return [n(MATERIAL_SAND), n(MATERIAL_WATER) + n(MATERIAL_STEAM), n(MATERIAL_LAVA) + n(MATERIAL_STONE)];
}

/** Advances a few frames, draws, and checks the accounts held and the
 *  canvas shows something other than empty cells. */
function smoke(sand: SandExports, d: SandHandle): void {
  const before = accounts(sand, d);
  let steps = 0;
  for (let i = 0; i < SMOKE_FRAMES; i++) steps += sand.sand_advance(d, SMOKE_FRAME_S);
  blit(ctx, sand.memory, sand.sand_render(d), w, h);
  const after = accounts(sand, d);
  if (after.some((v, i) => v !== before[i])) {
    reportSmoke(`error accounts changed: ${before} -> ${after}`);
    return;
  }
  const { data } = ctx.getImageData(0, 0, w, h);
  let px = 0;
  for (let i = 0; i < data.length; i += 4) {
    if (data[i] !== EMPTY_RGB[0] || data[i + 1] !== EMPTY_RGB[1] || data[i + 2] !== EMPTY_RGB[2]) px += 1;
  }
  reportSmoke(`ok steps=${steps} particle_px=${px}`);
}

/** The brush: press and drag to paint; held still, it keeps painting
 *  (a pour). Cells under the pointer come from pixels.ts `cellAt`. */
function attachBrush(sand: SandExports, d: SandHandle, brush: { code: number; radius: number }): () => void {
  canvas.style.touchAction = "none";
  let active: number | null = null;
  let last: [number, number] = [0, 0];
  const cell = (e: PointerEvent): [number, number] => {
    const r = canvas.getBoundingClientRect();
    return cellAt(e.clientX - r.left, e.clientY - r.top, r.width, r.height, w, h);
  };
  const stroke = (to: [number, number]) => {
    for (const [x, y] of strokeCells(last, to, Math.max(1, brush.radius / 2))) {
      sand.sand_paint(d, x, y, brush.radius, brush.code);
    }
    last = to;
  };
  canvas.addEventListener("pointerdown", (e) => {
    if (active !== null || !e.isPrimary || e.button !== 0) return;
    active = e.pointerId;
    canvas.setPointerCapture(e.pointerId);
    last = cell(e);
    stroke(last);
  });
  canvas.addEventListener("pointermove", (e) => {
    if (e.pointerId === active) stroke(cell(e));
  });
  const end = (e: PointerEvent) => {
    if (e.pointerId === active) active = null;
  };
  canvas.addEventListener("pointerup", end);
  canvas.addEventListener("pointercancel", end);
  // Called each frame: a held brush keeps painting where it is.
  return () => {
    if (active !== null) stroke(last);
  };
}

try {
  const sand = await loadSand();
  const d = sand.sand_new(w, h, seed);
  if (d === 0) throw new Error(`sand_new(${w}, ${h}) refused`);
  sand.sand_set_chunked(d, chunked ? 1 : 0);
  sand.sand_set_rate(d, rate);
  const paint = (x: number, y: number, r: number, code: number) => void sand.sand_paint(d, x, y, r, code);
  // Clears with the brush: erase discs of the widest radius, centres
  // MAX_BRUSH apart (a disc covers the square of side r·√2 around it).
  const reset = (name: string) => {
    for (let y = 0; y < h + MAX_BRUSH; y += MAX_BRUSH) {
      for (let x = 0; x < w + MAX_BRUSH; x += MAX_BRUSH) paint(x, y, MAX_BRUSH, MATERIAL_EMPTY);
    }
    SCENES[name]?.(paint, w, h);
  };
  SCENES[scene]?.(paint, w, h);

  if (smokeMode) {
    smoke(sand, d);
  } else {
    const controls = byId("controls", HTMLElement);
    const brush = { code: MATERIAL_SAND, radius: DEFAULT_RADIUS };
    select(controls, {
      label: "brush",
      choices: BRUSH.map(([name, code]) => [String(code), name]),
      value: String(brush.code),
      onChange: (v) => { brush.code = Number(v); },
    });
    slider(controls, {
      label: "radius", min: 1, max: MAX_BRUSH, value: brush.radius,
      format: (r) => `${r} cells`, onInput: (r) => { brush.radius = r; },
    });
    let next = scene;
    select(controls, {
      label: "scene",
      choices: Object.keys(SCENES).map((s) => [s, s]),
      value: scene,
      onChange: (v) => { next = v; reset(v); },
    });
    button(controls, { label: "reset", onClick: () => reset(next) });
    checkbox(controls, {
      label: "chunks", checked: chunked,
      onChange: (on) => { chunked = on; sand.sand_set_chunked(d, on ? 1 : 0); },
    });
    slider(controls, {
      label: "rate", min: OPTIONS.rate.min, max: OPTIONS.rate.max, value: rate,
      format: (hz) => `${hz} steps/s`,
      onInput: (hz) => { rate = hz; sand.sand_set_rate(d, hz); },
    });
    const hold = attachBrush(sand, d, brush);

    const fps = new RateMeter();
    const sps = new RateMeter();
    const stepMs = new Smoothed();
    const drawMs = new Smoothed();
    const cells = w * h;
    runLoop((elapsed, now) => {
      hold();
      const t0 = performance.now();
      const steps = sand.sand_advance(d, elapsed);
      const t1 = performance.now();
      blit(ctx, sand.memory, sand.sand_render(d), w, h);
      drawMs.add(performance.now() - t1);
      if (steps > 0) stepMs.add((t1 - t0) / steps);
      fps.add(now);
      sps.add(now, steps);

      const perStep = stepMs.value;
      // Throughput as if every cell were visited: the grid over the time a
      // step takes. With chunks on and the grid settling, this outruns
      // the cells actually visited, which is the point of chunks.
      const cellsPerS = perStep > 0 ? (cells * MS_PER_SECOND) / perStep : 0;
      const slow = sandStepBudget.limited ? " (slow motion: step budget)" : "";
      const counts = COUNTED.map(([name, code]) => `${name} ${sand.sand_count(d, code).toLocaleString()}`);
      hud.textContent =
        `display ${fps.perSecond} fps · ${sps.perSecond} steps/s${slow}` +
        (Number.isFinite(maxFps) ? ` · capped at ${maxFps} fps` : "") + "\n" +
        `step ${perStep.toFixed(2)} ms · ${(cellsPerS / 1e6).toFixed(0)} M cells/s · ` +
        `draw ${drawMs.value.toFixed(2)} ms · moves ${sand.sand_last_moves(d).toLocaleString()} · ` +
        `awake chunks ${sand.sand_awake_chunks(d)} / ${sand.sand_chunks(d)}${chunked ? "" : " (chunks off)"}\n` +
        `${w} × ${h} = ${cells.toLocaleString()} cells · ${counts.join(" · ")}`;
    }, { maxFps });
  }
} catch (err) {
  pageFailed(hud, err);
}
