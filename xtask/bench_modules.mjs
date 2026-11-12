// `cargo xtask bench-wasm` runs this in Node after the engine: time every
// other module through its real exports (sand.wasm, swarm.wasm), the cases
// the docs quote. Prints one line per case: "<module>\t<case>\t<ns per call>".
// Codes come from the site's abi mirrors (Node strips the types).

import { readFileSync } from "node:fs";
import { MATERIAL_SAND, MATERIAL_STONE, MATERIAL_WATER } from "../site/js/sand-abi.ts";
import { NEIGHBOURS_BRUTE, NEIGHBOURS_GRID, NEIGHBOURS_SORTED, TOOL_FOOD } from "../site/js/swarm-abi.ts";

const [pkg, budgetArg] = process.argv.slice(2);
const BUDGET_MS = Number(budgetArg ?? 500);
const WARMUP_MS = 100;
/** One fixed step: a hair over 1/60 s at the default 60 Hz. */
const FRAME = 1 / 60 + 1e-9;

function load(name) {
  const m = new WebAssembly.Module(readFileSync(`${pkg}/${name}`));
  return new WebAssembly.Instance(m, { env: { console_error() {} } }).exports;
}

/** Calls f() until `ms` have passed; mean ns per call. */
function time(f, ms) {
  let n = 0;
  const t0 = performance.now();
  while (performance.now() - t0 < ms) { f(); n++; }
  return ((performance.now() - t0) * 1e6) / n;
}

function report(module, name, f) {
  time(f, WARMUP_MS);
  console.log(`${module}\t${name}\t${time(f, BUDGET_MS).toFixed(0)}`);
}

// Sand (M9): a busy 640 × 360 grid (30% sand and water over a floor), and
// a settled one with chunks on; the render.
{
  const s = load("sand.wasm");
  let seed = 7;
  const rnd = () => ((seed = (seed * 1103515245 + 12345) >>> 0) / 2 ** 32);
  const busy = () => {
    const d = s.sand_new(640, 360, 1);
    for (let y = 0; y < 359; y++) for (let x = 0; x < 640; x++) {
      const r = rnd();
      if (r < 0.15) s.sand_paint(d, x, y, 0, MATERIAL_SAND); else if (r < 0.3) s.sand_paint(d, x, y, 0, MATERIAL_WATER);
    }
    for (let x = 0; x < 640; x++) s.sand_paint(d, x, 359, 0, MATERIAL_STONE);
    return d;
  };
  const d = busy();
  report("sand", "busy step 640x360", () => s.sand_advance(d, FRAME));
  const settled = s.sand_new(640, 360, 1);
  for (let y = 270; y < 360; y++) for (let x = 0; x < 640; x++) s.sand_paint(settled, x, y, 0, y === 359 ? MATERIAL_STONE : MATERIAL_SAND);
  s.sand_advance(settled, FRAME); s.sand_advance(settled, FRAME);
  report("sand", "settled step 640x360", () => s.sand_advance(settled, FRAME));
  report("sand", "render 640x360", () => s.sand_render(d));
}

const s = load("swarm.wasm");

// Boids (S1): 10k at the page's density, warmed up; the three modes.
{
  const d = s.swarm_new(10000, 2560, 1440, 2, 1);
  for (let i = 0; i < 300; i++) s.swarm_advance(d, FRAME);
  for (const [name, code] of [["sorted", NEIGHBOURS_SORTED], ["grid", NEIGHBOURS_GRID]]) {
    s.swarm_set_neighbours(d, code);
    report("boids", `${name} step 10k`, () => s.swarm_advance(d, FRAME));
  }
  report("boids", "render 10k", () => s.swarm_render(d));
  const b = s.swarm_new(2000, 1145, 644, 2, 1);
  s.swarm_set_neighbours(b, NEIGHBOURS_BRUTE);
  report("boids", "brute step 2k", () => s.swarm_advance(b, FRAME));
}

// Vicsek (S2): Fig. 2a's N = 400 and 4000 at η = 2.
for (const [n, l] of [[400, 10], [4000, 31.6]]) {
  const d = s.vicsek_new(n, l, 2.0, 1, 1);
  report("vicsek", `step N=${n}`, () => s.vicsek_advance(d, FRAME));
}

// Ants (S3): the page's 200 × 120 world, 500 ants, food painted.
{
  const d = s.ant_new(200, 120, 500, 3, 1);
  s.ant_paint(d, TOOL_FOOD, 160, 60, 8, 50);
  for (let i = 0; i < 300; i++) s.ant_advance(d, FRAME);
  report("ants", "step 200x120, 500 ants", () => s.ant_advance(d, FRAME));
  report("ants", "render 600x360", () => s.ant_render(d));
}

// Physarum (S4): the page's 512² and 100k agents.
{
  const d = s.slime_new(512, 100000, 1, 1);
  for (let i = 0; i < 50; i++) s.slime_advance(d, FRAME);
  report("physarum", "step 512², 100k agents", () => s.slime_advance(d, FRAME));
  report("physarum", "render 512²", () => s.slime_render(d));
}
