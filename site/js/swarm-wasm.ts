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

/** Fetches and instantiates swarm.wasm; `swarm_advance` and
 *  `vicsek_advance` capped by `swarmStepBudget` and timed, the frees
 *  forgetting their handle. */
export async function loadSwarm(url: URL | string = SWARM_URL): Promise<SwarmExports> {
  // Unchecked, as in loadEngine: swarm.d.ts asserts the shape (and `cargo
  // xtask site` checks it against the export table).
  const exports = (await instantiateWithPanicHook(url, "swarm.wasm")) as unknown as SwarmExports;
  const { swarm_advance: advance, swarm_free: free } = exports;
  const { vicsek_advance: vAdvance, vicsek_free: vFree } = exports;
  const { ant_advance: aAdvance, ant_free: aFree } = exports;
  return {
    ...exports,
    vicsek_advance(d, elapsed) {
      const cap = swarmStepBudget.cap;
      exports.vicsek_set_step_cap(d, cap);
      const t0 = performance.now();
      const steps = vAdvance(d, elapsed);
      swarmStepBudget.record(d, steps, performance.now() - t0, cap);
      return steps;
    },
    vicsek_free(d) {
      swarmStepBudget.forget(d);
      vFree(d);
    },
    ant_advance(d, elapsed) {
      const cap = swarmStepBudget.cap;
      exports.ant_set_step_cap(d, cap);
      const t0 = performance.now();
      const steps = aAdvance(d, elapsed);
      swarmStepBudget.record(d, steps, performance.now() - t0, cap);
      return steps;
    },
    ant_free(d) {
      swarmStepBudget.forget(d);
      aFree(d);
    },
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
