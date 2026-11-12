// Loads swarm.wasm (crates/swarm-web), the swarm track's module, with the
// same panic hook and step budget as the engine (wasm.ts, loop.ts).

import { MAX_RATE_HZ } from "./swarm-abi.ts";
import { STEP_BUDGET_MS, StepBudget } from "./loop.ts";
import { instantiate } from "./engine-loader.ts";
import type { SwarmExports } from "./swarm";

const SWARM_URL = new URL("../pkg/swarm.wasm", import.meta.url);

/** The boids page's step budget: brute force at its cap takes ~0.45 s a
 *  step, so past the budget the page slows down rather than freezing
 *  more than one step's worth (TASKS S1 decision 10). */
export const swarmStepBudget = new StepBudget(STEP_BUDGET_MS, MAX_RATE_HZ);

/** Fetches and instantiates swarm.wasm; `swarm_advance` and
 *  `vicsek_advance` capped by `swarmStepBudget` and timed, the frees
 *  forgetting their handle. */
export async function loadSwarm(url: URL | string = SWARM_URL): Promise<SwarmExports> {
  // Unchecked, as in loadEngine: swarm.d.ts asserts the shape (and `cargo
  // xtask site` checks it against the export table).
  const exports = (await instantiate(url, "swarm.wasm")).exports as unknown as SwarmExports;
  const b = swarmStepBudget;
  return {
    ...exports,
    swarm_advance: b.budgeted(exports.swarm_advance, exports.swarm_set_step_cap),
    swarm_free: b.forgetting(exports.swarm_free),
    vicsek_advance: b.budgeted(exports.vicsek_advance, exports.vicsek_set_step_cap),
    vicsek_free: b.forgetting(exports.vicsek_free),
    ant_advance: b.budgeted(exports.ant_advance, exports.ant_set_step_cap),
    ant_free: b.forgetting(exports.ant_free),
    slime_advance: b.budgeted(exports.slime_advance, exports.slime_set_step_cap),
    slime_free: b.forgetting(exports.slime_free),
  };
}
