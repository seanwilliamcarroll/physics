// Loads the engine module. Zero imports: the .wasm needs nothing from JS.

/** Default location, resolved relative to this file (not the page), so any
 *  demo at any depth finds it and the site works under a sub-path. */
const ENGINE_URL = new URL("../pkg/engine.wasm", import.meta.url);

/** Fetches, compiles, and instantiates engine.wasm; returns its exports. */
export async function loadEngine(url = ENGINE_URL) {
  // instantiateStreaming compiles while downloading. It requires the server
  // to send `Content-Type: application/wasm` (python's http.server does).
  const { instance } = await WebAssembly.instantiateStreaming(fetch(url), {});
  return instance.exports;
}

/** A Float32Array view of a demo's interleaved [x0, y0, x1, y1, ...]
 *  positions, in meters. Create a fresh view every frame: if wasm memory
 *  grows, old views are detached, and the buffer itself may move. */
export function positionsView(engine, demo) {
  return new Float32Array(
    engine.memory.buffer,
    engine.demo_positions_ptr(demo),
    engine.demo_positions_len(demo),
  );
}
