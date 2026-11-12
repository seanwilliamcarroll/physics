// Loads the engine module and supplies its one import (console_error, used
// by the Rust panic hook; see crates/engine-web/src/imports.rs).

// `import type` is erased when compiling: no runtime import of engine.d.ts.
import { COORDS_PER_PARTICLE, MAX_RATE_HZ } from "./abi.ts";
import { STEP_BUDGET_MS, StepBudget } from "./loop.ts";
import type { DemoHandle, EngineExports, EngineImports } from "./engine";

/** Default location, resolved relative to this file (not the page), so any
 *  demo at any depth finds it and the site works under a sub-path. */
const ENGINE_URL = new URL("../pkg/engine.wasm", import.meta.url);

/** Text of the most recent Rust panic, or null. Pages load one module, so
 *  module-level state is enough; the smoke test reads it. */
let lastPanic: string | null = null;

export function lastPanicMessage(): string | null {
  return lastPanic;
}

/** Fetches, compiles, and instantiates a module built on `web-common`,
 *  supplying its one import (the panic hook's `console_error`); returns
 *  the raw exports. `name` labels its console messages. Shared by
 *  `loadEngine` and the sand page's `loadSand` (sand-wasm.ts). */
export async function instantiateWithPanicHook(url: URL | string, name: string): Promise<WebAssembly.Exports> {
  /** Set right after instantiation, before any call into Rust. */
  let memory: WebAssembly.Memory | null = null;
  const imports: EngineImports = {
    env: {
      // Called by the Rust panic hook just before the module traps
      // ("RuntimeError: unreachable"): `len` UTF-8 bytes at `ptr`.
      console_error(ptr, len) {
        if (memory === null) {
          // A panic during instantiation itself: no memory to read yet.
          console.error(`${name} panicked before instantiation finished`);
          return;
        }
        lastPanic = new TextDecoder().decode(new Uint8Array(memory.buffer, ptr, len));
        console.error(`${name} ${lastPanic}`);
      },
    },
  };
  // instantiateStreaming compiles while downloading. It requires the server
  // to send `Content-Type: application/wasm` (python's http.server does).
  const { instance } = await WebAssembly.instantiateStreaming(fetch(url), imports);
  const memoryExport = instance.exports.memory;
  if (!(memoryExport instanceof WebAssembly.Memory)) throw new Error(`${name} exports no memory`);
  memory = memoryExport;
  return instance.exports;
}

/** Fetches, compiles, and instantiates engine.wasm; returns its exports. */
export async function loadEngine(url: URL | string = ENGINE_URL): Promise<EngineExports> {
  // The one unchecked step: wasm exports arrive untyped, and engine.d.ts
  // asserts their shape. The smoke test is what verifies it at runtime.
  const exports = (await instantiateWithPanicHook(url, "engine.wasm")) as unknown as EngineExports;
  return withStepBudget(exports);
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
