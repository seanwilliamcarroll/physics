// Typed-array views of the engine's buffers in wasm memory. Functions of
// the exports and a handle only: no page, no module state.

import { COORDS_PER_PARTICLE } from "./abi.ts";
import type { DemoHandle, EngineExports } from "./engine";

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
