// Loads swarm.wasm (crates/swarm-web), the swarm track's module, with the
// same panic hook and step budget as the engine (wasm.ts, loop.ts).

import { MAX_RATE_HZ } from "./swarm-abi.ts";
import { STEP_BUDGET_MS, StepBudget } from "./loop.ts";
import { instantiateWithPanicHook } from "./wasm.ts";
import type { SwarmExports } from "./swarm";

const SWARM_URL = new URL("../pkg/swarm.wasm", import.meta.url);

/** The boids page's step budget: brute force at its cap takes ~0.45 s a
 *  step, so past the budget the page slows down rather than freezing
 *  more than one step's worth (TASKS S1 decision 10). */
export const swarmStepBudget = new StepBudget(STEP_BUDGET_MS, MAX_RATE_HZ);

/** Fetches and instantiates swarm.wasm; `swarm_advance` capped by
 *  `swarmStepBudget` and timed, `swarm_free` forgetting the flock. */
export async function loadSwarm(url: URL | string = SWARM_URL): Promise<SwarmExports> {
  // Unchecked, as in loadEngine: swarm.d.ts asserts the shape (and `cargo
  // xtask site` checks it against the export table).
  const exports = (await instantiateWithPanicHook(url, "swarm.wasm")) as unknown as SwarmExports;
  const { swarm_advance: advance, swarm_free: free } = exports;
  return {
    ...exports,
    swarm_advance(d, elapsed) {
      const cap = swarmStepBudget.cap;
      exports.swarm_set_step_cap(d, cap);
      const t0 = performance.now();
      const steps = advance(d, elapsed);
      swarmStepBudget.record(d, steps, performance.now() - t0, cap);
      return steps;
    },
    swarm_free(d) {
      swarmStepBudget.forget(d);
      free(d);
    },
  };
}
