# 03 — Wasm Shell and Rendering

Status: **Adopted** (M0), with as-built notes and the size record since
Depends on: `02-core-types.md`

## Goal

Run engine demos in the browser with **zero third-party crates and zero JS
libraries**: raw wasm exports, shared linear memory, and built-in browser
drawing APIs.

## Workspace layout

Abbreviated; full tree in `repo-layout.md`.

```
physics/
  Cargo.toml          // [workspace] members = ["crates/*", "xtask"]
  crates/
    math/             // Scalar, Vec2 (02-core-types.md)
    engine/           // std-only library (02-core-types.md)
    engine-web/       // cdylib: exports + demo glue, depends on engine (named `web` until #161)
  xtask/              // build helper: `cargo xtask site`
  site/
    index.html
    js/               // shared ES modules
    demos/<name>/     // one folder per demo
    pkg/engine.wasm   // copied from the build (gitignored)
```

`crates/engine-web/Cargo.toml`:

```toml
[lib]
crate-type = ["cdylib"]

[dependencies]
engine = { path = "../engine" }
math = { path = "../math" }
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
cargo xtask site                      # release build of `engine-web` → site/pkg/engine.wasm
python3 -m http.server -d site        # instantiateStreaming won't load from file://
```

Day to day, `cargo xtask serve` does both, plus `tsc --watch`, and serves
with `Cache-Control: no-store` (`xtask/serve.py`): plain `http.server`
lets the browser reuse a cached `engine.wasm`, which once paired the new
M3 page with a pre-M3 engine (`demo_new` returned null for the new kind).

`cargo xtask site` wraps the manual steps:

```sh
cargo build --release --target wasm32-unknown-unknown -p engine-web
cp target/wasm32-unknown-unknown/release/engine_web.wasm site/pkg/engine.wasm
```

Targets are installed automatically by `rust-toolchain.toml`.

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

| Milestone | Variants | `.wasm` (release) | gzip -9 | Notes |
|---|---|---|---|---|
| M0 | `F32`, `F64` | 28,593 B | 9,998 B | `opt-level = 3`, LTO, Rust 1.99.1; zero imports |
| M1.1 | `F32`, `F64` | 34,230 B | 12,060 B | + panic hook (std panic formatting, ~5.2 KB) and `demo_panic_for_test`; one import, `env.console_error` |
| M1.5 | `F32`, `F64` | 41,820 B | 14,604 B | + pairwise gravity, explicit Euler, velocity Verlet, orbit scene, energy (each ×2 scalars) |
| M2.3 | `F32`, `F64` | 44,458 B | 15,173 B | + cluster scene |
| M2.5 | `F32`, `F64` | 58,544 B | 19,926 B | + disk, collapse, `Softening`, `demo_set_softening`. ~7.4 KB of it is std's unstable sort (the disk's enclosed-mass radii); the stable sort was ~8.9 KB. Not shared with anything: generic sorts compile per element type and comparator. Dropping it (an O(n²) enclosed count) would save it, at a setup cost of ~16M comparisons for N = 4096 |
| M2.8 | `F32`, `F64` | 75,872 B | 25,902 B | + Barnes–Hut and `demo_set_theta`. Its sort first compiled once per scalar (82,908 B); sorting non-generic `(key, index)` pairs keeps one copy. The disk's f64 sort could share it too (non-negative floats sort like their bit patterns), at the cost of coupling the two for size alone |
| M3.5 | `F32`, `F64` | 90,194 B | 29,209 B | + constraints, XPBD and impulse solvers, pendulum, solver controls (each ×2 scalars) |
| M4.6 | `F32`, `F64` | 102,099 B | 34,099 B | + compliance, iteration order, chain and double-pendulum scenes, drag, links buffer |
| M5.6 | `F32`, `F64` | 127,655 B | 42,813 B | + springs and damping, ground, the jelly, live stiffness (+25.6 KB over M4.6: springs, the jelly builder and damped forms of both solvers, ×2 scalars) |
| M6.6 | `F32`, `F64` | 192,680 B | 60,661 B | + collision: broadphase, narrowphase, contacts in both solvers (no M6 page or exports yet; measured at A1.5). **+65 KB over M5.6** (below) |
| M6.7 | `F32`, `F64` | 197,543 B | 62,605 B | + the impact stage (Generalized Reflections), both solvers |
| M6.9 | `F32`, `F64` | 215,612 B | 66,591 B | + the box, break and cradle constructors, restitution, radius, momentum and broadphase-pairs exports (+18.1 KB: three scene builders ×2 scalars) |
| M6.11 | `F32`, `F64` | 179,755 B | 55,435 B | one sort key for every sort (below): **−35.9 KB**; sorting code 39.1 → 6.9 KB |
| M7.7 | `F32`, `F64` | 226,888 B | 73,452 B | + segments, moment-of-impact contacts, the cloth, tunnels, pockets, the pool table and its exports: **+47.1 KB** over M6.11 (below) |

