// The lab pages' engine: engine-loader.ts's instance, plus what a page
// adds (where the file is, the step budget, views of its buffers).

// `import type` is erased when compiling: no runtime import of engine.d.ts.
import { MAX_RATE_HZ } from "./abi.ts";
import { STEP_BUDGET_MS, StepBudget } from "./loop.ts";
import { instantiate } from "./engine-loader.ts";
import type { Loaded } from "./engine-loader.ts";
import type { EngineExports } from "./engine";

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

// Views of the engine's buffers: page-free, so they live in
// engine-views.ts (the website's package ships them too).
export { linksView, pairsView, pocketsView, positionsView, pottedView, radiiOf, segmentsView } from "./engine-views.ts";
