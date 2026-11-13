// Loads sand.wasm (crates/sand-web), M9's falling-sand module, with the
// same panic hook and step budget as the engine (wasm.ts, loop.ts).

import { MAX_RATE_HZ } from "./sand-abi.ts";
import { STEP_BUDGET_MS, StepBudget } from "./loop.ts";
import { instantiate } from "./engine-loader.ts";
import type { SandExports } from "./sand";

const SAND_URL = new URL("../pkg/sand.wasm", import.meta.url);

/** The sand page's step budget: a busy 1920 × 1080 grid takes about 12 ms
 *  a step natively, so past the budget the page slows down rather than
 *  freezing (docs/workers.md, option 1). */
export const sandStepBudget = new StepBudget(STEP_BUDGET_MS, MAX_RATE_HZ);

/** Fetches and instantiates sand.wasm; `sand_advance` capped by
 *  `sandStepBudget` and timed, `sand_free` forgetting the grid. */
export async function loadSand(url: URL | string = SAND_URL): Promise<SandExports> {
  // Unchecked, as in loadEngine: sand.d.ts asserts the shape (and `cargo
  // xtask site` checks it against the export table).
  const exports = (await instantiate(url, "sand.wasm")).exports as unknown as SandExports;
  return {
    ...exports,
    sand_advance: sandStepBudget.budgeted(exports.sand_advance, exports.sand_set_step_cap),
    sand_free: sandStepBudget.forgetting(exports.sand_free),
  };
}