**Where M6's +65 KB went** (A1.7; per-function sizes from the module's
`name` section, M5.8 against M6.6; the code section grew 59.7 KB):

| | Δ | |
|---|---|---|
| sorting | **+26.7 KB** | six new instantiations, each with its own quicksort, heapsort and small-sort: the broadphase's `(i64, i64, usize)` keys, its `(usize, usize)` output pairs, and the warm start's `(ParticleId, Body, S)` entries, the last once per scalar |
| stepping | +16.9 KB | the substep with contacts, ×2 scalars; big enough that `Demo::advance` is no longer inlined into `demo_advance` (shows as 0 → 33.8 KB there, −16.8 KB here) |
| `Contacts::find` | +11.5 KB | ×2 scalars |
| drop glue, other | +4.7 KB | |

Sorting is the lever, as M2 already found (~7–9 KB per element type).

**Fixed in M6.11: one sort key** (`engine/src/sort_key.rs`). Every sort in
the engine now sorts `(i64, i64, usize)`, one non-generic instantiation:
the broadphase's cells and its output pairs (`(a, b, b)`), the warm start
(keys with an index into a separate λ vector, so not once per scalar),
Barnes–Hut's Morton keys (a `u64` as two non-negative halves) and the
disk's radii (an `f64` as its IEEE total-order bits). Five element types,
seven instantiations, became one; every golden is unchanged, so the
orders are too. Measured per-function from the name section (a script
over the code and name sections; `wasm-tools` has no per-function sizes):
sorting went from 39.1 KB to 6.9 KB.

The cost is speed in the broadphase, +6–12% (128 to 4,096 circles:
24-byte keys instead of 16-byte pairs, and one more pass), ~15 µs per
substep at 1,024 circles. Not taken: dropping the broadphase's final sort
of pairs altogether (its cell keys are already sorted, so the order is
deterministic without it), which would be smaller *and* faster but
reorders contacts, so every collision golden would change.

**Where M7's +47.1 KB went** (M7.9; per function, M6.11 against M7.7;
the code section grew 45.6 KB). No single lever this time, unlike M6's
sorts: the stepping loop is no longer inlined into `Demo::advance`
(30.2 KB there became 40.5 KB in `run_steps`, ×2 scalars: **+10.3 KB**
for segments, the cloth, tunnel counting and pockets in the substep);
the pool's scene builders and `Demo::new_pool` +10.2 KB; the new exports
+8.0 KB; `Contacts::find` (moment of impact) +6.1 KB; the energy readout
with spin +5.2 KB; `impacts::resolve` (coupled restitution) +3.2 KB;
drop glue +2.7 KB. Limiting the pool to `f64` would save ~5 KB of
scene building, at the cost of the "every scene in both scalars" rule:
not taken.

The acoustic track ships its own module, `acoustic.wasm`
(`crates/acoustic-web`): sizes in `12-acoustic-foundations.md`. M9's
falling sand ships `sand.wasm` (`crates/sand-web`, 37.6 KB): sizes in
`11-falling-sand.md`. The swarm track's `swarm.wasm` (`crates/swarm-web`;
48.5 KB at S1, 103.8 KB with all four models) is the one module built
with `simd128` (`15-swarm.md`, S1.4–5).

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

