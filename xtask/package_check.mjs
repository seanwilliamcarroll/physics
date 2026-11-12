// Run by `cargo xtask package` from a scratch project whose
// node_modules/physics-engine is the unpacked tarball: the fountain,
// through the package's own entry points, as the website will use it.
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { loadEngine, DEMO_FOUNTAIN, SCALAR_F32, COORDS_PER_PARTICLE, positionsView } from "physics-engine";

const N = 300;
const STEPS = 60;
// The wasm by its exported subpath (what a bundler's `?url` import resolves).
const wasm = readFileSync(fileURLToPath(import.meta.resolve("physics-engine/engine.wasm")));
const { engine, memory, lastPanic } = await loadEngine(wasm);
if (engine.memory !== memory) throw new Error("the memory isn't the exports' memory");
const demo = engine.demo_new(DEMO_FOUNTAIN, SCALAR_F32, N, 1);
if (demo === 0) throw new Error("demo_new returned null");
let steps = 0;
for (let i = 0; i < STEPS; i++) steps += engine.demo_advance(demo, 1 / 60 + 1e-9);
if (steps !== STEPS) throw new Error(`${steps} steps, expected ${STEPS}`);
const xy = positionsView(engine, demo);
if (xy.length !== N * COORDS_PER_PARTICLE) throw new Error(`${xy.length} floats`);
let apex = -Infinity;
for (let i = 1; i < xy.length; i += COORDS_PER_PARTICLE) apex = Math.max(apex, xy[i]);
// After a second, something is in the air and nothing is not a number.
if (!(apex > 1) || !xy.every(Number.isFinite)) throw new Error(`apex ${apex}`);
engine.demo_free(demo);
if (lastPanic() !== null) throw new Error(`panicked: ${lastPanic()}`);
console.log(`package: check ok (${steps} steps, ${N} particles, apex ${apex.toFixed(2)} m)`);
