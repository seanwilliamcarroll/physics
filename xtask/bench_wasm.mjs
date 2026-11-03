// `cargo xtask bench-wasm` runs this in Node: time the cluster scene through
// engine.wasm's exports, the same cases as crates/engine/benches/step.rs.
// Prints one line per case: "<group> <n> <ns per step>". Codes come from
// site/js/abi.ts (Node strips the types), so they can't drift.
//
// Each sample is a demo_advance call: one physics step plus the O(n)
// render-buffer fill. The native benchmark is World::step alone, so tiny n
// reads slightly slower here for that reason too.

import { readFileSync } from "node:fs";
import {
  DEMO_CLUSTER, INTEGRATOR_SYMPLECTIC_EULER, INTEGRATOR_VELOCITY_VERLET, SCALAR_F32, SCALAR_F64,
} from "../site/js/abi.ts";

const [wasmPath, budgetArg] = process.argv.slice(2);
/** Wall-clock time spent measuring each case, ms. */
const BUDGET_MS = Number(budgetArg ?? 500);
/** Warm-up before measuring each case, ms (JIT tiers up wasm code). */
const WARMUP_MS = 100;
const SIZES = [16, 128, 1024];
const SEED = 1;
const DT = 1 / 60;
const SCALARS = [["f32", SCALAR_F32], ["f64", SCALAR_F64]];
const INTEGRATORS = [["symplectic", INTEGRATOR_SYMPLECTIC_EULER], ["verlet", INTEGRATOR_VELOCITY_VERLET]];

const module = new WebAssembly.Module(readFileSync(wasmPath));
const { exports: e } = new WebAssembly.Instance(module, { env: { console_error() {} } });

/** Calls step() until `ms` have passed; returns mean ns per call. */
function time(step, ms) {
  let calls = 0;
  const t0 = performance.now();
  let t = t0;
  while (t - t0 < ms) {
    step();
    calls += 1;
    t = performance.now();
  }
  return ((t - t0) * 1e6) / calls;
}

for (const [sname, scode] of SCALARS) {
  for (const [iname, icode] of INTEGRATORS) {
    for (const n of SIZES) {
      const d = e.demo_new(DEMO_CLUSTER, scode, n, SEED);
      if (d === 0) throw new Error(`demo_new failed for n=${n}`);
      e.demo_set_integrator(d, icode);
      const step = () => e.demo_advance(d, DT);
      time(step, WARMUP_MS);
      console.log(`step_${sname}_${iname} ${n} ${time(step, BUDGET_MS).toFixed(1)}`);
      e.demo_free(d);
    }
  }
}
