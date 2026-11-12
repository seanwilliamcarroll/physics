# physics-engine

The engine from [physics](https://github.com/seanwilliamcarroll/physics)
as a WebAssembly module, with its types and a loader. Built by `cargo
xtask package` there; not published to a registry (it's attached to that
repository's releases).

```js
import wasmUrl from "physics-engine/engine.wasm?url"; // Vite
import { loadEngine, DEMO_FOUNTAIN, SCALAR_F32, positionsView } from "physics-engine";

const { engine } = await loadEngine(wasmUrl);
const demo = engine.demo_new(DEMO_FOUNTAIN, SCALAR_F32, 300, 1);
function frame(elapsedSeconds) {
  engine.demo_advance(demo, elapsedSeconds); // fixed 60 Hz steps inside
  const xy = positionsView(engine, demo); // [x0, y0, x1, y1, …], metres; fresh every frame
}
// when done:
engine.demo_free(demo);
```

- `loadEngine(source)` takes the wasm's URL, a `Response`, or its bytes.
  Each call is an independent instance.
- Scenes are compiled in: `demo_new(kind, …)` with a `DEMO_*` code.
- The types (`EngineExports`) are checked against the wasm's export table
  when the package is built.
