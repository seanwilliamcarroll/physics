// The entry point of the `physics-engine` package: what the website
// imports (docs/16-site-demos.md). Everything here is page-free: the
// loader, the ABI's constants and types, and views of the buffers.
// `cargo xtask package` compiles this file and what it imports, adds
// engine.wasm, and packs them.
//
//   import wasmUrl from "physics-engine/engine.wasm?url";
//   import { loadEngine, DEMO_FOUNTAIN, SCALAR_F32, positionsView } from "physics-engine";
//   const { engine } = await loadEngine(wasmUrl);
//   const demo = engine.demo_new(DEMO_FOUNTAIN, SCALAR_F32, 300, 1);
//   engine.demo_advance(demo, elapsedSeconds);   // fixed 60 Hz steps inside
//   const xy = positionsView(engine, demo);      // fresh every frame
//   engine.demo_free(demo);

import { instantiate } from "./engine-loader.ts";
import type { WasmSource } from "./engine-loader.ts";
import type { EngineExports } from "./engine";

export * from "./abi.ts";
export * from "./engine-views.ts";
export { instantiate } from "./engine-loader.ts";
export type { Loaded, WasmSource } from "./engine-loader.ts";
export type { DemoHandle, EngineExports, Ptr, Status } from "./engine";

/** An instantiated engine. */
export interface Engine {
  /** The module's exports, typed (`engine.d.ts`). */
  readonly engine: EngineExports;
  readonly memory: WebAssembly.Memory;
  /** Text of this instance's most recent Rust panic, or null. */
  lastPanic(): string | null;
}

/** Instantiates engine.wasm from `source` (its URL, a `Response`, or its
 *  bytes). Instances are independent: load one per demo, or share one. */
export async function loadEngine(source: WasmSource): Promise<Engine> {
  const { exports, memory, lastPanic } = await instantiate(source, "engine.wasm");
  // Unchecked: the exports arrive untyped, and engine.d.ts asserts their
  // shape. `cargo xtask site` checked that file against this very wasm.
  return { engine: exports as unknown as EngineExports, memory, lastPanic };
}
