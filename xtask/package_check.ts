// Type-checked (not run) by `cargo xtask package` against the unpacked
// tarball's .d.ts: what a TypeScript consumer of the package writes.
import { loadEngine, positionsView, DEMO_FOUNTAIN, SCALAR_F32 } from "physics-engine";
import type { DemoHandle, Engine, EngineExports, WasmSource } from "physics-engine";

export async function fountain(source: WasmSource): Promise<Float32Array> {
  const loaded: Engine = await loadEngine(source);
  const engine: EngineExports = loaded.engine;
  const demo: DemoHandle = engine.demo_new(DEMO_FOUNTAIN, SCALAR_F32, 300, 1);
  const steps: number = engine.demo_advance(demo, 1 / 60);
  void steps;
  // @ts-expect-error a bare number isn't a handle: the brand is kept.
  engine.demo_free(42);
  return positionsView(engine, demo);
}