The sketch below is the idea. As built, instantiation is
`site/js/engine-loader.ts`: `instantiate(source, name)` takes a URL, a
`Response` or bytes, supplies the panic hook's import, and returns the
exports, the memory and that instance's last panic. It keeps nothing
at module level, so instances are independent, and it has no page in
it: the lab pages add theirs in `wasm.ts` (where the file is, the step
budget), and the package for the website ships the loader as is
(`16-site-demos.md`). Streaming compilation needs the server to send
`application/wasm`; where it's refused, the loader compiles the
downloaded bytes instead and says so once.

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

### Multiple demos and plots (M1)

The M1 page runs three `Demo` handles from one wasm instance, one per
canvas, each stepped with the same elapsed time. Shared site modules:
`plot.ts` (`LinePlot`: several series from `Ring` buffers, linear or log
`|v|` scale floored at 1e-16), `trail.ts` (fading per-particle history,
drawn in 8 opacity bands), `controls.ts` (slider/select/checkbox/button),
`options.ts` (URL options and the generated options table).

Two Canvas facts learned the hard way: assigning `canvas.width`/`height`
clears the canvas even to the same value, so `setupCanvas` only assigns
on a real change; and a canvas sized before its grid is complete measures
the wrong column width, so pages build all panels before sizing any.

### Measured: rendering is the bottleneck (M0)

The `m0-hello` HUD splits ms per frame between physics (`demo_advance`)
and drawing (issuing the canvas calls; rasterization can add more):

| Particles | Physics | Draw |
|---|---|---|
| 100,000 (f64) | 0.34 ms | 5.8 ms |
| 2,000,000 (f32) | 7.0 ms | 57.6 ms |

Physics costs ~4 ns per particle per step; drawing costs ~8x to ~17x
more. Display fps falls long before physics can't keep up. Canvas 2D also
silently drops any single draw command over ~16 MiB, so `drawPoints`
fills every 50k rects.

Not a problem for upcoming milestones (hundreds to thousands of bodies).
Options when a demo needs it, cheapest first:

- `fillRect` per point instead of path `rect` + `fill` (measure: fewer
  path ops vs more calls)
- Pixel buffer: Rust writes RGBA (already planned for falling sand), one
  `putImageData` per frame; cost scales with canvas size, not `n`
- WebGL2 instanced points straight from the wasm position buffer
  (already listed under Deferred in `05-roadmap.md`)

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
  we want strings, callbacks, or browser APIs from Rust. The acoustic
  track, once the likely first need, did without it: the worklet loads a
  raw module too (`12-acoustic-foundations.md`). The swarm track's first
  notes proposed `wasm-bindgen` with `web-sys` for a Canvas 2D front
  end; the hand-written C ABI and `pixels.ts` did that job instead. The
  likeliest need now is a GPU tier: `wgpu` on the web is built on it
  (`15-swarm.md`, "If the GPU tier is built"). If adopted, use the
  `wasm-bindgen` CLI directly; wasm-pack moved to an individual maintainer
  and adds little here.
- **Threads / SharedArrayBuffer:** require cross-origin isolation headers on
  the website host. Revisit for large-N benchmarks. Workers, a step budget
  and wasm threads compared: `workers.md`.
- **SIMD:** adopted for `swarm.wasm` alone (S1.4, `15-swarm.md`):
  `-C target-feature=+simd128` and loops written in lanes, no
  `core::arch::wasm32` intrinsics. The other modules build without it.

## Milestone: "hello particles" (M0, done)

1. `engine`: `Scalar` (f32, f64), `Vec2`, `Particles`, `UniformGravity`,
   symplectic Euler, `World::step`.
2. `engine-web`: `demo_new`/`advance`/`positions` exports, one demo kind.
3. `site`: canvas + loop; particles fall off screen.
4. Swap in `PairwiseGravity` with a two-body orbit, then a small cluster → N-body demo.
5. Add an energy plot and an integrator dropdown → first side-by-side.
