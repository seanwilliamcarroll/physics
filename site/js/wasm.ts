// Loads the engine module and supplies its one import (console_error, used
// by the Rust panic hook; see crates/web/src/imports.rs).

// `import type` is erased when compiling: no runtime import of engine.d.ts.
import type { DemoHandle, EngineExports, EngineImports } from "./engine";

/** Default location, resolved relative to this file (not the page), so any
 *  demo at any depth finds it and the site works under a sub-path. */
const ENGINE_URL = new URL("../pkg/engine.wasm", import.meta.url);

/** Text of the most recent Rust panic, or null. Pages load one engine, so
 *  module-level state is enough; the smoke test reads it. */
let lastPanic: string | null = null;

export function lastPanicMessage(): string | null {
  return lastPanic;
}

/** Fetches, compiles, and instantiates engine.wasm; returns its exports. */
export async function loadEngine(url: URL | string = ENGINE_URL): Promise<EngineExports> {
  /** Set right after instantiation, before any call into Rust. */
  let memory: WebAssembly.Memory | null = null;
  const imports: EngineImports = {
    env: {
      // Called by the Rust panic hook just before the module traps
      // ("RuntimeError: unreachable"): `len` UTF-8 bytes at `ptr`.
      console_error(ptr, len) {
        if (memory === null) {
          // A panic during instantiation itself: no memory to read yet.
          console.error("engine.wasm panicked before instantiation finished");
          return;
        }
        lastPanic = new TextDecoder().decode(new Uint8Array(memory.buffer, ptr, len));
        console.error(`engine.wasm ${lastPanic}`);
      },
    },
  };
  // instantiateStreaming compiles while downloading. It requires the server
  // to send `Content-Type: application/wasm` (python's http.server does).
  const { instance } = await WebAssembly.instantiateStreaming(fetch(url), imports);
  // The one unchecked step: wasm exports arrive untyped, and engine.d.ts
  // asserts their shape. The smoke test is what verifies it at runtime.
  const exports = instance.exports as unknown as EngineExports;
  memory = exports.memory;
  return exports;
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
