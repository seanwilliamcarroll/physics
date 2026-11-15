// `cargo xtask bench-wasm` runs this in Node: the largest cluster whose
// physics step fits the page's step budget (site/js/loop.ts), per scalar,
// through engine.wasm's exports. V8 is the engine Chrome runs the demos
// with. Prints "<scalar> <largest n> <ns per step at that n>", the n with
// a "+" when even the ABI's cap (MAX_GRAVITY_BODIES) fits.
//
// A step is one demo_advance at 60 Hz: pairwise gravity (O(n²), the cost
// that grows), the integrator and the render-buffer fill. Search: double n
// until a step is over budget, then bisect to within 1%.

import { readFileSync } from "node:fs";
import { DEMO_CLUSTER, MAX_GRAVITY_BODIES, SCALAR_F32, SCALAR_F64 } from "../site/js/abi.ts";
import { STEP_BUDGET_MS } from "../site/js/loop.ts";

const [wasmPath] = process.argv.slice(2);
const SEED = 1;
const DT = 1 / 60;
const BUDGET_NS = STEP_BUDGET_MS * 1e6;

const module = new WebAssembly.Module(readFileSync(wasmPath));
const { exports: e } = new WebAssembly.Instance(module, { env: { console_error() {} } });

/** Median ns of a step at `n` bodies: a few warm-up steps, then the
 *  median of at least 5 steps (or 300 ms of them). */
function stepNs(scalar, n) {
  const d = e.demo_new(DEMO_CLUSTER, scalar, n, SEED);
  if (d === 0) throw new Error(`demo_new failed for n=${n}`);
  try {
    for (let i = 0; i < 3; i++) e.demo_advance(d, DT);
    const times = [];
    const t0 = performance.now();
    while (times.length < 5 || (performance.now() - t0 < 300 && times.length < 50)) {
      const t = performance.now();
      e.demo_advance(d, DT);
      times.push((performance.now() - t) * 1e6);
    }
    times.sort((a, b) => a - b);
    return times[times.length >> 1];
  } finally {
    e.demo_free(d);
  }
}

for (const [name, scalar] of [["f32", SCALAR_F32], ["f64", SCALAR_F64]]) {
  let lo = 256;
  if (stepNs(scalar, lo) > BUDGET_NS) throw new Error(`${name}: 256 bodies already over budget`);
  const cap = MAX_GRAVITY_BODIES;
  if (stepNs(scalar, cap) <= BUDGET_NS) {
    console.log(`${name} ${cap}+ ${stepNs(scalar, cap).toFixed(0)}`);
    continue;
  }
  let hi = Math.min(lo * 2, cap);
  while (stepNs(scalar, hi) <= BUDGET_NS) [lo, hi] = [hi, Math.min(hi * 2, cap)];
  while (hi - lo > lo / 100) {
    const mid = Math.floor((lo + hi) / 2);
    if (stepNs(scalar, mid) <= BUDGET_NS) lo = mid;
    else hi = mid;
  }
  console.log(`${name} ${lo} ${stepNs(scalar, lo).toFixed(0)}`);
}
