// The lab pages' engine: engine-loader.ts's instance, plus what a page
// adds (where the file is, the step budget, views of its buffers).

// `import type` is erased when compiling: no runtime import of engine.d.ts.
import { COORDS_PER_PARTICLE, MAX_RATE_HZ } from "./abi.ts";
import { STEP_BUDGET_MS, StepBudget } from "./loop.ts";
import { instantiate } from "./engine-loader.ts";
import type { Loaded } from "./engine-loader.ts";
import type { DemoHandle, EngineExports } from "./engine";

/** Default location, resolved relative to this file (not the page), so any
 *  demo at any depth finds it and the site works under a sub-path. */
const ENGINE_URL = new URL("../pkg/engine.wasm", import.meta.url);

/** The engine this page loaded last (a page loads one). */
let loaded: Loaded | null = null;

/** Text of the most recent Rust panic in the page's engine, or null; the
 *  smoke test reads it. */
export function lastPanicMessage(): string | null {
  return loaded?.lastPanic() ?? null;
}

/** Fetches, compiles, and instantiates engine.wasm; returns its exports,
 *  with the page's step budget around `demo_advance`. */
export async function loadEngine(url: URL | string = ENGINE_URL): Promise<EngineExports> {
  loaded = await instantiate(url, "engine.wasm");
  // The one unchecked step: wasm exports arrive untyped, and engine.d.ts
  // asserts their shape. The smoke test is what verifies it at runtime.
  return withStepBudget(loaded.exports as unknown as EngineExports);
}

/** The page's step budget (loop.ts): every `demo_advance` through the
 *  engine `loadEngine` returns is capped and timed by it. */
export const stepBudget = new StepBudget(STEP_BUDGET_MS, MAX_RATE_HZ);

/** `exports` with `demo_advance` capped by `stepBudget` and timed (physics
 *  only: drawing isn't in it), and `demo_free` forgetting the demo. The
 *  exports object itself is frozen, so this is a copy. */
function withStepBudget(exports: EngineExports): EngineExports {
  return {
    ...exports,
    demo_advance: stepBudget.budgeted(exports.demo_advance, exports.demo_set_step_cap),
    demo_free: stepBudget.forgetting(exports.demo_free),
  };
}

/** A Float32Array view of a demo's interleaved [x0, y0, x1, y1, ...]
 *  positions, in meters. Create a fresh view every frame: if wasm memory
 *  grows, old views are detached, and the buffer itself may move. */
export function positionsView(engine: EngineExports, demo: DemoHandle): Float32Array {
  return new Float32Array(
    engine.memory.buffer,
    engine.demo_positions_ptr(demo),
    engine.demo_positions_len(demo),
  );
}

/** A Uint32Array view of a demo's links, `[a0, b0, a1, b1, ...]`: the
 *  particles each constraint joins. Fresh per frame, like positionsView;
 *  the length changes when a grab adds or removes its rod. */
export function linksView(engine: EngineExports, demo: DemoHandle): Uint32Array {
  return new Uint32Array(
    engine.memory.buffer,
    engine.demo_links_ptr(demo),
    engine.demo_links_len(demo),
  );
}

/** A Uint32Array view of a demo's broadphase pairs, `[a0, b0, a1, b1,
 *  ...]`, as the last demo_update_pairs left them. Fresh per frame, like
 *  positionsView. */
export function pairsView(engine: EngineExports, demo: DemoHandle): Uint32Array {
  return new Uint32Array(
    engine.memory.buffer,
    engine.demo_pairs_ptr(demo),
    engine.demo_pairs_len(demo),
  );
}

/** Every particle's radius, m (0 for a pin), read once: radii never
 *  change in a demo, so pages keep this per demo. */
export function radiiOf(engine: EngineExports, demo: DemoHandle): Float64Array {
  const n = engine.demo_positions_len(demo) / COORDS_PER_PARTICLE;
  return Float64Array.from({ length: n }, (_, i) => engine.demo_particle_radius(demo, i));
}

/** Float32 views of the pool table's cushions `[x0, y0, x1, y1, ...]` and
 *  pockets `[x, y, r, ...]`. They never change, but views are fresh per
 *  frame anyway (memory growth detaches old ones). */
export function segmentsView(engine: EngineExports, demo: DemoHandle): Float32Array {
  return new Float32Array(engine.memory.buffer, engine.demo_segments_ptr(demo), engine.demo_segments_len(demo));
}

export function pocketsView(engine: EngineExports, demo: DemoHandle): Float32Array {
  return new Float32Array(engine.memory.buffer, engine.demo_pockets_ptr(demo), engine.demo_pockets_len(demo));
}

/** The potted list, `[ball, pocket, ...]`, everything since the rack. */
export function pottedView(engine: EngineExports, demo: DemoHandle): Uint32Array {
  return new Uint32Array(engine.memory.buffer, engine.demo_potted_ptr(demo), engine.demo_potted_len(demo));
}
