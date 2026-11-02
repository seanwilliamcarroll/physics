# 03 — Wasm Shell and Rendering

Status: **Draft**
Depends on: `02-core-types.md`

## Goal

Run engine demos in the browser with **zero third-party crates and zero JS
libraries**: raw wasm exports, shared linear memory, and built-in browser
drawing APIs.

## Workspace layout

```
physics/
  Cargo.toml          // [workspace] members = ["engine", "web"]
  engine/             // std-only library (02-core-types.md)
  web/                // cdylib: exports + demo glue, depends on engine
  site/
    index.html
    main.js
    engine.wasm       // copied from the build
```

`web/Cargo.toml`:

```toml
[lib]
crate-type = ["cdylib"]

[dependencies]
engine = { path = "../engine" }
```

Workspace `Cargo.toml`, release profile tuned for download size:

```toml
[profile.release]
opt-level = 3        # try "s"/"z" later and measure size vs speed
lto = true
codegen-units = 1
panic = "abort"
```

## Build and run

```sh
rustup target add wasm32-unknown-unknown
cargo build --release --target wasm32-unknown-unknown -p web
cp target/wasm32-unknown-unknown/release/web.wasm site/engine.wasm
cd site && python3 -m http.server     # instantiateStreaming won't load from file://
```

## The boundary

### Principle

Rust owns simulation state. JS owns the frame loop and drawing. They meet at
a handful of `extern "C"` functions plus **pointers into wasm linear memory**.

### Exports

```rust
pub struct Demo {
    world: AnyWorld,
    render_buf: Vec<f32>,   // [x0, y0, x1, y1, ...] in world units
    accumulator: f64,
    dt: f64,
}

#[unsafe(no_mangle)] pub extern "C" fn demo_new(kind: u32, scalar: u32, n: u32) -> *mut Demo;
#[unsafe(no_mangle)] pub extern "C" fn demo_free(d: *mut Demo);
#[unsafe(no_mangle)] pub extern "C" fn demo_advance(d: *mut Demo, elapsed_s: f64) -> u32; // steps taken
#[unsafe(no_mangle)] pub extern "C" fn demo_positions_ptr(d: *mut Demo) -> *const f32;
#[unsafe(no_mangle)] pub extern "C" fn demo_positions_len(d: *mut Demo) -> u32;
```

`*mut Demo` is an opaque handle from `Box::into_raw`, released by
`Box::from_raw` in `demo_free`. No `static mut` (denied by default in the
2024 edition), and multiple demos can coexist on one page, which the
side-by-side comparisons need.

Every export dereferences a raw pointer, so each `unsafe` block gets a
`// SAFETY:` comment stating the contract: the pointer came from `demo_new`
and hasn't been freed.

### Runtime scalar choice

```rust
enum AnyWorld {
    F32(World<f32>),
    F64(World<f64>),
    // Fixed(World<Fixed>) later
}
```

One `match` per call. Each variant monomorphizes a full engine copy into the
`.wasm`. **Measure binary size per added scalar.**

### The render buffer

After stepping, `Demo` converts positions to `f32` into `render_buf`.
That decouples the engine's `S` from rendering, so the renderer never
changes when we add `Fixed`.

Optimization later: for `World<f32>`, positions are already `f32` and could
be exposed directly. Not worth it until profiling says so.

### Fixed timestep lives in Rust

```rust
pub fn advance(&mut self, elapsed: f64) -> u32 {
    self.accumulator += elapsed.min(0.25);      // clamp: avoid spiral of death
    let mut steps = 0;
    while self.accumulator >= self.dt {
        self.world.step(self.dt);
        self.accumulator -= self.dt;
        steps += 1;
    }
    self.fill_render_buf();
    steps
}
```

Keeping the accumulator in Rust means the stepping policy is testable
natively, and JS can't accidentally pass a variable `dt`.
Displays at 60/120/144 Hz all produce the same physics.

Later option: render-time interpolation between the last two states, using
`accumulator / dt`, for smooth motion when physics runs slower than the display.

### JS side

```js
const { instance } = await WebAssembly.instantiateStreaming(fetch("engine.wasm"));
const e = instance.exports;
const d = e.demo_new(/*kind*/ 0, /*scalar*/ 1, /*n*/ 200);

let last = performance.now();
function frame(now) {
  e.demo_advance(d, (now - last) / 1000);
  last = now;
  // Recreate the view EVERY frame: if wasm memory grows, old buffers detach.
  const pos = new Float32Array(e.memory.buffer,
                               e.demo_positions_ptr(d),
                               e.demo_positions_len(d));
  draw(pos);
  requestAnimationFrame(frame);
}
requestAnimationFrame(frame);
```

Also reread the pointer every frame: if the engine's `Vec` reallocates,
the address changes.

## Rendering

All built into the browser; no libraries.

| Approach | How | Good for | Limit (rough) |
|---|---|---|---|
| **Canvas 2D, vector** | `fillRect` / `arc` / `lineTo` from JS | Particles, chains, springs, billiards, plots | Low thousands of shapes per frame |
| **Canvas 2D, pixel buffer** | Rust writes RGBA into a `Vec<u8>`; JS wraps it in `ImageData` and calls `putImageData` | Falling sand, drum height maps, heat maps | Bound by memory bandwidth; millions of pixels OK |
| **WebGL2 / WebGPU** | Upload the position buffer, draw instanced points | 100k+ particles | Much more boilerplate; only if profiling demands it |

Plan: **vector Canvas 2D** for phases 1–4. **Pixel buffer** for falling sand
and the acoustic track (that's a tiny software rasterizer we write ourselves).
GPU only if a demo outgrows Canvas.

Canvas 2D tips:

- Batch: one `beginPath()`, many `rect`/`arc` calls, one `fill()`.
  Many separate fills are far slower.
- Small particles: `fillRect` is cheaper than `arc`.
- World-to-screen transform: either `ctx.setTransform(scale, 0, 0, -scale, ox, oy)`
  (y-up physics, y-down canvas) or map coordinates in JS. Avoid scaling stroke widths by accident.
- High-DPI: size the canvas backing store by `devicePixelRatio`.

### Plots

Energy, momentum, and constraint-error plots for the side-by-side demos are
drawn by hand on a second canvas (a polyline over a ring buffer of samples).
Rust exposes metric values per step the same way as positions.

## Not now

- **wasm-bindgen:** status verified November 2026. It moved to a new
  `wasm-bindgen` GitHub org with new maintainers after the rustwasm org was
  archived (September 2025), so it meets the dependency bar. Not needed until
  we want strings, callbacks, or browser APIs from Rust. Likely first need:
  the `AudioWorklet` acoustic track. If adopted, use the `wasm-bindgen` CLI
  directly; wasm-pack moved to an individual maintainer and adds little here.
- **Threads / SharedArrayBuffer:** require cross-origin isolation headers on
  the website host. Revisit for large-N benchmarks.
- **SIMD:** `-C target-feature=+simd128` with `core::arch::wasm32`.
  Benchmark against scalar once phase 1 works.

## Milestone: "hello particles"

1. `engine`: `Scalar` (f32, f64), `Vec2`, `Particles`, `UniformGravity`,
   symplectic Euler, `World::step`.
2. `web`: `demo_new`/`advance`/`positions` exports, one demo kind.
3. `site`: canvas + loop; particles fall off screen.
4. Swap in `PairwiseGravity` with a two-body orbit, then a small cluster → N-body demo.
5. Add an energy plot and an integrator dropdown → first side-by-side.
